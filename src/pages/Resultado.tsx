import { useEffect, useState } from "react";
import { useParams, useNavigate } from "react-router-dom";
import { Layout } from "@/components/Layout";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { Download, Share2, Loader2, AlertCircle, ArrowLeft } from "lucide-react";
import { supabase } from "@/lib/supabase";
import { toast } from "sonner";
import { ScoreCard } from "@/components/audit-flow/ScoreCard";
import { FinancialImpactCard } from "@/components/audit-flow/FinancialImpactCard";
import { IssuesList } from "@/components/audit-flow/IssuesList";
import { AuditActions } from "@/components/audit-flow/AuditActions";

interface AuditRecord {
  id: string;
  created_at: string;
  contract_type: string;
  status: string;
  score_vantagem: number;
  ai_result_json: any;
}

const Resultado = () => {
  const { id } = useParams<{ id: string }>();
  const navigate = useNavigate();
  const [loading, setLoading] = useState(true);
  const [audit, setAudit] = useState<AuditRecord | null>(null);

  useEffect(() => {
    if (id) {
      fetchAudit(id);
    }
  }, [id]);

  const fetchAudit = async (auditId: string) => {
    try {
      const { data, error } = await supabase
        .from('auditorias_contratos')
        .select('*')
        .eq('id', auditId)
        .single();

      if (error) throw error;
      setAudit(data);
    } catch (error) {
      console.error("Erro ao buscar auditoria:", error);
      toast.error("Erro ao carregar o laudo.");
      navigate('/relatorios');
    } finally {
      setLoading(false);
    }
  };

  if (loading) {
    return (
      <Layout>
        <div className="flex flex-col items-center justify-center min-h-[60vh]">
          <Loader2 className="h-12 w-12 animate-spin text-primary mb-4" />
          <p className="text-muted-foreground">Carregando laudo...</p>
        </div>
      </Layout>
    );
  }

  if (!audit || !audit.ai_result_json) {
    return (
      <Layout>
        <div className="flex flex-col items-center justify-center min-h-[60vh] text-center px-4">
          <AlertCircle className="h-16 w-16 text-destructive mb-4" />
          <h2 className="text-2xl font-bold mb-2">Laudo não encontrado</h2>
          <p className="text-muted-foreground mb-6">
            Não foi possível localizar os dados desta auditoria.
          </p>
          <Button onClick={() => navigate('/relatorios')}>
            Voltar para Meus Relatórios
          </Button>
        </div>
      </Layout>
    );
  }

  const aiData = audit.ai_result_json;
  const contractType = aiData.tipo_contrato_identificado || audit.contract_type || "Contrato";
  const score = aiData.score_risco_contrato !== undefined ? aiData.score_risco_contrato : (audit.score_vantagem || 0);

  // Ensure score is 0-100 for display if it comes as 0-10
  const displayScore = score <= 10 ? score * 10 : score;

  return (
    <Layout>
      <div className="max-w-5xl mx-auto space-y-8 py-8 px-4">
        {/* Header */}
        <div className="flex flex-col md:flex-row md:items-start md:justify-between gap-4">
          <div>
            <Button
              variant="ghost"
              className="pl-0 mb-2 hover:bg-transparent hover:text-primary"
              onClick={() => navigate('/relatorios')}
            >
              <ArrowLeft className="h-4 w-4 mr-2" />
              Voltar para Relatórios
            </Button>
            <h1 className="text-3xl font-bold text-foreground">Laudo Forense</h1>
            <p className="text-muted-foreground mt-1">
              {contractType} • Analisado em {new Date(audit.created_at).toLocaleDateString('pt-BR', {
                day: '2-digit',
                month: '2-digit',
                year: 'numeric',
                hour: '2-digit',
                minute: '2-digit'
              })}
            </p>
          </div>
          <div className="flex gap-2">
            <Button variant="outline" size="sm">
              <Download className="h-4 w-4 mr-2" />
              Exportar PDF
            </Button>
            <Button variant="outline" size="sm">
              <Share2 className="h-4 w-4 mr-2" />
              Compartilhar
            </Button>
          </div>
        </div>

        {/* Main Content Grid */}
        <div className="grid gap-8">

          {/* Score Card */}
          <ScoreCard
            score={displayScore}
            riskLevel={displayScore >= 60 ? "Risco Alto" : displayScore >= 30 ? "Risco Médio" : "Risco Baixo"}
            contractType={contractType}
          />

          {/* Financial Impact */}
          <FinancialImpactCard
            totalCharged={aiData.diagnostico_caixa_e_risco?.valor_total_original_R$ || 0}
            legalValue={(aiData.diagnostico_caixa_e_risco?.valor_total_original_R$ || 0) - (aiData.diagnostico_caixa_e_risco?.economia_potencial_R$ || 0)}
            potentialSavings={aiData.diagnostico_caixa_e_risco?.economia_potencial_R$ || 0}
          />

          {/* Issues List */}
          <IssuesList
            issues={(aiData.clausulas_analisadas || []).map((item: any) => ({
              type: item.status,
              severity: item.status === 'ABUSIVA' ? 'high' : 'medium',
              clause: item.nome_clausula,
              description: item.justificativa_legal,
              riskCategory: item.dominio,
              financialImpact: new Intl.NumberFormat('pt-BR', { style: 'currency', currency: 'BRL' }).format(item.economia_estimada_R$ || 0),
              originalText: item.texto_original_vulneravel
            }))}
          />

          {/* CTA */}
          {/* Final Actions */}
          <AuditActions
            auditData={{
              contractType: aiData.tipo_contrato_identificado,
              issues: (aiData.clausulas_analisadas || []).map((item: any) => ({
                clause: item.nome_clausula,
                description: item.justificativa_legal,
                correction: item.texto_corrigido_sugerido
              }))
            }}
          />

        </div>
      </div>
    </Layout>
  );
};

export default Resultado;
