import { ReactNode, useEffect, useState } from "react";
import { Navigate } from "react-router-dom";
import { useAuth } from "@/contexts/AuthContext";
import { supabase } from "@/integrations/supabase/client";
import { Loader2 } from "lucide-react";

interface AdminRouteProps {
    children: ReactNode;
}

export const AdminRoute = ({ children }: AdminRouteProps) => {
    const { user, isLoading: authLoading } = useAuth();
    const [isAdmin, setIsAdmin] = useState<boolean | null>(null);
    const [isCheckingRole, setIsCheckingRole] = useState(true);

    useEffect(() => {
        const checkAdminRole = async () => {
            if (!user) {
                setIsCheckingRole(false);
                return;
            }

            try {
                // Check admin role using the has_role RPC function
                const { data, error } = await supabase.rpc('has_role', {
                    _user_id: user.id,
                    _role: 'admin'
                });

                if (error) {
                    console.error('Error checking admin role:', error);
                    setIsAdmin(false);
                } else {
                    setIsAdmin(data === true);
                }
            } catch (error) {
                console.error('Error checking admin role:', error);
                setIsAdmin(false);
            } finally {
                setIsCheckingRole(false);
            }
        };

        checkAdminRole();
    }, [user]);

    // Show loading state while checking auth or role
    if (authLoading || isCheckingRole) {
        return (
            <div className="min-h-screen flex items-center justify-center">
                <Loader2 className="h-8 w-8 animate-spin text-primary" />
            </div>
        );
    }

    // Redirect to login if not authenticated
    if (!user) {
        return <Navigate to="/auth" replace />;
    }

    // Redirect to home if not admin
    if (!isAdmin) {
        return <Navigate to="/contratoblindado" replace />;
    }

    return <>{children}</>;
};
