import { lazy, Suspense } from "react";
import { Button } from "@/components/ui/button";
import { Footer } from "@/components/Footer";
import { useNavigate } from "react-router-dom";
import {
    Shield,
    Lock,
    AlertTriangle,
    Menu,
    Database
} from "lucide-react";
import logoJusContratos from "@/assets/logo-juscontratos.png";
import { useState } from "react";
import { Sheet, SheetContent, SheetTrigger } from "@/components/ui/sheet";
import { useAuth } from "@/contexts/AuthContext";

// Local Components
import { ScoreGauge } from "@/components/leilao/ScoreGauge";
import { SocialProofSection } from "@/components/leilao/SocialProofSection";
import { TickerBar } from "@/components/leilao/TickerBar";

// Lazy Components for below-the-fold content
const SimulatorSection = lazy(() => import("@/components/leilao/SimulatorSection").then(m => ({ default: m.SimulatorSection })));
const ProtocoloSection = lazy(() => import("@/components/leilao/ProtocoloSection").then(m => ({ default: m.ProtocoloSection })));
const ProtectionSection = lazy(() => import("@/components/leilao/ProtectionSection").then(m => ({ default: m.ProtectionSection })));
const FluxoSection = lazy(() => import("@/components/leilao/FluxoSection").then(m => ({ default: m.FluxoSection })));
const FinalCtaSection = lazy(() => import("@/components/leilao/FinalCtaSection").then(m => ({ default: m.FinalCtaSection })));

const SectionLoader = () => <div className="h-64 flex items-center justify-center bg-slate-50 animate-pulse">Carregando seção...</div>;

const LeilaoBlindado = () => {
    const navigate = useNavigate();
    const { isAuthenticated } = useAuth();
    const [mobileMenuOpen, setMobileMenuOpen] = useState(false);

    const handleCtaClick = () => {
        navigate("/consultas");
    };

    return (
        <div className="min-h-screen bg-white font-sans text-[#1a2b4b]">
            {/* Header */}
            <header className="border-b border-gray-100 bg-white sticky top-0 z-50 shadow-sm" role="banner">
                <div className="container mx-auto px-4 py-4">
                    <div className="flex items-center justify-between">
                        <div
                            className="flex items-center gap-2 cursor-pointer"
                            onClick={() => navigate("/home")}
                            role="link"
                            tabIndex={0}
                            aria-label="Voltar para a página inicial"
                            onKeyDown={(e) => e.key === 'Enter' && navigate("/home")}
                        >
                            <img
                                src={logoJusContratos}
                                alt="Logotipo JusContratos"
                                className="h-10 md:h-12 w-auto"
                                width="160"
                                height="48"
                                fetchPriority="high"
                            />
                        </div>

                        {/* Desktop Navigation */}
                        <nav className="hidden md:flex items-center gap-8" aria-label="Navegação principal">
                            <a href="#como-funciona" className="text-sm font-bold text-gray-500 hover:text-[#1a2b4b] transition-colors uppercase tracking-wide">
                                Como Funciona
                            </a>
                            <a href="#protecao" className="text-sm font-bold text-gray-500 hover:text-[#1a2b4b] transition-colors uppercase tracking-wide">
                                Garantia
                            </a>
                            <Button
                                variant="default"
                                className="bg-[#002B5C] hover:bg-[#001f42] text-white font-bold"
                                onClick={() => navigate(isAuthenticated ? "/dashboard" : "/auth")}
                                aria-label={isAuthenticated ? "Acessar Dashboard" : "Fazer Login"}
                            >
                                {isAuthenticated ? "Dashboard" : "Entrar"}
                            </Button>
                        </nav>

                        {/* Mobile Menu */}
                        <Sheet open={mobileMenuOpen} onOpenChange={setMobileMenuOpen}>
                            <SheetTrigger asChild className="md:hidden">
                                <Button variant="ghost" size="icon" aria-label="Abrir menu de navegação">
                                    <Menu className="h-6 w-6 text-[#1a2b4b]" />
                                </Button>
                            </SheetTrigger>
                            <SheetContent side="right">
                                <nav className="flex flex-col gap-6 mt-8" aria-label="Navegação mobile">
                                    <a href="#como-funciona" onClick={() => setMobileMenuOpen(false)} className="text-lg font-bold text-gray-800">
                                        Como Funciona
                                    </a>
                                    <a href="#protecao" onClick={() => setMobileMenuOpen(false)} className="text-lg font-bold text-gray-800">
                                        Garantia
                                    </a>
                                    <Button
                                        className="w-full bg-[#002B5C] hover:bg-[#001f42] font-bold"
                                        onClick={() => navigate(isAuthenticated ? "/dashboard" : "/auth")}
                                        aria-label={isAuthenticated ? "Acessar Dashboard" : "Fazer Login"}
                                    >
                                        {isAuthenticated ? "Dashboard" : "Entrar"}
                                    </Button>
                                </nav>
                            </SheetContent>
                        </Sheet>
                    </div>
                </div>
            </header>

            <main>
                {/* Hero Section */}
                <section className="relative bg-white pt-20 pb-24 md:pt-36 md:pb-32 overflow-hidden" aria-labelledby="hero-title">
                    <div className="container mx-auto px-6 lg:px-4">
                        <div className="grid lg:grid-cols-2 gap-16 items-center">
                            {/* Left Column - Copy & CTA (with mobile-only Gauge) */}
                            <div className="text-center lg:text-left z-10 flex flex-col items-center lg:items-start">
                                {/* Orange Badge */}
                                <div className="inline-flex items-center gap-2 bg-[#f59e0b] lg:bg-[#FFB700] px-4 py-1.5 rounded-full mb-8 shadow-sm">
                                    <Shield className="w-3 h-3 text-white" aria-hidden="true" />
                                    <span className="text-xs font-bold text-white tracking-widest uppercase">PLATAFORMA DE AUDITORIA JURÍDICA</span>
                                </div>

                                <h1 id="hero-title" className="text-4xl md:text-5xl lg:text-6xl font-black text-[#1a2b4b] mb-8 lg:mb-6 leading-[1.1] tracking-tighter">
                                    O Lance que Define seu Patrimônio <br />
                                    <span className="text-[#002B5C]">Precisa de Segurança.</span>
                                </h1>

                                {/* Mobile-Only Gauge & Social Proof Block */}
                                <div className="lg:hidden flex flex-col items-center scale-90 sm:scale-100" aria-hidden="true">
                                    <ScoreGauge />

                                    <div className="inline-flex items-center gap-2.5 bg-slate-50 border border-slate-100 px-5 py-2 rounded-full mb-3 shadow-sm">
                                        <AlertTriangle className="w-4 h-4 text-red-500" />
                                        <span className="text-xs font-black text-[#1a2b4b] tracking-widest uppercase text-center">SEGURANÇA MÁXIMA</span>
                                    </div>
                                    <p className="text-gray-400 text-xs font-semibold mb-6 tracking-wide text-center">Arrematação Blindada</p>

                                    <SocialProofSection isMobile={true} />
                                </div>

                                <p className="text-lg md:text-xl text-gray-500 lg:text-gray-600 mb-10 leading-relaxed max-w-2xl mx-auto lg:mx-0 font-medium">
                                    Auditoria especializada de Editais e Matrículas. Identificamos riscos ocultos antes que você assuma a dívida do antigo proprietário.
                                </p>

                                <Button
                                    size="lg"
                                    className="bg-[#00C851] hover:bg-[#009624] text-white font-black text-base sm:text-lg h-14 px-6 sm:px-10 rounded-lg shadow-lg hover:shadow-xl transition-all uppercase tracking-wider hover:-translate-y-1 w-full md:w-auto"
                                    onClick={handleCtaClick}
                                    aria-label="Iniciar auditoria de leilão agora"
                                >
                                    INICIAR AUDITORIA DE LEILÃO
                                </Button>

                                <div className="mt-8 flex items-center justify-center lg:justify-start gap-4 text-xs text-gray-400 font-bold tracking-tight">
                                    <span className="flex items-center gap-1">
                                        <Lock className="w-3 h-3" aria-hidden="true" /> Pagamento Seguro
                                    </span>
                                    <span className="hidden md:inline text-gray-300">|</span>
                                    <span className="flex items-center gap-1">
                                        <Database className="w-3 h-3" aria-hidden="true" /> Dados Oficiais STJ/Bacen
                                    </span>
                                </div>
                            </div>

                            {/* Right Column - Premium Score Visual (Hidden on mobile) */}
                            <div className="hidden lg:flex relative z-10 flex-col items-center" aria-hidden="true">
                                {/* Radial Glow Background */}
                                <div className="absolute top-1/2 left-1/2 -translate-x-1/2 -translate-y-1/2 w-[400px] h-[400px] bg-[radial-gradient(circle_at_center,_#3b82f6_0%,_transparent_70%)] opacity-[0.03] -z-10 blur-3xl"></div>

                                <ScoreGauge />

                                {/* Risk Badge */}
                                <div className="inline-flex items-center gap-2.5 bg-slate-50 border border-slate-100 px-5 py-2 rounded-full mb-3 shadow-sm">
                                    <AlertTriangle className="w-4 h-4 text-red-500" />
                                    <span className="text-xs font-black text-[#1a2b4b] tracking-widest uppercase">SEGURANÇA MÁXIMA</span>
                                </div>

                                {/* Contract Subtext */}
                                <p className="text-gray-400 text-xs font-semibold mb-6 tracking-wide">Arrematação Blindada</p>

                                <SocialProofSection />
                            </div>
                        </div>
                    </div>
                </section>

                <TickerBar />

                {/* Lazy Sections */}
                <Suspense fallback={<SectionLoader />}>
                    <SimulatorSection onCtaClick={handleCtaClick} />
                </Suspense>

                <Suspense fallback={<SectionLoader />}>
                    <ProtocoloSection />
                </Suspense>

                <Suspense fallback={<SectionLoader />}>
                    <ProtectionSection onCtaClick={handleCtaClick} />
                </Suspense>

                <Suspense fallback={<SectionLoader />}>
                    <FluxoSection />
                </Suspense>

                <Suspense fallback={<SectionLoader />}>
                    <FinalCtaSection onCtaClick={handleCtaClick} />
                </Suspense>
            </main>

            <Footer />
        </div>
    );
};

export default LeilaoBlindado;
