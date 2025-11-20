import { Layout } from "@/components/Layout";
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { Button } from "@/components/ui/button";
import { Accordion, AccordionContent, AccordionItem, AccordionTrigger } from "@/components/ui/accordion";
import { AlertCircle, TrendingDown, Scale, Download, Share2 } from "lucide-react";
import { Progress } from "@/components/ui/progress";

const Resultado = () => {
  const riskLevel = 78;
  const valorCobrado = "R$ 125.400,00";
  const valorLegal = "R$ 98.200,00";
  const economia = "R$ 27.200,00";

  const clausulasAbusivas = [
    {
      titulo: "Juros acima da média de mercado",
      gravidade: "Alta",
      detalhes:
        "A taxa de juros aplicada (4,2% a.m.) está 85% acima da taxa média SELIC para financiamentos imobiliários no período. De acordo com a Resolução BCB nº 4.549/2017, taxas que excedem 60% da média do mercado são consideradas abusivas.",
      fundamentacao: "CDC Art. 51, IV - Cláusulas abusivas",
    },
    {
      titulo: "Capitalização mensal de juros (anatocismo)",
      gravidade: "Alta",
      detalhes:
        "Identificada cobrança de juros sobre juros com capitalização mensal, prática vedada pela Súmula 121 do STF, exceto para contratos específicos autorizados por lei especial.",
      fundamentacao: "Súmula 121 STF",
    },
    {
      titulo: "Multa moratória desproporcional",
      gravidade: "Média",
      detalhes:
        "A multa moratória de 8% ultrapassa o limite legal estabelecido pelo CDC de 2% sobre o valor da prestação em atraso.",
      fundamentacao: "CDC Art. 52, § 1º",
    },
    {
      titulo: "Seguro prestamista sem cotação prévia",
      gravidade: "Média",
      detalhes:
        "O contrato vincula obrigatoriamente a contratação de seguro prestamista sem apresentação de cotações alternativas, caracterizando venda casada.",
      fundamentacao: "CDC Art. 39, I - Vedação à venda casada",
    },
  ];

  const getGravidadeColor = (gravidade: string) => {
    return gravidade === "Alta" ? "danger" : "warning";
  };

  return (
    <Layout>
      <div className="max-w-5xl mx-auto space-y-6">
        {/* Header */}
        <div className="flex items-start justify-between">
          <div>
            <h1 className="text-3xl font-bold text-foreground">Laudo Forense - Contrato #001</h1>
            <p className="text-muted-foreground mt-1">
              Análise completa realizada em 15/11/2025 às 14:32
            </p>
          </div>
          <div className="flex gap-2">
            <Button variant="outline" size="sm">
              <Download className="h-4 w-4 mr-2" />
              Exportar PDF
            </Button>
            <Button variant="outline" size="sm">
              <Share2 className="h-4 w-4 mr-2" />
              Compartilhar
            </Button>
          </div>
        </div>

        {/* Risk Gauge */}
        <Card className="shadow-lg border-2 border-danger/30">
          <CardHeader>
            <div className="flex items-center gap-2">
              <AlertCircle className="h-6 w-6 text-danger" />
              <CardTitle>Nível de Risco Detectado</CardTitle>
            </div>
          </CardHeader>
          <CardContent>
            <div className="space-y-4">
              <div className="flex items-center justify-between">
                <span className="text-sm font-medium">Análise de Conformidade</span>
                <Badge variant="danger" className="text-base px-4 py-1">
                  {riskLevel}% - Risco Alto
                </Badge>
              </div>
              <Progress value={riskLevel} className="h-4" />
              <p className="text-sm text-muted-foreground">
                Este contrato apresenta múltiplas irregularidades graves que podem ser contestadas
                judicialmente. Recomenda-se consulta jurídica imediata.
              </p>
            </div>
          </CardContent>
        </Card>

        {/* Diagnóstico Financeiro */}
        <Card className="shadow-md">
          <CardHeader>
            <div className="flex items-center gap-2">
              <TrendingDown className="h-5 w-5 text-success" />
              <CardTitle>Diagnóstico Financeiro</CardTitle>
            </div>
            <CardDescription>Comparativo entre valores cobrados e valores legais</CardDescription>
          </CardHeader>
          <CardContent>
            <div className="grid md:grid-cols-3 gap-6">
              <div className="text-center p-4 bg-muted/50 rounded-lg">
                <p className="text-sm text-muted-foreground mb-2">Valor Total Cobrado</p>
                <p className="text-2xl font-bold text-danger">{valorCobrado}</p>
              </div>
              <div className="text-center p-4 bg-muted/50 rounded-lg">
                <p className="text-sm text-muted-foreground mb-2">Valor Legal Calculado</p>
                <p className="text-2xl font-bold text-success">{valorLegal}</p>
              </div>
              <div className="text-center p-4 bg-success/10 border-2 border-success rounded-lg">
                <p className="text-sm text-muted-foreground mb-2">Economia Potencial</p>
                <p className="text-2xl font-bold text-success">{economia}</p>
              </div>
            </div>
          </CardContent>
        </Card>

        {/* Cláusulas Abusivas */}
        <Card className="shadow-md">
          <CardHeader>
            <div className="flex items-center gap-2">
              <Scale className="h-5 w-5 text-primary" />
              <CardTitle>Cláusulas Abusivas Detectadas</CardTitle>
            </div>
            <CardDescription>
              {clausulasAbusivas.length} irregularidades identificadas no contrato
            </CardDescription>
          </CardHeader>
          <CardContent>
            <Accordion type="single" collapsible className="space-y-2">
              {clausulasAbusivas.map((clausula, index) => (
                <AccordionItem
                  key={index}
                  value={`item-${index}`}
                  className="border border-border rounded-lg px-4"
                >
                  <AccordionTrigger className="hover:no-underline">
                    <div className="flex items-center justify-between w-full pr-4">
                      <span className="font-medium text-left">{clausula.titulo}</span>
                      <Badge variant={getGravidadeColor(clausula.gravidade) as any}>
                        {clausula.gravidade}
                      </Badge>
                    </div>
                  </AccordionTrigger>
                  <AccordionContent className="pt-4 pb-2">
                    <div className="space-y-3 text-sm">
                      <div>
                        <p className="font-medium text-foreground mb-1">Detalhamento:</p>
                        <p className="text-muted-foreground">{clausula.detalhes}</p>
                      </div>
                      <div className="p-3 bg-primary/5 border-l-4 border-primary rounded">
                        <p className="font-medium text-primary mb-1">Fundamentação Legal:</p>
                        <p className="text-muted-foreground">{clausula.fundamentacao}</p>
                      </div>
                    </div>
                  </AccordionContent>
                </AccordionItem>
              ))}
            </Accordion>
          </CardContent>
        </Card>

        {/* CTA */}
        <Card className="bg-primary text-primary-foreground shadow-lg">
          <CardContent className="pt-6">
            <div className="text-center space-y-4">
              <h3 className="text-2xl font-bold">Precisa de Suporte Jurídico?</h3>
              <p className="text-primary-foreground/90">
                Nossa equipe de advogados especializados pode auxiliar na contestação das cláusulas
                identificadas
              </p>
              <Button variant="secondary" size="lg" className="mt-4">
                Agendar Consulta Gratuita
              </Button>
            </div>
          </CardContent>
        </Card>
      </div>
    </Layout>
  );
};

export default Resultado;
