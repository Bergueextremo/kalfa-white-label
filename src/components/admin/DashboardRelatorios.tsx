import { useEffect, useState } from "react";
import { Card, CardContent } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { Button } from "@/components/ui/button";
import { FileText, Download, Eye, Loader2, Trash2 } from "lucide-react";
import { useNavigate } from "react-router-dom";
import { supabase } from "@/lib/supabase";
import { useAuth } from "@/contexts/AuthContext";
import { toast } from "sonner";

interface AuditRecord {
    id: string;
    created_at: string;
    contract_type: string;
    status: string;
    score_vantagem: number;
}

export function DashboardRelatorios() {
    const navigate = useNavigate();
    const { user } = useAuth();
    const [audits, setAudits] = useState<AuditRecord[]>([]);
    const [loading, setLoading] = useState(true);

    useEffect(() => {
        if (user) {
            fetchAudits();
        }
    }, [user]);

    const fetchAudits = async () => {
        try {
            setLoading(true);
            const { data, error } = await supabase
                .from('auditorias_contratos')
                .select('*')
                .eq('user_id', user!.id)
                .order('created_at', { ascending: false });

            if (error) throw error;
            setAudits(data || []);
        } catch (error) {
            console.error("Erro ao buscar auditorias:", error);
            toast.error("Erro ao carregar relatórios");
        } finally {
            setLoading(false);
        }
    };

    const handleDelete = async (id: string) => {
        if (!confirm("Deseja realmente excluir este relatório?")) return;
        try {
            const { error } = await supabase
                .from('auditorias_contratos')
                .delete()
                .eq('id', id);

            if (error) throw error;

            setAudits(audits.filter(a => a.id !== id));
            toast.success("Relatório removido");
        } catch (error) {
            console.error("Erro ao deletar:", error);
            toast.error("Erro ao remover relatório");
        }
    };

    const getStatusBadge = (status: string) => {
        switch (status) {
            case 'COMPLETED':
                return <Badge className="bg-green-100 text-green-700 hover:bg-green-100 border-green-200">Concluído</Badge>;
            case 'PROCESSING':
                return <Badge className="bg-blue-100 text-blue-700 hover:bg-blue-100 border-blue-200">Em Análise</Badge>;
            case 'FAILED':
                return <Badge variant="destructive">Falha</Badge>;
            default:
                return <Badge variant="secondary">{status}</Badge>;
        }
    };

    return (
        <div className="space-y-6">
            <div>
                <h2 className="text-2xl font-bold text-slate-900">Meus Relatórios</h2>
                <p className="text-slate-500 mt-1 text-sm">Histórico de auditorias realizadas por você</p>
            </div>

            {loading ? (
                <div className="flex justify-center py-12">
                    <Loader2 className="h-8 w-8 animate-spin text-primary" />
                </div>
            ) : audits.length === 0 ? (
                <Card className="border-dashed">
                    <CardContent className="flex flex-col items-center justify-center py-12 text-center">
                        <FileText className="h-12 w-12 text-slate-300 mb-4" />
                        <h3 className="text-lg font-semibold text-slate-900">Nenhum relatório encontrado</h3>
                        <p className="text-slate-500 text-sm max-w-xs">
                            Você ainda não realizou nenhuma auditoria de contrato.
                        </p>
                    </CardContent>
                </Card>
            ) : (
                <div className="space-y-3">
                    {audits.map((audit) => (
                        <Card key={audit.id} className="overflow-hidden hover:shadow-sm transition-shadow border-slate-100">
                            <div className="p-4 flex flex-col sm:flex-row items-start sm:items-center justify-between gap-4">
                                <div className="flex items-start gap-4">
                                    <div className="p-2 bg-slate-50 rounded-lg border border-slate-100">
                                        {audit.status === 'PROCESSING' ? (
                                            <Loader2 className="h-5 w-5 text-blue-500 animate-spin" />
                                        ) : (
                                            <FileText className="h-5 w-5 text-slate-400" />
                                        )}
                                    </div>
                                    <div>
                                        <h3 className="font-bold text-slate-900 text-sm leading-tight">
                                            {audit.contract_type || "Auditoria Avulsa"}
                                        </h3>
                                        <div className="flex items-center gap-2 text-[10px] text-slate-500 mt-1 uppercase font-medium">
                                            <span>{new Date(audit.created_at).toLocaleDateString('pt-BR', {
                                                day: '2-digit',
                                                month: '2-digit',
                                                year: 'numeric',
                                                hour: '2-digit',
                                                minute: '2-digit'
                                            })}</span>
                                            <span>•</span>
                                            {getStatusBadge(audit.status)}
                                        </div>
                                    </div>
                                </div>

                                <div className="flex items-center gap-2 w-full sm:w-auto ml-auto">
                                    {audit.status === 'COMPLETED' && (
                                        <Button
                                            variant="outline"
                                            size="sm"
                                            className="h-8 gap-2 text-xs font-bold border-slate-200"
                                            onClick={() => navigate(`/resultado/${audit.id}`)}
                                        >
                                            <Eye className="h-3.5 w-3.5" />
                                            Ver Resultado
                                        </Button>
                                    )}
                                    <Button
                                        variant="ghost"
                                        size="icon"
                                        className="h-8 w-8 text-slate-300 hover:text-red-500 hover:bg-red-50"
                                        onClick={() => handleDelete(audit.id)}
                                    >
                                        <Trash2 className="h-4 w-4" />
                                    </Button>
                                </div>
                            </div>
                        </Card>
                    ))}
                </div>
            )}
        </div>
    );
}
