import { useEffect, useState } from "react";
import { useParams, useNavigate } from "react-router-dom";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { Download, Share2, Loader2, AlertCircle, ArrowLeft, Upload, FileText, Shield, TrendingUp, Edit3, CheckCircle, RefreshCw } from "lucide-react";
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
  file_path: string;
}

interface ProcessingStep {
  id: string;
  title: string;
  icon: React.ElementType;
  status: 'pending' | 'current' | 'completed';
  duration: string;
  substeps?: string[];
}

const Resultado = () => {
  const { id } = useParams<{ id: string }>();
  const navigate = useNavigate();
  const [loading, setLoading] = useState(true);
  const [audit, setAudit] = useState<AuditRecord | null>(null);
  const [processingSteps, setProcessingSteps] = useState<ProcessingStep[]>([
    { id: 'upload', title: 'Recebendo Arquivo Seguro', icon: Upload, status: 'completed', duration: '2s' },
    { id: 'reading', title: 'Identificando Tipo de Contrato', icon: FileText, status: 'completed', duration: '5s' },
    { id: 'analysis', title: 'Escaneando Cláusulas Abusivas', icon: Shield, status: 'current', duration: '8s', substeps: [
      'Executando Varredura Forense contra Precedentes Superiores (STJ/STF)...',
      'Auditando valores financeiros e capitalização de juros...',
      'Cálculo Preditivo de Economia Financeira e Vantagem Competitiva...'
    ]},
    { id: 'score', title: 'Gerando Laudo Preliminar', icon: TrendingUp, status: 'pending', duration: '3s' },
    { id: 'correction', title: 'Finalizando Análise Premium', icon: Edit3, status: 'pending', duration: '4s' }
  ]);

  // Animate processing steps
  useEffect(() => {
    if (audit && (!audit.ai_result_json || audit.status === 'PROCESSING' || audit.status === 'processing')) {
      const interval = setInterval(() => {
        setProcessingSteps(prev => {
          const currentIndex = prev.findIndex(s => s.status === 'current');
          if (currentIndex === -1 || currentIndex >= prev.length - 1) {
            // Reset cycle
            return prev.map((s, i) => ({
              ...s,
              status: i === 0 ? 'current' : 'pending'
            })) as ProcessingStep[];
          }
          return prev.map((s, i) => ({
            ...s,
            status: i < currentIndex + 1 ? 'completed' : i === currentIndex + 1 ? 'current' : 'pending'
          })) as ProcessingStep[];
        });
      }, 4000);
      return () => clearInterval(interval);
    }
  }, [audit]);

  useEffect(() => {
    if (id) {
      fetchAudit(id);
    }
  }, [id]);

  // Auto-trigger process-audit if audit is in PROCESSING state but hasn't been processed yet
  const [processingTriggered, setProcessingTriggered] = useState(false);
  
  useEffect(() => {
    const triggerProcessing = async () => {
      if (
        audit && 
        !processingTriggered &&
        !audit.ai_result_json && 
        (audit.status === 'PROCESSING' || audit.status === 'processing')
      ) {
        setProcessingTriggered(true);
        console.log("Auditoria em PROCESSING sem resultado. Disparando process-audit...");
        
        try {
          const { data, error } = await supabase.functions.invoke('process-audit', {
            body: { audit_id: audit.id, file_path: audit.file_path }
          });
          
          if (error) {
            console.error("Erro ao iniciar process-audit:", error);
          } else {
            console.log("process-audit disparado com sucesso:", data);
          }
        } catch (err) {
          console.error("Erro ao chamar process-audit:", err);
        }
      }
    };
    
    triggerProcessing();
  }, [audit, processingTriggered]);

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

  // If audit is being processed, show processing UI with 50/50 layout
  if (!audit.ai_result_json || audit.status === 'processing' || audit.status === 'PROCESSING') {
    const handleRetryProcessing = async () => {
      try {
        toast.info("Reiniciando processamento...");
        const { data, error } = await supabase.functions.invoke('process-audit', {
          body: { audit_id: audit.id, file_path: audit.file_path }
        });
        if (error) throw error;
        toast.success("Processamento reiniciado!");
        setTimeout(() => fetchAudit(id!), 3000);
      } catch (err) {
        console.error("Erro ao reprocessar:", err);
        toast.error("Erro ao reiniciar processamento");
      }
    };

    return (
      <div className="min-h-screen flex flex-col lg:flex-row">
        {/* Left Panel - White with spinner */}
        <div className="flex-1 bg-gradient-to-br from-slate-50 to-slate-100 flex items-center justify-center p-8">
          <div className="max-w-md text-center">
            <div className="relative mb-8 inline-block">
              <div className="absolute inset-0 bg-primary/20 blur-2xl rounded-full scale-150 animate-pulse" />
              <Loader2 className="h-20 w-20 text-primary animate-spin relative z-10" />
            </div>
            
            <h2 className="text-3xl font-bold text-slate-900 mb-4">
              Processando seu Contrato...
            </h2>
            <p className="text-slate-600 mb-8 leading-relaxed">
              Nosso Autenticador Jurídico está analisando cada cláusula em busca de irregularidades. 
              Isso pode levar alguns segundos.
            </p>

            <div className="flex flex-col sm:flex-row gap-3 justify-center">
              <Button variant="outline" onClick={handleRetryProcessing} className="gap-2">
                <RefreshCw className="h-4 w-4" />
                Reprocessar
              </Button>
              <Button onClick={() => navigate('/')} className="gap-2">
                <ArrowLeft className="h-4 w-4" />
                Voltar para Início
              </Button>
            </div>
          </div>
        </div>

        {/* Right Panel - Dark with progress timeline */}
        <div className="flex-1 bg-gradient-to-br from-slate-800 to-slate-900 flex items-center justify-center p-8">
          <div className="max-w-lg w-full">
            <h3 className="text-2xl font-bold text-white mb-2">
              Auditoria Forense em Tempo Real
            </h3>
            <p className="text-slate-400 mb-8">
              Acompanhe o processamento do seu documento pelo nosso Autenticador Jurídico.
            </p>

            {/* Progress Steps */}
            <div className="space-y-4">
              {processingSteps.map((step, idx) => {
                const Icon = step.icon;
                const isActive = step.status === 'current';
                const isCompleted = step.status === 'completed';

                return (
                  <div key={step.id} className="relative">
                    <div className="flex items-start gap-4">
                      {/* Icon Circle */}
                      <div className={`
                        relative z-10 flex items-center justify-center w-10 h-10 rounded-full transition-all duration-500
                        ${isCompleted ? 'bg-green-500/20 border-2 border-green-500' :
                          isActive ? 'bg-blue-500/20 border-2 border-blue-500 animate-pulse' :
                          'bg-slate-700/50 border-2 border-slate-600'}
                      `}>
                        {isCompleted ? (
                          <CheckCircle className="w-5 h-5 text-green-400" />
                        ) : (
                          <Icon className={`w-5 h-5 ${isActive ? 'text-blue-400' : 'text-slate-500'}`} />
                        )}
                      </div>

                      {/* Content */}
                      <div className="flex-1 pb-4">
                        <div className="flex items-center gap-3">
                          <span className={`
                            font-medium transition-colors duration-300
                            ${isCompleted ? 'text-green-400' :
                              isActive ? 'text-blue-400' :
                              'text-slate-500'}
                          `}>
                            {step.title}
                            {isActive && '...'}
                          </span>
                        </div>

                        {/* Substeps for active step */}
                        {isActive && step.substeps && (
                          <div className="mt-3 space-y-2">
                            {step.substeps.map((substep, subIdx) => (
                              <div key={subIdx} className="flex items-center gap-2 text-sm text-slate-400">
                                <div className="w-1.5 h-1.5 bg-blue-400 rounded-full animate-pulse"></div>
                                {substep}
                              </div>
                            ))}
                          </div>
                        )}
                      </div>
                    </div>

                    {/* Connector line */}
                    {idx < processingSteps.length - 1 && (
                      <div className={`
                        absolute left-5 top-10 w-0.5 h-6 -ml-px transition-colors duration-500
                        ${isCompleted ? 'bg-green-500/50' : 'bg-slate-700'}
                      `} />
                    )}
                  </div>
                );
              })}
            </div>
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
