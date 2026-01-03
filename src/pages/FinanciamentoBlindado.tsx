import { Button } from "@/components/ui/button";
import { Footer } from "@/components/Footer";
import { useNavigate } from "react-router-dom";
import {
    Shield,
    Gavel,
    Search,
    FileCheck,
    Lock,
    AlertTriangle,
    CheckCircle2,
    Timer,
    UploadCloud,
    Menu,
    ArrowRight,
    TrendingDown,
    Banknote,
    FileWarning,
    Scale,
    Calculator,
    Users,
    Landmark
} from "lucide-react";
import logoJusContratos from "@/assets/logo-juscontratos.png";
import { useState } from "react";
import { Sheet, SheetContent, SheetTrigger } from "@/components/ui/sheet";
import { useAuth } from "@/contexts/AuthContext";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from "@/components/ui/select";
import { Card, CardContent, CardHeader, CardTitle, CardDescription } from "@/components/ui/card";

const FinanciamentoBlindado = () => {
    const navigate = useNavigate();
    const { isAuthenticated } = useAuth();
    const [mobileMenuOpen, setMobileMenuOpen] = useState(false);

    // Calculator State
    const [parcela, setParcela] = useState("");
    const [prazo, setPrazo] = useState("");
    const [tipo, setTipo] = useState("veiculo");
    const [showResult, setShowResult] = useState(false);

    const calculateSavings = () => {
        if (!parcela || !prazo) return;
        setShowResult(true);
        // Scroll to results if needed
    };

    const valorParcela = parseFloat(parcela.replace(/\D/g, "")) / 100 || 0;
    const numParcelas = parseInt(prazo) || 0;

    const totalAtual = valorParcela * numParcelas;
    // Estimativa de redução conservadora (35-40%)
    const reductionFactor = 0.35;
    const economiaEstimada = totalAtual * reductionFactor;
    const totalJusto = totalAtual - economiaEstimada;

    const formatCurrency = (val: number) => {
        return new Intl.NumberFormat('pt-BR', { style: 'currency', currency: 'BRL' }).format(val);
    };

    const handleParcelaChange = (e: React.ChangeEvent<HTMLInputElement>) => {
        const value = e.target.value.replace(/\D/g, "");
        const formatted = new Intl.NumberFormat('pt-BR', { style: 'currency', currency: 'BRL' }).format(parseFloat(value) / 100);
        setParcela(formatted);
    };

    // Common styles
    const sectionPadding = "py-16 md:py-24";
    const containerClass = "container mx-auto px-4";

    return (
        <div className="min-h-screen bg-white font-sans text-[#1a2b4b]">
            {/* Header */}
            <header className="border-b border-gray-100 bg-white sticky top-0 z-50 shadow-sm">
                <div className="container mx-auto px-4 py-4">
                    <div className="flex items-center justify-between">
                        <div className="flex items-center gap-2 cursor-pointer" onClick={() => navigate("/home")}>
                            <img src={logoJusContratos} alt="JusContratos" className="h-10 md:h-12" />
                        </div>

                        {/* Desktop Navigation */}
                        <nav className="hidden md:flex items-center gap-8">
                            <a href="#calculadora" className="text-sm font-semibold text-gray-600 hover:text-[#1a2b4b] transition-colors uppercase tracking-wide">
                                Simular Economia
                            </a>
                            <a href="#o-inimigo" className="text-sm font-semibold text-gray-600 hover:text-[#1a2b4b] transition-colors uppercase tracking-wide">
                                O Que o Banco Esconde
                            </a>
                            <Button
                                variant="default"
                                className="bg-[#002B5C] hover:bg-[#001f42] text-white font-bold"
                                onClick={() => navigate(isAuthenticated ? "/dashboard" : "/auth")}
                            >
                                {isAuthenticated ? "Dashboard" : "Entrar"}
                            </Button>
                        </nav>

                        {/* Mobile Menu */}
                        <Sheet open={mobileMenuOpen} onOpenChange={setMobileMenuOpen}>
                            <SheetTrigger asChild className="md:hidden">
                                <Button variant="ghost" size="icon">
                                    <Menu className="h-6 w-6 text-[#1a2b4b]" />
                                </Button>
                            </SheetTrigger>
                            <SheetContent side="right">
                                <nav className="flex flex-col gap-6 mt-8">
                                    <a href="#calculadora" onClick={() => setMobileMenuOpen(false)} className="text-lg font-medium text-gray-800">
                                        Simular Economia
                                    </a>
                                    <a href="#o-inimigo" onClick={() => setMobileMenuOpen(false)} className="text-lg font-medium text-gray-800">
                                        O Que o Banco Esconde
                                    </a>
                                    <Button
                                        className="w-full bg-[#002B5C] hover:bg-[#001f42]"
                                        onClick={() => navigate(isAuthenticated ? "/dashboard" : "/auth")}
                                    >
                                        {isAuthenticated ? "Dashboard" : "Entrar"}
                                    </Button>
                                </nav>
                            </SheetContent>
                        </Sheet>
                    </div>
                </div>
            </header>

            {/* DOBRA 1: HERO SECTION */}
            <section className="relative overflow-hidden bg-white pt-24 pb-32 border-b border-gray-100">
                <div className={containerClass}>
                    <div className="max-w-4xl mx-auto text-center">
                        <div className="inline-flex items-center gap-2 bg-slate-50 border border-slate-100 px-4 py-1.5 rounded-full mb-8">
                            <Scale className="w-3 h-3 text-[#1a2b4b]" />
                            <span className="text-xs font-bold text-[#1a2b4b] tracking-widest uppercase">Auditoria de Financiamentos</span>
                        </div>

                        <h1 className="text-4xl md:text-5xl lg:text-6xl font-extrabold text-[#1a2b4b] mb-8 leading-[1.1] tracking-tight">
                            Você Comprou Um, <br className="hidden md:block" />
                            <span className="text-[#002B5C]">Mas Está Pagando Dois?</span>
                        </h1>

                        <p className="text-lg md:text-xl text-gray-600 mb-10 max-w-2xl mx-auto leading-relaxed font-medium">
                            Auditoria pericial para Imóveis e Veículos. Descubra exatamente quanto o banco está cobrando a mais.
                        </p>

                        <div className="flex flex-col sm:flex-row items-center justify-center gap-6">
                            <Button
                                size="lg"
                                className="w-full sm:w-auto bg-[#00C853] hover:bg-[#009624] text-white font-bold text-lg h-14 px-10 rounded-lg shadow-[0_4px_14px_0_rgba(0,200,83,0.39)] hover:shadow-[0_6px_20px_rgba(0,200,83,0.23)] hover:-translate-y-0.5 transition-all uppercase tracking-wider"
                                onClick={() => document.getElementById('calculadora')?.scrollIntoView({ behavior: 'smooth' })}
                            >
                                Simular Minha Economia Agora
                            </Button>
                        </div>

                        <div className="mt-8 text-center">
                            <p className="text-xs text-slate-400 font-medium tracking-wide uppercase">
                                Base de cálculo atualizada conforme Súmulas do STJ e Normas do Bacen.
                            </p>
                        </div>
                    </div>
                </div>
            </section>

            {/* DOBRA 2: CALCULADORA (O Gancho) */}
            <section id="calculadora" className={`${sectionPadding} bg-slate-50 border-b border-gray-200`}>
                <div className={containerClass}>
                    <div className="max-w-4xl mx-auto">
                        <div className="text-center mb-10">
                            <h2 className="text-3xl font-extrabold text-[#1a2b4b] mb-4">
                                Calculadora de Previsibilidade JusContratos
                            </h2>
                            <p className="text-gray-600">
                                Insira os dados do seu contrato atual e veja a discrepância.
                            </p>
                        </div>

                        <Card className="border-0 shadow-xl bg-white overflow-hidden">
                            <CardContent className="p-8 md:p-10">
                                <div className="grid md:grid-cols-2 gap-12">
                                    {/* Inputs */}
                                    <div className="space-y-6">
                                        <div className="space-y-2">
                                            <Label htmlFor="tipo" className="text-sm font-semibold text-gray-700">Tipo de Contrato</Label>
                                            <Select value={tipo} onValueChange={setTipo}>
                                                <SelectTrigger className="h-12 bg-slate-50 border-gray-200">
                                                    <SelectValue placeholder="Selecione o tipo" />
                                                </SelectTrigger>
                                                <SelectContent>
                                                    <SelectItem value="veiculo">Veículo (Carro/Moto/Caminhão)</SelectItem>
                                                    <SelectItem value="imovel">Imóvel (Financiamento Habitacional)</SelectItem>
                                                    <SelectItem value="consignado">Empréstimo Consignado</SelectItem>
                                                </SelectContent>
                                            </Select>
                                        </div>

                                        <div className="space-y-2">
                                            <Label htmlFor="parcela" className="text-sm font-semibold text-gray-700">Valor da Parcela Atual</Label>
                                            <Input
                                                id="parcela"
                                                value={parcela}
                                                onChange={handleParcelaChange}
                                                placeholder="R$ 0,00"
                                                className="h-12 bg-slate-50 border-gray-200 text-lg"
                                            />
                                        </div>

                                        <div className="space-y-2">
                                            <Label htmlFor="prazo" className="text-sm font-semibold text-gray-700">Quantidade de Parcelas (Total)</Label>
                                            <Input
                                                id="prazo"
                                                type="number"
                                                value={prazo}
                                                onChange={(e) => setPrazo(e.target.value)}
                                                placeholder="Ex: 60"
                                                className="h-12 bg-slate-50 border-gray-200 text-lg"
                                            />
                                        </div>

                                        <Button
                                            className="w-full h-12 bg-[#1a2b4b] hover:bg-[#15233b] text-white font-bold text-lg mt-4 shadow-lg hover:shadow-xl transition-all"
                                            onClick={calculateSavings}
                                        >
                                            Calcular Juros Abusivos
                                        </Button>
                                    </div>

                                    {/* Resultado Visual */}
                                    <div className="flex flex-col justify-center">
                                        {!showResult ? (
                                            <div className="h-full flex flex-col items-center justify-center text-center p-8 bg-slate-50 rounded-xl border border-dashed border-gray-300">
                                                <Calculator className="w-12 h-12 text-gray-300 mb-4" />
                                                <p className="text-gray-500 font-medium">Preencha os dados ao lado para ver sua economia estimada.</p>
                                            </div>
                                        ) : (
                                            <div className="space-y-6 animate-in fade-in slide-in-from-bottom-4 duration-700">
                                                <div className="space-y-4">
                                                    <div>
                                                        <p className="text-xs text-gray-500 font-bold uppercase tracking-wider mb-1">Total Que Você Vai Pagar</p>
                                                        <div className="flex items-end gap-2 text-red-500">
                                                            <span className="text-2xl font-bold">{formatCurrency(totalAtual)}</span>
                                                        </div>
                                                        <div className="w-full bg-red-100 h-2 rounded-full mt-2">
                                                            <div className="h-full bg-red-500 rounded-full w-full"></div>
                                                        </div>
                                                    </div>

                                                    <div>
                                                        <p className="text-xs text-gray-500 font-bold uppercase tracking-wider mb-1">Estimativa Justa (Sem Abusos)</p>
                                                        <div className="flex items-end gap-2 text-[#1a2b4b]">
                                                            <span className="text-2xl font-bold">{formatCurrency(totalJusto)}</span>
                                                        </div>
                                                        <div className="w-full bg-slate-100 h-2 rounded-full mt-2">
                                                            <div className="h-full bg-[#1a2b4b] rounded-full w-[65%]"></div>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div className="p-6 bg-green-50 border border-green-100 rounded-xl">
                                                    <p className="text-sm text-green-700 font-semibold uppercase tracking-wide mb-1">Dinheiro Recuperável Estimado</p>
                                                    <p className="text-3xl md:text-4xl font-extrabold text-[#00C853] tracking-tight">{formatCurrency(economiaEstimada)}</p>
                                                </div>

                                                <Button
                                                    className="w-full h-14 bg-[#00C853] hover:bg-[#009624] text-white font-bold text-lg shadow-[0_4px_14px_0_rgba(0,200,83,0.39)] hover:shadow-[0_6px_20px_rgba(0,200,83,0.23)] hover:-translate-y-0.5 transition-all uppercase tracking-wider"
                                                    onClick={() => navigate("/consultas")}
                                                >
                                                    Quero o Laudo Para Recuperar
                                                </Button>
                                                <p className="text-[10px] text-center text-gray-400">
                                                    *Estimativa baseada na média de 35% de redução em contratos revisados. O valor final depende de laudo pericial detalhado.
                                                </p>
                                            </div>
                                        )}
                                    </div>
                                </div>
                            </CardContent>
                        </Card>
                    </div>
                </div>
            </section>

            {/* DOBRA 4: PROVA SOCIAL (Novo) */}
            <section className="py-12 bg-white border-b border-gray-100">
                <div className={containerClass}>
                    <div className="grid md:grid-cols-3 gap-8 text-center divide-y md:divide-y-0 md:divide-x divide-gray-100">
                        <div className="py-4">
                            <p className="text-4xl font-extrabold text-[#1a2b4b] mb-2">R$ +12 Mi</p>
                            <p className="text-gray-500 text-sm font-medium uppercase tracking-wide">Auditados e Analisados</p>
                        </div>
                        <div className="py-4">
                            <p className="text-4xl font-extrabold text-[#1a2b4b] mb-2">2.500+</p>
                            <p className="text-gray-500 text-sm font-medium uppercase tracking-wide">Contratos Verificados</p>
                        </div>
                        <div className="py-4">
                            <p className="text-4xl font-extrabold text-[#00C853] mb-2">35%</p>
                            <p className="text-gray-500 text-sm font-medium uppercase tracking-wide">Economia Média por Contrato</p>
                        </div>
                    </div>
                </div>
            </section>

            {/* DOBRA 3: O INIMIGO */}
            <section id="o-inimigo" className={`${sectionPadding} bg-white border-b border-gray-100`}>
                <div className={containerClass}>
                    <div className="text-center mb-16">
                        <h2 className="text-3xl font-extrabold text-[#1a2b4b] mb-4">
                            O Que o Banco Não Te Explicou na Assinatura
                        </h2>
                        <div className="h-1 w-20 bg-[#1a2b4b] mx-auto rounded-full opacity-10 mb-8"></div>
                        <p className="text-sm font-semibold text-gray-500 uppercase tracking-widest mb-4">
                            Auditamos contratos de todas as principais instituições financeiras
                        </p>
                        <div className="flex flex-wrap justify-center gap-8 opacity-40 grayscale hover:grayscale-0 transition-all duration-500 mb-12">
                            {/* Placeholder Logos - Text for now as specific SVG paths would be huge */}
                            <span className="text-2xl font-bold font-serif text-slate-600">Santander</span>
                            <span className="text-2xl font-bold font-sans tracking-tight text-[#fecb00] drop-shadow-sm text-slate-600">Banco do Brasil</span>
                            <span className="text-2xl font-bold font-sans italic text-slate-600">Bradesco</span>
                            <span className="text-2xl font-bold font-sans text-slate-600">Itaú</span>
                            <span className="text-2xl font-bold font-sans text-slate-600 tracking-tighter">CAIXA</span>
                            <span className="text-2xl font-bold font-sans text-slate-600">BV Financeira</span>
                        </div>
                    </div>

                    <div className="grid md:grid-cols-2 lg:grid-cols-4 gap-8">
                        {/* Card 1 */}
                        <div className="group p-8 rounded-lg border border-gray-100 bg-slate-50/50 hover:bg-white hover:shadow-xl transition-all duration-300">
                            <div className="mb-6">
                                <TrendingDown className="w-8 h-8 text-[#1a2b4b]" strokeWidth={1.5} />
                            </div>
                            <h3 className="text-lg font-bold text-[#1a2b4b] mb-3">Anatocismo</h3>
                            <p className="text-gray-600 text-sm leading-relaxed">
                                Juros sobre juros. A prática ilegal que dobra sua dívida a longo prazo, transformando seu financiamento em uma bola de neve.
                            </p>
                        </div>

                        {/* Card 2 */}
                        <div className="group p-8 rounded-lg border border-gray-100 bg-slate-50/50 hover:bg-white hover:shadow-xl transition-all duration-300">
                            <div className="mb-6">
                                <FileWarning className="w-8 h-8 text-[#1a2b4b]" strokeWidth={1.5} />
                            </div>
                            <h3 className="text-lg font-bold text-[#1a2b4b] mb-3">Venda Casada & Seguros</h3>
                            <p className="text-gray-600 text-sm leading-relaxed">
                                Taxas embutidas que você nunca pediu, mas está pagando com juros. Seguros e títulos de capitalização disfarçados.
                            </p>
                        </div>

                        {/* Card 3 */}
                        <div className="group p-8 rounded-lg border border-gray-100 bg-slate-50/50 hover:bg-white hover:shadow-xl transition-all duration-300">
                            <div className="mb-6">
                                <Banknote className="w-8 h-8 text-[#1a2b4b]" strokeWidth={1.5} />
                            </div>
                            <h3 className="text-lg font-bold text-[#1a2b4b] mb-3">Tarifas Fantasmas (TAC/TEC)</h3>
                            <p className="text-gray-600 text-sm leading-relaxed">
                                Cobranças administrativas ilegais que encarecem sua parcela sem trazer retorno algum para o seu contrato.
                            </p>
                        </div>

                        {/* Card 4 */}
                        <div className="group p-8 rounded-lg border border-gray-100 bg-slate-50/50 hover:bg-white hover:shadow-xl transition-all duration-300">
                            <div className="mb-6">
                                <AlertTriangle className="w-8 h-8 text-[#1a2b4b]" strokeWidth={1.5} />
                            </div>
                            <h3 className="text-lg font-bold text-[#1a2b4b] mb-3">Risco de Busca e Apreensão</h3>
                            <p className="text-gray-600 text-sm leading-relaxed">
                                A única blindagem real contra a perda do bem por atraso é a revisão contratual antecipada e estratégica.
                            </p>
                        </div>
                    </div>
                </div>
            </section>

            {/* DOBRA 3: A SOLUÇÃO TÉCNICA */}
            <section className={`${sectionPadding} bg-[#0f172a] text-white`}>
                <div className={containerClass}>
                    <div className="max-w-4xl mx-auto text-center">
                        <div className="mb-8 flex justify-center">
                            <Calculator className="w-12 h-12 text-[#00C853] opacity-80" strokeWidth={1} />
                        </div>
                        <h2 className="text-3xl md:text-4xl font-extrabold mb-6 leading-tight">
                            Tecnologia de Recálculo Pericial
                        </h2>
                        <p className="text-slate-400 text-lg mb-8 leading-relaxed max-w-2xl mx-auto">
                            Não somos uma calculadora online comum. Nossa plataforma desmonta a estrutura do seu contrato, compara com a Taxa Média de Mercado do dia da assinatura e aponta matematicamente onde você está sendo lesado.
                        </p>

                        <div className="inline-flex items-center gap-2 bg-slate-800/50 border border-slate-700 px-6 py-3 rounded-full">
                            <CheckCircle2 className="w-4 h-4 text-[#00C853]" />
                            <span className="text-sm font-semibold text-slate-200">
                                Válido para: Financiamento Imobiliário (Casa/Apto), Veículos (Carro/Moto) e Empréstimos Consignados.
                            </span>
                        </div>
                    </div>
                </div>
            </section>

            {/* DOBRA 4: PROVA LÓGICA */}
            <section className={`${sectionPadding} bg-white`}>
                <div className={containerClass}>
                    <div className="grid lg:grid-cols-2 gap-16 items-center">
                        <div>
                            <h2 className="text-3xl md:text-4xl font-extrabold text-[#1a2b4b] mb-6 leading-tight">
                                A Matemática Não Mente
                            </h2>
                            <p className="text-gray-600 text-lg mb-8 leading-relaxed">
                                A diferença entre o que o banco cobra e o que a lei permite não é mágica. É a remoção cirúrgica de cobranças indevidas e juros abusivos.
                            </p>
                            <p className="text-sm text-gray-500 italic border-l-4 border-[#00C853] pl-4">
                                "Não confie na palavra do gerente. Confie no cálculo exato da dívida."
                            </p>
                        </div>

                        {/* Comparativo Visual */}
                        <div className="bg-slate-50 rounded-2xl p-8 border border-slate-100 shadow-lg">
                            <h3 className="text-xl font-bold text-[#1a2b4b] mb-8 text-center">Comparativo Mensal Estimado</h3>

                            <div className="space-y-6">
                                {/* Coluna A (Banco) */}
                                <div>
                                    <div className="flex justify-between text-sm font-semibold text-gray-500 mb-2">
                                        <span>Cobrança Bancária Atual</span>
                                        <span className="text-red-500 font-bold">Injusto</span>
                                    </div>
                                    <div className="h-14 bg-red-100 rounded-lg relative overflow-hidden flex items-center px-4 w-full border border-red-200">
                                        <div className="absolute left-0 top-0 bottom-0 bg-red-500 w-[90%] opacity-10"></div>
                                        <span className="font-mono font-bold text-red-700 text-lg">R$ 1.500,00 <span className="text-xs font-normal">/mês</span></span>
                                    </div>
                                </div>

                                {/* Coluna B (Recálculo) */}
                                <div>
                                    <div className="flex justify-between text-sm font-semibold text-gray-500 mb-2">
                                        <span>Após Recálculo Justo</span>
                                        <span className="text-[#00C853] font-bold">Economia Real</span>
                                    </div>
                                    <div className="h-14 bg-green-50 rounded-lg relative overflow-hidden flex items-center px-4 w-[65%] border border-[#00C853]/30 shadow-[0_2px_10px_rgba(0,200,83,0.15)]">
                                        <div className="absolute left-0 top-0 bottom-0 bg-[#00C853] w-full opacity-10"></div>
                                        <span className="font-mono font-bold text-[#006429] text-lg">R$ 980,00 <span className="text-xs font-normal">/mês</span></span>
                                    </div>
                                </div>
                            </div>

                            <div className="mt-8 pt-6 border-t border-gray-200 text-center">
                                <p className="text-gray-500 text-sm">
                                    Simulação baseada em casos reais de revisão de taxa média.
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </section>

            {/* DOBRA 5: COMO FAZER (Fluxo Rápido) */}
            <section id="como-funciona" className={`${sectionPadding} bg-slate-50 border-y border-gray-200`}>
                <div className={containerClass}>
                    <div className="text-center mb-16">
                        <h2 className="text-3xl font-extrabold text-[#1a2b4b] mb-4">
                            Recuperação Financeira em 3 Passos
                        </h2>
                    </div>

                    <div className="grid md:grid-cols-3 gap-8">
                        {/* Step 1 */}
                        <div className="bg-white p-8 rounded-xl shadow-sm border border-gray-100 relative group hover:shadow-md transition-all">
                            <div className="w-12 h-12 bg-[#1a2b4b] text-white rounded-lg flex items-center justify-center font-bold text-xl mb-6 shadow-lg group-hover:scale-110 transition-transform">
                                1
                            </div>
                            <h3 className="font-bold text-lg text-[#1a2b4b] mb-3">Selecione o Tipo</h3>
                            <p className="text-gray-600 text-sm leading-relaxed">
                                Escolha "Financiamento de Veículo" ou "Imobiliário" na nossa plataforma segura.
                            </p>
                        </div>

                        {/* Step 2 */}
                        <div className="bg-white p-8 rounded-xl shadow-sm border border-gray-100 relative group hover:shadow-md transition-all">
                            <div className="w-12 h-12 bg-[#1a2b4b] text-white rounded-lg flex items-center justify-center font-bold text-xl mb-6 shadow-lg group-hover:scale-110 transition-transform">
                                2
                            </div>
                            <h3 className="font-bold text-lg text-[#1a2b4b] mb-3">Anexe o Contrato</h3>
                            <p className="text-gray-600 text-sm leading-relaxed">
                                Envie foto ou PDF do seu contrato bancário para análise do nosso algoritmo pericial.
                            </p>
                        </div>

                        {/* Step 3 */}
                        <div className="bg-white p-8 rounded-xl shadow-sm border border-gray-100 relative group hover:shadow-md transition-all">
                            <div className="w-12 h-12 bg-[#00C853] text-white rounded-lg flex items-center justify-center font-bold text-xl mb-6 shadow-lg group-hover:scale-110 transition-transform">
                                3
                            </div>
                            <h3 className="font-bold text-lg text-[#1a2b4b] mb-3">Receba o Laudo</h3>
                            <p className="text-gray-600 text-sm leading-relaxed">
                                Acesse seu Laudo de Discrepância Financeira mostrando exatamente quanto você pode economizar.
                            </p>
                        </div>
                    </div>
                </div>
            </section>

            {/* DOBRA 6: CTA FINAL (Rodapé de Conversão Atualizado) */}
            <section className="py-24 bg-white">
                <div className="container mx-auto px-4 max-w-4xl text-center">
                    <h2 className="text-3xl md:text-5xl font-extrabold text-[#1a2b4b] mb-8 leading-tight">
                        Você tem duas opções: <br />
                        <span className="text-base font-normal text-gray-600 block mt-4">Continuar pagando juros abusivos ou investir R$ 147,00 para economizar milhares.</span>
                    </h2>

                    <div className="flex flex-col items-center gap-6 mt-10">
                        <Button
                            size="lg"
                            className="bg-[#00C853] hover:bg-[#009624] text-white font-bold text-xl px-12 py-8 h-auto rounded-lg shadow-[0_4px_14px_0_rgba(0,200,83,0.39)] hover:shadow-[0_6px_20px_rgba(0,200,83,0.23)] hover:-translate-y-0.5 transition-all uppercase tracking-wider"
                            onClick={() => navigate("/consultas")}
                        >
                            Quero Parar de Perder Dinheiro
                        </Button>

                        <div className="flex items-center justify-center gap-2 text-xs text-gray-500 font-medium uppercase tracking-widest mt-4">
                            <Lock className="w-4 h-4 text-[#1a2b4b]" />
                            Sigilo Bancário Absoluto. Seus dados são processados em ambiente criptografado.
                        </div>
                    </div>
                </div>
            </section>

            <Footer />
        </div>
    );
};

export default FinanciamentoBlindado;
