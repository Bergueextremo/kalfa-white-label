import React from 'react';
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Footer } from "@/components/Footer";
import { BrainCircuit, Lock, Zap, FileSearch } from "lucide-react";

const SobreTecnologia = () => {
    return (
        <div className="min-h-screen bg-slate-950 flex flex-col font-sans">
            <div className="container mx-auto px-4 py-12 flex-grow">
                <div className="max-w-4xl mx-auto space-y-8">
                    <div className="text-center space-y-4">
                        <h1 className="text-4xl font-bold bg-gradient-to-r from-violet-400 to-fuchsia-400 bg-clip-text text-transparent">
                            Autenticação Jurídica
                        </h1>
                        <p className="text-slate-400">
                            Entenda como nossa tecnologia valida contratos com base na legislação brasileira.
                        </p>
                    </div>

                    <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
                        <Card className="bg-slate-900 border-slate-800 hover:border-violet-500/50 transition-colors group">
                            <CardHeader className="flex flex-row items-center gap-4">
                                <div className="p-3 bg-violet-900/20 rounded-lg group-hover:bg-violet-900/30 transition-colors">
                                    <BrainCircuit className="h-8 w-8 text-violet-400" />
                                </div>
                                <CardTitle className="text-lg text-slate-100">Validado pelo BACEN</CardTitle>
                            </CardHeader>
                            <CardContent className="text-slate-400">
                                Nossa metodologia audita as taxas de juros aplicadas comparando-as diretamente com a Tabela Média de Juros do Banco Central do Brasil (BACEN) para o período do contrato, identificando abusos com precisão matemática.
                            </CardContent>
                        </Card>

                        <Card className="bg-slate-900 border-slate-800 hover:border-violet-500/50 transition-colors group">
                            <CardHeader className="flex flex-row items-center gap-4">
                                <div className="p-3 bg-fuchsia-900/20 rounded-lg group-hover:bg-fuchsia-900/30 transition-colors">
                                    <FileSearch className="h-8 w-8 text-fuchsia-400" />
                                </div>
                                <CardTitle className="text-lg text-slate-100">Código de Defesa do Consumidor</CardTitle>
                            </CardHeader>
                            <CardContent className="text-slate-400">
                                O sistema verifica automaticamente a conformidade com o CDC, detectando cláusulas leoninas, vendas casadas e cobranças indevidas que ferem os direitos fundamentais do consumidor brasileiro.
                            </CardContent>
                        </Card>

                        <Card className="bg-slate-900 border-slate-800 hover:border-violet-500/50 transition-colors group">
                            <CardHeader className="flex flex-row items-center gap-4">
                                <div className="p-3 bg-blue-900/20 rounded-lg group-hover:bg-blue-900/30 transition-colors">
                                    <Lock className="h-8 w-8 text-blue-400" />
                                </div>
                                <CardTitle className="text-lg text-slate-100">Arquitetura Zero-Trust</CardTitle>
                            </CardHeader>
                            <CardContent className="text-slate-400">
                                A segurança é nativa, não um adendo. Operamos em uma arquitetura de segurança Zero-Trust, onde nenhuma entidade interna ou externa é confiável por padrão. Cada requisição é autenticada e criptografada, garantindo a integridade dos seus dados.
                            </CardContent>
                        </Card>

                        <Card className="bg-slate-900 border-slate-800 hover:border-violet-500/50 transition-colors group">
                            <CardHeader className="flex flex-row items-center gap-4">
                                <div className="p-3 bg-amber-900/20 rounded-lg group-hover:bg-amber-900/30 transition-colors">
                                    <Zap className="h-8 w-8 text-amber-400" />
                                </div>
                                <CardTitle className="text-lg text-slate-100">Infraestrutura em Nuvem</CardTitle>
                            </CardHeader>
                            <CardContent className="text-slate-400">
                                Nossa plataforma é hospedada em infraestrutura de nuvem elástica e redundante. Isso garante alta disponibilidade (99.9% uptime) e velocidade de processamento, permitindo que uma auditoria que levaria dias seja concluída em segundos.
                            </CardContent>
                        </Card>

                    </div>

                    <Card className="bg-slate-900 border-slate-800">
                        <CardContent className="p-8 text-center space-y-4">
                            <h2 className="text-2xl font-bold text-slate-100">Jurisprudência Consolidada</h2>
                            <p className="text-slate-300 max-w-2xl mx-auto">
                                Nossos parâmetros de análise são constantemente atualizados com base nos entendimentos do Superior Tribunal de Justiça (STJ) e Supremo Tribunal Federal (STF). Isso garante que cada laudo emitido tenha robustez jurídica e aplicabilidade real nos tribunais.
                            </p>
                        </CardContent>
                    </Card>

                </div>
            </div>
            <Footer />
        </div>
    );
};

export default SobreTecnologia;
