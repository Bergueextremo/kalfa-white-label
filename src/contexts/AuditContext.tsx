import React, { createContext, useContext, useState, ReactNode, useCallback } from 'react';
import { toast } from 'sonner';
import { useNavigate } from 'react-router-dom';
import { supabase } from '@/lib/supabase';
import { useAuth } from '@/contexts/AuthContext';
import { useCredits } from '@/contexts/CreditContext';
import { Step } from '@/components/audit-flow/ProgressTimeline';
import { Upload, FileText, Shield, TrendingUp, Edit3 } from 'lucide-react';

// Types
export type AuditStatus = 'idle' | 'upload' | 'processing' | 'result';

interface AuditContextType {
    isModalOpen: boolean;
    isMinimized: boolean;
    auditState: AuditStatus;
    selectedFile: File | null;
    steps: Step[];
    resultData: any;
    corrections: any[];
    showCheckout: boolean;
    // Actions
    openModal: () => void;
    closeModal: () => void;
    minimize: () => void;
    maximize: () => void;
    startAudit: (file: File) => Promise<void>;
    resetAudit: () => void;
    setShowCheckout: (show: boolean) => void;
    setSelectedFile: (file: File | null) => void;
}

const AuditContext = createContext<AuditContextType | undefined>(undefined);

export const useAudit = () => {
    const context = useContext(AuditContext);
    if (!context) {
        throw new Error('useAudit must be used within an AuditProvider');
    }
    return context;
};

// Initial Steps Constant
const initialSteps: Step[] = [
    {
        id: 'upload',
        title: 'Upload de Arquivo',
        icon: Upload,
        status: 'pending',
        duration: '2s'
    },
    {
        id: 'reading',
        title: 'Mapeamento de Campo',
        icon: FileText,
        status: 'pending',
        duration: '5s',
        substeps: [
            'Identificando tipo de contrato e vinculações...',
            'Extraindo cláusulas e delimitadores de responsabilidade...',
            'Mapeando partes envolvidas e histórico legal...'
        ]
    },
    {
        id: 'analysis',
        title: 'Consulta Jurídica e Criptografia',
        icon: Shield,
        status: 'pending',
        duration: '8s',
        substeps: [
            'Executando Varredura de Consulta Jurídica contra Precedentes Superiores (STJ/STF)...',
            'Auditando valores financeiros e capitalização de juros...',
            'Cálculo Preditivo de Economia Financeira e Vantagem Competitiva...'
        ]
    },
    {
        id: 'score',
        title: 'Cálculo do Score de Conformidade',
        icon: TrendingUp,
        status: 'pending',
        duration: '3s'
    },
    {
        id: 'correction',
        title: 'Geração do Laudo Final',
        icon: Edit3,
        status: 'pending',
        duration: '4s'
    }
];

export const AuditProvider = ({ children }: { children: ReactNode }) => {
    const { user } = useAuth();
    const { credits, useCredit } = useCredits();
    const navigate = useNavigate();

    // UI State
    const [isModalOpen, setIsModalOpen] = useState(false);
    const [isMinimized, setIsMinimized] = useState(false);
    const [showCheckout, setShowCheckout] = useState(false);

    // Audit Data State
    const [auditState, setAuditState] = useState<AuditStatus>('idle');
    const [selectedFile, setSelectedFile] = useState<File | null>(null);
    const [steps, setSteps] = useState<Step[]>(initialSteps);
    const [resultData, setResultData] = useState<any>(null);
    const [corrections, setCorrections] = useState<any[]>([]);

    const openModal = useCallback(async () => {
        // NOVO: Verificar se o usuário é admin
        let isAdmin = false;
        if (user) {
            try {
                const { data, error } = await supabase.rpc('has_role', {
                    _user_id: user.id,
                    _role: 'admin'
                });
                if (!error && data === true) isAdmin = true;
            } catch (e) {
                console.error("Erro ao verificar papel de admin:", e);
            }
        }

        if (!isAdmin && credits <= 0) {
            toast.error("Você precisa de créditos para iniciar uma nova auditoria.");
            navigate('/creditos');
            return;
        }
        setIsModalOpen(true);
        setIsMinimized(false);
    }, [credits, navigate, user]);

    const closeModal = useCallback(() => {
        // Only close if not processing, or if user explicitly wants to close (maybe add confirmation?)
        // For now, just close.
        setIsModalOpen(false);
        setIsMinimized(false);
    }, []);

    const minimize = useCallback(() => {
        setIsModalOpen(false);
        setIsMinimized(true);
    }, []);

    const maximize = useCallback(() => {
        setIsModalOpen(true);
        setIsMinimized(false);
    }, []);

    const resetAudit = useCallback(() => {
        setAuditState('idle'); // Changed from 'upload' to 'idle' to show empty state
        setSelectedFile(null);
        setSteps(initialSteps.map(s => ({ ...s, status: 'pending' })));
        setResultData(null);
        setCorrections([]);
    }, []);

    const updateStepStatus = (stepId: string, status: 'current' | 'completed') => {
        setSteps(prev => prev.map(s => s.id === stepId ? { ...s, status } : s));
    };

    const startAudit = async (file: File) => {
        if (!user) {
            toast.error("Você precisa estar logado para realizar uma auditoria.");
            return;
        }

        // NOVO: Verificar se o usuário é admin para liberar consulta grátis
        let isAdmin = false;
        try {
            const { data, error } = await supabase.rpc('has_role', {
                _user_id: user.id,
                _role: 'admin'
            });
            if (!error && data === true) {
                isAdmin = true;
                console.log("Admin detectado: Consulta liberada sem cobrança de créditos.");
            }
        } catch (e) {
            console.error("Erro ao verificar papel de admin:", e);
        }

        // Check and use credit (pula se for admin)
        if (!isAdmin && !(await useCredit())) {
            setShowCheckout(true);
            return;
        }

        setSelectedFile(file);
        setAuditState('processing');
        // Ensure modal is open when starting (unless we want to start in background?)
        // Let's keep it open by default.
        if (!isModalOpen && !isMinimized) {
            setIsModalOpen(true);
        }

        try {
            // 1. Upload Step
            updateStepStatus('upload', 'current');
            const fileExt = file.name.split('.').pop();
            const fileName = `${user.id}/${Math.random().toString(36).substring(2)}.${fileExt}`;
            const filePath = `${fileName}`;

            const { error: uploadError } = await supabase.storage
                .from('contracts')
                .upload(filePath, file);

            if (uploadError) {
                console.warn("Upload error:", uploadError);
                throw new Error("Erro no upload: " + uploadError.message);
            }
            updateStepStatus('upload', 'completed');

            // 2. Reading Step
            updateStepStatus('reading', 'current');

            const { data: newAudit, error: createError } = await supabase
                .from('auditorias_contratos')
                .insert({
                    user_id: user.id,
                    file_path: filePath,
                    status: 'PROCESSING',
                    contract_type: 'Detectando...'
                })
                .select()
                .single();

            if (createError) throw new Error("Erro ao criar registro de auditoria: " + createError.message);

            await new Promise(r => setTimeout(r, 1500));
            updateStepStatus('reading', 'completed');

            // 3. Analysis Step
            updateStepStatus('analysis', 'current');

            const { data: aiResponse, error: fnError } = await supabase.functions.invoke('process-audit', {
                body: {
                    audit_id: newAudit.id,
                    file_path: filePath
                }
            });

            if (fnError) throw new Error("Erro na análise: " + fnError.message);
            if (aiResponse?.error) throw new Error("Falha no processamento: " + aiResponse.error);
            if (!aiResponse?.success) throw new Error("Falha no processamento: Resposta inválida do Autenticador Jurídico");

            const aiData = aiResponse.data;

            const { error: updateError } = await supabase
                .from('auditorias_contratos')
                .update({
                    status: 'COMPLETED',
                    ai_result_json: aiData,
                    potential_savings: aiData.diagnostico_caixa_e_risco?.economia_potencial_R$ || 0,
                    score_vantagem: aiData.score_risco_contrato || 0,
                    contract_type: aiData.tipo_contrato_identificado || 'Contrato'
                })
                .eq('id', newAudit.id);

            if (updateError) {
                console.error("Client-side update error:", updateError);
            }

            updateStepStatus('analysis', 'completed');

            // 4. Score Step
            updateStepStatus('score', 'current');
            await new Promise(r => setTimeout(r, 1000));
            updateStepStatus('score', 'completed');

            // 5. Correction Step
            updateStepStatus('correction', 'current');

            const mappedResultData = {
                score: aiData.score_risco_contrato,
                riskLevel: aiData.score_risco_contrato > 7 ? 'ALTO (Ameaça ao Caixa)' : 'MÉDIO (Risco Controlável)',
                contractType: aiData.tipo_contrato_identificado,
                totalCharged: aiData.diagnostico_caixa_e_risco.valor_total_original_R$,
                legalValue: aiData.diagnostico_caixa_e_risco.valor_total_original_R$ - aiData.diagnostico_caixa_e_risco.economia_potencial_R$,
                potentialSavings: aiData.diagnostico_caixa_e_risco.economia_potencial_R$,
                issues: aiData.clausulas_analisadas
                    .filter((c: any) => c.status === 'ABUSIVA' || c.status === 'IRREGULAR')
                    .map((c: any) => ({
                        type: c.status === 'ABUSIVA' ? 'abusive' : 'irregular',
                        severity: c.status === 'ABUSIVA' ? 'high' : 'medium',
                        clause: c.nome_clausula,
                        description: `${c.texto_original_vulneravel?.substring(0, 50)}... - ${c.justificativa_legal}`,
                        riskCategory: c.categoria_multa_risco_original,
                        financialImpact: new Intl.NumberFormat('pt-BR', { style: 'currency', currency: 'BRL' }).format(c.economia_estimada_R$ || 0),
                        originalText: c.texto_original_vulneravel,
                        correction: c.texto_corrigido_sugerido
                    }))
            };

            const mappedCorrections = aiData.clausulas_analisadas
                .filter((c: any) => c.status === 'ABUSIVA' || c.status === 'IRREGULAR')
                .map((c: any) => ({
                    original: c.texto_original_vulneravel,
                    corrected: c.texto_corrigido_sugerido || "Sugestão de remoção ou revisão conforme lei.",
                    savings: new Intl.NumberFormat('pt-BR', { style: 'currency', currency: 'BRL' }).format(c.economia_estimada_R$ || 0),
                    article: c.justificativa_legal
                }));

            setResultData(mappedResultData);
            setCorrections(mappedCorrections);

            updateStepStatus('correction', 'completed');

            setTimeout(() => {
                setAuditState('result');
                // Notification logic
                if (isMinimized) {
                    toast.success(`Análise do contrato ${file.name} concluída. Clique para ver.`, {
                        action: {
                            label: 'Ver',
                            onClick: () => maximize()
                        },
                        duration: 8000
                    });
                } else {
                    toast.success("Análise concluída com sucesso");
                }
            }, 500);

        } catch (error: any) {
            console.error(error);
            toast.error(error.message || "Ocorreu um erro durante a auditoria.");
            setAuditState('idle');
            setSteps(initialSteps.map(s => ({ ...s, status: 'pending' })));
        }
    };

    return (
        <AuditContext.Provider value={{
            isModalOpen,
            isMinimized,
            auditState,
            selectedFile,
            steps,
            resultData,
            corrections,
            showCheckout,
            openModal,
            closeModal,
            minimize,
            maximize,
            startAudit,
            resetAudit,
            setShowCheckout,
            setSelectedFile
        }}>
            {children}
        </AuditContext.Provider>
    );
};
