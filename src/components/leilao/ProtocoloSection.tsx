import { Search, AlertTriangle, Gavel, FileText } from "lucide-react";

export const ProtocoloSection = () => {
    const items = [
        {
            icon: Search,
            title: "Edital & Regras de Arremate",
            description: "Verificação detalhada de prazos, formas de pagamento e comissões."
        },
        {
            icon: AlertTriangle,
            title: "Varredura de Débitos",
            description: "Rastreio completo de IPTU, multas, condomínio e ônus pendentes."
        },
        {
            icon: Gavel,
            title: "Análise de Restrições",
            description: "Identifique dívidas do proprietário e processos de nulidade ativos."
        },
        {
            icon: FileText,
            title: "Viabilidade de Posse",
            description: "Parecer sobre ocupantes e necessidade de regularização do bem."
        }
    ];

    return (
        <section className="py-20 bg-white" id="protocolo" aria-labelledby="protocolo-title">
            <div className="container mx-auto px-4">
                <div className="text-center mb-16">
                    <h2 id="protocolo-title" className="text-2xl md:text-3xl font-bold text-[#1a2b4b]">
                        Protocolo de Auditoria JusContratos
                    </h2>
                </div>

                <div className="grid md:grid-cols-2 lg:grid-cols-4 gap-8">
                    {items.map((item, index) => {
                        const Icon = item.icon;
                        return (
                            <div key={index} className="p-8 rounded-2xl bg-white border border-gray-100 hover:shadow-lg transition-all text-left group" role="article">
                                <div className="w-12 h-12 bg-slate-50 rounded-lg flex items-center justify-center mb-6 group-hover:bg-[#002B5C] transition-colors" aria-hidden="true">
                                    <Icon className="w-6 h-6 text-[#1a2b4b] group-hover:text-white transition-colors" />
                                </div>
                                <h3 className="font-bold text-[#1a2b4b] text-lg mb-2">{item.title}</h3>
                                <p className="text-sm text-gray-600 leading-relaxed font-medium">
                                    {item.description}
                                </p>
                            </div>
                        );
                    })}
                </div>
            </div>
        </section>
    );
};
