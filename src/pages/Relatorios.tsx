import { useEffect, useState } from "react";
import { Layout } from "@/components/Layout";
import { Card, CardContent } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { Button } from "@/components/ui/button";
import { FileText, Download, Eye, Loader2, AlertCircle, Trash2, Sparkles } from "lucide-react";
import { useNavigate } from "react-router-dom";
import { supabase } from "@/lib/supabase";
import { useAuth } from "@/contexts/AuthContext";
import { toast } from "sonner";
import { QuickAuditModal } from "@/components/QuickAuditModal";

interface AuditRecord {
  id: string;
  created_at: string;
  contract_type: string;
  status: string;
  score_vantagem: number;
  ai_result_json: any;
}

const Relatorios = () => {
  const navigate = useNavigate();
  const { user } = useAuth();
  const [audits, setAudits] = useState<AuditRecord[]>([]);
  const [loading, setLoading] = useState(true);
  const [dateFilter, setDateFilter] = useState<'7' | '30' | '90' | 'all'>('all');
  const [showQuickAudit, setShowQuickAudit] = useState(false);

  useEffect(() => {
    if (user) {
      fetchAudits();
    }
  }, [user]);

  const fetchAudits = async () => {
    try {
      const { data, error } = await supabase
        .from('auditorias_contratos')
        .select('*')
        .eq('user_id', user!.id)
        .order('created_at', { ascending: false });

      if (error) throw error;
      setAudits(data || []);
    } catch (error) {
      console.error("Erro ao buscar auditorias:", error);
    } finally {
      setLoading(false);
    }
  };

  const handleDelete = async (id: string) => {
    try {
      const { error } = await supabase
        .from('auditorias_contratos')
        .delete()
        .eq('id', id);

      if (error) throw error;

      setAudits(audits.filter(a => a.id !== id));
      toast.success("Auditoria removida com sucesso.");
    } catch (error) {
      console.error("Erro ao deletar:", error);
      toast.error("Erro ao remover auditoria.");
    }
  };

  const getStatusBadge = (status: string) => {
    switch (status) {
      case 'COMPLETED':
        return <Badge className="bg-green-100 text-green-700 hover:bg-green-100">Concluído</Badge>;
      case 'PROCESSING':
        return <Badge className="bg-blue-100 text-blue-700 hover:bg-blue-100">Em Análise</Badge>;
      case 'FAILED':
        return <Badge variant="destructive">Falha</Badge>;
      default:
        return <Badge variant="secondary">{status}</Badge>;
    }
  };

  return (
    <Layout>
      <div className="space-y-6">
        <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-4">
          <div>
            <h1 className="text-3xl font-bold text-foreground">Meus Relatórios</h1>
            <p className="text-muted-foreground mt-1">
              Acesse o histórico completo de suas auditorias
            </p>
          </div>

          <Button
            onClick={() => setShowQuickAudit(true)}
            className="bg-primary hover:bg-primary/90 text-white shadow-lg hover:shadow-xl transition-all"
          >
            <Sparkles className="mr-2 h-4 w-4" />
            Nova Auditoria Rápida
          </Button>
        </div>

        <QuickAuditModal
          open={showQuickAudit}
          onOpenChange={setShowQuickAudit}
        />

        {loading ? (
          <div className="flex justify-center py-12">
            <Loader2 className="h-8 w-8 animate-spin text-primary" />
          </div>
        ) : audits.length === 0 ? (
          <Card className="border-dashed">
            <CardContent className="flex flex-col items-center justify-center py-12 text-center">
              <FileText className="h-12 w-12 text-muted-foreground mb-4" />
              <h3 className="text-lg font-semibold">Nenhuma auditoria encontrada</h3>
              <p className="text-muted-foreground mb-4">
                Você ainda não realizou nenhuma auditoria de contrato.
              </p>
              <Button onClick={() => setShowQuickAudit(true)}>
                Nova Auditoria
              </Button>
            </CardContent>
          </Card>
        ) : (
          <div className="space-y-4">
            {audits.map((audit) => (
              <Card key={audit.id} className="overflow-hidden hover:shadow-md transition-shadow">
                <div className="p-6 flex flex-col sm:flex-row items-start sm:items-center justify-between gap-4">
                  <div className="flex items-start gap-4">
                    <div className="p-2 bg-slate-100 rounded-lg">
                      {audit.status === 'PROCESSING' ? (
                        <Loader2 className="h-6 w-6 text-blue-600 animate-spin" />
                      ) : (
                        <FileText className="h-6 w-6 text-slate-600" />
                      )}
                    </div>
                    <div>
                      <h3 className="font-semibold text-lg">
                        {audit.contract_type || "Contrato não identificado"}
                      </h3>
                      <div className="flex items-center gap-2 text-sm text-muted-foreground mt-1">
                        <span>Analisado em {new Date(audit.created_at).toLocaleDateString('pt-BR', {
                          day: '2-digit',
                          month: '2-digit',
                          year: 'numeric',
                          hour: '2-digit',
                          minute: '2-digit'
                        })}</span>
                      </div>
                      <div className="mt-2">
                        {getStatusBadge(audit.status)}
                      </div>
                    </div>
                  </div>

                  <div className="flex items-center gap-2 w-full sm:w-auto">
                    {audit.status === 'COMPLETED' && (
                      <>
                        <Button
                          variant="outline"
                          size="sm"
                          className="flex-1 sm:flex-none gap-2"
                          onClick={() => navigate(`/resultado/${audit.id}`)}
                        >
                          <Eye className="h-4 w-4" />
                          Ver Laudo
                        </Button>
                        <Button variant="ghost" size="icon" className="text-muted-foreground">
                          <Download className="h-4 w-4" />
                        </Button>
                      </>
                    )}
                    <Button
                      variant="ghost"
                      size="icon"
                      className="text-muted-foreground hover:text-destructive"
                      onClick={() => handleDelete(audit.id)}
                      title="Excluir auditoria"
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
    </Layout>
  );
};

export default Relatorios;
