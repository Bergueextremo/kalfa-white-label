import { Button } from "@/components/ui/button";
import { Footer } from "@/components/Footer";
import { ScoreCard } from "@/components/audit-flow/ScoreCard";
import { useNavigate } from "react-router-dom";
import {
    Shield,
    Gavel,
    Search,
    FileCheck,
    Lock,
    AlertTriangle,
    CheckCircle2,
    FileText,
    Menu,
    ArrowRight,
    Scale,
    UploadCloud,
    Cpu,
    Users,
    Database
} from "lucide-react";
import logoJusContratos from "@/assets/logo-juscontratos.png";
import { useState } from "react";
import { Sheet, SheetContent, SheetTrigger } from "@/components/ui/sheet";
import { useAuth } from "@/contexts/AuthContext";

const LeilaoBlindado = () => {
    const navigate = useNavigate();
    const { isAuthenticated } = useAuth();
    const [mobileMenuOpen, setMobileMenuOpen] = useState(false);

    const handleCtaClick = () => {
        navigate("/consultas");
    };

    // Quiz State
    const [currentQuestion, setCurrentQuestion] = useState(0);
    const [quizStarted, setQuizStarted] = useState(false);
    const [quizFinished, setQuizFinished] = useState(false);
    const [answers, setAnswers] = useState<string[]>([]);

    const questions = [
        "O Edital cita explicitamente quem paga as dívidas de condomínio/IPTU anteriores à arrematação?",
        "Você já verificou se existe algum processo de Nulidade ou Recurso pendente no CPF/CNPJ do executado?",
        "O leilão é Extrajudicial e o imóvel está ocupado?",
        "O veículo possui bloqueios judiciais (RENAJUD) ativos que podem impedir a transferência imediata?"
    ];

    const handleAnswer = (answer: string) => {
        const newAnswers = [...answers, answer];
        setAnswers(newAnswers);

        if (currentQuestion < questions.length - 1) {
            setCurrentQuestion(currentQuestion + 1);
        } else {
            setQuizFinished(true);
        }
    };

    const restartQuiz = () => {
        setQuizStarted(false);
        setQuizFinished(false);
        setCurrentQuestion(0);
        setAnswers([]);
    };

    const getResult = () => {
        const hasRisk = answers.some(a => a === "Não Sei" || a === "Não");
        if (hasRisk) {
            return {
                status: "⚠️ RISCO MODERADO A ALTO",
                message: "Você está prestes a dar um lance no escuro. Pequenas omissões no edital podem travar seu capital por meses ou gerar dívidas inesperadas.",
                color: "text-amber-500",
                bg: "bg-amber-50",
                border: "border-amber-200"
            };
        }
        return {
            status: "🔍 NECESSITA VALIDAÇÃO JURÍDICA",
            message: "A confiança é o primeiro passo para o erro. Nossa auditoria forense valida se o que você leu é o que realmente está nos tribunais.",
            color: "text-blue-600",
            bg: "bg-blue-50",
            border: "border-blue-200"
        };
    };

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
                            <a href="#como-funciona" className="text-sm font-semibold text-gray-600 hover:text-[#1a2b4b] transition-colors uppercase tracking-wide">
                                Como Funciona
                            </a>
                            <a href="#garantia" className="text-sm font-semibold text-gray-600 hover:text-[#1a2b4b] transition-colors uppercase tracking-wide">
                                Garantia
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
                                    <a href="#como-funciona" onClick={() => setMobileMenuOpen(false)} className="text-lg font-medium text-gray-800">
                                        Como Funciona
                                    </a>
                                    <a href="#garantia" onClick={() => setMobileMenuOpen(false)} className="text-lg font-medium text-gray-800">
                                        Garantia
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

            {/* Hero Section */}
            <section className="relative bg-white pt-24 pb-24 md:pt-36 md:pb-32 overflow-hidden">
                <div className="container mx-auto px-4">
                    <div className="grid lg:grid-cols-2 gap-12 items-center">
                        {/* Left Column - Copy & CTA */}
                        <div className="text-center lg:text-left z-10">
                            <div className="inline-flex items-center gap-2 bg-slate-50 border border-slate-100 px-4 py-1.5 rounded-full mb-8 mx-auto lg:mx-0">
                                <Shield className="w-3 h-3 text-[#1a2b4b]" />
                                <span className="text-xs font-bold text-[#1a2b4b] tracking-widest uppercase">PLATAFORMA DE AUDITORIA JURÍDICA</span>
                            </div>

                            <h1 className="text-4xl md:text-5xl lg:text-6xl font-extrabold text-[#1a2b4b] mb-6 leading-[1.1] tracking-tight">
                                O Lance que Define seu Patrimônio <br />
                                <span className="text-[#002B5C]">Precisa de Segurança.</span>
                            </h1>

                            <p className="text-lg md:text-xl text-gray-600 mb-10 leading-relaxed max-w-2xl mx-auto lg:mx-0">
                                Auditoria especializada de Editais e Matrículas. Identificamos riscos ocultos antes que você assuma a dívida do antigo proprietário.
                            </p>

                            <Button
                                size="lg"
                                className="bg-[#00C851] hover:bg-[#009624] text-white font-bold text-lg h-14 px-10 rounded-lg shadow-lg hover:shadow-xl transition-all uppercase tracking-wider hover:-translate-y-1 w-full md:w-auto"
                                onClick={handleCtaClick}
                            >
                                INICIAR AUDITORIA DE LEILÃO
                            </Button>

                            <div className="mt-8 flex items-center justify-center lg:justify-start gap-4 text-xs text-gray-400 font-medium">
                                <span className="flex items-center gap-1">
                                    <Lock className="w-3 h-3" /> Pagamento Seguro
                                </span>
                                <span className="hidden md:inline text-gray-300">|</span>
                                <span className="flex items-center gap-1">
                                    <Database className="w-3 h-3" /> Dados Oficiais STJ/Bacen
                                </span>
                            </div>
                        </div>

                        {/* Right Column - Score & Social Proof */}
                        <div className="relative z-10 flex flex-col items-center lg:items-end">
                            {/* Score Card Component */}
                            <div className="w-full max-w-sm sm:max-w-md transform hover:scale-105 transition-transform duration-500 origin-center lg:origin-right">
                                <div className="h-[430px]">
                                    <ScoreCard
                                        score={100}
                                        riskLevel="Segurança Máxima"
                                        contractType="Arrematação Blindada"
                                        title="Análise de Risco"
                                        subtitle="Inteligência Artificial JusContratos"
                                    />
                                </div>

                                {/* Social Proof appended below */}
                                <div className="mt-4 bg-white/80 backdrop-blur-sm p-4 rounded-xl border border-white/50 shadow-sm flex items-center justify-between gap-4">
                                    <div className="flex -space-x-3">
                                        {[1, 2, 3, 4].map((i) => (
                                            <div key={i} className="w-10 h-10 rounded-full border-2 border-white bg-slate-200 flex items-center justify-center overflow-hidden shadow-sm">
                                                <Users className="w-5 h-5 text-slate-400" />
                                            </div>
                                        ))}
                                    </div>
                                    <div className="text-right">
                                        <div className="text-lg font-bold text-[#1a2b4b] leading-none">+ 12.500</div>
                                        <div className="text-[10px] text-gray-500 uppercase font-bold tracking-wide">Editais Analisados</div>
                                    </div>
                                </div>
                            </div>

                            {/* Decorative Elements */}
                            <div className="absolute -top-10 -right-10 w-64 h-64 bg-blue-50 rounded-full blur-3xl -z-10 opacity-60"></div>
                            <div className="absolute -bottom-10 -left-10 w-64 h-64 bg-green-50 rounded-full blur-3xl -z-10 opacity-60"></div>
                        </div>
                    </div>
                </div>
            </section>

            {/* Simulator Section */}
            <section className="py-20 bg-slate-50 border-y border-slate-200">
                <div className="container mx-auto px-4 max-w-4xl">
                    <div className="text-center mb-10">
                        <h2 className="text-2xl md:text-3xl font-bold text-[#1a2b4b] mb-4">
                            Simulador de Viabilidade: Descubra o Nível de Risco do Lote
                        </h2>
                        <p className="text-gray-600">
                            Responda a 4 perguntas rápidas e veja se você está seguro para arrematar.
                        </p>
                    </div>

                    <div className="bg-white rounded-2xl shadow-xl border border-gray-100 overflow-hidden min-h-[400px] flex flex-col justify-center transition-all">
                        {!quizStarted ? (
                            <div className="p-10 text-center">
                                <div className="w-20 h-20 bg-blue-100 rounded-full flex items-center justify-center mx-auto mb-6">
                                    <Scale className="w-10 h-10 text-[#002B5C]" />
                                </div>
                                <h3 className="text-xl font-bold text-[#1a2b4b] mb-4">Você sabe onde está pisando?</h3>
                                <p className="text-gray-500 mb-8 max-w-lg mx-auto">
                                    A maioria dos prejuízos em leilões vem de detalhes ocultos no edital ou processos paralelos que você não viu.
                                </p>
                                <Button
                                    size="lg"
                                    className="bg-[#002B5C] hover:bg-[#001f42] text-white px-10 py-6 text-lg rounded-xl shadow-lg"
                                    onClick={() => setQuizStarted(true)}
                                >
                                    Fazer Teste de Risco
                                </Button>
                            </div>
                        ) : !quizFinished ? (
                            <div className="p-8 md:p-12 animate-in fade-in slide-in-from-right-8 duration-500">
                                <div className="flex justify-between items-center mb-8">
                                    <span className="text-xs font-bold text-gray-400 uppercase tracking-widest">
                                        Pergunta {currentQuestion + 1} de {questions.length}
                                    </span>
                                    <div className="flex gap-1">
                                        {questions.map((_, i) => (
                                            <div key={i} className={`h-1.5 w-6 rounded-full transition-colors ${i <= currentQuestion ? 'bg-[#002B5C]' : 'bg-gray-200'}`} />
                                        ))}
                                    </div>
                                </div>

                                <h3 className="text-xl md:text-2xl font-bold text-[#1a2b4b] mb-10 leading-relaxed">
                                    {questions[currentQuestion]}
                                </h3>

                                <div className="grid grid-cols-1 sm:grid-cols-3 gap-4">
                                    <button
                                        className="py-4 px-6 rounded-xl border-2 border-slate-100 font-bold text-gray-600 hover:border-[#002B5C] hover:bg-[#002B5C] hover:text-white transition-all shadow-sm"
                                        onClick={() => handleAnswer("Sim")}
                                    >
                                        Sim
                                    </button>
                                    <button
                                        className="py-4 px-6 rounded-xl border-2 border-slate-100 font-bold text-gray-600 hover:border-[#002B5C] hover:bg-[#002B5C] hover:text-white transition-all shadow-sm"
                                        onClick={() => handleAnswer("Não")}
                                    >
                                        Não
                                    </button>
                                    <button
                                        className="py-4 px-6 rounded-xl border-2 border-slate-100 font-bold text-gray-600 hover:border-amber-500 hover:bg-amber-500 hover:text-white transition-all shadow-sm"
                                        onClick={() => handleAnswer("Não Sei")}
                                    >
                                        Não Sei
                                    </button>
                                </div>
                            </div>
                        ) : (
                            <div className="p-10 text-center animate-in zoom-in-95 duration-500">
                                <div className={`inline-block px-6 py-2 rounded-full text-sm font-bold mb-6 ${getResult().bg} ${getResult().color} border ${getResult().border}`}>
                                    {getResult().status}
                                </div>

                                <h3 className="text-2xl md:text-3xl font-extrabold text-[#1a2b4b] mb-6">
                                    Resultado da Análise
                                </h3>

                                <p className="text-gray-600 text-lg mb-10 max-w-xl mx-auto leading-relaxed">
                                    {getResult().message}
                                </p>

                                <Button
                                    className="w-full md:w-auto bg-[#00C851] hover:bg-[#009624] text-white font-bold text-lg h-16 px-12 rounded-xl shadow-[0_4px_14px_0_rgba(0,200,81,0.39)] hover:shadow-[0_6px_20px_rgba(0,200,81,0.23)] hover:-translate-y-1 transition-all uppercase tracking-wider mb-6"
                                    onClick={handleCtaClick}
                                >
                                    AUDITAR ESTE LOTE AGORA POR R$ 147
                                </Button>

                                <div>
                                    <button
                                        onClick={restartQuiz}
                                        className="text-gray-400 text-sm hover:text-gray-600 underline decoration-gray-300 underline-offset-4"
                                    >
                                        Refazer teste
                                    </button>
                                </div>
                            </div>
                        )}
                    </div>
                </div>
            </section>

            {/* Protocolo Section */}
            <section className="py-20 bg-white">
                <div className="container mx-auto px-4">
                    <div className="text-center mb-16">
                        <h2 className="text-2xl md:text-3xl font-bold text-[#1a2b4b]">
                            Protocolo de Auditoria JusContratos
                        </h2>
                    </div>

                    <div className="grid md:grid-cols-2 lg:grid-cols-4 gap-8">
                        {/* Item 1 */}
                        <div className="p-8 rounded-2xl bg-white border border-gray-100 hover:shadow-lg transition-all text-left group">
                            <div className="w-12 h-12 bg-slate-50 rounded-lg flex items-center justify-center mb-6 group-hover:bg-[#002B5C] transition-colors">
                                <Search className="w-6 h-6 text-[#1a2b4b] group-hover:text-white transition-colors" />
                            </div>
                            <h3 className="font-bold text-[#1a2b4b] text-lg mb-2">Edital & Regras de Arremate</h3>
                            <p className="text-sm text-gray-500 leading-relaxed">
                                Verificação detelhada de prazos, formas de pagamento e comissões.
                            </p>
                        </div>

                        {/* Item 2 */}
                        <div className="p-8 rounded-2xl bg-white border border-gray-100 hover:shadow-lg transition-all text-left group">
                            <div className="w-12 h-12 bg-slate-50 rounded-lg flex items-center justify-center mb-6 group-hover:bg-[#002B5C] transition-colors">
                                <AlertTriangle className="w-6 h-6 text-[#1a2b4b] group-hover:text-white transition-colors" />
                            </div>
                            <h3 className="font-bold text-[#1a2b4b] text-lg mb-2">Varredura de Débitos</h3>
                            <p className="text-sm text-gray-500 leading-relaxed">
                                Rastreio completo de IPTU, multas, condomínio e ônus pendentes.
                            </p>
                        </div>

                        {/* Item 3 */}
                        <div className="p-8 rounded-2xl bg-white border border-gray-100 hover:shadow-lg transition-all text-left group">
                            <div className="w-12 h-12 bg-slate-50 rounded-lg flex items-center justify-center mb-6 group-hover:bg-[#002B5C] transition-colors">
                                <Gavel className="w-6 h-6 text-[#1a2b4b] group-hover:text-white transition-colors" />
                            </div>
                            <h3 className="font-bold text-[#1a2b4b] text-lg mb-2">Análise de Restrições</h3>
                            <p className="text-sm text-gray-500 leading-relaxed">
                                Identifique dívidas do proprietário e processos de nulidade ativos.
                            </p>
                        </div>

                        {/* Item 4 */}
                        <div className="p-8 rounded-2xl bg-white border border-gray-100 hover:shadow-lg transition-all text-left group">
                            <div className="w-12 h-12 bg-slate-50 rounded-lg flex items-center justify-center mb-6 group-hover:bg-[#002B5C] transition-colors">
                                <FileText className="w-6 h-6 text-[#1a2b4b] group-hover:text-white transition-colors" />
                            </div>
                            <h3 className="font-bold text-[#1a2b4b] text-lg mb-2">Viabilidade de Posse</h3>
                            <p className="text-sm text-gray-500 leading-relaxed">
                                Parecer sobre ocupantes e necessidade de regularização do bem.
                            </p>
                        </div>
                    </div>
                </div>
            </section>

            {/* Dark Section - Protection */}
            <section className="py-24 bg-[#0A111F] text-white">
                <div className="container mx-auto px-4">
                    <div className="grid lg:grid-cols-2 gap-16 items-center">
                        <div>
                            <h2 className="text-3xl md:text-4xl font-extrabold mb-6 leading-tight">
                                Proteja seu Capital de <br />
                                <span className="text-red-400">Giros Inesperados</span>
                            </h2>
                            <p className="text-slate-400 text-lg mb-10 leading-relaxed">
                                Um erro na leitura do edital pode custar 100x o valor desta auditoria. O risco jurídico é invisível, mas o prejuízo é real.
                            </p>

                            <div className="space-y-4 max-w-md">
                                <div className="flex justify-between items-center p-4 bg-[#131B2C] rounded-lg border border-slate-800">
                                    <div className="flex items-center gap-3">
                                        <AlertTriangle className="w-5 h-5 text-red-400" />
                                        <span className="text-red-400 font-medium">Risco de Prejuízo</span>
                                    </div>
                                    <span className="font-bold text-white">Eliminado</span>
                                </div>

                                <div className="flex justify-between items-center p-4 bg-[#003875] rounded-lg border border-[#004a99]">
                                    <div className="flex items-center gap-3">
                                        <Shield className="w-5 h-5 text-white" />
                                        <span className="text-white font-medium">Valor da Segurança</span>
                                    </div>
                                    <span className="font-bold text-white text-xl">R$ 147,00</span>
                                </div>
                            </div>

                            <button
                                className="w-full mt-8 bg-[#00C851] hover:bg-[#009624] text-white font-bold text-lg py-4 rounded-lg shadow-lg hover:shadow-[0_0_20px_rgba(0,200,81,0.4)] transition-all uppercase tracking-wider transform hover:-translate-y-1"
                                onClick={handleCtaClick}
                            >
                                QUERO BLINDAR MEU LANCE
                            </button>
                        </div>

                        <div className="relative flex justify-center">
                            <div className="absolute inset-0 bg-[#00C853] blur-[100px] opacity-10 rounded-full"></div>
                            {/* Pulse Animation Wrapper */}
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

            {/* Fluxo Operacional */}
            <section id="como-funciona" className="py-24 bg-white">
                <div className="container mx-auto px-4">
                    <div className="text-center mb-20">
                        <h2 className="text-3xl font-bold text-[#1a2b4b] mb-4">Fluxo Operacional</h2>
                        <p className="text-gray-500 uppercase tracking-wide text-sm">Tecnologia jurídica aplicada para garantir sua arrematação</p>
                    </div>

                    <div className="grid md:grid-cols-3 gap-8 relative max-w-5xl mx-auto">
                        {/* Connecting Line (Desktop) */}
                        <div className="hidden md:block absolute top-[2.5rem] left-[20%] right-[20%] h-[2px] bg-gray-100 z-0"></div>

                        {/* Step 1 */}
                        <div className="relative z-10 text-center">
                            <div className="w-20 h-20 bg-white border-2 border-slate-100 rounded-full flex items-center justify-center text-xl font-bold text-[#1a2b4b] mx-auto mb-6 shadow-sm">
                                1
                            </div>
                            <h3 className="font-bold text-[#1a2b4b] text-lg mb-2">Upload de Edital</h3>
                            <p className="text-sm text-gray-500 max-w-[200px] mx-auto">
                                Protocolo Online: Basta enviar o PDF ou o Link do Edital.
                            </p>
                        </div>

                        {/* Step 2 */}
                        <div className="relative z-10 text-center">
                            <div className="w-20 h-20 bg-white border-2 border-slate-100 rounded-full flex items-center justify-center text-xl font-bold text-[#1a2b4b] mx-auto mb-6 shadow-sm">
                                2
                            </div>
                            <h3 className="font-bold text-[#1a2b4b] text-lg mb-2">Processamento</h3>
                            <p className="text-sm text-gray-500 max-w-[200px] mx-auto">
                                Cruzamento de dados na Blockchain da JusContratos.
                            </p>
                        </div>

                        {/* Step 3 */}
                        <div className="relative z-10 text-center">
                            <div className="w-20 h-20 bg-[#002B5C] rounded-full flex items-center justify-center text-xl font-bold text-white mx-auto mb-6 shadow-lg">
                                3
                            </div>
                            <h3 className="font-bold text-[#1a2b4b] text-lg mb-2">Laudo Técnico</h3>
                            <p className="text-sm text-gray-500 max-w-[200px] mx-auto">
                                Emissão de Documento de Viabilidade Financeira e Jurídica.
                            </p>
                        </div>
                    </div>
                </div>
            </section>

            {/* Final CTA */}
            <section className="py-24 bg-slate-50 border-t border-slate-100">
                <div className="container mx-auto px-4 text-center">
                    <h2 className="text-3xl md:text-5xl font-extrabold text-[#1a2b4b] mb-10 leading-tight">
                        O Leilão Não Espera pela Sua Hesitação.
                    </h2>

                    <Button
                        size="lg"
                        className="bg-[#00C851] hover:bg-[#009624] text-white font-bold text-lg h-16 px-12 rounded-lg shadow-xl hover:shadow-2xl transition-all uppercase tracking-wider hover:-translate-y-1"
                        onClick={handleCtaClick}
                    >
                        AUDITAR MEU EDITAL AGORA
                    </Button>

                    <p className="mt-8 flex items-center justify-center gap-2 text-xs text-gray-400 uppercase tracking-widest font-semibold">
                        <Lock className="w-3 h-3" />
                        Pagamento Seguro e Criptografado
                    </p>
                </div>
            </section>

            <Footer />
        </div>
    );
};

export default LeilaoBlindado;
