import { Layout } from "@/components/Layout";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { FileText, TrendingDown, AlertTriangle, Activity } from "lucide-react";
import { Badge } from "@/components/ui/badge";

const Dashboard = () => {
  const stats = [
    {
      title: "Contratos Analisados",
      value: "47",
      icon: FileText,
      description: "Total de auditorias",
      color: "text-primary",
    },
    {
      title: "Economia Identificada",
      value: "R$ 127.450",
      icon: TrendingDown,
      description: "Potencial de recuperação",
      color: "text-success",
    },
    {
      title: "Nível de Risco Médio",
      value: "62%",
      icon: AlertTriangle,
      description: "Contratos com irregularidades",
      color: "text-warning",
    },
  ];

  const recentActivities = [
    {
      contract: "Contrato de Financiamento - Banco XYZ",
      date: "15/11/2025",
      risk: "Alto",
      amount: "R$ 45.200",
    },
    {
      contract: "Acordo de Locação - Imóvel Comercial",
      date: "14/11/2025",
      risk: "Médio",
      amount: "R$ 8.500",
    },
    {
      contract: "Cartão de Crédito - Operadora ABC",
      date: "13/11/2025",
      risk: "Baixo",
      amount: "R$ 1.200",
    },
  ];

  const getRiskColor = (risk: string) => {
    switch (risk) {
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
        {/* Header */}
        <div>
          <h1 className="text-3xl font-bold text-foreground">Visão Geral</h1>
          <p className="text-muted-foreground mt-1">
            Acompanhe suas auditorias e identificações de irregularidades
          </p>
        </div>

        {/* Stats Cards */}
        <div className="grid gap-6 md:grid-cols-3">
          {stats.map((stat) => (
            <Card key={stat.title} className="shadow-md hover:shadow-lg transition-shadow">
              <CardHeader className="flex flex-row items-center justify-between pb-2">
                <CardTitle className="text-sm font-medium text-muted-foreground">
                  {stat.title}
                </CardTitle>
                <stat.icon className={`h-5 w-5 ${stat.color}`} />
              </CardHeader>
              <CardContent>
                <div className="text-3xl font-bold text-foreground">{stat.value}</div>
                <p className="text-xs text-muted-foreground mt-2">
                  {stat.description}
                </p>
              </CardContent>
            </Card>
          ))}
        </div>

        {/* Recent Activity */}
        <Card className="shadow-md">
          <CardHeader>
            <div className="flex items-center gap-2">
              <Activity className="h-5 w-5 text-primary" />
              <CardTitle>Atividades Recentes</CardTitle>
            </div>
          </CardHeader>
          <CardContent>
            <div className="space-y-4">
              {recentActivities.map((activity, index) => (
                <div
                  key={index}
                  className="flex items-center justify-between p-4 border border-border rounded-lg hover:bg-muted/50 transition-colors"
                >
                  <div className="flex-1">
                    <h4 className="font-medium text-foreground">{activity.contract}</h4>
                    <p className="text-sm text-muted-foreground mt-1">{activity.date}</p>
                  </div>
                  <div className="flex items-center gap-4">
                    <div className="text-right">
                      <p className="font-semibold text-foreground">{activity.amount}</p>
                      <p className="text-xs text-muted-foreground">Economia potencial</p>
                    </div>
                    <Badge variant={getRiskColor(activity.risk) as any}>
                      {activity.risk}
                    </Badge>
                  </div>
                </div>
              ))}
            </div>
          </CardContent>
        </Card>
      </div>
    </Layout>
  );
};

export default Dashboard;
