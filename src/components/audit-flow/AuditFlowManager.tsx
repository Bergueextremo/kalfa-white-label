import { useRef, useCallback } from "react";
import { Card, CardContent } from "@/components/ui/card";
import { Upload, FileText, Sparkles, Minus } from "lucide-react";
import { Button } from "@/components/ui/button";
import { toast } from "sonner";
import { useAudit } from "@/contexts/AuditContext";
import { CheckoutModal } from "@/components/CheckoutModal";

// Import modular components
import { AuditHeader } from "@/components/audit-flow/AuditHeader";
import { ProgressTimeline } from "@/components/audit-flow/ProgressTimeline";
import { ScoreCard } from "@/components/audit-flow/ScoreCard";
import { FinancialImpactCard } from "@/components/audit-flow/FinancialImpactCard";
import { IssuesList } from "@/components/audit-flow/IssuesList";
import { CorrectionComparison } from "@/components/audit-flow/CorrectionComparison";
import { AuditActions } from "@/components/audit-flow/AuditActions";

export function AuditFlowManager() {
    const fileInputRef = useRef<HTMLInputElement>(null);
    const {
        auditState,
        selectedFile,
        steps,
        resultData,
        corrections,
        showCheckout,
        startAudit,
        minimize,
        setShowCheckout,
        setSelectedFile
    } = useAudit();

    const validateAndSetFile = (file: File) => {
        if (!file.type.includes("pdf") && !file.type.includes("document")) {
            toast.error("Por favor, envie um arquivo PDF ou DOCX");
            return;
        }
        setSelectedFile(file);
    };

    const handleDrop = useCallback((e: React.DragEvent) => {
        e.preventDefault();
        const file = e.dataTransfer.files[0];
        if (file) validateAndSetFile(file);
    }, []);

    const handleFileInput = (e: React.ChangeEvent<HTMLInputElement>) => {
        const file = e.target.files?.[0];
        if (file) validateAndSetFile(file);
    };

    return (
        <div className="space-y-6 relative">
            {/* Minimize Button */}
            {auditState === 'processing' && (
                <div className="absolute top-0 right-0 z-10">
                    <Button variant="ghost" size="icon" onClick={minimize} className="hover:bg-slate-100">
                        <Minus className="h-6 w-6 text-slate-400" />
                    </Button>
                </div>
            )}

            <AuditHeader />

            {(auditState === 'idle' || auditState === 'upload') && (
                <div className="animate-in fade-in slide-in-from-bottom-4 duration-500">
                    <Card className="shadow-xl border-slate-200 overflow-hidden bg-white">
                        <CardContent className="p-0">
                            {!selectedFile ? (
                                <div
                                    className="p-4 md:p-16 text-center transition-all duration-300 ease-in-out bg-white hover:bg-slate-50/50"
                                    onDragOver={(e) => e.preventDefault()}
                                    onDrop={handleDrop}
                                >
                                    <div className="border-2 border-dashed border-slate-200 rounded-2xl p-6 md:p-12 transition-all">
                                        <div className="bg-blue-50 w-20 h-20 rounded-full flex items-center justify-center mx-auto mb-6">
                                            <Upload className="h-10 w-10 text-blue-600" />
                                        </div>
                                        <h3 className="text-xl md:text-2xl font-semibold mb-3 text-slate-900">Arraste seu contrato (PDF ou DOCX)</h3>
                                        <p className="text-slate-500 text-lg mb-4 max-w-lg mx-auto">
                                            O Sistema de Autenticação detectará automaticamente se é Financiamento, Aluguel ou Serviços.
                                        </p>
                                        <div className="flex flex-col gap-1 mb-8 text-sm text-slate-400">
                                            <p>Formatos aceitos: <strong>PDF e DOCX</strong> (até 10MB)</p>
                                            <p>Aceitamos documentos digitalizados/escaneados (OCR Inteligente)</p>
                                        </div>
                                        <input type="file" ref={fileInputRef} className="hidden" accept=".pdf,.doc,.docx" onChange={handleFileInput} />
                                        <Button
                                            size="lg"
                                            className="bg-slate-900 hover:bg-slate-800 text-white px-6 py-4 md:px-8 md:py-6 text-lg h-auto shadow-lg hover:shadow-xl transition-all w-full sm:w-auto"
                                            onClick={() => fileInputRef.current?.click()}
                                        >
                                            <FileText className="mr-2 h-5 w-5" />
                                            Selecionar Arquivo Manualmente
                                        </Button>
                                    </div>
                                </div>
                            ) : (
                                <div className="p-4 md:p-16 text-center bg-white animate-in fade-in duration-300">
                                    <div className="border-2 border-slate-100 rounded-2xl p-6 md:p-12 bg-slate-50/50">
                                        <div className="bg-blue-100 w-20 h-20 rounded-full flex items-center justify-center mx-auto mb-6">
                                            <FileText className="h-10 w-10 text-blue-700" />
                                        </div>
                                        <h3 className="text-xl md:text-2xl font-semibold mb-2 text-slate-900">Arquivo Pronto para Análise</h3>
                                        <p className="text-slate-600 text-lg mb-8 font-medium">{selectedFile.name}</p>
                                        <div className="flex flex-col sm:flex-row items-center justify-center gap-4">
                                            <Button
                                                size="lg"
                                                className="bg-blue-600 hover:bg-blue-700 text-white px-10 py-6 text-lg h-auto shadow-lg hover:shadow-xl transition-all w-full sm:w-auto"
                                                onClick={() => startAudit(selectedFile)}
                                            >
                                                <Sparkles className="mr-2 h-5 w-5" />
                                                INICIAR M.A.P.A
                                            </Button>
                                            <Button
                                                variant="outline"
                                                size="lg"
                                                className="px-8 py-6 text-lg h-auto border-slate-200 hover:bg-slate-100 text-slate-600 w-full sm:w-auto"
                                                onClick={() => setSelectedFile(null)}
                                            >
                                                Trocar Arquivo
                                            </Button>
                                        </div>
                                    </div>
                                </div>
                            )}
                        </CardContent>
                    </Card>
                </div>
            )}

            {auditState === 'processing' && (
                <div className="animate-in fade-in slide-in-from-bottom-4 duration-500">
                    <ProgressTimeline steps={steps} />
                </div>
            )}

            {auditState === 'result' && resultData && (
                <div className="space-y-6 animate-in fade-in slide-in-from-bottom-4 duration-700">
                    {/* Top Row: Score & Financial */}
                    <div className="grid lg:grid-cols-2 gap-6">
                        <ScoreCard
                            score={resultData.score}
                            riskLevel={resultData.riskLevel}
                            contractType={resultData.contractType}
                        />
                        <FinancialImpactCard
                            totalCharged={resultData.totalCharged}
                            legalValue={resultData.legalValue}
                            potentialSavings={resultData.potentialSavings}
                        />
                    </div>

                    {/* Middle: Issues */}
                    <IssuesList issues={resultData.issues} />

                    {/* Bottom: Corrections */}
                    <CorrectionComparison corrections={corrections} />

                    {/* Final Actions */}
                    <AuditActions auditData={resultData} />
                </div>
            )}
            {/* Checkout Modal for low credits */}
            <CheckoutModal open={showCheckout} onOpenChange={setShowCheckout} />
        </div>
    );
}
