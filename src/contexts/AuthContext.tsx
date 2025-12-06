import { createContext, useContext, useState, useEffect, ReactNode } from "react";
import { useNavigate } from "react-router-dom";
import { supabase } from "@/lib/supabase";

interface User {
  id: string;
  name: string;
  email: string;
}

interface AuthContextType {
  user: User | null;
  isAuthenticated: boolean;
  isLoading: boolean;
  login: (email: string, password: string) => Promise<void>;
  signup: (name: string, email: string, password: string) => Promise<void>;
  logout: () => void;
}

const AuthContext = createContext<AuthContextType | undefined>(undefined);

export function AuthProvider({ children }: { children: ReactNode }) {
  const [user, setUser] = useState<User | null>(null);
  const [isLoading, setIsLoading] = useState(true);
  const navigate = useNavigate();

  useEffect(() => {
    // Check active session
    supabase.auth.getSession().then(({ data: { session } }) => {
      if (session?.user) {
        setUser({
          id: session.user.id,
          name: session.user.user_metadata.name || session.user.email?.split('@')[0] || 'Usuário',
          email: session.user.email || '',
        });
      }
      setIsLoading(false);
    });

    // Listen for changes
    const {
      data: { subscription },
    } = supabase.auth.onAuthStateChange((_event, session) => {
      if (session?.user) {
        setUser({
          id: session.user.id,
          name: session.user.user_metadata.name || session.user.email?.split('@')[0] || 'Usuário',
          email: session.user.email || '',
        });
      } else {
        setUser(null);
      }
      setIsLoading(false);
    });

    return () => subscription.unsubscribe();
  }, []);

  const login = async (email: string, password: string) => {
    const { error } = await supabase.auth.signInWithPassword({
      email,
      password,
    });

    if (error) throw error;
    navigate("/dashboard");
  };

  const signup = async (name: string, email: string, password: string) => {
    const { data: authData, error } = await supabase.auth.signUp({
      email,
      password,
      options: {
        data: {
          name,
        },
      },
    });

    if (error) throw error;

    // NOVO: Verificar se há ativação pendente para este email
    if (authData.user) {
      console.log('Verificando pending_activation para:', email);

      try {
        const { data: pendingActivation, error: activationError } = await supabase
          .from('pending_activations')
          .select('*')
          .eq('email', email)
          .eq('activated', false)
          .eq('payment_status', 'approved')
          .gt('expires_at', new Date().toISOString()) // Não expirado
          .order('created_at', { ascending: false })
          .limit(1)
          .maybeSingle();

        if (activationError) {
          console.error('Erro ao buscar pending_activation:', activationError);
        } else if (pendingActivation) {
          console.log('✅ Pending activation encontrada! Liberando créditos:', pendingActivation);

          // Atualizar profile com créditos
          const { error: updateError } = await supabase
            .from('profiles')
            .update({ credits: pendingActivation.credits })
            .eq('id', authData.user.id);

          if (updateError) {
            console.error('Erro ao atualizar créditos:', updateError);
          } else {
            console.log(`Créditos liberados: ${pendingActivation.credits}`);

            // Marcar ativação como processada
            await supabase
              .from('pending_activations')
              .update({
                activated: true,
                activated_at: new Date().toISOString(),
                user_id: authData.user.id
              })
              .eq('id', pendingActivation.id);

            // Mostrar toast de sucesso com créditos
            const { toast } = await import('sonner');
            toast.success(`Conta criada! ${pendingActivation.credits} créditos liberados.`);
          }
        } else {
          console.log('Nenhuma pending_activation encontrada para este email');
        }
      } catch (error) {
        console.error('Erro ao processar pending_activation:', error);
        // Não lançamos erro aqui para não bloquear o signup
      }
    }

    navigate("/dashboard");
  };

  const logout = async () => {
    await supabase.auth.signOut();
    setUser(null);
    navigate("/");
  };

  return (
    <AuthContext.Provider
      value={{
        user,
        isAuthenticated: !!user,
        isLoading,
        login,
        signup,
        logout,
      }}
    >
      {children}
    </AuthContext.Provider>
  );
}

export function useAuth() {
  const context = useContext(AuthContext);
  if (context === undefined) {
    throw new Error("useAuth must be used within an AuthProvider");
  }
  return context;
}
