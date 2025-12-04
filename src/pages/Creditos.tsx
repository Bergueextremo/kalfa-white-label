import { Layout } from "@/components/Layout";
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { Wallet, Zap, Shield, Check } from "lucide-react";
import { Badge } from "@/components/ui/badge";
import { useCredits } from "@/contexts/CreditContext";
import { CheckoutModal } from "@/components/CheckoutModal";
import { useState } from "react";

const Creditos = () => {
  const { credits } = useCredits();
  const [showCheckout, setShowCheckout] = useState(false);

  const planos = [
    {
      nome: "Start",
      creditos: 10,
      preco: "R$ 97,00",
      descricao: "Pessoa física",
      features: ["10 análises completas", "Suporte por email", "Laudos em PDF"],
    },
    {
      nome: "Essencial",
      creditos: 50,
      preco: "R$ 324,00",
      descricao: "Corretor/Despachante",
      features: [
        "50 análises completas",
        "Suporte prioritário",
        "Laudos personalizados",
        "Acesso multi-dispositivo",
      ],
      destaque: true,
    },
    {
      nome: "Enterprise",
      creditos: "Ilimitado",
      preco: "R$ 997,00",
      descricao: "Escritório advocacia",
      features: [
        "Análises Ilimitadas",
        "Gerente de conta dedicado",
        "API de integração",
        "Integrações customizadas",
        "SLA garantido",
      ],
    },
  ];

  return (
    <Layout>
      <div className="space-y-8">
        <div>
          <h1 className="text-3xl font-bold text-foreground">Carteira de Créditos</h1>
          <p className="text-muted-foreground mt-1">
            Gerencie seus créditos de análise e adquira novos pacotes
          </p>
        </div>

        {/* Saldo Atual */}
        <Card className="shadow-lg border-2 border-primary">
          <CardContent className="pt-6">
            <div className="flex flex-col md:flex-row items-center justify-between gap-4">
              <div className="flex items-center gap-4">
                <div className="p-4 bg-primary/10 rounded-full">
                  <Wallet className="h-8 w-8 text-primary" />
                </div>
                <div>
                  <p className="text-sm text-muted-foreground">Saldo Disponível</p>
                  <p className="text-4xl font-bold text-foreground">{credits} créditos</p>
                </div>
              </div>
              <Button size="lg" onClick={() => setShowCheckout(true)}>
                <Zap className="h-5 w-5 mr-2" />
                Comprar Mais Créditos
              </Button>
            </div>
          </CardContent>
        </Card>

        <CheckoutModal open={showCheckout} onOpenChange={setShowCheckout} />

        {/* Planos */}
        <div>
          <h2 className="text-2xl font-bold text-foreground mb-6">Planos Disponíveis</h2>
          <div className="grid md:grid-cols-3 gap-6">
            {planos.map((plano) => (
              <Card
                key={plano.nome}
                className={`shadow-md hover:shadow-xl transition-all relative ${plano.destaque ? "border-2 border-primary scale-105" : ""
                  }`}
              >
                {plano.destaque && (
                  <div className="absolute -top-3 left-1/2 -translate-x-1/2">
                    <Badge className="bg-primary text-primary-foreground px-4 py-1">
                      Mais Popular
                    </Badge>
                  </div>
                )}
                <CardHeader>
                  <CardTitle className="text-2xl">{plano.nome}</CardTitle>
                  <CardDescription>{plano.descricao}</CardDescription>
                </CardHeader>
                <CardContent className="space-y-6">
                  <div className="text-center py-4">
                    <p className="text-4xl font-bold text-primary">{plano.preco}</p>
                    <p className="text-sm text-muted-foreground mt-2">
                      {plano.creditos} créditos de análise
                    </p>
                  </div>

                  <ul className="space-y-3">
                    {plano.features.map((feature, index) => (
                      <li key={index} className="flex items-start gap-2">
                        <Check className="h-5 w-5 text-success flex-shrink-0 mt-0.5" />
                        <span className="text-sm text-muted-foreground">{feature}</span>
                      </li>
                    ))}
                  </ul>

                  <Button className="w-full" variant={plano.destaque ? "default" : "outline"} onClick={() => setShowCheckout(true)}>
                    Adquirir Plano
                  </Button>
                </CardContent>
              </Card>
            ))}
          </div>
        </div>

        {/* Informações Adicionais */}
        <Card className="bg-muted/50">
          <CardContent className="pt-6">
            <div className="flex items-start gap-4">
              <Shield className="h-6 w-6 text-primary flex-shrink-0 mt-1" />
              <div>
                <h3 className="font-semibold text-foreground mb-2">Garantia de Qualidade</h3>
                <p className="text-sm text-muted-foreground">
                  Caso não fique satisfeito com alguma análise, devolvemos o crédito utilizado.
                  Créditos não expiram e podem ser utilizados quando você precisar.
                </p>
              </div>
            </div>
          </CardContent>
        </Card>
      </div>
    </Layout>
  );
};

export default Creditos;
