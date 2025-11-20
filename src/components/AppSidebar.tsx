import { Scale, LayoutDashboard, Upload, FileText, Wallet, HeadphonesIcon, Settings, User } from "lucide-react";
import { NavLink } from "@/components/NavLink";
import { useLocation } from "react-router-dom";
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

const menuItems = [
  { title: "Visão Geral", url: "/", icon: LayoutDashboard },
  { title: "Nova Auditoria", url: "/nova-auditoria", icon: Upload },
  { title: "Meus Relatórios", url: "/relatorios", icon: FileText },
  { title: "Carteira de Créditos", url: "/creditos", icon: Wallet },
  { title: "Suporte Jurídico", url: "/suporte", icon: HeadphonesIcon },
];

export function AppSidebar() {
  const { state } = useSidebar();
  const location = useLocation();
  const currentPath = location.pathname;
  const isCollapsed = state === "collapsed";

  const isActive = (path: string) => {
    if (path === "/") return currentPath === path;
    return currentPath.startsWith(path);
  };

  return (
    <Sidebar className={isCollapsed ? "w-14" : "w-64"}>
      <SidebarContent>
        {/* Logo */}
        <div className="flex items-center gap-2 px-4 py-6">
          {!isCollapsed && (
            <>
              <Scale className="h-7 w-7 text-sidebar-primary-foreground" />
              <span className="text-xl font-bold text-sidebar-primary-foreground">
                JusContratos
              </span>
            </>
          )}
          {isCollapsed && (
            <Scale className="h-7 w-7 mx-auto text-sidebar-primary-foreground" />
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
      </SidebarContent>

      {/* Footer - Perfil e Configurações */}
      <SidebarFooter>
        <Separator className="bg-sidebar-border mb-2" />
        <SidebarMenu>
          <SidebarMenuItem>
            <SidebarMenuButton asChild>
              <NavLink
                to="/configuracoes"
                className="hover:bg-sidebar-accent transition-colors duration-200"
                activeClassName="bg-sidebar-accent text-sidebar-accent-foreground font-medium"
              >
                <Settings className={isCollapsed ? "mx-auto" : "mr-3 h-5 w-5"} />
                {!isCollapsed && <span>Configurações</span>}
              </NavLink>
            </SidebarMenuButton>
          </SidebarMenuItem>
          <SidebarMenuItem>
            <SidebarMenuButton className="hover:bg-sidebar-accent transition-colors duration-200">
              <User className={isCollapsed ? "mx-auto" : "mr-3 h-5 w-5"} />
              {!isCollapsed && (
                <div className="flex flex-col">
                  <span className="text-sm font-medium">Usuário</span>
                  <span className="text-xs text-sidebar-foreground/70">usuario@email.com</span>
                </div>
              )}
            </SidebarMenuButton>
          </SidebarMenuItem>
        </SidebarMenu>
      </SidebarFooter>
    </Sidebar>
  );
}
