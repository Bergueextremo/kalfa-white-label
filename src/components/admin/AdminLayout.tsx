import { ReactNode } from "react";
import { SidebarProvider, SidebarTrigger } from "@/components/ui/sidebar";
import { AdminSidebar } from "@/components/admin/AdminSidebar";

interface AdminLayoutProps {
    children: ReactNode;
}

export function AdminLayout({ children }: AdminLayoutProps) {
    return (
        <SidebarProvider>
            <div className="flex min-h-screen w-full bg-slate-50 print:block">
                <AdminSidebar />
                <div className="flex-1 flex flex-col">
                    <header className="h-14 border-b border-slate-200 bg-white flex items-center px-6 print:hidden">
                        <SidebarTrigger className="text-slate-600 hover:bg-slate-100" />
                        <div className="ml-4 font-semibold text-slate-700">Área Administrativa</div>
                    </header>
                    <main className="flex-1 p-8 overflow-auto">
                        {children}
                    </main>
                </div>
            </div>
        </SidebarProvider>
    );
}
