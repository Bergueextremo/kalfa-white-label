import { Layout } from "@/components/Layout";
import { Card, CardContent } from "@/components/ui/card";
import { Badge } from "@/components/ui/badge";
import { Button } from "@/components/ui/button";
import { FileText, Download, Eye } from "lucide-react";
import { useNavigate } from "react-router-dom";

const Relatorios = () => {
  const navigate = useNavigate();

  const relatorios = [
    {
      id: 1,
      titulo: "Contrato de Financiamento - Banco XYZ",
      data: "15/11/2025",
      risco: "Alto",
      status: "Concluído",
    },
    {
      id: 2,
      titulo: "Acordo de Locação - Imóvel Comercial",
      data: "14/11/2025",
      risco: "Médio",
      status: "Concluído",
    },
    {
      id: 3,
      titulo: "Cartão de Crédito - Operadora ABC",
      data: "13/11/2025",
      risco: "Baixo",
      status: "Concluído",
    },
  ];

  const getRiscoColor = (risco: string) => {
    switch (risco) {
      case "Alto":
        return "danger";
      case "Médio":
        return "warning";
      case "Baixo":
        return "success";
      default:
        return "secondary";
    }
  };

  return (
    <Layout>
      <div className="space-y-6">
        <div>
          <h1 className="text-3xl font-bold text-foreground">Meus Relatórios</h1>
          <p className="text-muted-foreground mt-1">
            Acesse o histórico completo de suas auditorias
          </p>
        </div>

        <div className="space-y-4">
          {relatorios.map((relatorio) => (
            <Card key={relatorio.id} className="shadow-md hover:shadow-lg transition-shadow">
              <CardContent className="p-6">
                <div className="flex items-center justify-between gap-4">
                  <div className="flex items-start gap-4 flex-1">
                    <div className="p-3 bg-primary/10 rounded-lg">
                      <FileText className="h-6 w-6 text-primary" />
                    </div>
                    <div className="flex-1">
                      <h3 className="font-semibold text-foreground text-lg">
                        {relatorio.titulo}
                      </h3>
                      <p className="text-sm text-muted-foreground mt-1">
                        Analisado em {relatorio.data}
                      </p>
                      <div className="flex gap-2 mt-3">
                        <Badge variant={getRiscoColor(relatorio.risco) as any}>
                          Risco {relatorio.risco}
                        </Badge>
                        <Badge variant="outline">{relatorio.status}</Badge>
                      </div>
                    </div>
                  </div>
                  <div className="flex gap-2">
                    <Button
                      variant="outline"
                      size="sm"
                      onClick={() => navigate(`/resultado/${relatorio.id}`)}
                    >
                      <Eye className="h-4 w-4 mr-2" />
                      Ver Laudo
                    </Button>
                    <Button variant="outline" size="sm">
                      <Download className="h-4 w-4" />
                    </Button>
                  </div>
                </div>
              </CardContent>
            </Card>
          ))}
        </div>
      </div>
    </Layout>
  );
};

export default Relatorios;
