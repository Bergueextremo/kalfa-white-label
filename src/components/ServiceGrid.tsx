import { FileText, Key, Landmark, Calculator, ArrowRight } from "lucide-react";
import { Button } from "@/components/ui/button";
import { useNavigate } from "react-router-dom";

const services = [
    {
        icon: Key,
        title: "Aluguel & Imobiliário",
        desc: "Identifique cláusulas de despejo, reajuste de IGP-M e multas abusivas.",
        action: "Auditar Aluguel"
    },
    {
        icon: Landmark,
        title: "Financiamento Bancário",
        desc: "Análise de juros compostos, tabela price e venda casada em contratos bancários.",
        action: "Revisar Juros"
    },
    {
        icon: FileText,
        title: "Prestação de Serviços",
        desc: "Blindagem para PJ. Verifique riscos trabalhistas e cláusulas de rescisão.",
        action: "Analisar Serviço"
    },
    {
        icon: Calculator,
        title: "Empréstimos & Consignado",
        desc: "Verificação de taxas ocultas e Custo Efetivo Total (CET) acima do permitido.",
        action: "Calcular Risco"
    }
];

export const ServiceGrid = () => {
    const navigate = useNavigate();

    return (
        <section className="py-20 bg-slate-50">
            <div className="max-w-7xl mx-auto px-6">
                <div className="text-center mb-16 space-y-4">
                    <h2 className="text-3xl md:text-4xl font-bold text-slate-900">
                        Qual tipo de contrato você quer blindar?
                    </h2>
                    <p className="text-lg text-slate-600 max-w-2xl mx-auto">
                        Nosso Autenticador Jurídico é treinado em nichos específicos do direito para garantir precisão máxima na detecção de irregularidades.
                    </p>
                </div>

                <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-6">
                    {services.map((service, index) => (
                        <div key={index} className="bg-white p-6 rounded-xl shadow-sm border border-slate-200 hover:shadow-md hover:border-blue-200 transition-all group">
                            <div className="h-12 w-12 bg-blue-50 rounded-lg flex items-center justify-center mb-6 group-hover:bg-blue-600 transition-colors">
                                <service.icon className="h-6 w-6 text-blue-700 group-hover:text-white transition-colors" />
                            </div>

                            <h3 className="text-xl font-bold text-slate-900 mb-3">{service.title}</h3>
                            <p className="text-slate-500 text-sm mb-6 leading-relaxed">
                                {service.desc}
                            </p>

                            <Button
                                variant="outline"
                                className="w-full justify-between group-hover:bg-slate-50"
                                onClick={() => navigate("/scan-gratis", { state: { contractType: service.title } })}
                            >
                                {service.action}
                                <ArrowRight className="h-4 w-4 ml-2 opacity-50 group-hover:translate-x-1 transition-transform" />
                            </Button>
                        </div>
                    ))}
                </div>

                <div className="mt-12 text-center">
                    <p className="text-sm text-slate-500 mb-4">Não achou seu tipo de contrato?</p>
                    <Button variant="ghost" className="text-blue-700 font-semibold" onClick={() => navigate("/scan-gratis")}>
                        Ver lista completa de auditorias disponíveis →
                    </Button>
                </div>
            </div>
        </section>
    );
};
