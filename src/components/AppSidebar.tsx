import { Scale, LayoutDashboard, Upload, FileText, Wallet, HeadphonesIcon, Settings, LogOut, User as UserIcon, Shield } from "lucide-react";
import { NavLink } from "@/components/NavLink";
import logoJusContratos from "@/assets/logo-juscontratos.png";
import { useLocation } from "react-router-dom";
import { useAuth } from "@/contexts/AuthContext";
import { CreditUsage } from "@/components/CreditUsage";
import {
  Sidebar,
  SidebarContent,
  SidebarGroup,
  SidebarGroupContent,
  SidebarGroupLabel,
  SidebarMenu,
  SidebarMenuButton,
  SidebarMenuItem,
  SidebarTrigger,
  SidebarFooter,
  useSidebar,
} from "@/components/ui/sidebar";
import { Separator } from "@/components/ui/separator";
import {
  DropdownMenu,
  DropdownMenuContent,
  DropdownMenuItem,
  DropdownMenuTrigger,
} from "@/components/ui/dropdown-menu";


const menuItems = [
  { title: "Visão Geral", url: "/dashboard", icon: LayoutDashboard },
  { title: "Nova Auditoria", url: "/nova-auditoria", icon: Upload },
  { title: "Meus Relatórios", url: "/relatorios", icon: FileText },
  { title: "Carteira de Créditos", url: "/creditos", icon: Wallet },
  { title: "Suporte Jurídico", url: "/suporte", icon: HeadphonesIcon },
];

const ADMIN_EMAIL = "jussistemas@gmail.com";

export function AppSidebar() {
  const { state } = useSidebar();
  const { user, logout } = useAuth();
  const location = useLocation();
  const currentPath = location.pathname;
  const isCollapsed = state === "collapsed";

  const isActive = (path: string) => {
    return currentPath === path || currentPath.startsWith(path);
  };

  return (
    <Sidebar className={isCollapsed ? "w-14" : "w-64"}>
      <SidebarContent>
        {/* Logo */}
        <div className="flex items-center gap-2 px-4 py-6">
          {!isCollapsed && (
            <img src={logoJusContratos} alt="JusContratos" className="h-12 md:h-14 brightness-0 invert" />
          )}
          {isCollapsed && (
            <img src={logoJusContratos} alt="JusContratos" className="h-12 w-auto mx-auto brightness-0 invert" />
          )}
        </div>

        <Separator className="bg-sidebar-border" />

        {/* Menu Principal */}
        <SidebarGroup>
          {!isCollapsed && (
            <SidebarGroupLabel className="text-sidebar-foreground/70 text-xs uppercase tracking-wider">
              Menu
            </SidebarGroupLabel>
          )}
          <SidebarGroupContent>
            <SidebarMenu>
              {menuItems.map((item) => (
                <SidebarMenuItem key={item.title}>
                  <SidebarMenuButton asChild>
                    <NavLink
                      to={item.url}
                      end={item.url === "/"}
                      className="hover:bg-sidebar-accent transition-colors duration-200"
                      activeClassName="bg-sidebar-accent text-sidebar-accent-foreground font-medium border-l-4 border-sidebar-primary-foreground"
                    >
                      <item.icon className={isCollapsed ? "mx-auto" : "mr-3 h-5 w-5"} />
                      {!isCollapsed && <span>{item.title}</span>}
                    </NavLink>
                  </SidebarMenuButton>
                </SidebarMenuItem>
              ))}
            </SidebarMenu>
          </SidebarGroupContent>
        </SidebarGroup>

        {/* Admin Menu - Only visible to admin */}
        {user?.email === ADMIN_EMAIL && (
          <SidebarGroup>
            {!isCollapsed && (
              <SidebarGroupLabel className="text-sidebar-foreground/70 text-xs uppercase tracking-wider">
                Admin
              </SidebarGroupLabel>
            )}
            <SidebarGroupContent>
              <SidebarMenu>
                <SidebarMenuItem>
                  <SidebarMenuButton asChild>
                    <NavLink
                      to="/admin"
                      className="hover:bg-sidebar-accent transition-colors duration-200"
                      activeClassName="bg-sidebar-accent text-sidebar-accent-foreground font-medium border-l-4 border-sidebar-primary-foreground"
                    >
                      <Shield className={isCollapsed ? "mx-auto" : "mr-3 h-5 w-5"} />
                      {!isCollapsed && <span>Dashboard Admin</span>}
                    </NavLink>
                  </SidebarMenuButton>
                </SidebarMenuItem>
              </SidebarMenu>
            </SidebarGroupContent>
          </SidebarGroup>
        )}
      </SidebarContent>

      {/* Footer - Configurações e Créditos */}
      <SidebarFooter className="p-4 space-y-4">
        <Separator className="bg-sidebar-border" />

        {!isCollapsed && <CreditUsage />}

        <div className="flex items-center justify-between gap-2">
          <DropdownMenu>
            <DropdownMenuTrigger asChild>
              <div className={`flex items-center gap-3 p-2 rounded-lg hover:bg-sidebar-accent cursor-pointer transition-colors ${isCollapsed ? 'justify-center w-full' : 'w-full'}`}>
                <div className="h-8 w-8 rounded-full bg-blue-100 flex items-center justify-center text-blue-700 font-bold">
                  {user?.name?.charAt(0) || "U"}
                </div>
                {!isCollapsed && (
                  <div className="flex-1 text-left overflow-hidden">
                    <p className="text-sm font-medium truncate text-sidebar-foreground">{user?.name || "Usuário"}</p>
                    <p className="text-xs text-muted-foreground truncate">Ver perfil</p>
                  </div>
                )}
              </div>
            </DropdownMenuTrigger>
            <DropdownMenuContent align="start" className="w-56">
              <DropdownMenuItem asChild>
                <NavLink to="/configuracoes" className="cursor-pointer w-full flex items-center">
                  <Settings className="mr-2 h-4 w-4" />
                  <span>Configurações</span>
                </NavLink>
              </DropdownMenuItem>
              <DropdownMenuItem onClick={logout} className="text-red-600 focus:text-red-600">
                <LogOut className="mr-2 h-4 w-4" />
                <span>Sair</span>
              </DropdownMenuItem>
            </DropdownMenuContent>
          </DropdownMenu>
        </div>
      </SidebarFooter>
    </Sidebar>
  );
}
