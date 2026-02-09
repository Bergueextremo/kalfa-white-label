import React from 'react';
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { Footer } from "@/components/Footer";
import { ScrollArea } from "@/components/ui/scroll-area";

const TermosDeUso = () => {
    return (
        <div className="min-h-screen bg-slate-950 flex flex-col font-sans">
            <div className="container mx-auto px-4 py-12 flex-grow">
                <div className="max-w-4xl mx-auto space-y-8">
                    <div className="text-center space-y-4">
                        <h1 className="text-4xl font-bold bg-gradient-to-r from-blue-400 to-purple-400 bg-clip-text text-transparent">
                            Termos de Uso
                        </h1>
                        <p className="text-slate-400">
                            Última atualização: 09 de Dezembro de 2024
                        </p>
                    </div>

                    <Card className="bg-slate-900 border-slate-800 shadow-2xl">
                        <CardContent className="p-6 md:p-8 space-y-6 text-slate-300 leading-relaxed">

                            <section>
                                <h2 className="text-xl font-semibold text-slate-100 mb-3">1. Aceitação dos Termos</h2>
                                <p>
                                    Ao acessar e utilizar a plataforma Alfa Audit Pro ("Plataforma"), desenvolvida pela ARCA BERGUE SOFTWARE HOUSE, você concorda expressamente com estes Termos de Uso. Se você não concordar com qualquer parte destes termos, não deverá utilizar nossos serviços.
                                </p>
                            </section>

                            <section>
                                <h2 className="text-xl font-semibold text-slate-100 mb-3">2. Descrição dos Serviços</h2>
                                <p>
                                    O Alfa Audit Pro é um <strong>Autenticador Jurídico Digital</strong> que utiliza tecnologia de Consulta Jurídica baseada nas diretrizes do <strong>Banco Central (BACEN)</strong>, <strong>Código de Defesa do Consumidor (CDC)</strong> e jurisprudências consolidadas do <strong>STJ</strong> e <strong>STF</strong> para analisar contratos bancários, imobiliários e de serviços. Nossos serviços incluem:
                                </p>
                                <ul className="list-disc pl-6 mt-2 space-y-2">
                                    <li>Consulta Jurídica de cláusulas contratuais.</li>
                                    <li>Identificação de irregularidades e abusividades baseada na legislação vigente.</li>
                                    <li>Cálculo pericial de valores a serem restituídos ou economizados.</li>
                                    <li>Geração de pareceres técnicos preliminares.</li>
                                </ul>
                            </section>

                            <section>
                                <h2 className="text-xl font-semibold text-slate-100 mb-3">3. Cadastro e Segurança</h2>
                                <p>
                                    Para utilizar os serviços, é necessário realizar um cadastro. Você é responsável por manter a confidencialidade de suas credenciais de acesso. O Alfa Audit Pro utiliza criptografia de ponta a ponta para proteger seus dados e os documentos enviados para análise.
                                </p>
                            </section>

                            <section>
                                <h2 className="text-xl font-semibold text-slate-100 mb-3">4. Pagamentos e Créditos</h2>
                                <p>
                                    O acesso às auditorias completas é realizado mediante a aquisição de créditos ou assinaturas. Todos os pagamentos são processados de forma segura. Os créditos adquiridos não possuem prazo de validade, salvo disposição em contrário em promoções específicas.
                                </p>
                            </section>

                            <section>
                                <h2 className="text-xl font-semibold text-slate-100 mb-3">5. Propriedade Intelectual</h2>
                                <p>
                                    Toda a tecnologia, design, logotipos e conteúdo da Plataforma são propriedade exclusiva da Alfa Consultoria Tecnologia Ltda. e seus licenciadores. É proibida a reprodução, cópia ou engenharia reversa de qualquer parte do sistema.
                                </p>
                            </section>

                            <section>
                                <h2 className="text-xl font-semibold text-slate-100 mb-3">6. Limitação de Responsabilidade</h2>
                                <p>
                                    Os relatórios gerados pelo Alfa Audit Pro são ferramentas de auxílio e não substituem o parecer jurídico de um advogado qualificado. A Plataforma não se responsabiliza por decisões tomadas exclusivamente com base nas análises automatizadas.
                                </p>
                            </section>

                            <section>
                                <h2 className="text-xl font-semibold text-slate-100 mb-3">7. Alterações nos Termos</h2>
                                <p>
                                    Podemos atualizar estes Termos de Uso periodicamente. Recomendamos que você revise esta página regularmente para estar ciente de quaisquer alterações. O uso continuado da Plataforma após as alterações constitui aceitação dos novos termos.
                                </p>
                            </section>

                            <section className="pt-6 border-t border-slate-800">
                                <p className="text-sm text-slate-500">
                                    Dúvidas? Entre em contato através do e-mail: <a href="mailto:juridico@alfaconsultoria.com.br" className="text-blue-400 hover:underline">juridico@alfaconsultoria.com.br</a>
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

export default TermosDeUso;
