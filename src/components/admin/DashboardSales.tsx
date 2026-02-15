import { Card, CardContent } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { Button } from "@/components/ui/button";
import { Download, DollarSign, TrendingUp, Loader2, Eye } from "lucide-react";
import { useState, useEffect } from "react";
import { supabase } from "@/lib/supabase";
import { toast } from "sonner";

interface Transaction {
    id: string;
    date: string;
    user: string;
    item: string;
    amount: number;
    status: string;
    file_path?: string;
    coupon_code?: string;
}

export function DashboardSales() {
    const [transactions, setTransactions] = useState<Transaction[]>([]);
    const [loading, setLoading] = useState(true);

    useEffect(() => {
        fetchSales();
    }, []);

    const fetchSales = async () => {
        try {
            setLoading(true);
            const { data, error } = await supabase.functions.invoke('get-admin-data', {
                body: { action: 'list_sales' }
            });

            if (error) throw error;
            setTransactions(data.sales || []);
        } catch (error) {
            console.error('Error fetching sales:', error);
            toast.error('Erro ao carregar vendas');
        } finally {
            setLoading(false);
        }
    };

    const handleViewContract = async (filePath: string) => {
        try {
            const { data, error } = await supabase.storage
                .from('contracts')
                .createSignedUrl(filePath, 3600);

            if (error) throw error;
            window.open(data.signedUrl, '_blank');
        } catch (error) {
            console.error('Error opening contract:', error);
            toast.error('Erro ao abrir contrato');
        }
    };

    const getStatusColor = (status: string) => {
        switch (status) {
            case 'Approved': return 'bg-green-100 text-green-700 border-green-200';
            case 'Pending': return 'bg-yellow-100 text-yellow-700 border-yellow-200';
            case 'Failed': return 'bg-red-100 text-red-700 border-red-200';
            default: return 'bg-slate-100 text-slate-700';
        }
    };

    const getStatusLabel = (status: string) => {
        switch (status) {
            case 'Approved': return 'Aprovado';
            case 'Pending': return 'Pendente';
            case 'Failed': return 'Falhou';
            default: return status;
        }
    };

    const totalRevenue = transactions
        .filter(t => t.status === 'Approved')
        .reduce((sum, t) => sum + t.amount, 0);

    const approvedCount = transactions.filter(t => t.status === 'Approved').length;
    const averageTicket = approvedCount > 0 ? totalRevenue / approvedCount : 0;

    const handleExport = () => {
        const headers = ["Data", "Usuário", "Item", "Cupom", "Valor", "Status"];
        const csvContent = [
            headers.join(","),
            ...transactions.map(t =>
                [
                    new Date(t.date).toLocaleDateString(),
                    t.user,
                    t.item,
                    t.coupon_code || "",
                    t.amount.toFixed(2),
                    getStatusLabel(t.status)
                ].join(",")
            )
        ].join("\n");

        const blob = new Blob([csvContent], { type: "text/csv;charset=utf-8;" });
        const link = document.createElement("a");
        const url = URL.createObjectURL(blob);

        link.setAttribute("href", url);
        link.setAttribute("download", `relatorio-vendas-${new Date().toISOString().split('T')[0]}.csv`);
        link.style.visibility = "hidden";
        document.body.appendChild(link);
        link.click();
        document.body.removeChild(link);
    };

    return (
        <div className="space-y-6">
            <div className="flex justify-between items-center">
                <div>
                    <h2 className="text-2xl font-bold text-slate-900">Vendas</h2>
                    <p className="text-slate-500 mt-1 text-sm">Relatório de transações financeiras</p>
                </div>
                <Button onClick={handleExport} size="sm" className="gap-2">
                    <Download className="h-4 w-4" />
                    Exportar
                </Button>
            </div>

            <div className="grid grid-cols-1 md:grid-cols-2 gap-4">
                <Card>
                    <CardContent className="p-4 flex items-center justify-between">
                        <div>
                            <p className="text-xs font-medium text-slate-500">Receita do Período</p>
                            <h3 className="text-xl font-bold text-slate-900 mt-1">
                                R$ {totalRevenue.toLocaleString('pt-BR', { minimumFractionDigits: 2 })}
                            </h3>
                        </div>
                        <div className="h-10 w-10 bg-green-100 rounded-full flex items-center justify-center">
                            <DollarSign className="h-5 w-5 text-green-600" />
                        </div>
                    </CardContent>
                </Card>
                <Card>
                    <CardContent className="p-4 flex items-center justify-between">
                        <div>
                            <p className="text-xs font-medium text-slate-500">Ticket Médio</p>
                            <h3 className="text-xl font-bold text-slate-900 mt-1">
                                R$ {averageTicket.toLocaleString('pt-BR', { minimumFractionDigits: 2 })}
                            </h3>
                        </div>
                        <div className="h-10 w-10 bg-blue-100 rounded-full flex items-center justify-center">
                            <TrendingUp className="h-5 w-5 text-blue-600" />
                        </div>
                    </CardContent>
                </Card>
            </div>

            <Card>
                <CardContent className="p-0 overflow-x-auto">
                    {loading ? (
                        <div className="flex justify-center py-12">
                            <Loader2 className="h-8 w-8 animate-spin text-primary" />
                        </div>
                    ) : (
                        <table className="w-full text-sm">
                            <thead className="bg-slate-50 border-b border-slate-200">
                                <tr>
                                    <th className="text-left py-3 px-4 font-semibold text-slate-600">Data</th>
                                    <th className="text-left py-3 px-4 font-semibold text-slate-600">Usuário</th>
                                    <th className="text-left py-3 px-4 font-semibold text-slate-600">Cupom</th>
                                    <th className="text-left py-3 px-4 font-semibold text-slate-600">Status</th>
                                    <th className="text-right py-3 px-4 font-semibold text-slate-600">Valor</th>
                                    <th className="text-right py-3 px-4 font-semibold text-slate-600">Ações</th>
                                </tr>
                            </thead>
                            <tbody>
                                {transactions.map((t) => (
                                    <tr key={t.id} className="border-b border-slate-100 hover:bg-slate-50 transition-colors">
                                        <td className="py-3 px-4 text-slate-600">
                                            {new Date(t.date).toLocaleDateString()}
                                        </td>
                                        <td className="py-3 px-4 font-medium text-slate-900">
                                            <div className="max-w-[150px] truncate" title={t.user}>{t.user}</div>
                                        </td>
                                        <td className="py-3 px-4 text-slate-600">
                                            {t.coupon_code || '-'}
                                        </td>
                                        <td className="py-3 px-4">
                                            <Badge className={`${getStatusColor(t.status)} text-[10px] px-2 py-0`} variant="outline">
                                                {getStatusLabel(t.status)}
                                            </Badge>
                                        </td>
                                        <td className="py-3 px-4 text-right font-medium text-slate-900">
                                            R$ {t.amount.toFixed(2)}
                                        </td>
                                        <td className="py-3 px-4 text-right">
                                            {t.file_path && (
                                                <Button
                                                    variant="ghost"
                                                    size="icon"
                                                    className="h-8 w-8"
                                                    onClick={() => handleViewContract(t.file_path!)}
                                                    title="Ver Contrato"
                                                >
                                                    <Eye className="h-4 w-4" />
                                                </Button>
                                            )}
                                        </td>
                                    </tr>
                                ))}
                            </tbody>
                        </table>
                    )}
                </CardContent>
            </Card>
        </div>
    );
}
