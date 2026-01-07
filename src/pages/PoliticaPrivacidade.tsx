import React from 'react';
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Footer } from "@/components/Footer";

const PoliticaPrivacidade = () => {
    return (
        <div className="min-h-screen bg-slate-950 flex flex-col font-sans">
            <div className="container mx-auto px-4 py-12 flex-grow">
                <div className="max-w-4xl mx-auto space-y-8">
                    <div className="text-center space-y-4">
                        <h1 className="text-4xl font-bold bg-gradient-to-r from-emerald-400 to-teal-400 bg-clip-text text-transparent">
                            Política de Privacidade
                        </h1>
                        <p className="text-slate-400">
                            Protegendo seus dados com rigor absoluto.
                        </p>
                    </div>

                    <Card className="bg-slate-900 border-slate-800 shadow-2xl">
                        <CardContent className="p-6 md:p-8 space-y-6 text-slate-300 leading-relaxed">

                            <section>
                                <h2 className="text-xl font-semibold text-slate-100 mb-3">1. Coleta de Dados</h2>
                                <p>
                                    Coletamos apenas as informações essenciais para a prestação dos nossos serviços. Isso inclui dados de cadastro (nome, e-mail) e os documentos (contratos) que você voluntariamente envia para análise. Não coletamos dados sensíveis desnecessários para a finalidade da auditoria.
                                </p>
                            </section>

                            <section>
                                <h2 className="text-xl font-semibold text-slate-100 mb-3">2. Uso das Informações</h2>
                                <p>
                                    As informações coletadas são utilizadas exclusivamente para:
                                </p>
                                <ul className="list-disc pl-6 mt-2 space-y-2">
                                    <li>Processar e realizar a Consulta Jurídica dos contratos enviados.</li>
                                    <li>Gerar pareceres técnicos personalizados e fundamentados.</li>
                                    <li>Aprimorar nossas bases de dados de jurisprudências e regulamentações.</li>
                                    <li>Comunicar atualizações importantes sobre sua conta e serviços.</li>
                                </ul>
                            </section>

                            <section>
                                <h2 className="text-xl font-semibold text-slate-100 mb-3">3. Compartilhamento e Sigilo</h2>
                                <p>
                                    O sigilo é nosso pilar. <strong>Não vendemos, alugamos ou compartilhamos seus dados pessoais ou o conteúdo dos seus contratos com terceiros</strong> para fins comerciais. O compartilhamento ocorre apenas quando estritamente necessário para o cumprimento de obrigações legais.
                                </p>
                            </section>

                            <section>
                                <h2 className="text-xl font-semibold text-slate-100 mb-3">4. Segurança de Dados</h2>
                                <p>
                                    Empregamos medidas de segurança de nível bancário, incluindo criptografia SSL segura em todas as transmissões de dados e armazenamento criptografado em servidores seguros. O acesso aos dados é restrito a sistemas automatizados e pessoal autorizado sob estrito acordo de confidencialidade.
                                </p>
                            </section>

                            <section>
                                <h2 className="text-xl font-semibold text-slate-100 mb-3">5. Seus Direitos</h2>
                                <p>
                                    Você tem total controle sobre seus dados. A qualquer momento, você pode solicitar:
                                </p>
                                <ul className="list-disc pl-6 mt-2 space-y-2">
                                    <li>Acesso aos dados que mantemos sobre você.</li>
                                    <li>Correção de dados incompletos ou imprecisos.</li>
                                    <li>Exclusão definitiva dos seus dados e documentos de nossos servidores.</li>
                                </ul>
                            </section>

                            <section className="pt-6 border-t border-slate-800">
                                <p className="text-sm text-slate-500">
                                    Para exercer seus direitos de privacidade, contate nosso Encarregado de Proteção de Dados (DPO) pelo e-mail: <a href="mailto:dpo@juscontratos.com.br" className="text-emerald-400 hover:underline">dpo@juscontratos.com.br</a>
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

export default PoliticaPrivacidade;
