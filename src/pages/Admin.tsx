import { AdminLayout } from "@/components/admin/AdminLayout";
import { MetricCard } from "@/components/admin/MetricCard";
import {
    Users,
    ShoppingCart,
    MessageSquare,
    BarChart3,
    Handshake,
    TrendingUp,
    Loader2,
    ArrowUpRight,
    LayoutDashboard,
    Sparkles,
    ClipboardList,
    FileText
} from "lucide-react";
import { Card, CardContent, CardHeader, CardTitle, CardDescription } from "@/components/ui/card";
import { Tabs, TabsContent, TabsList, TabsTrigger } from "@/components/ui/tabs";
import { useState, useEffect } from "react";
import { supabase } from "@/integrations/supabase/client";
import { toast } from "sonner";
import { Link } from "react-router-dom";
import { Button } from "@/components/ui/button";
import { DashboardSales } from "@/components/admin/DashboardSales";
import { DashboardPartners } from "@/components/admin/DashboardPartners";
import { DashboardLeads } from "@/components/admin/DashboardLeads";
import { DashboardUsers } from "@/components/admin/DashboardUsers";
import { DashboardContracts } from "@/components/admin/DashboardContracts";
import { DashboardAuditoria } from "@/components/admin/DashboardAuditoria";
import { DashboardRelatorios } from "@/components/admin/DashboardRelatorios";
import { useLocation } from "react-router-dom";

const Admin = () => {
    const location = useLocation();
    const [isLoading, setIsLoading] = useState(true);
    const [data, setData] = useState<any>(null);
    const [activeTab, setActiveTab] = useState("vendas");

    useEffect(() => {
        fetchData();

        // Handle deep-linking to tabs from URL
        const path = location.pathname;
        if (path.includes('/admin/auditoria')) setActiveTab('auditoria');
        else if (path.includes('/admin/relatorios')) setActiveTab('relatorios');
        else if (path.includes('/admin/users')) setActiveTab('users');
        else if (path.includes('/admin/contratos')) setActiveTab('contratos');
        else if (path.includes('/admin/sales')) setActiveTab('vendas');
        else if (path.includes('/admin/parceiros')) setActiveTab('parceiros');
        else if (path.includes('/admin/leads')) setActiveTab('leads');
    }, [location]);

    const fetchData = async () => {
        try {
            setIsLoading(true);
            const { data: metricsData, error: metricsError } = await supabase.functions.invoke('get-admin-data', {
                body: { action: 'get_financial_metrics' }
            });

            if (metricsError) throw metricsError;
            setData(metricsData.metrics);
        } catch (error) {
            console.error('Error fetching admin home data:', error);
            // toast.error('Erro ao carregar resumo do dashboard');
        } finally {
            setIsLoading(false);
        }
    };

    if (isLoading) {
        return (
            <AdminLayout>
                <div className="flex justify-center items-center h-[60vh]">
                    <Loader2 className="h-8 w-8 animate-spin text-[#002B5C]" />
                </div>
            </AdminLayout>
        );
    }

    const metrics = [
        {
            title: "Total de Vendas",
            value: data?.total_sales || 0,
            icon: ShoppingCart,
            color: "text-blue-600",
            bg: "bg-blue-50",
            tab: "vendas"
        },
        {
            title: "Leads Capturados",
            value: data?.total_leads || 0,
            icon: MessageSquare,
            color: "text-emerald-600",
            bg: "bg-emerald-50",
            tab: "leads"
        },
        {
            title: "Cupons Ativos",
            value: data?.sales_by_coupon ? Object.keys(data.sales_by_coupon).filter(k => k !== 'Direct').length : 0,
            icon: Handshake,
            color: "text-amber-600",
            bg: "bg-amber-50",
            tab: "parceiros"
        },
        {
            title: "Receita (R$)",
            value: ((data?.total_sales || 0) * 197).toLocaleString('pt-BR', { minimumFractionDigits: 0 }),
            icon: BarChart3,
            color: "text-purple-600",
            bg: "bg-purple-50",
            tab: "vendas"
        }
    ];

    return (
        <AdminLayout>
            <div className="space-y-6 animate-in fade-in duration-700">
                <div className="flex flex-col md:flex-row justify-between items-start md:items-center gap-4">
                    <div>
                        <h1 className="text-2xl font-black text-[#002B5C] tracking-tight">Painel Administrativo</h1>
                        <p className="text-slate-500 text-sm font-medium">Gestão centralizada do seu negócio Whitelabel.</p>
                    </div>
                </div>

                <div className="grid grid-cols-2 lg:grid-cols-4 gap-4">
                    {metrics.map((card, i) => (
                        <Card
                            key={i}
                            className="border-slate-100 shadow-sm overflow-hidden group cursor-pointer hover:border-primary/30 hover:shadow-md transition-all"
                            onClick={() => setActiveTab(card.tab)}
                        >
                            <CardContent className="p-4">
                                <div className="flex justify-between items-center mb-2">
                                    <div className={`p-2 rounded-lg ${card.bg}`}>
                                        <card.icon className={`h-5 w-5 ${card.color}`} />
                                    </div>
                                    <span className={`text-xl font-black text-[#002B5C]`}>{card.value}</span>
                                </div>
                                <div className="flex justify-between items-end">
                                    <h3 className="text-[10px] font-bold text-slate-400 uppercase tracking-widest">{card.title}</h3>
                                    <ArrowUpRight className="h-3 w-3 text-slate-300 group-hover:text-primary transition-colors" />
                                </div>
                            </CardContent>
                        </Card>
                    ))}
                </div>

                <Tabs value={activeTab} onValueChange={setActiveTab} className="w-full">
                    <div className="overflow-x-auto pb-2 scrollbar-hide">
                        <TabsList className="flex w-max min-w-full bg-slate-100/50 p-1 rounded-xl h-auto mb-6 gap-1">
                            <TabsTrigger value="auditoria" className="flex-1 py-2.5 px-4 rounded-lg data-[state=active]:bg-white data-[state=active]:shadow-sm gap-2">
                                <Sparkles className="h-4 w-4" />
                                <span className="whitespace-nowrap">Nova Auditoria</span>
                            </TabsTrigger>
                            <TabsTrigger value="relatorios" className="flex-1 py-2.5 px-4 rounded-lg data-[state=active]:bg-white data-[state=active]:shadow-sm gap-2">
                                <ClipboardList className="h-4 w-4" />
                                <span className="whitespace-nowrap">Meus Relatórios</span>
                            </TabsTrigger>
                            <TabsTrigger value="vendas" className="flex-1 py-2.5 px-4 rounded-lg data-[state=active]:bg-white data-[state=active]:shadow-sm gap-2">
                                <ShoppingCart className="h-4 w-4" />
                                <span className="whitespace-nowrap">Vendas</span>
                            </TabsTrigger>
                            <TabsTrigger value="parceiros" className="flex-1 py-2.5 px-4 rounded-lg data-[state=active]:bg-white data-[state=active]:shadow-sm gap-2">
                                <Handshake className="h-4 w-4" />
                                <span className="whitespace-nowrap">Parceiros</span>
                            </TabsTrigger>
                            <TabsTrigger value="leads" className="flex-1 py-2.5 px-4 rounded-lg data-[state=active]:bg-white data-[state=active]:shadow-sm gap-2">
                                <MessageSquare className="h-4 w-4" />
                                <span className="whitespace-nowrap">Leads</span>
                            </TabsTrigger>
                            <TabsTrigger value="users" className="flex-1 py-2.5 px-4 rounded-lg data-[state=active]:bg-white data-[state=active]:shadow-sm gap-2">
                                <Users className="h-4 w-4" />
                                <span className="whitespace-nowrap">Usuários</span>
                            </TabsTrigger>
                            <TabsTrigger value="contratos" className="flex-1 py-2.5 px-4 rounded-lg data-[state=active]:bg-white data-[state=active]:shadow-sm gap-2">
                                <FileText className="h-4 w-4" />
                                <span className="whitespace-nowrap">Gerenciar Contratos</span>
                            </TabsTrigger>
                        </TabsList>
                    </div>

                    <div className="bg-white rounded-2xl border border-slate-100 p-6 shadow-sm min-h-[400px]">
                        <TabsContent value="auditoria" className="mt-0 outline-none">
                            <DashboardAuditoria />
                        </TabsContent>
                        <TabsContent value="relatorios" className="mt-0 outline-none">
                            <DashboardRelatorios />
                        </TabsContent>
                        <TabsContent value="vendas" className="mt-0 outline-none">
                            <DashboardSales />
                        </TabsContent>
                        <TabsContent value="parceiros" className="mt-0 outline-none">
                            <DashboardPartners />
                        </TabsContent>
                        <TabsContent value="leads" className="mt-0 outline-none">
                            <DashboardLeads />
                        </TabsContent>
                        <TabsContent value="users" className="mt-0 outline-none">
                            <DashboardUsers />
                        </TabsContent>
                        <TabsContent value="contratos" className="mt-0 outline-none">
                            <DashboardContracts />
                        </TabsContent>
                    </div>
                </Tabs>
            </div>
        </AdminLayout>
    );
};

export default Admin;
