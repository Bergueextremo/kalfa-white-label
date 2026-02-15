import { useEffect } from "react";
import { Toaster } from "@/components/ui/toaster";
import { Toaster as Sonner } from "@/components/ui/sonner";
import { TooltipProvider } from "@/components/ui/tooltip";
import { QueryClient, QueryClientProvider } from "@tanstack/react-query";
import { BrowserRouter, Routes, Route, Navigate, useLocation } from "react-router-dom";
import { AuthProvider } from "@/contexts/AuthContext";
import { CreditProvider } from "@/contexts/CreditContext";
import { AuditProvider } from "@/contexts/AuditContext";
import { ProtectedRoute } from "@/components/ProtectedRoute";
import { AdminRoute } from "@/components/AdminRoute";
import { AiAssistant } from "@/components/AiAssistant";
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
import Admin from "./pages/Admin";
import AdminUsers from "./pages/admin/AdminUsers";
import AdminUserDetail from "./pages/admin/AdminUserDetail";
import AdminSales from "./pages/admin/AdminSales";
import AdminContracts from "./pages/admin/AdminContracts";
import AdminContractEditor from "./pages/admin/AdminContractEditor";
import AdminLeads from "./pages/admin/AdminLeads";
import AdminPartners from "./pages/admin/AdminPartners";
import AdminFinancialDashboard from "./pages/admin/AdminFinancialDashboard";
import Consultas from "./pages/Consultas";
import TermosDeUso from "./pages/TermosDeUso";
import PoliticaPrivacidade from "./pages/PoliticaPrivacidade";
import DiretrizesLgpd from "./pages/DiretrizesLgpd";
import SobreTecnologia from "./pages/SobreTecnologia";
import ParaEscritorios from "./pages/ParaEscritorios";
import ContratoBlindado from "./pages/ContratoBlindado";
import Catalog from "./pages/Catalog";
import ContractWizard from "./pages/ContractWizard";
import SuccessPage from "./pages/SuccessPage";
import FinanciamentoBlindado from "./pages/FinanciamentoBlindado";
import LeilaoBlindado from "./pages/LeilaoBlindado";

const queryClient = new QueryClient();

const AppRoutes = () => {
  const location = useLocation();
  const isAdminPage = location.pathname.startsWith('/admin');

  return (
    <TooltipProvider>
      <Toaster />
      <Sonner />
      <Routes>
        {/* Public routes */}
        <Route path="/" element={<Navigate to="/contratoblindado" replace />} />
        <Route path="/home" element={<Landing />} />
        <Route path="/auth" element={<AuthPage />} />
        <Route path="/scan-gratis" element={<FreeAuditFlow />} />
        <Route path="/checkout" element={<CheckoutPage />} />
        <Route path="/consultas" element={<Consultas />} />
        <Route path="/termos-de-uso" element={<TermosDeUso />} />
        <Route path="/politica-de-privacidade" element={<PoliticaPrivacidade />} />
        <Route path="/diretrizes-lgpd" element={<DiretrizesLgpd />} />
        <Route path="/sobre-a-tecnologia" element={<SobreTecnologia />} />
        <Route path="/para-escritorios" element={<ParaEscritorios />} />
        <Route path="/contratoblindado" element={<ContratoBlindado />} />
        <Route path="/catalogo" element={<Catalog />} />
        <Route path="/catalogo/:slug" element={<ContractWizard />} />
        <Route path="/financiamentoblindado" element={<FinanciamentoBlindado />} />
        <Route path="/leilaoblindado" element={<LeilaoBlindado />} />
        <Route path="/sucesso" element={<SuccessPage />} />

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
        {/* Public resultado page for premium audit sales */}
        <Route path="/resultado/:id" element={<Resultado />} />
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

        {/* Admin routes */}
        <Route
          path="/admin"
          element={
            <AdminRoute>
              <Admin />
            </AdminRoute>
          }
        />
        <Route
          path="/admin/users"
          element={
            <AdminRoute>
              <AdminUsers />
            </AdminRoute>
          }
        />
        <Route
          path="/admin/auditoria"
          element={
            <AdminRoute>
              <Admin />
            </AdminRoute>
          }
        />
        <Route
          path="/admin/relatorios"
          element={
            <AdminRoute>
              <Admin />
            </AdminRoute>
          }
        />
        <Route
          path="/admin/users/:id"
          element={
            <AdminRoute>
              <AdminUserDetail />
            </AdminRoute>
          }
        />
        <Route
          path="/admin/sales"
          element={
            <AdminRoute>
              <AdminSales />
            </AdminRoute>
          }
        />
        <Route
          path="/admin/parceiros"
          element={
            <AdminRoute>
              <AdminPartners />
            </AdminRoute>
          }
        />
        <Route
          path="/admin/financeiro"
          element={
            <AdminRoute>
              <AdminFinancialDashboard />
            </AdminRoute>
          }
        />
        <Route
          path="/admin/contratos"
          element={
            <AdminRoute>
              <AdminContracts />
            </AdminRoute>
          }
        />
        <Route
          path="/admin/contratos/novo"
          element={
            <AdminRoute>
              <AdminContractEditor />
            </AdminRoute>
          }
        />
        <Route
          path="/admin/contratos/:id"
          element={
            <AdminRoute>
              <AdminContractEditor />
            </AdminRoute>
          }
        />
        <Route
          path="/admin/leads"
          element={
            <AdminRoute>
              <AdminLeads />
            </AdminRoute>
          }
        />

        {/* Catch-all */}
        <Route path="*" element={<NotFound />} />
      </Routes>
      {!isAdminPage && <AiAssistant />}
    </TooltipProvider>
  );
};

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
              <AppRoutes />
            </AuditProvider>
          </CreditProvider>
        </AuthProvider>
      </BrowserRouter>
    </QueryClientProvider>
  );
};

export default App;
