import { useState, useEffect } from "react";
import { useNavigate } from "react-router-dom";
import { Button } from "@/components/ui/button";
import { Card } from "@/components/ui/card";
import { Slider } from "@/components/ui/slider";
import { 
  Shield, 
  CheckCircle2, 
  Star, 
  Users, 
  Clock, 
  FileText, 
  Lock, 
  ChevronDown,
  ChevronUp,
  AlertTriangle,
  BadgeCheck,
  MessageCircle,
  Calculator,
  Zap
} from "lucide-react";
import { Helmet } from "react-helmet";

const ContratoBlindado = () => {
  const navigate = useNavigate();
  const [activeUsers, setActiveUsers] = useState(23);
  const [contractValue, setContractValue] = useState([70000]);
  const [timeLeft, setTimeLeft] = useState({ hours: 1, minutes: 47, seconds: 22 });
  const [spotsLeft, setSpotsLeft] = useState(3);
  const [openFaq, setOpenFaq] = useState<number | null>(null);

  // Animated counter for active users
  useEffect(() => {
    const interval = setInterval(() => {
      setActiveUsers(Math.floor(Math.random() * (32 - 18 + 1)) + 18);
    }, 5000);
    return () => clearInterval(interval);
  }, []);

  // Countdown timer
  useEffect(() => {
    const timer = setInterval(() => {
      setTimeLeft(prev => {
        if (prev.seconds > 0) {
          return { ...prev, seconds: prev.seconds - 1 };
        } else if (prev.minutes > 0) {
          return { ...prev, minutes: prev.minutes - 1, seconds: 59 };
        } else if (prev.hours > 0) {
          return { hours: prev.hours - 1, minutes: 59, seconds: 59 };
        }
        return { hours: 1, minutes: 47, seconds: 22 }; // Reset
      });
    }, 1000);
    return () => clearInterval(timer);
  }, []);

  const estimatedSavings = Math.round(contractValue[0] * 0.08);
  const maxSavings = Math.round(contractValue[0] * 0.15);

  const handleCTA = () => {
    navigate("/consultas");
  };

  const testimonials = [
    {
      name: "João F.",
      savings: "R$ 8.743,00",
      type: "financiamento imobiliário",
      quote: "Não acredito… vocês acharam tudo isso no meu contrato?? Obrigado!!"
    },
    {
      name: "Mariana R.",
      savings: "R$ 32.900,00",
      type: "contrato de consórcio",
      quote: "Só com essa análise eu economizei quase 5 mil. Valeu demais!"
    },
    {
      name: "Carlos A.",
      clauses: "12 cláusulas abusivas",
      type: "contrato de aluguel",
      quote: "Vocês salvaram meu negócio. Muito obrigado pela análise detalhada!"
    }
  ];

  const faqs = [
    {
      question: "E se não encontrarem nada de errado?",
      answer: "Devolvemos 100% + R$ 20. Simples assim."
    },
    {
      question: "Quanto tempo demora?",
      answer: "10 segundos para análise inicial. PDF automático na hora."
    },
    {
      question: "Vocês ajudam a reverter as cláusulas?",
      answer: "Sim. Entregamos modelo de notificação e suporte jurídico (upgrade opcional)."
    },
    {
      question: "Meus dados estão seguros?",
      answer: "Sim. LGPD + criptografia + SSL."
    },
    {
      question: "Que tipos de contrato vocês analisam?",
      answer: "Financiamento de veículo, financiamento imobiliário, aluguel, consórcio, prestação de serviço, compra e venda, aditivos contratuais e outros."
    }
  ];

  return (
    <>
      <Helmet>
        <title>Auditoria de Contrato - Descubra Cláusulas Abusivas | JusContratos</title>
        <meta name="description" content="Descubra em 10 segundos se seu contrato tem cláusulas abusivas. 73% dos contratos auditados possuem irregularidades. Auditoria por apenas R$ 49." />
      </Helmet>

      <div className="min-h-screen bg-background">
        {/* Urgency Bar */}
        <div className="bg-destructive text-destructive-foreground py-2 px-4 text-center text-sm font-medium">
          <span className="animate-pulse">🔥</span> Promoção válida por 48h: de <span className="line-through">R$ 97</span> por <span className="font-bold">R$ 49</span> — Faltam apenas {spotsLeft} vagas hoje
        </div>

        {/* Hero Section */}
        <section className="relative py-16 md:py-24 px-4 bg-gradient-to-b from-primary/5 to-background">
          <div className="container mx-auto max-w-5xl text-center">
            {/* Social Proof Badge */}
            <div className="inline-flex items-center gap-2 bg-warning/10 text-warning-foreground px-4 py-2 rounded-full mb-6">
              <div className="flex">
                {[...Array(5)].map((_, i) => (
                  <Star key={i} className="w-4 h-4 fill-warning text-warning" />
                ))}
              </div>
              <span className="text-sm font-medium">4.9/5 baseado em 1.327 auditorias</span>
            </div>

            {/* Headline */}
            <h1 className="text-3xl md:text-5xl lg:text-6xl font-bold text-foreground mb-6 leading-tight">
              Descubra em <span className="text-primary">10 segundos</span> se você está sendo enganado no seu contrato.
            </h1>

            {/* Subheadline */}
            <p className="text-lg md:text-xl text-muted-foreground mb-4 max-w-3xl mx-auto">
              <span className="font-semibold text-destructive">73% dos contratos auditados</span> possuem cláusulas abusivas que fazem você perder dinheiro.
            </p>
            <p className="text-lg md:text-xl text-foreground font-medium mb-8">
              Já identificamos <span className="text-success font-bold">R$ 842.300,00</span> em prejuízos evitados para nossos clientes.
            </p>

            {/* Live Counter */}
            <div className="inline-flex items-center gap-2 bg-success/10 text-success px-4 py-2 rounded-full mb-8 animate-pulse">
              <Users className="w-4 h-4" />
              <span className="text-sm font-medium">{activeUsers} pessoas auditando agora</span>
            </div>

            {/* Main CTA */}
            <div className="flex flex-col items-center gap-4">
              <Button 
                size="lg" 
                onClick={handleCTA}
                className="text-lg px-8 py-6 h-auto bg-primary hover:bg-primary/90 shadow-lg hover:shadow-xl transition-all transform hover:scale-105"
              >
                <Shield className="w-5 h-5 mr-2" />
                Auditar Meu Contrato Agora — R$ 49
              </Button>
              
              {/* Guarantee Badge */}
              <div className="flex items-center gap-2 text-sm text-muted-foreground">
                <BadgeCheck className="w-4 h-4 text-success" />
                <span><strong>Garantia Total:</strong> se não encontrarmos nada, devolvemos 100% + R$ 20.</span>
              </div>
            </div>
          </div>
        </section>

        {/* Social Proof Section */}
        <section className="py-16 px-4 bg-muted/30">
          <div className="container mx-auto max-w-5xl">
            <h2 className="text-2xl md:text-3xl font-bold text-center mb-4">
              Casos Reais de Economia
            </h2>
            <p className="text-center text-muted-foreground mb-12">
              Mais de <span className="font-bold text-foreground">1.300 contratos</span> auditados com sucesso
            </p>

            {/* Testimonial Cards */}
            <div className="grid md:grid-cols-3 gap-6 mb-12">
              {testimonials.map((t, i) => (
                <Card key={i} className="p-6 bg-card border-border/50 hover:shadow-lg transition-shadow">
                  <div className="flex items-center gap-2 mb-4">
                    <div className="w-10 h-10 rounded-full bg-primary/10 flex items-center justify-center">
                      <span className="font-bold text-primary">{t.name.charAt(0)}</span>
                    </div>
                    <div>
                      <p className="font-semibold text-foreground">{t.name}</p>
                      <p className="text-xs text-muted-foreground">{t.type}</p>
                    </div>
                  </div>
                  {t.savings && (
                    <p className="text-success font-bold text-xl mb-2">
                      Economizou {t.savings}
                    </p>
                  )}
                  {t.clauses && (
                    <p className="text-destructive font-bold text-xl mb-2">
                      Corrigiu {t.clauses}
                    </p>
                  )}
                </Card>
              ))}
            </div>

            {/* WhatsApp Style Testimonials */}
            <div className="grid md:grid-cols-2 gap-4 max-w-3xl mx-auto">
              {testimonials.slice(0, 2).map((t, i) => (
                <div key={i} className="bg-[#dcf8c6] dark:bg-[#005c4b] rounded-lg p-4 relative">
                  <MessageCircle className="w-4 h-4 absolute top-2 right-2 text-muted-foreground/50" />
                  <p className="text-sm text-foreground italic">"{t.quote}"</p>
                  <p className="text-xs text-muted-foreground mt-2 text-right">— {t.name}</p>
                </div>
              ))}
            </div>
          </div>
        </section>

        {/* Calculator Section */}
        <section className="py-16 px-4 bg-background">
          <div className="container mx-auto max-w-3xl">
            <div className="text-center mb-8">
              <Calculator className="w-12 h-12 mx-auto text-primary mb-4" />
              <h2 className="text-2xl md:text-3xl font-bold mb-2">
                Calculadora de Economia Estimada
              </h2>
              <p className="text-muted-foreground">
                Descubra quanto você pode estar perdendo
              </p>
            </div>

            <Card className="p-8 bg-card">
              <div className="mb-8">
                <label className="block text-sm font-medium mb-4">
                  Valor do seu contrato: <span className="text-primary font-bold">R$ {contractValue[0].toLocaleString('pt-BR')}</span>
                </label>
                <Slider
                  value={contractValue}
                  onValueChange={setContractValue}
                  min={10000}
                  max={500000}
                  step={5000}
                  className="w-full"
                />
                <div className="flex justify-between text-xs text-muted-foreground mt-2">
                  <span>R$ 10.000</span>
                  <span>R$ 500.000</span>
                </div>
              </div>

              <div className="bg-success/10 rounded-lg p-6 text-center">
                <p className="text-sm text-muted-foreground mb-2">Economia estimada:</p>
                <p className="text-3xl md:text-4xl font-bold text-success">
                  R$ {estimatedSavings.toLocaleString('pt-BR')} a R$ {maxSavings.toLocaleString('pt-BR')}
                </p>
                <p className="text-xs text-muted-foreground mt-2">(8% a 15% do valor do contrato)</p>
              </div>

              <Button 
                onClick={handleCTA}
                className="w-full mt-6"
                size="lg"
              >
                Quero saber quanto eu posso economizar
              </Button>
            </Card>
          </div>
        </section>

        {/* Authority Section */}
        <section className="py-16 px-4 bg-primary/5">
          <div className="container mx-auto max-w-4xl">
            <h2 className="text-2xl md:text-3xl font-bold text-center mb-4">
              Por que 73% dos contratos têm erro?
            </h2>
            <p className="text-center text-muted-foreground mb-12">
              Nosso sistema identifica automaticamente mais de <span className="font-bold text-foreground">318 irregularidades</span> possíveis
            </p>

            <div className="grid md:grid-cols-2 gap-4">
              {[
                "Bancos colocam taxas escondidas",
                "Juros calculados fora da norma",
                "Multas abusivas",
                "Cláusulas que prendem você ilegalmente",
                "Termos que violam Código de Defesa do Consumidor",
                "Cobranças não autorizadas embutidas"
              ].map((item, i) => (
                <div key={i} className="flex items-center gap-3 bg-card p-4 rounded-lg border border-border/50">
                  <AlertTriangle className="w-5 h-5 text-destructive flex-shrink-0" />
                  <span className="text-foreground">{item}</span>
                </div>
              ))}
            </div>
          </div>
        </section>

        {/* Offer Section */}
        <section className="py-16 px-4 bg-background">
          <div className="container mx-auto max-w-3xl">
            <h2 className="text-2xl md:text-3xl font-bold text-center mb-12">
              O que você recebe por <span className="text-primary">R$ 49</span>
            </h2>

            <Card className="p-8 bg-card border-2 border-primary/20">
              <div className="space-y-4">
                {[
                  { icon: Zap, text: "Auditoria completa em 10 segundos" },
                  { icon: FileText, text: "Laudo PDF detalhado" },
                  { icon: CheckCircle2, text: "Lista de cláusulas irregulares" },
                  { icon: FileText, text: "Modelo de notificação extrajudicial (brinde)" },
                  { icon: CheckCircle2, text: "Orientação de como reverter" },
                  { icon: Users, text: "Suporte humano se necessário (upgrade)" }
                ].map((item, i) => (
                  <div key={i} className="flex items-center gap-3">
                    <div className="w-8 h-8 rounded-full bg-success/10 flex items-center justify-center">
                      <item.icon className="w-4 h-4 text-success" />
                    </div>
                    <span className="text-foreground">{item.text}</span>
                  </div>
                ))}
              </div>

              <Button 
                onClick={handleCTA}
                size="lg"
                className="w-full mt-8 text-lg py-6 h-auto"
              >
                <Shield className="w-5 h-5 mr-2" />
                Auditar Agora — R$ 49
              </Button>
            </Card>
          </div>
        </section>

        {/* Urgency Section */}
        <section className="py-12 px-4 bg-destructive/10">
          <div className="container mx-auto max-w-3xl text-center">
            <div className="inline-flex items-center gap-2 mb-6">
              <Clock className="w-6 h-6 text-destructive" />
              <span className="text-lg font-semibold text-foreground">Oferta por tempo limitado</span>
            </div>

            <div className="flex justify-center gap-4 mb-6">
              {[
                { value: timeLeft.hours.toString().padStart(2, '0'), label: 'Horas' },
                { value: timeLeft.minutes.toString().padStart(2, '0'), label: 'Min' },
                { value: timeLeft.seconds.toString().padStart(2, '0'), label: 'Seg' }
              ].map((t, i) => (
                <div key={i} className="bg-card rounded-lg p-4 min-w-[80px]">
                  <p className="text-3xl font-bold text-primary">{t.value}</p>
                  <p className="text-xs text-muted-foreground">{t.label}</p>
                </div>
              ))}
            </div>

            <p className="text-sm text-muted-foreground">
              De <span className="line-through">R$ 97</span> por apenas <span className="font-bold text-foreground">R$ 49</span>
            </p>
          </div>
        </section>

        {/* Guarantee Section */}
        <section className="py-16 px-4 bg-success/5">
          <div className="container mx-auto max-w-3xl text-center">
            <div className="w-20 h-20 mx-auto mb-6 rounded-full bg-success/10 flex items-center justify-center">
              <Shield className="w-10 h-10 text-success" />
            </div>
            
            <h2 className="text-2xl md:text-3xl font-bold mb-4">
              Garantia Antifraude™
            </h2>
            
            <Card className="p-8 bg-card border-2 border-success/30">
              <p className="text-lg text-foreground mb-4">
                Se o sistema não encontrar <strong>nenhuma irregularidade</strong>:
              </p>
              <p className="text-3xl font-bold text-success mb-4">
                Devolvemos 100% + R$ 20
              </p>
              <p className="text-muted-foreground">
                Sem burocracia. Sem pegadinha.
              </p>
            </Card>
          </div>
        </section>

        {/* FAQ Section */}
        <section className="py-16 px-4 bg-background">
          <div className="container mx-auto max-w-3xl">
            <h2 className="text-2xl md:text-3xl font-bold text-center mb-12">
              Perguntas Frequentes
            </h2>

            <div className="space-y-4">
              {faqs.map((faq, i) => (
                <Card 
                  key={i} 
                  className="overflow-hidden cursor-pointer"
                  onClick={() => setOpenFaq(openFaq === i ? null : i)}
                >
                  <div className="p-4 flex items-center justify-between">
                    <span className="font-medium text-foreground">{faq.question}</span>
                    {openFaq === i ? (
                      <ChevronUp className="w-5 h-5 text-muted-foreground" />
                    ) : (
                      <ChevronDown className="w-5 h-5 text-muted-foreground" />
                    )}
                  </div>
                  {openFaq === i && (
                    <div className="px-4 pb-4 text-muted-foreground border-t border-border pt-4">
                      {faq.answer}
                    </div>
                  )}
                </Card>
              ))}
            </div>
          </div>
        </section>

        {/* Final CTA Section */}
        <section className="py-20 px-4 bg-gradient-to-b from-primary/10 to-primary/5">
          <div className="container mx-auto max-w-3xl text-center">
            <h2 className="text-2xl md:text-4xl font-bold mb-6">
              Descubra agora se você está perdendo dinheiro.
            </h2>
            
            <Button 
              onClick={handleCTA}
              size="lg"
              className="text-lg px-10 py-6 h-auto bg-primary hover:bg-primary/90 shadow-xl hover:shadow-2xl transition-all transform hover:scale-105"
            >
              <Shield className="w-5 h-5 mr-2" />
              Auditar Meu Contrato — R$ 49
            </Button>

            <div className="mt-6 flex flex-col md:flex-row items-center justify-center gap-4 text-sm text-muted-foreground">
              <div className="flex items-center gap-2">
                <Lock className="w-4 h-4" />
                <span>Dados protegidos por SSL</span>
              </div>
              <div className="flex items-center gap-2">
                <BadgeCheck className="w-4 h-4" />
                <span>Garantia de devolução</span>
              </div>
            </div>
          </div>
        </section>

        {/* Footer */}
        <footer className="py-8 px-4 bg-muted/50 border-t border-border">
          <div className="container mx-auto max-w-5xl text-center text-sm text-muted-foreground">
            <p>© {new Date().getFullYear()} JusContratos. Todos os direitos reservados.</p>
            <p className="mt-2">CNPJ: 00.000.000/0001-00</p>
          </div>
        </footer>
      </div>
    </>
  );
};

export default ContratoBlindado;
