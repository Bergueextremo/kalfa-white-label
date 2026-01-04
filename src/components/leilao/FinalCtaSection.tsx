import { Button } from "@/components/ui/button";
import { Lock } from "lucide-react";

interface FinalCtaSectionProps {
    onCtaClick: () => void;
}

export const FinalCtaSection = ({ onCtaClick }: FinalCtaSectionProps) => {
    return (
        <section className="py-24 bg-slate-50 border-t border-slate-100" aria-labelledby="final-cta-title">
            <div className="container mx-auto px-6 text-center">
                <h2 id="final-cta-title" className="text-3xl md:text-5xl font-extrabold text-[#1a2b4b] mb-10 leading-tight">
                    O Leilão Não Espera pela Sua Hesitação.
                </h2>

                <Button
                    size="lg"
                    className="bg-[#00C851] hover:bg-[#009624] text-white font-bold text-base sm:text-lg h-16 px-6 sm:px-12 rounded-lg shadow-xl hover:shadow-2xl transition-all uppercase tracking-wider hover:-translate-y-1 w-full md:w-auto focus:ring-2 focus:ring-[#00C851]"
                    onClick={onCtaClick}
                    aria-label="Contratar auditoria de edital agora"
                >
                    AUDITAR MEU EDITAL AGORA
                </Button>

                <p className="mt-8 flex items-center justify-center gap-2 text-xs text-gray-500 uppercase tracking-widest font-bold">
                    <Lock className="w-3 h-3" aria-hidden="true" />
                    Pagamento Seguro e Criptografado
                </p>
            </div>
        </section>
    );
};
