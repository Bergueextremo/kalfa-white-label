import { Button } from "@/components/ui/button";
import { Card, CardContent } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { Scale, Shield, TrendingDown, FileText, Zap, Check, ArrowRight, Users, Home, Landmark, FileSearch, Banknote, ChevronRight, Menu, X } from "lucide-react";
import { useNavigate } from "react-router-dom";
import { useAuth } from "@/contexts/AuthContext";
import { Footer } from "@/components/Footer";
import { ServiceGrid } from "@/components/ServiceGrid";
import heroPadlockV2 from "@/assets/hero-padlock-v2.png";
import logoJusContratos from "@/assets/logo-juscontratos.png";
import { InfiniteScrollBanner } from '@/components/InfiniteScrollBanner';
import { Sheet, SheetContent, SheetTrigger } from '@/components/ui/sheet';
import { useState } from 'react';
const Landing = () => {
  const navigate = useNavigate();
  const {
    isAuthenticated
  } = useAuth();
  const [mobileMenuOpen, setMobileMenuOpen] = useState(false);

  const features = [{
    icon: Shield,
    title: "Análise Forense Completa",
    description: "Varredura técnica baseada em jurisprudência do STF e dados do Banco Central"
  }, {
    icon: TrendingDown,
    title: "Identificação de Juros Abusivos",
    description: "Cálculo preciso de taxas ilegais e economia potencial em contratos"
  }, {
    icon: FileText,
    title: "Laudos Fundamentados",
    description: "Documentação técnica completa com base legal para contestação judicial"
  }, {
    icon: Zap,
    title: "Resultados em 10 Segundos",
    description: "Processamento OCR e análise automática com relatórios instantâneos"
  }];
  const stats = [{
    value: "R$ 45M+",
    label: "Recuperados para clientes"
  }, {
    value: "12.500+",
    label: "Contratos analisados"
  }, {
    value: "87%",
    label: "Taxa de detecção"
  }, {
    value: "4.8/5",
    label: "Avaliação média"
  }];
  const plans = [{
    id: "start",
    name: "Start",
    price: "R$ 97,00",
    priceNumeric: 97.00,
    credits: "10 análises",
    creditsNumeric: 10,
    features: ["Laudos em PDF", "Suporte por email", "Acesso 24/7"]
  }, {
    id: "essencial",
    name: "Essencial",
    price: "R$ 324,00",
    priceNumeric: 324.00,
    credits: "50 análises",
    creditsNumeric: 50,
    features: ["Laudos personalizados", "Suporte prioritário", "Acesso multi-dispositivo", "Consultoria jurídica"],
    highlighted: true
  }, {
    id: "enterprise",
    name: "Enterprise",
    price: "R$ 997,00",
    priceNumeric: 997.00,
    credits: "Análises Ilimitadas",
    creditsNumeric: 200,
    features: ["Gerente dedicado", "Integrações customizadas", "SLA garantido", "Treinamento incluído"]
  }];
  return <div className="min-h-screen bg-background">
    {/* Header/Navigation */}
    <header className="border-b border-border bg-card/50 backdrop-blur-sm sticky top-0 z-50">
      <div className="container mx-auto px-4 py-4">
        <div className="flex items-center justify-between">
          <div className="flex items-center gap-2">
            <img src={logoJusContratos} alt="JusContratos" className="h-12 md:h-14" />
          </div>

          {/* Desktop Navigation */}
          <nav className="hidden md:flex items-center gap-8">
            <a href="#features" className="text-sm font-medium text-muted-foreground hover:text-foreground transition-colors">
              Recursos
            </a>
            <a href="/consultas" className="text-sm font-medium text-muted-foreground hover:text-foreground transition-colors">
              Consultas
            </a>
            <a href="#pricing" className="text-sm font-medium text-muted-foreground hover:text-foreground transition-colors">
              Preços
            </a>
            <Button variant="outline" onClick={() => navigate(isAuthenticated ? "/dashboard" : "/auth")}>
              {isAuthenticated ? "Dashboard" : "Entrar"}
            </Button>
            {!isAuthenticated && <Button onClick={() => navigate("/auth")}>
              Começar Gratuitamente
            </Button>}
          </nav>

          {/* Mobile Menu */}
          <Sheet open={mobileMenuOpen} onOpenChange={setMobileMenuOpen}>
            <SheetTrigger asChild className="md:hidden">
              <Button variant="ghost" size="icon">
                <Menu className="h-6 w-6" />
              </Button>
            </SheetTrigger>
            <SheetContent side="right" className="w-[300px] sm:w-[400px]">
              <nav className="flex flex-col gap-6 mt-8">
                <a
                  href="#features"
                  className="text-lg font-medium text-foreground hover:text-primary transition-colors"
                  onClick={() => setMobileMenuOpen(false)}
                >
                  Recursos
                </a>
                <a
                  href="/consultas"
                  className="text-lg font-medium text-foreground hover:text-primary transition-colors"
                  onClick={() => setMobileMenuOpen(false)}
                >
                  Consultas
                </a>
                <a
                  href="#pricing"
                  className="text-lg font-medium text-foreground hover:text-primary transition-colors"
                  onClick={() => setMobileMenuOpen(false)}
                >
                  Preços
                </a>
                <div className="flex flex-col gap-3 pt-4 border-t">
                  <Button
                    variant="outline"
                    className="w-full"
                    onClick={() => {
                      navigate(isAuthenticated ? "/dashboard" : "/auth");
                      setMobileMenuOpen(false);
                    }}
                  >
                    {isAuthenticated ? "Dashboard" : "Entrar"}
                  </Button>
                  {!isAuthenticated && (
                    <Button
                      className="w-full"
                      onClick={() => {
                        navigate("/auth");
                        setMobileMenuOpen(false);
                      }}
                    >
                      Começar Gratuitamente
                    </Button>
                  )}
                </div>
              </nav>
            </SheetContent>
          </Sheet>
        </div>
      </div>
    </header>

    {/* Hero Section */}
    <section className="relative overflow-hidden bg-white py-12 md:py-20">
      {/* Decorative Circle Background */}
      <div className="absolute left-1/2 -translate-x-1/2 md:left-auto md:translate-x-0 md:right-0 top-1/2 -translate-y-1/2 md:translate-x-1/4 w-[400px] h-[400px] md:w-[800px] md:h-[800px] lg:w-[1100px] lg:h-[1100px] rounded-full bg-[#0A1E4B] -z-10" />

      <div className="container mx-auto px-4">
        <div className="grid lg:grid-cols-2 gap-4 lg:gap-8 items-center">
          {/* Left Content */}
          <div className="flex flex-col gap-6 text-center lg:text-left items-center lg:items-start order-2 lg:order-1">
            <h1 className="text-4xl md:text-5xl lg:text-6xl xl:text-7xl font-extrabold text-[#0A1E4B] leading-tight order-1">
              BLINDE SEU<br />
              CONTRATO
            </h1>
            <p className="text-base md:text-lg lg:text-xl text-gray-500 max-w-lg order-2 mx-auto lg:mx-0">
              Não arrisque seu dinheiro com <span className="font-bold text-[#0A1E4B]">cláusulas abusivas e juros ilegais!</span>
            </p>

            {/* Mobile Image - Visible only on mobile */}
            <div className="relative flex justify-center py-8 order-3 lg:hidden w-full">
              <img
                alt="Blindagem de contrato"
                src={heroPadlockV2}
                className="w-[280px] sm:w-[320px] drop-shadow-2xl relative z-10"
              />
            </div>

            <div className="flex items-center justify-center lg:justify-start gap-2 text-sm text-gray-500 pt-2 order-4 lg:order-5">
              <Users className="h-4 w-4 text-[#0A1E4B]" />
              <span>+ de <span className="font-bold text-[#0A1E4B]">12.500</span> contratos já analisados</span>
            </div>

            <div className="flex flex-col sm:flex-row gap-4 pt-4 order-5 lg:order-4 w-full sm:w-auto">
              <Button size="lg" className="w-full sm:w-auto bg-[#00C853] hover:bg-[#00A844] text-white text-base md:text-lg px-8 py-6 font-bold uppercase tracking-wide shadow-lg hover:shadow-xl transition-all" onClick={() => navigate("/consultas")}>
                QUERO BLINDAR MEU CONTRATO
                <ArrowRight className="ml-2 h-5 w-5" />
              </Button>
            </div>
          </div>

          {/* Right Content - Padlock Image - Hidden on mobile */}
          <div className="relative flex justify-center order-1 lg:order-2 hidden lg:flex">
            <div className="relative z-10">
              <img
                alt="Blindagem de contrato"
                src={heroPadlockV2}
                className="w-[500px] lg:w-[600px] xl:w-[700px] drop-shadow-2xl"
              />
            </div>
          </div>
        </div>
      </div>
    </section>

    {/* Infinite Scroll Banner */}
    <InfiniteScrollBanner />

    {/* Contract Types Section */}
    <section className="bg-muted/30 py-16 md:py-20">
      <div className="container mx-auto px-4">
        <div className="text-center mb-12">
          <h2 className="text-3xl md:text-4xl font-bold text-foreground mb-4">
            Qual tipo de contrato você quer blindar?
          </h2>
          <p className="text-lg text-muted-foreground max-w-2xl mx-auto">
            Nosso Autenticador Jurídico é treinado em nichos específicos do direito para garantir precisão máxima na detecção de irregularidades.
          </p>
        </div>

        <div className="grid md:grid-cols-2 lg:grid-cols-4 gap-6 max-w-6xl mx-auto">
          {/* Aluguel & Imobiliário */}
          <Card className="group cursor-pointer hover:shadow-xl transition-all duration-300 hover:border-primary/50" onClick={() => navigate('/scan-gratis?type=aluguel')}>
            <CardContent className="p-6">
              <div className="p-3 bg-primary/10 rounded-lg w-fit mb-4 group-hover:bg-primary/20 transition-colors">
                <Home className="h-6 w-6 text-primary" />
              </div>
              <h3 className="text-lg font-bold text-foreground mb-2">Aluguel & Imobiliário</h3>
              <p className="text-sm text-muted-foreground mb-4">
                Identifique cláusulas de despejo, reajuste de IGP-M e multas abusivas.
              </p>
              <div className="flex items-center text-primary font-medium text-sm group-hover:gap-2 transition-all">
                <span>Auditar Aluguel</span>
                <ChevronRight className="h-4 w-4 ml-1" />
              </div>
            </CardContent>
          </Card>

          {/* Financiamento Bancário */}
          <Card className="group cursor-pointer hover:shadow-xl transition-all duration-300 hover:border-primary/50" onClick={() => navigate('/scan-gratis?type=veiculo')}>
            <CardContent className="p-6">
              <div className="p-3 bg-primary/10 rounded-lg w-fit mb-4 group-hover:bg-primary/20 transition-colors">
                <Landmark className="h-6 w-6 text-primary" />
              </div>
              <h3 className="text-lg font-bold text-foreground mb-2">Financiamento Bancário</h3>
              <p className="text-sm text-muted-foreground mb-4">
                Análise de juros compostos, tabela price e venda casada em contratos bancários.
              </p>
              <div className="flex items-center text-primary font-medium text-sm group-hover:gap-2 transition-all">
                <span>Revisar Juros</span>
                <ChevronRight className="h-4 w-4 ml-1" />
              </div>
            </CardContent>
          </Card>

          {/* Prestação de Serviços */}
          <Card className="group cursor-pointer hover:shadow-xl transition-all duration-300 hover:border-primary/50" onClick={() => navigate('/scan-gratis?type=servicos')}>
            <CardContent className="p-6">
              <div className="p-3 bg-primary/10 rounded-lg w-fit mb-4 group-hover:bg-primary/20 transition-colors">
                <FileSearch className="h-6 w-6 text-primary" />
              </div>
              <h3 className="text-lg font-bold text-foreground mb-2">Prestação de Serviços</h3>
              <p className="text-sm text-muted-foreground mb-4">
                Blindagem para PJ. Verifique riscos trabalhistas e cláusulas de rescisão.
              </p>
              <div className="flex items-center text-primary font-medium text-sm group-hover:gap-2 transition-all">
                <span>Analisar Serviço</span>
                <ChevronRight className="h-4 w-4 ml-1" />
              </div>
            </CardContent>
          </Card>

          {/* Empréstimos & Consignado */}
          <Card className="group cursor-pointer hover:shadow-xl transition-all duration-300 hover:border-primary/50" onClick={() => navigate('/scan-gratis?type=emprestimo')}>
            <CardContent className="p-6">
              <div className="p-3 bg-primary/10 rounded-lg w-fit mb-4 group-hover:bg-primary/20 transition-colors">
                <Banknote className="h-6 w-6 text-primary" />
              </div>
              <h3 className="text-lg font-bold text-foreground mb-2">Empréstimos & Consignado</h3>
              <p className="text-sm text-muted-foreground mb-4">
                Verificação de taxas ocultas e Custo Efetivo Total (CET) acima do permitido.
              </p>
              <div className="flex items-center text-primary font-medium text-sm group-hover:gap-2 transition-all">
                <span>Calcular Risco</span>
                <ChevronRight className="h-4 w-4 ml-1" />
              </div>
            </CardContent>
          </Card>
        </div>

        <div className="text-center mt-10">
          <p className="text-muted-foreground mb-3">Não achou seu tipo de contrato?</p>
          <Button variant="link" className="text-primary font-medium" onClick={() => navigate('/consultas')}>
            Ver lista completa de auditorias disponíveis
            <ArrowRight className="ml-2 h-4 w-4" />
          </Button>
        </div>
      </div>
    </section>

    {/* Service Grid Section */}


    {/* Stats Section */}
    <section className="bg-primary text-primary-foreground py-16">
      <div className="container mx-auto px-4">
        <div className="grid grid-cols-2 md:grid-cols-4 gap-8">
          {stats.map((stat, index) => <div key={index} className="text-center">
            <div className="text-4xl md:text-5xl font-bold mb-2">{stat.value}</div>
            <div className="text-sm md:text-base text-primary-foreground/80">{stat.label}</div>
          </div>)}
        </div>
      </div>
    </section>

    {/* Features Section */}
    <section id="features" className="container mx-auto px-4 py-20">
      <div className="max-w-6xl mx-auto">
        <div className="text-center mb-16">
          <h2 className="text-3xl md:text-4xl font-bold text-foreground mb-4">
            Tecnologia Forense de Ponta
          </h2>
          <p className="text-lg text-muted-foreground max-w-2xl mx-auto">
            Utilizamos nosso Autenticador Jurídico e bases de dados jurídicas para garantir análises precisas
          </p>
        </div>
        <div className="grid md:grid-cols-2 gap-8">
          {features.map((feature, index) => <Card key={index} className="shadow-lg hover:shadow-xl transition-shadow border-border">
            <CardContent className="p-8">
              <div className="p-3 bg-primary/10 rounded-lg w-fit mb-4">
                <feature.icon className="h-8 w-8 text-primary" />
              </div>
              <h3 className="text-xl font-semibold text-foreground mb-3">{feature.title}</h3>
              <p className="text-muted-foreground">{feature.description}</p>
            </CardContent>
          </Card>)}
        </div>
      </div>
    </section>

    {/* Pricing Section */}
    <section id="pricing" className="bg-muted/30 py-20">
      <div className="container mx-auto px-4">
        <div className="max-w-6xl mx-auto">
          <div className="text-center mb-16">
            <h2 className="text-3xl md:text-4xl font-bold text-foreground mb-4">
              Planos Transparentes
            </h2>
            <p className="text-lg text-muted-foreground">
              Escolha o plano ideal para seu volume de análises
            </p>
          </div>
          <div className="grid md:grid-cols-3 gap-8">
            {plans.map((plan, index) => <Card key={index} className={`shadow - lg hover: shadow - xl transition - all ${plan.highlighted ? "border-2 border-primary scale-105" : ""} `}>
              {plan.highlighted && <div className="bg-primary text-primary-foreground text-center py-2 text-sm font-medium rounded-t-lg">
                Mais Popular
              </div>}
              <CardContent className="p-8">
                <h3 className="text-2xl font-bold text-foreground mb-2">{plan.name}</h3>
                <div className="mb-6">
                  <div className="text-4xl font-bold text-primary">{plan.price}</div>
                  <div className="text-sm text-muted-foreground mt-1">{plan.credits}</div>
                </div>
                <ul className="space-y-3 mb-8">
                  {plan.features.map((feature, i) => <li key={i} className="flex items-start gap-2">
                    <Check className="h-5 w-5 text-success flex-shrink-0 mt-0.5" />
                    <span className="text-sm text-muted-foreground">{feature}</span>
                  </li>)}
                </ul>
                <Button className="w-full" variant={plan.highlighted ? "default" : "outline"} onClick={() => {
                  if (isAuthenticated) {
                    // Usuário autenticado: vai para dashboard (pode comprar créditos lá)
                    navigate("/dashboard");
                  } else {
                    // Novo usuário: vai direto para checkout com dados do plano
                    navigate("/checkout", {
                      state: {
                        plan: {
                          id: plan.id,
                          name: plan.name,
                          price: plan.priceNumeric,
                          priceFormatted: plan.price,
                          credits: plan.creditsNumeric
                        },
                        isNewUser: true
                      }
                    });
                  }
                }}>
                  Começar Agora
                </Button>
              </CardContent>
            </Card>)}
          </div>
        </div>
      </div>
    </section>

    {/* CTA Section */}
    <section className="container mx-auto px-4 py-20">
      <Card className="bg-primary text-primary-foreground shadow-2xl">
        <CardContent className="p-12 text-center">
          <h2 className="text-3xl md:text-4xl font-bold mb-4">
            Proteja seus Direitos Hoje
          </h2>
          <p className="text-lg text-primary-foreground/90 mb-8 max-w-2xl mx-auto">
            Milhares de brasileiros já economizaram milhões identificando cláusulas abusivas.
            Não deixe dinheiro na mesa.
          </p>
          <Button size="lg" variant="secondary" className="text-lg px-8 py-6" onClick={() => navigate("/auth")}>
            Iniciar Análise Gratuita
          </Button>
        </CardContent>
      </Card>
    </section>

    {/* Footer */}
    <Footer />
  </div>;
};
export default Landing;