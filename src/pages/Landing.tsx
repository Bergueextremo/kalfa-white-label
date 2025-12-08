import { Button } from "@/components/ui/button";
import { Card, CardContent } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { Scale, Shield, TrendingDown, FileText, Zap, Check, ArrowRight, Users } from "lucide-react";
import { useNavigate } from "react-router-dom";
import { useAuth } from "@/contexts/AuthContext";
import { Footer } from "@/components/Footer";
import { ServiceGrid } from "@/components/ServiceGrid";
import heroPadlock from "@/assets/hero-padlock.png";
const Landing = () => {
  const navigate = useNavigate();
  const {
    isAuthenticated
  } = useAuth();
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
              <Scale className="h-8 w-8 text-primary" />
              <span className="text-2xl font-bold text-foreground">JusContratos</span>
            </div>
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
          </div>
        </div>
      </header>

      {/* Hero Section */}
      <section className="relative overflow-hidden bg-gradient-to-br from-background via-background to-muted/30 py-16 md:py-24">
        <div className="container mx-auto px-4">
          <div className="grid lg:grid-cols-2 gap-12 items-center">
            {/* Left Content */}
            <div className="space-y-6 text-left">
              <h1 className="text-4xl md:text-5xl lg:text-6xl font-extrabold text-foreground leading-tight">
                BLINDE SEU{" "}
                <span className="text-primary block">CONTRATO</span>
              </h1>
              <p className="text-lg md:text-xl text-muted-foreground max-w-lg">
                Não arrisque seu dinheiro com{" "}
                <span className="font-semibold text-foreground">cláusulas abusivas e juros ilegais!</span>
              </p>
              <div className="flex flex-col sm:flex-row gap-4 pt-4">
                <Button size="lg" className="text-lg px-8 py-6 font-bold shadow-lg hover:shadow-xl transition-all" onClick={() => navigate(isAuthenticated ? "/dashboard" : "/auth")}>
                  QUERO BLINDAR MEU CONTRATO
                  <ArrowRight className="ml-2 h-5 w-5" />
                </Button>
              </div>
              <div className="flex items-center gap-2 text-sm text-muted-foreground pt-2">
                <Users className="h-4 w-4 text-primary" />
                <span>+ de <span className="font-semibold text-foreground">12.500</span> contratos já analisados</span>
              </div>
            </div>

            {/* Right Content - Padlock Image with Rings */}
            <div className="relative flex justify-center lg:justify-end">
              {/* Decorative Rings */}
              <div className="absolute inset-0 flex items-center justify-center">
                <div className="w-[400px] h-[400px] md:w-[500px] md:h-[500px] rounded-full border-[12px] border-primary/30 animate-pulse" />
              </div>
              <div className="absolute inset-0 flex items-center justify-center">
                <div className="w-[340px] h-[340px] md:w-[420px] md:h-[420px] rounded-full border-[8px] border-primary/50" />
              </div>
              
              {/* Padlock Image */}
              <div className="relative z-10">
                <img alt="Proteção jurídica garantida" src="/lovable-uploads/af8c88ce-339b-4f07-bf03-fb81d37c2b79.png" className="w-[300px] md:w-[400px] lg:w-[450px] drop-shadow-2xl border-8" />
              </div>

              {/* Floating Benefits Card */}
              <div className="absolute left-0 lg:-left-8 top-1/2 -translate-y-1/2 z-20 bg-slate-700/95 backdrop-blur-sm rounded-xl p-5 shadow-2xl max-w-[200px] hidden md:block">
                <div className="space-y-3 text-sm">
                  <div className="flex items-center gap-2">
                    <span className="text-primary font-bold">+</span>
                    <span className="text-primary font-semibold">Proteção</span>
                  </div>
                  <div className="text-white font-bold">Análise Forense</div>
                  <div className="flex items-center gap-2">
                    <span className="text-primary font-bold">+</span>
                    <span className="text-primary font-semibold">Precisão</span>
                  </div>
                  <div className="text-white">E suporte</div>
                  <div className="text-primary font-bold">Especializado</div>
                </div>
              </div>
            </div>
          </div>
        </div>
        
        {/* Bottom accent bar */}
        <div className="absolute bottom-0 left-0 right-0 h-1 bg-gradient-to-r from-primary via-primary to-primary/50" />
      </section>

      {/* Service Grid Section */}
      <ServiceGrid />

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
              {plans.map((plan, index) => <Card key={index} className={`shadow-lg hover:shadow-xl transition-all ${plan.highlighted ? "border-2 border-primary scale-105" : ""}`}>
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