import { useState, useEffect } from "react";
import { useNavigate } from "react-router-dom";
import { Car, Home, Building2, Briefcase, Scale, FileText, Check, Shield, Lock, ArrowLeft, Upload, ChevronRight, Gavel } from "lucide-react";
import { Button } from "@/components/ui/button";
import { Card, CardContent } from "@/components/ui/card";
import { cn } from "@/lib/utils";
import logoAlfaConsultoria from "@/assets/logo-alfa-consultoria.png";
interface ContractType {
  id: string;
  icon: React.ElementType;
  title: string;
  subtitle: string;
  description: string;
  keywords: string[];
}
const contractTypes: ContractType[] = [{
  id: "veiculo",
  icon: Car,
  title: "Financiamento de Veículo",
  subtitle: "Juros abusivos, Busca e Apreensão, Taxas Ocultas",
  description: "Detectando taxas de juros acima do limite legal, cláusulas de busca e apreensão irregulares e cobranças ocultas.",
  keywords: ["juros abusivos financiamento veículo", "busca e apreensão", "taxas ocultas carro"]
}, {
  id: "leilao",
  icon: Gavel,
  title: "Arrematação em Leilão",
  subtitle: "Edital, Matrícula, Dívidas Ocultas",
  description: "Análise completa de riscos em leilões judiciais e extrajudiciais de imóveis e veículos. Blindagem contra dívidas do antigo proprietário.",
  keywords: ["leilão", "arrematação", "edital de leilão", "dívidas leilão"]
}, {
  id: "imovel",
  icon: Home,
  title: "Aluguel & Imobiliário",
  subtitle: "Multa de rescisão, Reajuste IGP-M, Despejo",
  description: "Detectando multas abusivas, IGP-M irregular, cláusulas de despejo e cobranças indevidas de IPTU.",
  keywords: ["multa abusiva contrato de aluguel", "IGP-M irregular", "despejo ilegal"]
}, {
  id: "emprestimo",
  icon: Building2,
  title: "Empréstimo Bancário & Consignado",
  subtitle: "Superendividamento, RMC, Venda Casada",
  description: "Detectando venda casada de seguros, RMC irregular, anatocismo e spread bancário abusivo.",
  keywords: ["superendividamento", "venda casada banco", "juros abusivos consignado"]
}, {
  id: "empresarial",
  icon: Briefcase,
  title: "Empresarial & Contrato Social",
  subtitle: "Blindagem de Sócios, Saída, Responsabilidade",
  description: "Analisando cláusulas de exclusão de sócio, responsabilidade patrimonial e direito de retirada.",
  keywords: ["riscos em contrato social", "blindagem patrimonial", "saída de sócio"]
}, {
  id: "servicos",
  icon: Scale,
  title: "Prestação de Serviços",
  subtitle: "Riscos trabalhistas, Não pagamento, Prazos",
  description: "Verificando cláusulas que geram vínculo empregatício, multas desproporcionais e prazos abusivos.",
  keywords: ["riscos trabalhistas PJ", "contrato de prestação de serviços", "multa contratual"]
}, {
  id: "outros",
  icon: FileText,
  title: "Outros Contratos",
  subtitle: "Consulta Jurídica Genérica",
  description: "Varredura completa para identificação de cláusulas abusivas em qualquer tipo de contrato.",
  keywords: ["análise contrato", "cláusulas abusivas", "revisão contratual"]
}];
const benefits = ["Varredura de Cláusulas Abusivas", "Base de dados STJ e Bacen", "Laudo Técnico em PDF", "Resultado em até 10 segundos"];
const Consultas = () => {
  const navigate = useNavigate();
  const [selectedContract, setSelectedContract] = useState<ContractType | null>(null);
  const [remainingSpots, setRemainingSpots] = useState(49);

  // Decrement counter logic to simulate activity
  useEffect(() => {
    // Initial random drop to make it feel live if user refreshes
    const initialDrop = Math.floor(Math.random() * 3);
    setRemainingSpots(prev => Math.max(12, prev - initialDrop));

    const interval = setInterval(() => {
      setRemainingSpots(prev => {
        if (prev <= 12) return prev; // Don't go below 12
        return Math.random() > 0.5 ? prev - 1 : prev; // Randomly decrement
      });
    }, 15000); // Check every 15 seconds

    return () => clearInterval(interval);
  }, []);
  const handleContractClick = (contract: ContractType) => {
    setSelectedContract(contract);
  };
  const handleProceed = () => {
    if (selectedContract) {
      navigate(`/scan-gratis?type=${selectedContract.id}`);
    }
  };
  return <div className="min-h-screen bg-[#F8F9FA]">
    {/* Header Simples */}
    <header className="bg-white border-b border-slate-200 sticky top-0 z-50">
      <div className="container mx-auto px-4 py-4">
        <div className="flex items-center justify-between">
          <div className="flex items-center gap-2 cursor-pointer" onClick={() => navigate("/home")}>
            <img src={logoAlfaConsultoria} alt="Alfa Consultoria" className="h-12 md:h-14" />
          </div>
          <button onClick={() => navigate(-1)} className="flex items-center gap-2 text-sm text-slate-600 hover:text-slate-900 transition-colors">
            <ArrowLeft className="h-4 w-4" />
            Voltar
          </button>
        </div>
      </div>
    </header>

    {/* Main Content */}
    <main className="container mx-auto px-4 py-8 lg:py-12">
      {/* Page Header */}
      <div className="text-center mb-10 lg:mb-12">
        <div className="inline-flex items-center gap-2 bg-[#0A192F]/5 px-4 py-2 rounded-full mb-4">
          <Shield className="h-4 w-4 text-[#0A192F]" />
          <span className="text-xs font-semibold text-[#0A192F] uppercase tracking-wider">AUDITORIA JURÍDICA ESPECIALIZADA</span>
        </div>
        <h1 className="text-3xl md:text-4xl lg:text-5xl font-extrabold text-[#0A192F] mb-4">
          Qual tipo de contrato você quer blindar?
        </h1>
        <p className="text-lg text-slate-600 max-w-2xl mx-auto">
          Selecione a categoria do seu documento para uma análise de precisão máxima baseada no STJ e Bacen.
        </p>
      </div>

      {/* Two Column Layout */}
      <div className="grid lg:grid-cols-[1fr,380px] gap-8 lg:gap-12 max-w-6xl mx-auto">
        {/* Left Column - Contract Selection */}
        <div className="space-y-4">
          {contractTypes.map(contract => {
            const isSelected = selectedContract?.id === contract.id;
            const Icon = contract.icon;
            return <button key={contract.id} onClick={() => handleContractClick(contract)} className={cn("w-full text-left p-5 rounded-xl border-2 transition-all duration-200", "bg-white hover:shadow-lg group", isSelected ? "border-[#3B82F6] bg-blue-50/50 shadow-lg" : "border-slate-200 hover:border-slate-300")}>
              <div className="flex items-start gap-4">
                <div className={cn("p-3 rounded-lg transition-colors", isSelected ? "bg-[#3B82F6] text-white" : "bg-slate-100 text-slate-600 group-hover:bg-slate-200")}>
                  <Icon className="h-6 w-6" />
                </div>
                <div className="flex-1 min-w-0">
                  <div className="flex items-center justify-between gap-2">
                    <h3 className={cn("font-bold text-lg", isSelected ? "text-[#3B82F6]" : "text-[#0A192F]")}>
                      {contract.title}
                    </h3>
                    <ChevronRight className={cn("h-5 w-5 flex-shrink-0 transition-transform", isSelected ? "text-[#3B82F6] rotate-90" : "text-slate-400")} />
                  </div>
                  <p className="text-sm text-slate-500 mt-1">{contract.subtitle}</p>

                  {/* Expanded Description */}
                  <div className={cn("overflow-hidden transition-all duration-300", isSelected ? "max-h-24 mt-3 pt-3 border-t border-slate-200" : "max-h-0")}>
                    <p className="text-sm text-slate-600">{contract.description}</p>
                  </div>
                </div>
              </div>
            </button>;
          })}
        </div>

        {/* Right Column - Order Summary (Sticky) */}
        <div className="lg:sticky lg:top-24 h-fit">
          <Card className="shadow-xl border-slate-200 overflow-hidden">
            {/* Card Header */}
            <div className="bg-[#0A192F] px-6 py-4">
              <div className="flex items-center gap-2">
                <Lock className="h-5 w-5 text-emerald-400" />
                <h2 className="text-lg font-bold text-white">Resumo da Auditoria</h2>
              </div>
            </div>

            <CardContent className="p-6 space-y-6">
              {/* Selected Item */}
              <div className="min-h-[60px]">
                {selectedContract ? <div className="flex items-center gap-3 p-3 bg-blue-50 rounded-lg border border-blue-100">
                  <selectedContract.icon className="h-5 w-5 text-[#3B82F6]" />
                  <span className="font-medium text-[#0A192F] text-sm">{selectedContract.title}</span>
                </div> : <div className="flex items-center justify-center p-3 bg-slate-50 rounded-lg border border-dashed border-slate-300 text-sm text-slate-500">
                  Selecione um tipo de contrato
                </div>}
              </div>

              {/* Benefits List */}
              <div className="space-y-3">
                {benefits.map((benefit, index) => <div key={index} className="flex items-center gap-3">
                  <div className="flex-shrink-0 w-5 h-5 rounded-full bg-emerald-100 flex items-center justify-center">
                    <Check className="h-3 w-3 text-emerald-600" />
                  </div>
                  <span className="text-sm text-slate-700">{benefit}</span>
                </div>)}
              </div>

              {/* Scarcity Trigger */}
              <div className="bg-blue-50 border-l-4 border-blue-500 p-4 rounded-r-lg">
                <div className="flex items-start gap-3">
                  <div className="flex-shrink-0">
                    <div className="bg-black rounded-full p-1">
                      <span className="text-white font-bold text-xs px-1">!</span>
                    </div>
                  </div>
                  <div className="space-y-1">
                    <p className="font-bold text-[#0A192F] text-sm">ATENÇÃO:</p>
                    <p className="text-sm text-slate-600 leading-relaxed">
                      Devido à alta demanda, hoje a auditoria está limitada.
                    </p>
                    <p className="font-bold text-red-600 text-sm">
                      Restam apenas: {remainingSpots}
                    </p>
                  </div>
                </div>
              </div>

              {/* Divider */}
              <div className="border-t border-slate-200" />

              {/* Price */}
              <div className="text-center space-y-1">
                <span className="text-xs text-slate-500 uppercase tracking-wider">Sessão Única</span>
                <div className="text-4xl font-extrabold text-[#0A192F]">
                  R$ 197<span className="text-2xl">,00</span>
                </div>
              </div>

              {/* CTA Button */}
              <Button size="lg" className={cn("w-full py-6 text-base font-bold transition-all duration-200", selectedContract ? "bg-[#10B981] hover:bg-[#059669] text-white shadow-lg hover:shadow-xl" : "bg-slate-300 text-slate-500 cursor-not-allowed")} disabled={!selectedContract} onClick={handleProceed}>
                <Upload className="h-5 w-5 mr-2" />
                FAZER UPLOAD E AUDITAR AGORA
              </Button>

              {/* Trust Badges */}
              <div className="flex items-center justify-center gap-4 pt-2">
                <div className="flex items-center gap-1 text-xs text-slate-500">
                  <Lock className="h-3 w-3" />
                  <span>SSL Seguro</span>
                </div>
                <div className="flex items-center gap-1 text-xs text-slate-500">
                  <Shield className="h-3 w-3" />
                  <span>Dados Protegidos</span>
                </div>
              </div>
            </CardContent>
          </Card>

          {/* Additional Trust Message */}
          <p className="text-center text-xs text-slate-500 mt-4 px-4">
            Seus documentos são processados com criptografia de ponta a ponta e excluídos após a análise.
          </p>
        </div>
      </div>
    </main>

    {/* Mobile Sticky CTA */}
    <div className="fixed bottom-0 left-0 right-0 p-4 bg-white border-t border-slate-200 lg:hidden z-40">
      <div className="flex items-center justify-between gap-4">
        <div>
          <span className="text-xs text-slate-500 block">Sessão Única</span>
          <span className="text-2xl font-extrabold text-[#0A192F]">R$ 197,00</span>
        </div>
        <Button size="lg" className={cn("flex-1 py-5 font-bold", selectedContract ? "bg-[#10B981] hover:bg-[#059669] text-white" : "bg-slate-300 text-slate-500 cursor-not-allowed")} disabled={!selectedContract} onClick={handleProceed}>
          BLINDAR CONTRATO
        </Button>
      </div>
    </div>
  </div>;
};
export default Consultas;