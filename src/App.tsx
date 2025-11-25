import { useEffect } from "react";
import { Toaster } from "@/components/ui/toaster";
import { Toaster as Sonner } from "@/components/ui/sonner";
import { TooltipProvider } from "@/components/ui/tooltip";
import { QueryClient, QueryClientProvider } from "@tanstack/react-query";
import { BrowserRouter, Routes, Route } from "react-router-dom";
import { AuthProvider } from "@/contexts/AuthContext";
import { CreditProvider } from "@/contexts/CreditContext";
import { AuditProvider } from "@/contexts/AuditContext";
import { ProtectedRoute } from "@/components/ProtectedRoute";
import Landing from "./pages/Landing";
import AuthPage from "./pages/AuthPage";
import Dashboard from "./pages/Dashboard";
import NovaAuditoria from "./pages/NovaAuditoria";
import Resultado from "./pages/Resultado";
import Relatorios from "./pages/Relatorios";
import Creditos from "./pages/Creditos";
import Suporte from "./pages/Suporte";
import NotFound from "./pages/NotFound";
import Configuracoes from "./pages/Configuracoes";
import FreeAuditFlow from "./pages/FreeAuditFlow";
import CheckoutPage from "./pages/CheckoutPage";


const queryClient = new QueryClient();


const App = () => {
  useEffect(() => {
    // Preload font
    document.documentElement.style.fontFamily = 'Inter, system-ui, sans-serif';
  }, []);

  return (
    <QueryClientProvider client={queryClient}>
      <BrowserRouter>
        <AuthProvider>
          <CreditProvider>
            <AuditProvider>
              <TooltipProvider>
                <Toaster />
                <Sonner />
                <Routes>
                  {/* Public routes */}
                  <Route path="/" element={<Landing />} />
                  <Route path="/auth" element={<AuthPage />} />
                  <Route path="/scan-gratis" element={<FreeAuditFlow />} />
                  <Route path="/checkout" element={<CheckoutPage />} />


                  {/* Protected routes */}
                  <Route
                    path="/dashboard"
                    element={
                      <ProtectedRoute>
                        <Dashboard />
                      </ProtectedRoute>
                    }
                  />
                  <Route
                    path="/nova-auditoria"
                    element={
                      <ProtectedRoute>
                        <NovaAuditoria />
                      </ProtectedRoute>
                    }
                  />
                  <Route
                    path="/resultado/:id"
                    element={
                      <ProtectedRoute>
                        <Resultado />
                      </ProtectedRoute>
                    }
                  />
                  <Route
                    path="/relatorios"
                    element={
                      <ProtectedRoute>
                        <Relatorios />
                      </ProtectedRoute>
                    }
                  />
                  <Route
                    path="/creditos"
                    element={
                      <ProtectedRoute>
                        <Creditos />
                      </ProtectedRoute>
                    }
                  />
                  <Route
                    path="/suporte"
                    element={
                      <ProtectedRoute>
                        <Suporte />
                      </ProtectedRoute>
                    }
                  />

                  <Route
                    path="/configuracoes"
                    element={
                      <ProtectedRoute>
                        <Configuracoes />
                      </ProtectedRoute>
                    }
                  />

                  {/* Catch-all */}
                  <Route path="*" element={<NotFound />} />
                </Routes>
              </TooltipProvider>
            </AuditProvider>
          </CreditProvider>
        </AuthProvider>
      </BrowserRouter>
    </QueryClientProvider>
  );
};

export default App;
