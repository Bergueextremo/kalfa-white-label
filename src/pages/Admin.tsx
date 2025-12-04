import { AdminLayout } from "@/components/admin/AdminLayout";
import { MetricCard } from "@/components/admin/MetricCard";
import { FileText, DollarSign, Users, TrendingUp, Loader2 } from "lucide-react";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { useState, useEffect } from "react";
import { supabase } from "@/lib/supabase";
import { toast } from "sonner";
import { SalesChart } from "@/components/dashboard/SalesChart";
import { DatePickerWithRange } from "@/components/ui/date-range-picker";
import { DateRange } from "react-day-picker";
import { subDays } from "date-fns";

interface ChartData {
    date: string;
    revenue: number;
}

interface Metrics {
    totalAudits: number;
    totalSales: number;
    conversionRate: number;
    averageTicket: number;
    totalUsers: number;
    chartData?: ChartData[];
}

const Admin = () => {
    const [metrics, setMetrics] = useState<Metrics>({
        totalAudits: 0,
        totalSales: 0,
        conversionRate: 0,
        averageTicket: 0,
        totalUsers: 0,
        chartData: []
    });
    const [loading, setLoading] = useState(true);
    const [date, setDate] = useState<DateRange | undefined>({
        from: subDays(new Date(), 30),
        to: new Date(),
    });

    useEffect(() => {
        if (date?.from && date?.to) {
            fetchMetrics();
        }
    }, [date]);

    const fetchMetrics = async () => {
        try {
            setLoading(true);
            if (!date?.from || !date?.to) return;

            const startDate = date.from.toISOString();
            const endDate = date.to.toISOString();

            const { data, error } = await supabase.functions.invoke('get-admin-metrics', {
                body: { start_date: startDate, end_date: endDate }
            });

            if (error) throw error;
            setMetrics(data.metrics);
            // If the API returns chartData in the root or inside metrics, handle it.
            // Based on my previous edit to get-admin-metrics, chartData is at the root level of the response JSON, 
            // but I might have put it inside metrics or alongside it.
            // Let's check the Edge Function response structure again.
            // Response: { metrics: {...}, recentAudits: [...], chartData: [...] }
            // So I need to set chartData separately or update the state structure.
            // I'll update the state to include chartData from the response root if needed, 
            // but my Metrics interface has chartData.
            // Let's update setMetrics to merge it.

            setMetrics({
                ...data.metrics,
                chartData: data.chartData || []
            });

        } catch (error) {
            console.error('Error fetching metrics:', error);
            toast.error('Erro ao carregar métricas');
        } finally {
            setLoading(false);
        }
    };

    return (
        <AdminLayout>
            <div className="space-y-8">
                <div className="flex flex-col md:flex-row justify-between items-start md:items-center gap-4">
                    <div>
                        <h1 className="text-3xl font-bold text-slate-900">War Room</h1>
                        <p className="text-slate-500 mt-1">Visão geral de performance do negócio</p>
                    </div>
                    <DatePickerWithRange date={date} setDate={setDate} />
                </div>

                {/* KPI Cards */}
                {loading ? (
                    <div className="flex justify-center py-12">
                        <Loader2 className="h-8 w-8 animate-spin text-primary" />
                    </div>
                ) : (
                    <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
                        <MetricCard
                            title="Total Consultas"
                            value={metrics.totalAudits}
                            icon={FileText}
                            trend={{ value: 0, isPositive: true }}
                        />
                        <MetricCard
                            title="Receita Total"
                            value={metrics.totalSales.toLocaleString('pt-BR', { minimumFractionDigits: 2 })}
                            prefix="R$ "
                            icon={DollarSign}
                            trend={{ value: 0, isPositive: true }}
                        />
                        <MetricCard
                            title="Usuários Totais"
                            value={metrics.totalUsers}
                            icon={Users}
                            trend={{ value: 0, isPositive: true }}
                        />
                        <MetricCard
                            title="Taxa de Conversão"
                            value={metrics.conversionRate.toFixed(1)}
                            suffix="%"
                            icon={TrendingUp}
                            trend={{ value: 0, isPositive: true }}
                        />
                    </div>
                )}

                {/* Chart Section */}
                <SalesChart data={metrics.chartData || []} />
            </div>
        </AdminLayout>
    );
};

export default Admin;
