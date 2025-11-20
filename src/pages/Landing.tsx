import { Button } from "@/components/ui/button";
import { Card, CardContent } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { Scale, Shield, TrendingDown, FileText, Zap, Check, ArrowRight } from "lucide-react";
import { useNavigate } from "react-router-dom";
import { useAuth } from "@/contexts/AuthContext";

const Landing = () => {
  const navigate = useNavigate();
  const { isAuthenticated } = useAuth();

  const features = [
    {
      icon: Shield,
      title: "Análise Forense Completa",
      description: "Varredura técnica baseada em jurisprudência do STF e dados do Banco Central",
    },
    {
      icon: TrendingDown,
      title: "Identificação de Juros Abusivos",
      description: "Cálculo preciso de taxas ilegais e economia potencial em contratos",
    },
    {
      icon: FileText,
      title: "Laudos Fundamentados",
      description: "Documentação técnica completa com base legal para contestação judicial",
    },
    {
      icon: Zap,
      title: "Resultados em 10 Segundos",
      description: "Processamento OCR e análise automática com relatórios instantâneos",
    },
  ];

  const stats = [
    { value: "R$ 45M+", label: "Recuperados para clientes" },
    { value: "12.500+", label: "Contratos analisados" },
    { value: "87%", label: "Taxa de detecção" },
    { value: "4.8/5", label: "Avaliação média" },
  ];

  const plans = [
    {
      name: "Starter",
      price: "R$ 149,90",
      credits: "10 análises",
      features: ["Laudos em PDF", "Suporte por email", "Acesso 24/7"],
    },
    {
      name: "Professional",
      price: "R$ 399,90",
      credits: "30 análises",
      features: ["Laudos personalizados", "Suporte prioritário", "API de integração", "Consultoria jurídica"],
      highlighted: true,
    },
    {
      name: "Enterprise",
      price: "R$ 1.199,90",
      credits: "100 análises",
      features: ["Gerente dedicado", "Integrações customizadas", "SLA garantido", "Treinamento incluído"],
    },
  ];

  return (
    <div className="min-h-screen bg-background">
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
              <a href="#pricing" className="text-sm font-medium text-muted-foreground hover:text-foreground transition-colors">
                Preços
              </a>
              <Button
                variant="outline"
                onClick={() => navigate(isAuthenticated ? "/dashboard" : "/auth")}
              >
                {isAuthenticated ? "Dashboard" : "Entrar"}
              </Button>
              {!isAuthenticated && (
                <Button onClick={() => navigate("/auth")}>
                  Começar Gratuitamente
                </Button>
              )}
            </nav>
          </div>
        </div>
      </header>

      {/* Hero Section */}
      <section className="container mx-auto px-4 py-20 md:py-32">
        <div className="max-w-4xl mx-auto text-center space-y-8">
          <Badge variant="outline" className="text-sm px-4 py-2">
            <Shield className="h-4 w-4 mr-2 inline" />
            Certificado pela OAB e validado por juristas
          </Badge>
          <h1 className="text-4xl md:text-6xl font-bold text-foreground leading-tight">
            Detecte Cláusulas Abusivas e Juros Ilegais em{" "}
            <span className="text-primary">Segundos</span>
          </h1>
          <p className="text-xl text-muted-foreground max-w-2xl mx-auto">
            Plataforma de auditoria forense que analisa contratos financeiros identificando irregularidades
            com base em jurisprudência do STF e normas do Banco Central
          </p>
          <div className="flex flex-col sm:flex-row gap-4 justify-center">
            <Button size="lg" className="text-lg px-8 py-6" onClick={() => navigate("/auth")}>
              Analisar Primeiro Contrato
              <ArrowRight className="ml-2 h-5 w-5" />
            </Button>
            <Button size="lg" variant="outline" className="text-lg px-8 py-6">
              Ver Demonstração
            </Button>
          </div>
        </div>
      </section>

      {/* Stats Section */}
      <section className="bg-primary text-primary-foreground py-16">
        <div className="container mx-auto px-4">
          <div className="grid grid-cols-2 md:grid-cols-4 gap-8">
            {stats.map((stat, index) => (
              <div key={index} className="text-center">
                <div className="text-4xl md:text-5xl font-bold mb-2">{stat.value}</div>
                <div className="text-sm md:text-base text-primary-foreground/80">{stat.label}</div>
              </div>
            ))}
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
              Utilizamos inteligência artificial e bases de dados jurídicas para garantir análises precisas
            </p>
          </div>
          <div className="grid md:grid-cols-2 gap-8">
            {features.map((feature, index) => (
              <Card key={index} className="shadow-lg hover:shadow-xl transition-shadow border-border">
                <CardContent className="p-8">
                  <div className="p-3 bg-primary/10 rounded-lg w-fit mb-4">
                    <feature.icon className="h-8 w-8 text-primary" />
                  </div>
                  <h3 className="text-xl font-semibold text-foreground mb-3">{feature.title}</h3>
                  <p className="text-muted-foreground">{feature.description}</p>
                </CardContent>
              </Card>
            ))}
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
              {plans.map((plan, index) => (
                <Card
                  key={index}
                  className={`shadow-lg hover:shadow-xl transition-all ${
                    plan.highlighted ? "border-2 border-primary scale-105" : ""
                  }`}
                >
                  {plan.highlighted && (
                    <div className="bg-primary text-primary-foreground text-center py-2 text-sm font-medium rounded-t-lg">
                      Mais Popular
                    </div>
                  )}
                  <CardContent className="p-8">
                    <h3 className="text-2xl font-bold text-foreground mb-2">{plan.name}</h3>
                    <div className="mb-6">
                      <div className="text-4xl font-bold text-primary">{plan.price}</div>
                      <div className="text-sm text-muted-foreground mt-1">{plan.credits}</div>
                    </div>
                    <ul className="space-y-3 mb-8">
                      {plan.features.map((feature, i) => (
                        <li key={i} className="flex items-start gap-2">
                          <Check className="h-5 w-5 text-success flex-shrink-0 mt-0.5" />
                          <span className="text-sm text-muted-foreground">{feature}</span>
                        </li>
                      ))}
                    </ul>
                    <Button className="w-full" variant={plan.highlighted ? "default" : "outline"}>
                      Começar Agora
                    </Button>
                  </CardContent>
                </Card>
              ))}
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
      <footer className="border-t border-border bg-card/50 py-12">
        <div className="container mx-auto px-4">
          <div className="grid md:grid-cols-4 gap-8">
            <div>
              <div className="flex items-center gap-2 mb-4">
                <Scale className="h-6 w-6 text-primary" />
                <span className="text-lg font-bold">JusContratos</span>
              </div>
              <p className="text-sm text-muted-foreground">
                Auditoria jurídica e financeira forense de contratos
              </p>
            </div>
            <div>
              <h4 className="font-semibold mb-4">Produto</h4>
              <ul className="space-y-2 text-sm text-muted-foreground">
                <li><a href="#features" className="hover:text-foreground transition-colors">Recursos</a></li>
                <li><a href="#pricing" className="hover:text-foreground transition-colors">Preços</a></li>
                <li><a href="#" className="hover:text-foreground transition-colors">API</a></li>
              </ul>
            </div>
            <div>
              <h4 className="font-semibold mb-4">Empresa</h4>
              <ul className="space-y-2 text-sm text-muted-foreground">
                <li><a href="#" className="hover:text-foreground transition-colors">Sobre</a></li>
                <li><a href="#" className="hover:text-foreground transition-colors">Blog</a></li>
                <li><a href="#" className="hover:text-foreground transition-colors">Carreiras</a></li>
              </ul>
            </div>
            <div>
              <h4 className="font-semibold mb-4">Legal</h4>
              <ul className="space-y-2 text-sm text-muted-foreground">
                <li><a href="#" className="hover:text-foreground transition-colors">Privacidade</a></li>
                <li><a href="#" className="hover:text-foreground transition-colors">Termos</a></li>
                <li><a href="#" className="hover:text-foreground transition-colors">Segurança</a></li>
              </ul>
            </div>
          </div>
          <div className="border-t border-border mt-8 pt-8 text-center text-sm text-muted-foreground">
            © 2025 JusContratos. Todos os direitos reservados.
          </div>
        </div>
      </footer>
    </div>
  );
};

export default Landing;
