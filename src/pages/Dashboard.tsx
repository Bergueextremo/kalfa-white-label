import { useEffect, useState } from "react";
import { Layout } from "@/components/Layout";
import { Card, CardContent, CardHeader, CardTitle } from "@/components/ui/card";
import { FileText, TrendingDown, AlertTriangle, Activity, Loader2, Calendar } from "lucide-react";
import { Badge } from "@/components/ui/badge";
import { supabase } from "@/lib/supabase";
import { useAuth } from "@/contexts/AuthContext";
import {
  Select,
  SelectContent,
  SelectItem,
  SelectTrigger,
  SelectValue,
} from "@/components/ui/select";
import { OnboardingTour } from "@/components/OnboardingTour";

const Dashboard = () => {
  const { user } = useAuth();
  const [loading, setLoading] = useState(true);
  const [period, setPeriod] = useState("30");
  const [stats, setStats] = useState({
    totalAudits: 0,
    totalSavings: 0,
    avgRisk: 0
  });
  const [recentActivities, setRecentActivities] = useState<any[]>([]);

  useEffect(() => {
    if (user) {
      fetchDashboardData();
    }
  }, [user, period]);

  const fetchDashboardData = async () => {
    setLoading(true);
    try {
      let query = supabase
        .from('auditorias_contratos')
        .select('*')
        .eq('user_id', user!.id)
        .order('created_at', { ascending: false });

      if (period !== "all") {
        const days = parseInt(period);
        const date = new Date();
        date.setDate(date.getDate() - days);
        query = query.gte('created_at', date.toISOString());
      }

      const { data: audits, error } = await query;

      if (error) throw error;

      if (audits) {
        // Calculate Stats
        const totalAudits = audits.length;
        const totalSavings = audits.reduce((acc, curr) => acc + (curr.potential_savings || 0), 0);
        const totalScore = audits.reduce((acc, curr) => acc + (curr.score_vantagem || 0), 0);

        // Score is now 0-100 from the backend.
        const avgScore = totalAudits > 0 ? (totalScore / totalAudits) : 0;

        setStats({
          totalAudits,
          totalSavings,
          avgRisk: Math.round(avgScore)
        });

        // Map Recent Activities
        const recent = audits.slice(0, 5).map(audit => ({
          id: audit.id,
          contract: audit.contract_type || "Contrato não identificado",
          date: new Date(audit.created_at).toLocaleDateString('pt-BR'),
          risk: getRiskLabel(audit.score_vantagem || 0),
          amount: new Intl.NumberFormat('pt-BR', { style: 'currency', currency: 'BRL' }).format(audit.potential_savings || 0)
        }));
        setRecentActivities(recent);
      }
    } catch (error) {
      console.error("Erro ao carregar dashboard:", error);
    } finally {
      setLoading(false);
    }
  };

  const getRiskLabel = (score: number) => {
    // Score 0-10. Higher score = Better for user = Lower Risk?
    // Wait, prompt said "Score de Risco (0 a 10): Baseado na gravidade...".
    // Usually High Score = High Risk in this context?
    // Let's check ScoreCard logic:
    // score >= 61 -> Risco Alto (Red)
    // score >= 31 -> Risco Médio (Yellow)
    // else -> Risco Baixo (Green)
    // And we mapped 0-10 to 0-100.
    const normalizedScore = score <= 10 ? score * 10 : score;

    if (normalizedScore >= 60) return "Alto";
    if (normalizedScore >= 30) return "Médio";
    return "Baixo";
  };

  const getRiskColor = (risk: string) => {
    switch (risk) {
      case "Alto": return "destructive";
      case "Médio": return "warning"; // Ensure this variant exists or use default/secondary
      case "Baixo": return "success"; // Ensure this variant exists
      default: return "secondary";
    }
  };

  const statCards = [
    {
      title: "Contratos Analisados",
      value: stats.totalAudits.toString(),
      icon: FileText,
      description: "Total de auditorias",
      color: "text-primary",
    },
    {
      title: "Economia Identificada",
      value: new Intl.NumberFormat('pt-BR', { style: 'currency', currency: 'BRL' }).format(stats.totalSavings),
      icon: TrendingDown,
      description: "Potencial de recuperação",
      color: "text-emerald-600",
    },
    {
      title: "Nível de Risco Médio",
      value: `${stats.avgRisk}%`,
      icon: AlertTriangle,
      description: "Média de risco dos contratos",
      color: "text-amber-500",
    },
  ];

  return (
    <Layout>
      <div className="space-y-6">
        {/* Header */}
        <div className="flex flex-col md:flex-row md:items-center justify-between gap-4">
          <div>
            <h1 className="text-3xl font-bold text-foreground">
              Olá, {user?.name?.split(' ')[0] || 'Visitante'}! 👋
            </h1>
            <p className="text-muted-foreground mt-1">
              Bem-vindo de volta. Acompanhe a visão geral das suas auditorias.
            </p>
          </div>

          <div className="flex items-center gap-2">
            <Select value={period} onValueChange={setPeriod}>
              <SelectTrigger className="w-[180px]">
                <Calendar className="w-4 h-4 mr-2" />
                <SelectValue placeholder="Selecione o período" />
              </SelectTrigger>
              <SelectContent>
                <SelectItem value="7">Últimos 7 dias</SelectItem>
                <SelectItem value="30">Últimos 30 dias</SelectItem>
                <SelectItem value="90">Últimos 90 dias</SelectItem>
                <SelectItem value="all">Todo o período</SelectItem>
              </SelectContent>
            </Select>
          </div>
        </div>

        {loading ? (
          <div className="flex justify-center py-12">
            <Loader2 className="h-8 w-8 animate-spin text-primary" />
          </div>
        ) : (
          <>
            {/* Stats Cards */}
            <div className="grid gap-6 md:grid-cols-3">
              {statCards.map((stat) => (
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
                  {recentActivities.length === 0 ? (
                    <p className="text-center text-muted-foreground py-4">Nenhuma atividade recente neste período.</p>
                  ) : (
                    recentActivities.map((activity, index) => (
                      <div
                        key={index}
                        className="flex items-center justify-between p-4 border border-border rounded-lg hover:bg-muted/50 transition-colors"
                      >
                        <div className="flex-1">
                          <h4 className="font-medium text-foreground">{activity.contract}</h4>
                          <p className="text-sm text-muted-foreground mt-1">{activity.date}</p>
                        </div>
                        <div className="flex items-center gap-4">
                          <div className="text-right hidden sm:block">
                            <p className="font-semibold text-foreground">{activity.amount}</p>
                            <p className="text-xs text-muted-foreground">Economia potencial</p>
                          </div>
                          <Badge variant={getRiskColor(activity.risk) as any}>
                            {activity.risk}
                          </Badge>
                        </div>
                      </div>
                    ))
                  )}
                </div>
              </CardContent>
            </Card>
          </>
        )}
      </div>
      <OnboardingTour />
    </Layout>
  );
};

export default Dashboard;
