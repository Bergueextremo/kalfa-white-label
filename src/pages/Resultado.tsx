import { useEffect, useState } from "react";
import { useParams, useNavigate } from "react-router-dom";
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

  // Polling effect to check status if processing
  useEffect(() => {
    let intervalId: NodeJS.Timeout;

    if (audit && (!audit.ai_result_json || audit.status === 'PROCESSING' || audit.status === 'processing')) {
      console.log("Status de processamento detectado. Iniciando polling...");
      intervalId = setInterval(() => {
        console.log("Polling audit status...");
        fetchAudit(id!);
      }, 5000); // Check every 5 seconds
    }

    return () => {
      if (intervalId) clearInterval(intervalId);
    };
  }, [audit, id]);

  const fetchAudit = async (auditId: string) => {
    try {
      // First try direct access (works if user is logged in and owns the audit)
      const { data, error } = await supabase
        .from('auditorias_contratos')
        .select('*')
        .eq('id', auditId)
        .single();

      if (!error && data) {
        setAudit(data);
        return;
      }

      // If direct access fails (e.g. RLS blocks public user), try Edge Function
      console.log("Acesso direto falhou, tentando via Edge Function...");
      const { data: publicData, error: functionError } = await supabase.functions.invoke('get-public-audit', {
        body: { audit_id: auditId }
      });

      if (functionError) throw functionError;
      if (publicData) {
        setAudit(publicData);
        return;
      }

      throw error || new Error("Auditoria não encontrada");

    } catch (error) {
      console.error("Erro ao buscar auditoria:", error);
      toast.error("Erro ao carregar o laudo.");
      // Only redirect if we really can't load it
      // navigate('/relatorios'); // Removed auto-redirect to avoid auth loop
    } finally {
      setLoading(false);
    }
  };

  if (loading) {
    return (
      <div className="min-h-screen flex items-center justify-center">
        <div className="flex flex-col items-center">
          <Loader2 className="h-12 w-12 animate-spin text-primary mb-4" />
          <p className="text-muted-foreground">Carregando laudo...</p>
        </div>
      </div>
    );
  }

  if (!audit) {
    return (
      <div className="min-h-screen flex items-center justify-center">
        <div className="flex flex-col items-center text-center px-4 max-w-md">
          <AlertCircle className="h-16 w-16 text-destructive mb-4" />
          <h2 className="text-2xl font-bold mb-2">Laudo não encontrado</h2>
          <p className="text-muted-foreground mb-6">
            Não foi possível localizar os dados desta auditoria.
          </p>
          <Button onClick={() => navigate('/')}>
            Voltar para Início
          </Button>
        </div>
      </div>
    );
  }

  // If audit is being processed, show processing UI
  if (!audit.ai_result_json || audit.status === 'processing') {
    return (
      <div className="min-h-screen flex items-center justify-center bg-gradient-to-br from-slate-50 to-slate-100">
        <div className="flex flex-col items-center text-center px-4 max-w-2xl">
          <div className="relative mb-6">
            <div className="absolute inset-0 bg-primary/20 blur-xl rounded-full animate-pulse" />
            <Loader2 className="h-16 w-16 text-primary animate-spin relative z-10" />
          </div>
          <h2 className="text-2xl font-bold mb-2">Processando Auditoria Premium</h2>
          <p className="text-muted-foreground mb-6 max-w-md">
            Nossa IA está analisando cada cláusula do seu contrato com o Gemini Pro.
            Isso pode levar alguns minutos. Esta página será atualizada automaticamente.
          </p>
          <div className="flex gap-4">
            <Button variant="outline" onClick={() => window.location.reload()}>
              Atualizar Página
            </Button>
            <Button onClick={() => navigate('/')}>
              Voltar para Início
            </Button>
          </div>
        </div>
      </div>
    );
  }

  const aiData = audit.ai_result_json;
  const contractType = aiData.tipo_contrato_identificado || audit.contract_type || "Contrato";
  const score = aiData.score_risco_contrato !== undefined ? aiData.score_risco_contrato : (audit.score_vantagem || 0);

  // Ensure score is 0-100 for display if it comes as 0-10
  const displayScore = score <= 10 ? score * 10 : score;

  return (
    <div className="min-h-screen bg-background">
      <div className="max-w-5xl mx-auto space-y-8 py-8 px-4">
        {/* Header */}
        <div className="flex flex-col md:flex-row md:items-start md:justify-between gap-4">
          <div>
            <Button
              variant="ghost"
              className="pl-0 mb-2 hover:bg-transparent hover:text-primary"
              onClick={() => navigate('/')}
            >
              <ArrowLeft className="h-4 w-4 mr-2" />
              Voltar para Início
            </Button>
            <h1 className="text-3xl font-bold text-foreground">Laudo Forense Premium</h1>
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
    </div>
  );
};

export default Resultado;
