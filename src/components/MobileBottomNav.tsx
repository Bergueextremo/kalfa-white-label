import { LayoutDashboard, Upload, FileText, Wallet, HeadphonesIcon } from "lucide-react";
import { NavLink, useLocation } from "react-router-dom";
import { cn } from "@/lib/utils";

const navItems = [
  { title: "Início", url: "/dashboard", icon: LayoutDashboard },
  { title: "Auditar", url: "/nova-auditoria", icon: Upload },
  { title: "Relatórios", url: "/relatorios", icon: FileText },
  { title: "Créditos", url: "/creditos", icon: Wallet },
  { title: "Suporte", url: "/suporte", icon: HeadphonesIcon },
];

export function MobileBottomNav() {
  const location = useLocation();

  const isActive = (path: string) => {
    return location.pathname === path || location.pathname.startsWith(path + "/");
  };

  return (
    <nav className="fixed bottom-0 left-0 right-0 z-50 bg-slate-900 border-t border-slate-800 md:hidden">
      <div className="flex items-center justify-around h-16 px-2">
        {navItems.map((item) => {
          const active = isActive(item.url);
          return (
            <NavLink
              key={item.url}
              to={item.url}
              className={cn(
                "flex flex-col items-center justify-center gap-1 px-3 py-2 rounded-lg transition-all min-w-[56px]",
                active
                  ? "text-white bg-slate-800"
                  : "text-slate-400 hover:text-slate-200"
              )}
            >
              <item.icon className={cn("h-5 w-5", active && "text-blue-400")} />
              <span className="text-[10px] font-medium">{item.title}</span>
            </NavLink>
          );
        })}
      </div>
      {/* Safe area para iPhones */}
      <div className="h-safe-area-inset-bottom bg-slate-900" />
    </nav>
  );
}
