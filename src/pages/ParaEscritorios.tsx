import React from 'react';
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Footer } from "@/components/Footer";
import { Button } from "@/components/ui/button";
import { Code, Building2, LayoutTemplate, Headset } from "lucide-react";

const ParaEscritorios = () => {
    const handleContact = () => {
        window.open('https://wa.me/5511999999999?text=Olá, tenho interesse na API para escritórios.', '_blank');
    };

    return (
        <div className="min-h-screen bg-slate-950 flex flex-col font-sans">
            <div className="container mx-auto px-4 py-12 flex-grow">
                <div className="max-w-5xl mx-auto space-y-12">

                    {/* Hero Section */}
                    <div className="text-center space-y-6">
                        <div className="inline-block p-2 px-4 rounded-full bg-blue-900/30 border border-blue-800 text-blue-400 text-sm font-medium">
                            Alfa Consultoria Audit Pro
                        </div>
                        <h1 className="text-4xl md:text-5xl font-bold text-white">
                            Potencialize seu Escritório com <br />
                            <span className="bg-gradient-to-r from-blue-500 to-cyan-400 bg-clip-text text-transparent">Auditoria Automatizada</span>
                        </h1>
                        <p className="text-xl text-slate-400 max-w-2xl mx-auto">
                            Integre nossa tecnologia de Consulta Jurídica diretamente ao seu fluxo de trabalho. Aumente a produtividade da sua equipe e ofereça resultados mais rápidos aos seus clientes.
                        </p>
                        <div className="flex justify-center gap-4">
                            <Button onClick={handleContact} size="lg" className="bg-blue-600 hover:bg-blue-700 text-white font-semibold shadow-lg shadow-blue-900/20">
                                Falar com Consultor
                            </Button>
                            <Button variant="outline" size="lg" className="border-slate-700 text-slate-300 hover:bg-slate-800 hover:text-white">
                                Ver Documentação da API
                            </Button>
                        </div>
                    </div>

                    {/* Features Grid */}
                    <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
                        <Card className="bg-slate-900 border-slate-800 p-2">
                            <CardHeader className="flex flex-row items-center gap-4">
                                <div className="p-3 bg-blue-500/10 rounded-lg">
                                    <Code className="h-6 w-6 text-blue-400" />
                                </div>
                                <div className="space-y-1">
                                    <CardTitle className="text-lg text-slate-100">API RESTful Robusta</CardTitle>
                                </div>
                            </CardHeader>
                            <CardContent className="text-slate-400 text-sm">
                                Conecte seu CRM ou software jurídico diretamente à nossa engine de auditoria. Envie contratos e receba os relatórios estruturados (JSON) ou em PDF automaticamente, sem intervenção humana.
                            </CardContent>
                        </Card>

                        <Card className="bg-slate-900 border-slate-800 p-2">
                            <CardHeader className="flex flex-row items-center gap-4">
                                <div className="p-3 bg-purple-500/10 rounded-lg">
                                    <LayoutTemplate className="h-6 w-6 text-purple-400" />
                                </div>
                                <div className="space-y-1">
                                    <CardTitle className="text-lg text-slate-100">Solução White-Label</CardTitle>
                                </div>
                            </CardHeader>
                            <CardContent className="text-slate-400 text-sm">
                                Entregue valor com a sua marca. Personalizamos a interface das auditorias e os relatórios gerados com o logotipo e identidade visual do seu escritório. Seu cliente vê apenas a sua excelência.
                            </CardContent>
                        </Card>

                        <Card className="bg-slate-900 border-slate-800 p-2">
                            <CardHeader className="flex flex-row items-center gap-4">
                                <div className="p-3 bg-emerald-500/10 rounded-lg">
                                    <Building2 className="h-6 w-6 text-emerald-400" />
                                </div>
                                <div className="space-y-1">
                                    <CardTitle className="text-lg text-slate-100">Planos Corporativos</CardTitle>
                                </div>
                            </CardHeader>
                            <CardContent className="text-slate-400 text-sm">
                                Volume alto de demandas? Oferecemos pacotes de créditos com descontos progressivos e faturamento mensal flexível para escritórios de médio e grande porte.
                            </CardContent>
                        </Card>

                        <Card className="bg-slate-900 border-slate-800 p-2">
                            <CardHeader className="flex flex-row items-center gap-4">
                                <div className="p-3 bg-orange-500/10 rounded-lg">
                                    <Headset className="h-6 w-6 text-orange-400" />
                                </div>
                                <div className="space-y-1">
                                    <CardTitle className="text-lg text-slate-100">Suporte Dedicado</CardTitle>
                                </div>
                            </CardHeader>
                            <CardContent className="text-slate-400 text-sm">
                                Tenha acesso direto à nossa equipe de engenharia e especialistas jurídicos para auxiliar na integração e na interpretação de relatórios complexos.
                            </CardContent>
                        </Card>
                    </div>

                    {/* API Preview / Code Snippet */}
                    <Card className="bg-slate-950 border border-slate-800 overflow-hidden">
                        <div className="bg-slate-900 px-4 py-2 border-b border-slate-800 flex items-center gap-2">
                            <div className="flex gap-1.5">
                                <div className="w-3 h-3 rounded-full bg-red-500/20 border border-red-500/50"></div>
                                <div className="w-3 h-3 rounded-full bg-yellow-500/20 border border-yellow-500/50"></div>
                                <div className="w-3 h-3 rounded-full bg-green-500/20 border border-green-500/50"></div>
                            </div>
                            <span className="text-xs text-slate-500 font-mono ml-2">POST /api/v1/audit/contract</span>
                        </div>
                        <div className="p-6 overflow-x-auto">
                            <pre className="font-mono text-sm text-blue-300">
                                {`curl -X POST https://api.alfaconsultoria.com.br/v1/audits \\
  -H "Authorization: Bearer YOUR_API_KEY" \\
  -F "file=@contrato_financiamento.pdf" \\
  -F "type=financiamento_veiculo"`}
                            </pre>
                            <pre className="font-mono text-sm text-slate-500 mt-4">
                                {`// Resposta (200 OK)
{
  "audit_id": "aud_8f92j9s2",
  "status": "processing",
  "eta_seconds": 45
}`}
                            </pre>
                        </div>
                    </Card>

                    <div className="text-center pt-8">
                        <p className="text-slate-500 mb-4">Pronto para transformar sua prática jurídica?</p>
                        <Button onClick={handleContact} size="lg" variant="secondary" className="bg-slate-800 text-white hover:bg-slate-700">
                            Solicitar Acesso Demo
                        </Button>
                    </div>

                </div>
            </div>
            <Footer />
        </div>
    );
};

export default ParaEscritorios;
