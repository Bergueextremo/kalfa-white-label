import React from 'react';
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Footer } from "@/components/Footer";

const DiretrizesLgpd = () => {
    return (
        <div className="min-h-screen bg-slate-950 flex flex-col font-sans">
            <div className="container mx-auto px-4 py-12 flex-grow">
                <div className="max-w-4xl mx-auto space-y-8">
                    <div className="text-center space-y-4">
                        <h1 className="text-4xl font-bold bg-gradient-to-r from-indigo-400 to-cyan-400 bg-clip-text text-transparent">
                            Compliance & LGPD
                        </h1>
                        <p className="text-slate-400">
                            Nosso compromisso com a Lei Geral de Proteção de Dados (Lei 13.709/2018).
                        </p>
                    </div>

                    <Card className="bg-slate-900 border-slate-800 shadow-2xl">
                        <CardContent className="p-6 md:p-8 space-y-6 text-slate-300 leading-relaxed">

                            <section>
                                <h2 className="text-xl font-semibold text-slate-100 mb-3">1. Compromisso Institucional</h2>
                                <p>
                                    A JusContratos Tecnologia Ltda. está em total conformidade com a LGPD. Entendemos a importância da privacidade e proteção de dados no cenário digital atual e adotamos uma postura proativa para garantir que seus direitos sejam respeitados e seus dados, protegidos.
                                </p>
                            </section>

                            <section>
                                <h2 className="text-xl font-semibold text-slate-100 mb-3">2. Base Legal para Processamento</h2>
                                <p>
                                    O processamento dos seus dados pessoais e documentos é realizado com base no <strong>Consentimento</strong> (quando você se cadastra e envia documentos) e na <strong>Execução de Contrato</strong> (para prestar o serviço de auditoria contratado).
                                </p>
                            </section>

                            <section>
                                <h2 className="text-xl font-semibold text-slate-100 mb-3">3. Direitos do Titular dos Dados</h2>
                                <p>
                                    Asseguramos aos usuários todos os direitos previstos no Art. 18 da LGPD, facilitando o exercício de:
                                </p>
                                <ul className="grid grid-cols-1 md:grid-cols-2 gap-3 mt-3">
                                    <li className="bg-slate-950 p-3 rounded border border-slate-800">Confirmação da existência de tratamento</li>
                                    <li className="bg-slate-950 p-3 rounded border border-slate-800">Acesso aos dados</li>
                                    <li className="bg-slate-950 p-3 rounded border border-slate-800">Correção de dados incompletos ou desatualizados</li>
                                    <li className="bg-slate-950 p-3 rounded border border-slate-800">Portabilidade dos dados</li>
                                    <li className="bg-slate-950 p-3 rounded border border-slate-800">Eliminação dos dados pessoais</li>
                                    <li className="bg-slate-950 p-3 rounded border border-slate-800">Revogação do consentimento</li>
                                </ul>
                            </section>

                            <section>
                                <h2 className="text-xl font-semibold text-slate-100 mb-3">4. Medidas de Segurança Técnica</h2>
                                <p>
                                    Adotamos medidas técnicas e administrativas robustas para proteger os dados pessoais de acessos não autorizados e de situações acidentais ou ilícitas. Isso inclui firewalls avançados, criptografia AES-256 e monitoramento constante de ameaças.
                                </p>
                            </section>

                            <section>
                                <h2 className="text-xl font-semibold text-slate-100 mb-3">5. Encarregado de Dados (DPO)</h2>
                                <p>
                                    Designamos um Encarregado de Proteção de Dados para atuar como canal de comunicação entre o controlador, os titulares dos dados e a Autoridade Nacional de Proteção de Dados (ANPD).
                                </p>
                            </section>

                        </CardContent>
                    </Card>
                </div>
            </div>
            <Footer />
        </div>
    );
};

export default DiretrizesLgpd;
