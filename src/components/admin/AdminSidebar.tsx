import { LayoutDashboard, Users, ShoppingCart, LogOut, Shield, FileText } from "lucide-react";
import { NavLink } from "@/components/NavLink";
import { useAuth } from "@/contexts/AuthContext";
import {
    Sidebar,
    SidebarContent,
    SidebarGroup,
    SidebarGroupContent,
    SidebarGroupLabel,
    SidebarMenu,
    SidebarMenuButton,
    SidebarMenuItem,
    SidebarFooter,
    useSidebar,
} from "@/components/ui/sidebar";
import { Separator } from "@/components/ui/separator";

const adminMenuItems = [
    { title: "Dashboard", url: "/admin", icon: LayoutDashboard },
    { title: "Usuários", url: "/admin/users", icon: Users },
    { title: "Vendas", url: "/admin/sales", icon: ShoppingCart },
    { title: "Contratos", url: "/admin/contratos", icon: FileText },
];

export function AdminSidebar() {
    const { state } = useSidebar();
    const { logout } = useAuth();
    const isCollapsed = state === "collapsed";

    return (
        <Sidebar className={isCollapsed ? "w-14" : "w-64"} variant="sidebar">
            <SidebarContent className="bg-slate-900 text-slate-100">
                {/* Logo */}
                <div className="flex items-center gap-2 px-4 py-6">
                    <Shield className="h-7 w-7 text-blue-500" />
                    {!isCollapsed && (
                        <span className="text-xl font-bold text-white">
                            JusAdmin
                        </span>
                    )}
                </div>

                <Separator className="bg-slate-800" />

                {/* Menu Principal */}
                <SidebarGroup>
                    <SidebarGroupContent>
                        <SidebarMenu>
                            {adminMenuItems.map((item) => (
                                <SidebarMenuItem key={item.title}>
                                    <SidebarMenuButton asChild className="hover:bg-slate-800 hover:text-white text-slate-400">
                                        <NavLink
                                            to={item.url}
                                            end={item.url === "/admin"}
                                            className="flex items-center w-full p-2 rounded-md transition-colors"
                                            activeClassName="bg-blue-600 text-white font-medium"
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

            {/* Footer */}
            <SidebarFooter className="p-4 bg-slate-900 border-t border-slate-800">
                <button
                    onClick={logout}
                    className={`flex items-center gap-2 text-red-400 hover:text-red-300 transition-colors w-full ${isCollapsed ? 'justify-center' : ''}`}
                >
                    <LogOut className="h-5 w-5" />
                    {!isCollapsed && <span>Sair</span>}
                </button>
            </SidebarFooter>
        </Sidebar>
    );
}
