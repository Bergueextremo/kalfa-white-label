import { Scale, ShieldCheck, Lock, Building2, Mail, Phone } from "lucide-react";
import logoAlfaConsultoria from "@/assets/logo-alfa-consultoria.png";

export const Footer = () => {
    return (
        <footer className="bg-slate-950 text-slate-300 font-sans border-t border-slate-800">
            {/* Faixa de Aviso Legal (Estilo Gov) */}
            <div className="bg-slate-900 py-3 px-4 text-center border-b border-slate-800">
                <p className="text-[10px] md:text-xs font-medium text-slate-400 uppercase tracking-wider">
                    Plataforma Privada de Consulta Jurídica - Não associada a órgãos governamentais.
                </p>
            </div>

            <div className="max-w-7xl mx-auto px-6 py-12 md:py-16">
                <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-12">

                    {/* Coluna 1: Institucional */}
                    <div className="space-y-6">
                        <div className="flex items-center gap-2 text-white">
                            <img src={logoAlfaConsultoria} alt="Alfa Consultoria" className="h-12 md:h-14 brightness-0 invert" />
                        </div>
                        <p className="text-sm leading-relaxed text-slate-400">
                            Tecnologia de ponta para análise contratual, mitigação de riscos e recuperação de ativos financeiros. Segurança jurídica ao alcance de um clique.
                        </p>
                        <div className="flex gap-4">
                            <div className="bg-slate-900 p-2 rounded border border-slate-800" title="Site Blindado">
                                <ShieldCheck className="h-5 w-5 text-emerald-500" />
                            </div>
                            <div className="bg-slate-900 p-2 rounded border border-slate-800" title="SSL Seguro">
                                <Lock className="h-5 w-5 text-emerald-500" />
                            </div>
                            <a
                                href="https://www.instagram.com/alfaconsultoriaempresarial/"
                                target="_blank"
                                rel="noreferrer"
                                className="bg-slate-900 p-2 rounded border border-slate-800 hover:border-pink-500/50 transition-colors group"
                                title="Instagram"
                            >
                                <svg
                                    className="h-5 w-5 text-slate-400 group-hover:text-pink-500 transition-colors"
                                    xmlns="http://www.w3.org/2000/svg"
                                    viewBox="0 0 24 24"
                                    fill="none"
                                    stroke="currentColor"
                                    strokeWidth="2"
                                    strokeLinecap="round"
                                    strokeLinejoin="round"
                                >
                                    <rect x="2" y="2" width="20" height="20" rx="5" ry="5"></rect>
                                    <path d="M16 11.37A4 4 0 1 1 12.63 8 4 4 0 0 1 16 11.37z"></path>
                                    <line x1="17.5" y1="6.5" x2="17.51" y2="6.5"></line>
                                </svg>
                            </a>
                        </div>
                    </div>

                    {/* Coluna 2: Auditorias Especializadas (O Funil) */}
                    <div>
                        <h3 className="text-white font-semibold mb-6 text-sm uppercase tracking-wider">Auditorias Frequentes</h3>
                        <ul className="space-y-3 text-sm">
                            <li><a href="/consultas" className="hover:text-white hover:underline decoration-slate-700 underline-offset-4 transition-colors">Consultas Avulsas</a></li>
                            <li><a href="/consultas" className="hover:text-white hover:underline decoration-slate-700 underline-offset-4 transition-colors">Contratos de Financiamento</a></li>
                            <li><a href="/consultas" className="hover:text-white hover:underline decoration-slate-700 underline-offset-4 transition-colors">Contratos de Aluguel (Imobiliário)</a></li>
                            <li><a href="/consultas" className="hover:text-white hover:underline decoration-slate-700 underline-offset-4 transition-colors">Empréstimos Bancários & CDC</a></li>
                            <li><a href="/consultas" className="hover:text-white hover:underline decoration-slate-700 underline-offset-4 transition-colors">Contratos de Prestação de Serviços</a></li>
                            <li><a href="/consultas" className="hover:text-white hover:underline decoration-slate-700 underline-offset-4 transition-colors">Análise de Distrato</a></li>
                        </ul>
                    </div>

                    {/* Coluna 3: Institucional & Legal */}
                    <div>
                        <h3 className="text-white font-semibold mb-6 text-sm uppercase tracking-wider">Legal & Compliance</h3>
                        <ul className="space-y-3 text-sm">
                            <li><a href="/termos-de-uso" className="hover:text-white transition-colors">Termos de Uso</a></li>
                            <li><a href="/politica-de-privacidade" className="hover:text-white transition-colors">Política de Privacidade</a></li>
                            <li><a href="/diretrizes-lgpd" className="hover:text-white transition-colors">Diretrizes de LGPD</a></li>
                            <li><a href="/sobre-a-tecnologia" className="hover:text-white transition-colors">Sobre a Tecnologia</a></li>
                            <li><a href="/para-escritorios" className="hover:text-white transition-colors">Para Escritórios (API)</a></li>
                        </ul>
                    </div>

                    {/* Coluna 4: Contato */}
                    <div>
                        <h3 className="text-white font-semibold mb-6 text-sm uppercase tracking-wider">Atendimento</h3>
                        <ul className="space-y-4 text-sm">
                            <li className="flex items-start gap-3">
                                <Phone className="h-5 w-5 text-slate-500 mt-0.5" />
                                <div>
                                    <a href="https://wa.me/5561998684615" target="_blank" rel="noreferrer" className="block text-white hover:text-emerald-500 transition-colors">(61) 99868-4615</a>
                                    <span className="text-xs text-slate-500">Seg a Sex, 09h às 18h</span>
                                </div>
                            </li>
                            <li className="flex items-center gap-3">
                                <Mail className="h-5 w-5 text-slate-500" />
                                <a href="mailto:contato@alfaconsultoriaoficial.com.br" className="hover:text-white transition-colors">contato@alfaconsultoriaoficial.com.br</a>
                            </li>
                            <li className="flex items-start gap-3">
                                <Building2 className="h-5 w-5 text-slate-500 mt-0.5" />
                                <a
                                    href="https://www.google.com/maps/place/SAUS+Quadra+03+Ed.+Business+Point,+BL+C+Lote+2+-+Asa+Sul,+Bras%C3%ADlia+-+DF,+70070-934/data=!4m2!3m1!1s0x935a3b272abdf80f:0x3487cad1299a126c?utm_source=mstt_1&entry=gps&coh=192189&g_ep=CAESBzI1LjE0LjAYACCenQoqbCw5NDIyMzI5OSw5NDIxNjQxMyw5NDIxMjQ5Niw5NDIwNzM5NCw5NDIwNzUwNiw5NDIwODUwNiw5NDIxNzUyMyw5NDIxODY1Myw5NDIyOTgzOSw0NzA4NDM5Myw5NDIxMzIwMCw5NDI1ODMxOUICQlI%3D&skid=a57d83a2-f721-409c-8ae2-6830cfd89f0f&g_st=awb"
                                    target="_blank"
                                    rel="noreferrer"
                                    className="hover:text-white transition-colors leading-relaxed"
                                >
                                    SAUS Quadra 03 BL C Lote 2 <br />
                                    Salas 616 a 620 – Asa Sul <br />
                                    Brasília – DF, 70070-934
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>

                {/* Bottom Footer: Pagamento e Copyright */}
                <div className="mt-16 pt-8 border-t border-slate-800 flex flex-col md:flex-row justify-between items-center gap-6">
                    <div className="text-xs text-slate-500">
                        © 2024 Alfa Consultoria Tecnologia Ltda. CNPJ 43.293.726/0001-72. <br className="hidden md:block" />
                        Todos os direitos reservados.
                        <br />
                        <span className="opacity-75">
                            Desenvolvida por <a href="https://arcabergue.vercel.app/" target="_blank" rel="noreferrer" className="hover:text-slate-300 transition-colors">ARCA BERGUE SOFTWARE HOUSE</a>
                        </span>
                    </div>

                    {/* Simulação de Ícones de Pagamento */}
                    <div className="flex items-center gap-2 opacity-70 grayscale hover:grayscale-0 transition-all">
                        <div className="h-6 w-10 bg-slate-800 rounded flex items-center justify-center text-[8px] font-bold">VISA</div>
                        <div className="h-6 w-10 bg-slate-800 rounded flex items-center justify-center text-[8px] font-bold">MASTER</div>
                        <div className="h-6 w-10 bg-slate-800 rounded flex items-center justify-center text-[8px] font-bold">PIX</div>
                    </div>
                </div>
            </div>
        </footer>
    );
};
