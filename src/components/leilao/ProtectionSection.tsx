import { AlertTriangle, Shield, CheckCircle2 } from "lucide-react";

interface ProtectionSectionProps {
    onCtaClick: () => void;
}

export const ProtectionSection = ({ onCtaClick }: ProtectionSectionProps) => {
    return (
        <section className="py-24 bg-[#0A111F] text-white" id="protecao" aria-labelledby="protection-title">
            <div className="container mx-auto px-6 lg:px-4">
                <div className="grid lg:grid-cols-2 gap-16 items-center">
                    <div>
                        <h2 id="protection-title" className="text-3xl md:text-4xl font-extrabold mb-6 leading-tight">
                            Proteja seu Capital de <br />
                            <span className="text-red-400">Giros Inesperados</span>
                        </h2>
                        <p className="text-slate-400 text-lg mb-10 leading-relaxed">
                            Um erro na leitura do edital pode custar 100x o valor desta auditoria. O risco jurídico é invisível, mas o prejuízo é real.
                        </p>

                        <div className="space-y-4 max-w-md">
                            <div className="flex justify-between items-center p-4 bg-[#131B2C] rounded-lg border border-slate-800">
                                <div className="flex items-center gap-3">
                                    <AlertTriangle className="w-5 h-5 text-red-400" aria-hidden="true" />
                                    <span className="text-red-400 font-medium">Risco de Prejuízo</span>
                                </div>
                                <span className="font-bold text-white uppercase tracking-wider text-sm">Eliminado</span>
                            </div>

                            <div className="flex justify-between items-center p-4 bg-[#003875] rounded-lg border border-[#004a99]">
                                <div className="flex items-center gap-3">
                                    <Shield className="w-5 h-5 text-white" aria-hidden="true" />
                                    <span className="text-white font-medium">Valor da Segurança</span>
                                </div>
                                <span className="font-bold text-white text-xl">R$ 147,00</span>
                            </div>
                        </div>

                        <button
                            className="w-full mt-8 bg-[#00C851] hover:bg-[#009624] text-white font-bold text-base sm:text-lg py-4 px-6 rounded-lg shadow-lg hover:shadow-[0_0_20px_rgba(0,200,81,0.4)] transition-all uppercase tracking-wider transform hover:-translate-y-1 focus:ring-2 focus:ring-[#00C851] outline-none"
                            onClick={onCtaClick}
                            aria-label="Contratar blindagem de lance agora"
                        >
                            QUERO BLINDAR MEU LANCE
                        </button>
                    </div>

                    <div className="relative flex justify-center" aria-hidden="true">
                        <div className="absolute inset-0 bg-[#00C853] blur-[100px] opacity-10 rounded-full"></div>
                        <div className="relative">
                            <div className="absolute inset-0 bg-[#00C851] rounded-full animate-ping-slow opacity-20"></div>
                            <div className="relative w-80 h-80 rounded-full border border-slate-700 bg-slate-900/50 backdrop-blur-sm flex flex-col items-center justify-center p-8 text-center ring-1 ring-white/10">
                                <div className="w-16 h-16 rounded-full bg-green-500/20 flex items-center justify-center mb-6 relative">
                                    <div className="absolute inset-0 bg-[#00C851] rounded-full animate-ping opacity-75"></div>
                                    <CheckCircle2 className="w-8 h-8 text-[#00C851] relative z-10" />
                                </div>
                                <h3 className="text-xl font-bold text-white mb-2">Segurança Patrimonial</h3>
                                <p className="text-sm text-slate-400">Auditoria completa de aspectos legais e financeiros.</p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    );
};
