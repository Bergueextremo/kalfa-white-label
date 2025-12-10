import { ReactNode, useEffect } from "react";
import { SidebarProvider, SidebarTrigger } from "@/components/ui/sidebar";
import { AppSidebar } from "@/components/AppSidebar";
import { Button } from "@/components/ui/button";
import { LogOut, User as UserIcon } from "lucide-react";
import { useAuth } from "@/contexts/AuthContext";
import { useCredits } from "@/contexts/CreditContext";
import { useNavigate, useLocation } from "react-router-dom";
import { toast } from "sonner";
import {
  DropdownMenu,
  DropdownMenuContent,
  DropdownMenuItem,
  DropdownMenuLabel,
  DropdownMenuSeparator,
  DropdownMenuTrigger,
} from "@/components/ui/dropdown-menu";
import { NewAuditModal } from "@/components/NewAuditModal";
import { GlobalAuditModal } from "@/components/GlobalAuditModal";
import { AuditProgressWidget } from "@/components/AuditProgressWidget";

interface LayoutProps {
  children: ReactNode;
}

export function Layout({ children }: LayoutProps) {
  const { user, logout } = useAuth();
  const { credits, isLoading } = useCredits();
  const navigate = useNavigate();
  const location = useLocation();

  useEffect(() => {
    // Redirect logic: If not loading, user logged in, references 0 credits, and not on allowed pages.
    // Allowed pages when 0 credits: /creditos, /dashboard (maybe? No, user said only unlock after payment), /configuracoes?
    // User said: "encaminhar para a área de planos... olha só Acesso tá bloqueado"
    // So usually trigger on navigation attempts to functional areas.
    // Let's protect everything except /creditos and the onboarding flow itself.
    // But Dashboard is the landing for onboarding. So Dashboard needs to be accessible OR render the Onboarding component.
    // Dashboard handles the OnboardingTour, so it should be allowed initially?
    // But 'Onboarding' ends with redirect to 'creditos'.

    if (!isLoading && user && credits <= 0) {
      const allowedPaths = ['/creditos', '/configuracoes']; // Allow config to logout?
      const isAllowed = allowedPaths.some(path => location.pathname.startsWith(path));

      // If on Dashboard, we might want to allow it IF Onboarding is showing. 
      // But OnboardingTour checks for 'has_seen_onboarding'. 
      // If we redirect immediately from Dashboard, OnboardingTour might not show.
      // Strategy: Layout shouldn't block Dashboard if Onboarding needs to show.
      // But if Onboarding is DONE and CREDITS < 0 -> Block.

      // For now, let's just create a toast/check.
      // "Encaminhar para a área de planos" implies redirection.

      if (!isAllowed && location.pathname !== '/dashboard') {
        // If trying to access Audit, Reports, etc.
        toast.error("Acesso bloqueado. Adquira créditos para utilizar a plataforma.");
        navigate('/creditos');
      }
      // If on Dashboard, we let it be handled by Dashboard's own logic or just leave it visible but restricted?
      // User said: "quando ele não pagar... dá as boas-vinda ensinar... e encaminhar para a área de planos".
      // This implies: Landing from login -> Dashboard -> (Onboarding) -> Dashboard/Creditos.

      // Let's rely on a blocking modal component instead of hard redirect if we want to be friendlier?
      // Or just hard redirect other pages.
    }
  }, [credits, isLoading, location, navigate, user]);

  return (
    <SidebarProvider defaultOpen={true}>
      <div className="flex min-h-screen w-full bg-background">
        <AppSidebar />
        <div className="flex-1 flex flex-col">
          {/* Header com trigger e user menu */}
          <header className="h-14 border-b border-border flex items-center justify-between px-4 md:px-6 bg-card">
            <div className="flex items-center gap-4">
              <SidebarTrigger className="md:hidden hover:bg-accent transition-colors" />
            </div>

            <div className="flex items-center gap-2 md:gap-4">
              {/* Consultation Counter */}
              <div className="hidden md:flex items-center gap-2 px-3 py-1.5 bg-slate-100 rounded-full border border-slate-200">
                <span className="text-xs font-semibold text-slate-500 uppercase tracking-wide">Consultas Disponíveis:</span>
                <span className="text-sm font-bold text-blue-600">{credits}</span>
              </div>

              {/* New Audit Modal CTA */}
              <NewAuditModal />

              <DropdownMenu>
                <DropdownMenuTrigger asChild>
                  <Button variant="ghost" size="sm" className="gap-2">
                    <UserIcon className="h-4 w-4" />
                    <span className="hidden md:inline">{user?.name || user?.email}</span>
                  </Button>
                </DropdownMenuTrigger>
                <DropdownMenuContent align="end">
                  <DropdownMenuLabel>Minha Conta</DropdownMenuLabel>
                  <DropdownMenuSeparator />
                  <DropdownMenuItem onClick={logout} className="text-destructive">
                    <LogOut className="h-4 w-4 mr-2" />
                    Sair
                  </DropdownMenuItem>
                </DropdownMenuContent>
              </DropdownMenu>
            </div>
          </header>

          {/* Main Content */}
          <main className="flex-1 p-4 md:p-6 overflow-auto">
            {children}
          </main>
        </div>
      </div>
      <GlobalAuditModal />
      <AuditProgressWidget />
    </SidebarProvider>
  );
}
