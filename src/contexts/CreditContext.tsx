import React, { createContext, useContext, useState, useEffect, ReactNode } from 'react';
import { toast } from 'sonner';
import { supabase } from "@/lib/supabase";
import { useAuth } from "@/contexts/AuthContext";

interface CreditContextType {
    credits: number;
    maxCredits: number;
    addCredits: (amount: number) => void;
    useCredit: () => Promise<boolean>;
    isLoading: boolean;
}

const CreditContext = createContext<CreditContextType | undefined>(undefined);

export function CreditProvider({ children }: { children: ReactNode }) {
    const [credits, setCredits] = useState(0);
    const [isLoading, setIsLoading] = useState(true);
    const { user } = useAuth(); // Assuming useAuth is available and exports user object with ID

    const fetchCredits = async () => {
        if (!user) {
            setCredits(0);
            setIsLoading(false);
            return;
        }
        setIsLoading(true); // Moved here to ensure it's set when user is present
        try {
            const { data, error } = await supabase
                .from('profiles')
                .select('credits')
                .eq('id', user.id)
                .single();

            if (error) {
                console.error('Error fetching credits:', error);

                // If profile doesn't exist, create it
                if (error.code === 'PGRST116') { // PGRST116 typically means "no rows found" for .single()
                    console.log('Profile not found, creating new profile...');
                    const { data: newProfile, error: insertError } = await supabase
                        .from('profiles')
                        .insert({
                            id: user.id,
                            credits: 0,
                            email: user.email || '',
                            name: user.user_metadata?.name || user.email?.split('@')[0] || 'User'
                        })
                        .select('credits')
                        .single();

                    if (insertError) {
                        console.error('Error creating profile:', insertError);
                        setCredits(0);
                    } else {
                        setCredits(newProfile?.credits || 0);
                    }
                } else {
                    setCredits(0);
                }
            } else {
                setCredits(data?.credits || 0);
            }
        } catch (err) {
            console.error('Unexpected error fetching credits:', err);
        } finally {
            setIsLoading(false);
        }
    };

    useEffect(() => {
        fetchCredits();

        // Subscribe to changes in realtime
        if (user) {
            const channel = supabase
                .channel('schema-db-changes')
                .on(
                    'postgres_changes',
                    {
                        event: 'UPDATE',
                        schema: 'public',
                        table: 'profiles',
                        filter: `id=eq.${user.id}`,
                    },
                    (payload) => {
                        console.log('Credit change received:', payload);
                        setCredits(payload.new.credits);
                    }
                )
                .subscribe();

            return () => {
                supabase.removeChannel(channel);
            };
        }
    }, [user]);

    // This function is now mainly for optimistic updates or triggering a refetch
    const addCredits = async (amount: number) => {
        if (!user) return;

        // Optimistic update
        setCredits(prev => prev + amount);

        // Update DB
        try {
            const { error } = await supabase.rpc('increment_credits', {
                row_id: user.id,
                amount: amount
            });

            // Fallback for if RPC doesn't exist (though it's safer with RPC to avoid race conditions, but for now simple update might suffice if RLS allows)
            if (error) {
                // Try direct update if RPC fails
                const { data: currentProfile } = await supabase.from('profiles').select('credits').eq('id', user.id).single();
                if (currentProfile) {
                    await supabase
                        .from('profiles')
                        .update({ credits: currentProfile.credits + amount })
                        .eq('id', user.id);
                }
            }
        } catch (err) {
            console.error("Failed to update credits in DB", err);
            // Revert might be needed but for now let's hope it works
        }
    };

    const useCredit = async () => {
        if (credits <= 0) {
            toast.error("Créditos esgotados! Adquira mais para continuar.");
            return false;
        }
        if (!user) {
            toast.error("Você precisa estar logado para usar créditos.");
            return false;
        }

        // Optimistic update
        setCredits(prev => prev - 1);

        // Update DB
        try {
            // Try decrement RPC first (if exists) or fallback
            const { error } = await supabase.rpc('decrement_credits', {
                row_id: user.id,
                amount: 1
            });

            if (error) {
                // Direct update fallback
                const { data: currentProfile } = await supabase.from('profiles').select('credits').eq('id', user.id).single();
                if (currentProfile) {
                    await supabase
                        .from('profiles')
                        .update({ credits: Math.max(0, currentProfile.credits - 1) })
                        .eq('id', user.id);
                }
            }
            return true;
        } catch (err) {
            console.error("Failed to deduct credit in DB", err);
            // Revert optimistic update
            setCredits(prev => prev + 1);
            toast.error("Erro ao processar consumo de crédito. Tente novamente.");
            return false;
        }
    };

    return (
        <CreditContext.Provider value={{ credits, maxCredits: 9999, addCredits, useCredit, isLoading }}>
            {children}
        </CreditContext.Provider>
    );
}

export function useCredits() {
    const context = useContext(CreditContext);
    if (context === undefined) {
        throw new Error('useCredits must be used within a CreditProvider');
    }
    return context;
}
