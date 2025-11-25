import React, { createContext, useContext, useState, useEffect, ReactNode } from 'react';
import { toast } from 'sonner';

interface CreditContextType {
    credits: number;
    maxCredits: number;
    addCredits: (amount: number) => void;
    useCredit: () => boolean;
    isLoading: boolean;
}

const CreditContext = createContext<CreditContextType | undefined>(undefined);

export function CreditProvider({ children }: { children: ReactNode }) {
    const [credits, setCredits] = useState(12); // Initial simulated value
    const [maxCredits, setMaxCredits] = useState(20); // Simulated max/plan limit
    const [isLoading, setIsLoading] = useState(true);

    useEffect(() => {
        // Simulate loading from backend/localStorage
        const storedCredits = localStorage.getItem('jus_credits');
        if (storedCredits) {
            setCredits(parseInt(storedCredits));
        }
        setIsLoading(false);
    }, []);

    useEffect(() => {
        localStorage.setItem('jus_credits', credits.toString());
    }, [credits]);

    const addCredits = (amount: number) => {
        setCredits(prev => {
            const newTotal = prev + amount;
            // Update max credits if the new total exceeds current max (simulating plan upgrade)
            if (newTotal > maxCredits) {
                setMaxCredits(newTotal);
            }
            return newTotal;
        });
        toast.success(`${amount} créditos adicionados com sucesso!`);
    };

    const useCredit = () => {
        if (credits > 0) {
            setCredits(prev => prev - 1);
            return true;
        } else {
            toast.error("Créditos esgotados! Adquira mais para continuar.");
            return false;
        }
    };

    return (
        <CreditContext.Provider value={{ credits, maxCredits, addCredits, useCredit, isLoading }}>
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
