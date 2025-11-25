import { useLocation, useNavigate } from "react-router-dom";
import { AlertTriangle, Lock, ArrowRight, DollarSign } from "lucide-react";
import { Button } from "@/components/ui/button";
import { Card, CardContent } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";

const PreliminaryResult = () => {
    const location = useLocation();
    const navigate = useNavigate();

    const { scanResult, contractType } = location.state || {};

    if (!scanResult) {
        navigate('/');
        return null;
    }

    const { detected_risks = [], risk_count = 0, estimated_savings_hint = 0 } = scanResult;

    return (
        <div className="min-h-screen bg-slate-950 relative overflow-hidden">
            {/* Blurred Background Effect */}
            <div className="absolute inset-0 bg-gradient-to-br from-slate-900 via-slate-800 to-slate-900">
                <div className="absolute inset-0 backdrop-blur-3xl bg-slate-900/60"></div>
                {/* Simulated Document Background */}
                <div className="absolute inset-0 opacity-10">
                    <div className="h-full w-full bg-white/5 backdrop-blur-sm"></div>
                </div>
            </div>

            {/* Content */}
            <div className="relative z-10 container mx-auto px-4 py-16">
                <div className="max-w-4xl mx-auto">
                    {/* Alert Header */}
                    <div className="text-center mb-12">
                        <div className="inline-flex items-center gap-3 bg-red-500/20 border border-red-500/50 rounded-full px-6 py-3 mb-6">
                            <AlertTriangle className="h-6 w-6 text-red-400 animate-pulse" />
                            <span className="text-red-300 font-semibold text-lg">
                                {risk_count} {risk_count === 1 ? 'Risco Detectado' : 'Riscos Detectados'}
                            </span>
                        </div>

                        <h1 className="text-4xl md:text-5xl font-bold text-white mb-4">
                            Análise Preliminar Concluída
                        </h1>
                        <p className="text-xl text-slate-300">
                            Identificamos possíveis irregularidades em seu {contractType?.toLowerCase() || 'contrato'}
                        </p>
                    </div>

                    {/* Risk Cards (Blurred) */}
                    <div className="space-y-4 mb-12">
                        {detected_risks.slice(0, 3).map((risk: string, index: number) => (
                            <Card key={index} className="bg-slate-800/50 border-slate-700 backdrop-blur-sm relative overflow-hidden">
                                <CardContent className="p-6">
                                    <div className="flex items-start gap-4">
                                        <div className="p-3 bg-red-500/20 rounded-lg">
                                            <AlertTriangle className="h-6 w-6 text-red-400" />
                                        </div>
                                        <div className="flex-1">
                                            <h3 className="text-lg font-semibold text-white mb-2">
                                                {risk}
                                            </h3>
                                            <div className="relative">
                                                <p className="text-slate-400 blur-sm select-none">
                                                    Esta cláusula pode violar o Artigo XX do CDC e representa um risco financeiro significativo. A economia estimada com a correção desta irregularidade pode chegar a R$ X.XXX,XX.
                                                </p>
                                                <div className="absolute inset-0 flex items-center justify-center">
                                                    <Badge variant="secondary" className="bg-slate-700/90 text-white gap-2">
                                                        <Lock className="h-3 w-3" />
                                                        CONTEÚDO BLOQUEADO
                                                    </Badge>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </CardContent>
                            </Card>
                        ))}
                    </div>

                    {/* Estimated Savings */}
                    {estimated_savings_hint > 0 && (
                        <Card className="bg-emerald-500/10 border-emerald-500/30 mb-12">
                            <CardContent className="p-8 text-center">
                                <DollarSign className="h-12 w-12 text-emerald-400 mx-auto mb-4" />
                                <h3 className="text-2xl font-bold text-white mb-2">
                                    Economia Estimada
                                </h3>
                                <p className="text-4xl font-bold text-emerald-400 mb-2">
                                    R$ {estimated_savings_hint.toLocaleString('pt-BR', { minimumFractionDigits: 2 })}
                                </p>
                                <p className="text-slate-400">
                                    Valor aproximado que você pode recuperar
                                </p>
                            </CardContent>
                        </Card>
                    )}

                    {/* Unlock CTA */}
                    <Card className="bg-gradient-to-br from-blue-600 to-blue-700 border-blue-500 shadow-2xl">
                        <CardContent className="p-12 text-center">
                            <Lock className="h-16 w-16 text-white/80 mx-auto mb-6" />
                            <h2 className="text-3xl font-bold text-white mb-4">
                                Sua Auditoria Completa Está Pronta
                            </h2>
                            <p className="text-xl text-blue-100 mb-8 max-w-2xl mx-auto">
                                Para revelar as cláusulas ilegais, baixar o laudo jurídico fundamentado e o contrato blindado, desbloqueie agora.
                            </p>

                            <div className="space-y-4">
                                <Button
                                    size="lg"
                                    className="bg-white text-blue-700 hover:bg-blue-50 px-12 py-6 text-lg font-semibold gap-3"
                                    onClick={() => navigate('/auth', { state: { from: 'preliminary-result' } })}
                                >
                                    Desbloquear Laudo Completo
                                    <ArrowRight className="h-5 w-5" />
                                </Button>

                                <p className="text-sm text-blue-200">
                                    Crie sua conta gratuita e adquira créditos para acessar o resultado completo
                                </p>
                            </div>
                        </CardContent>
                    </Card>

                    {/* Footer Note */}
                    <div className="mt-12 text-center">
                        <p className="text-sm text-slate-500">
                            Esta é uma análise preliminar automatizada. O laudo completo inclui fundamentação legal detalhada, jurisprudência aplicável e sugestões de correção.
                        </p>
                    </div>
                </div>
            </div>
        </div>
    );
};

export default PreliminaryResult;
