import { useState, useEffect } from "react";
import { Scale, Shield, ArrowLeft, Building2, User, LockKeyhole, CheckCircle2 } from "lucide-react";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { Tabs, TabsContent, TabsList, TabsTrigger } from "@/components/ui/tabs";
import { useNavigate, useLocation } from "react-router-dom";
import { useAuth } from "@/contexts/AuthContext";
import { toast } from "sonner";
import { z } from "zod";
import { cn } from "@/lib/utils";
import logoJusContratos from "@/assets/logo-juscontratos.png";

// Schemas de Validação
const loginSchema = z.object({
  email: z.string().trim().email({ message: "E-mail inválido" }),
  password: z.string().min(6, { message: "Mínimo 6 caracteres" }),
});

const signupSchema = z.object({
  name: z.string().trim().min(2, { message: "Nome muito curto" }),
  email: z.string().trim().email({ message: "E-mail inválido" }),
  password: z.string().min(6, { message: "Mínimo 6 caracteres" }),
  document: z.string().optional(),
});

type UserType = "PF" | "PJ";

const AuthPage = () => {
  const navigate = useNavigate();
  const location = useLocation();
  const { login, signup, isAuthenticated } = useAuth();
  const [isLoading, setIsLoading] = useState(false);
  const [errors, setErrors] = useState<Record<string, string>>({});

  // Estado para controlar o tipo de usuário (Segmentação B2B)
  const [userType, setUserType] = useState<UserType>("PF");

  // NOVO: Estado para dados vindos do pagamento
  const [emailFromPayment, setEmailFromPayment] = useState<string>("");
  const [planFromPayment, setPlanFromPayment] = useState<string>("");
  const [paymentConfirmed, setPaymentConfirmed] = useState(false);
  const [activeTab, setActiveTab] = useState<"login" | "signup">("login");

  // NOVO: Detectar parâmetros da URL (vindo do checkout)
  useEffect(() => {
    const params = new URLSearchParams(location.search);
    const email = params.get('email');
    const plan = params.get('plan');
    const confirmed = params.get('payment_confirmed');

    if (email && plan && confirmed === 'true') {
      console.log('Pagamento confirmado detectado:', { email, plan });
      setEmailFromPayment(email);
      setPlanFromPayment(plan);
      setPaymentConfirmed(true);
      setActiveTab("signup"); // Força tab de cadastro
    }
  }, [location.search]);

  if (isAuthenticated) {
    navigate("/dashboard");
    return null;
  }

  const handleLogin = async (e: React.FormEvent<HTMLFormElement>) => {
    e.preventDefault();
    setErrors({});
    const formData = new FormData(e.currentTarget);

    try {
      const data = {
        email: formData.get("email") as string,
        password: formData.get("password") as string,
      };

      loginSchema.parse(data);
      setIsLoading(true);

      await login(data.email, data.password);
      toast.success("Acesso autorizado com sucesso.");
    } catch (error) {
      if (error instanceof z.ZodError) {
        const fieldErrors: Record<string, string> = {};
        error.errors.forEach((err) => { if (err.path[0]) fieldErrors[err.path[0] as string] = err.message; });
        setErrors(fieldErrors);
      } else {
        toast.error("Credenciais inválidas ou erro no servidor.");
      }
    } finally {
      setIsLoading(false);
    }
  };

  const handleSignup = async (e: React.FormEvent<HTMLFormElement>) => {
    e.preventDefault();
    setErrors({});
    const formData = new FormData(e.currentTarget);

    try {
      const data = {
        name: formData.get("name") as string,
        email: formData.get("signup-email") as string,
        password: formData.get("signup-password") as string,
      };

      signupSchema.parse(data);
      setIsLoading(true);

      await signup(data.name, data.email, data.password);

      toast.success(userType === 'PJ' ? "Ambiente corporativo criado com sucesso." : "Conta criada com sucesso.");
    } catch (error) {
      if (error instanceof z.ZodError) {
        const fieldErrors: Record<string, string> = {};
        error.errors.forEach((err) => { if (err.path[0]) fieldErrors[err.path[0] as string] = err.message; });
        setErrors(fieldErrors);
      } else {
        toast.error("Erro ao criar conta.");
      }
    } finally {
      setIsLoading(false);
    }
  };

  return (
    <div className="min-h-screen w-full flex bg-white font-sans">

      {/* COLUNA ESQUERDA - INSTITUCIONAL (Imagem) */}
      <div className="hidden lg:flex lg:w-1/2 relative bg-slate-900 text-white overflow-hidden">
        {/* Imagem de Fundo Abstrata/Corporativa */}
        <div
          className="absolute inset-0 bg-cover bg-center opacity-40 mix-blend-overlay"
          style={{ backgroundImage: 'url("https://images.unsplash.com/photo-1497366216548-37526070297c?q=80&w=2301&auto=format&fit=crop")' }}
        />
        <div className="absolute inset-0 bg-gradient-to-t from-slate-900 via-slate-900/80 to-slate-900/40" />

        <div className="relative z-10 flex flex-col justify-between p-12 w-full h-full">
          <div className="flex items-center gap-3">
            <div className="bg-white/10 p-2 rounded-lg backdrop-blur-sm border border-white/20">
              <img src={logoJusContratos} alt="JusContratos" className="h-6 w-auto brightness-0 invert" />
            </div>
          </div>

          <div className="space-y-6 max-w-lg">
            {/* Fonte alterada para sans-serif bold */}
            <h1 className="text-4xl md:text-5xl font-bold leading-tight">
              Segurança Jurídica com Precisão Forense.
            </h1>
            <p className="text-slate-300 text-lg leading-relaxed font-medium">
              Junte-se a escritórios de advocacia e departamentos jurídicos que utilizam nosso Autenticador Jurídico para blindar contratos e recuperar ativos financeiros.
            </p>

            <div className="flex gap-4 pt-4">
              <div className="flex items-center gap-2 text-sm font-medium text-slate-300 bg-white/5 px-3 py-1.5 rounded-full border border-white/10">
                <CheckCircle2 className="h-4 w-4 text-emerald-400" />
                <span>Auditoria em Segundos</span>
              </div>
              <div className="flex items-center gap-2 text-sm font-medium text-slate-300 bg-white/5 px-3 py-1.5 rounded-full border border-white/10">
                <CheckCircle2 className="h-4 w-4 text-emerald-400" />
                <span>Compliance Bacen/STJ</span>
              </div>
            </div>
          </div>

          <div className="text-xs text-slate-500 font-medium">
            © 2024 JusContratos Enterprise. Todos os direitos reservados.
          </div>
        </div>
      </div>

      {/* COLUNA DIREITA - FORMULÁRIO */}
      <div className="flex-1 flex flex-col relative bg-white">
        {/* Header Mobile */}
        <div className="lg:hidden p-6 flex items-center gap-2">
          <img src={logoJusContratos} alt="JusContratos" className="h-8 w-auto" />
        </div>

        {/* Botão Voltar */}
        <div className="absolute top-6 right-6 lg:top-8 lg:right-8">
          <Button
            variant="ghost"
            onClick={() => navigate("/")}
            className="text-slate-500 hover:text-slate-900 hover:bg-slate-50"
          >
            <ArrowLeft className="h-4 w-4 mr-2" />
            Voltar ao site
          </Button>
        </div>

        <div className="flex-1 flex items-center justify-center p-6 lg:p-12">
          <div className="w-full max-w-[420px] space-y-8">

            {/* Cabeçalho do Form */}
            <div className="space-y-2 text-center lg:text-left">
              {/* Fonte alterada para sans-serif bold */}
              <h2 className="text-3xl font-bold text-slate-900 tracking-tight">
                Acesso ao Painel
              </h2>
              <p className="text-slate-500">
                Gerencie suas auditorias e documentos blindados.
              </p>
            </div>

            <Tabs value={activeTab} onValueChange={(v) => setActiveTab(v as "login" | "signup")} className="w-full">
              <TabsList className="grid w-full grid-cols-2 mb-8 bg-slate-100 p-1">
                <TabsTrigger value="login" className="data-[state=active]:bg-white data-[state=active]:shadow-sm font-medium">Login</TabsTrigger>
                <TabsTrigger value="signup" className="data-[state=active]:bg-white data-[state=active]:shadow-sm font-medium">Nova Conta</TabsTrigger>
              </TabsList>

              <TabsContent value="login" className="space-y-6 animate-in fade-in-50 slide-in-from-bottom-2">
                <form onSubmit={handleLogin} className="space-y-4">
                  <div className="space-y-2">
                    <Label htmlFor="email">E-mail Corporativo ou Pessoal</Label>
                    <Input
                      id="email"
                      name="email"
                      type="email"
                      placeholder="nome@exemplo.com"
                      className="bg-slate-50 border-slate-200 focus:bg-white transition-all h-11"
                      required
                    />
                    {errors.email && <p className="text-sm text-red-500">{errors.email}</p>}
                  </div>

                  <div className="space-y-2">
                    <div className="flex items-center justify-between">
                      <Label htmlFor="password">Senha</Label>
                      <a href="#" className="text-xs text-blue-700 hover:underline font-medium">Esqueceu a senha?</a>
                    </div>
                    <Input
                      id="password"
                      name="password"
                      type="password"
                      placeholder="••••••••"
                      className="bg-slate-50 border-slate-200 focus:bg-white transition-all h-11"
                      required
                    />
                  </div>

                  <Button type="submit" className="w-full h-11 bg-slate-900 hover:bg-slate-800 text-white font-medium" disabled={isLoading}>
                    {isLoading ? "Autenticando..." : "Acessar Plataforma"}
                  </Button>
                </form>
              </TabsContent>

              <TabsContent value="signup" className="space-y-6 animate-in fade-in-50 slide-in-from-bottom-2">
                {/* SELETOR DE TIPO DE CONTA (B2B vs B2C) */}
                <div className="grid grid-cols-2 gap-3 mb-6">
                  <div
                    onClick={() => setUserType("PF")}
                    className={cn(
                      "cursor-pointer rounded-lg border p-3 flex flex-col items-center justify-center gap-2 transition-all hover:bg-slate-50",
                      userType === "PF" ? "border-blue-600 bg-blue-50/50 text-blue-700 ring-1 ring-blue-600" : "border-slate-200 text-slate-500"
                    )}
                  >
                    <User className="h-5 w-5" />
                    <span className="text-xs font-semibold">Para Você</span>
                  </div>
                  <div
                    onClick={() => setUserType("PJ")}
                    className={cn(
                      "cursor-pointer rounded-lg border p-3 flex flex-col items-center justify-center gap-2 transition-all hover:bg-slate-50",
                      userType === "PJ" ? "border-blue-600 bg-blue-50/50 text-blue-700 ring-1 ring-blue-600" : "border-slate-200 text-slate-500"
                    )}
                  >
                    <Building2 className="h-5 w-5" />
                    <span className="text-xs font-semibold">Escritórios/Empresas</span>
                  </div>
                </div>

                <form onSubmit={handleSignup} className="space-y-4">
                  <div className="space-y-2">
                    <Label htmlFor="name">
                      {userType === "PJ" ? "Nome do Escritório / Empresa" : "Nome Completo"}
                    </Label>
                    <Input
                      id="name"
                      name="name"
                      type="text"
                      placeholder={userType === "PJ" ? "Ex: Silva & Souza Advogados" : "Seu nome"}
                      className="bg-slate-50 border-slate-200 focus:bg-white transition-all h-11"
                      required
                    />
                    {errors.name && <p className="text-sm text-red-500">{errors.name}</p>}
                  </div>

                  <div className="space-y-2">
                    <Label htmlFor="signup-email">E-mail Profissional</Label>
                    {emailFromPayment ? (
                      <>
                        {/* Campo visível (readonly) */}
                        <Input
                          id="signup-email-display"
                          type="email"
                          value={emailFromPayment}
                          className="bg-slate-100 border-slate-300 text-slate-700 h-11"
                          readOnly
                          disabled
                        />
                        {/* Campo hidden que será enviado no form */}
                        <input
                          type="hidden"
                          id="signup-email"
                          name="signup-email"
                          value={emailFromPayment}
                        />
                        <p className="text-xs text-emerald-600 flex items-center gap-1">
                          <CheckCircle2 className="h-3 w-3" />
                          E-mail vinculado ao pagamento confirmado
                        </p>
                      </>
                    ) : (
                      <Input
                        id="signup-email"
                        name="signup-email"
                        type="email"
                        placeholder="contato@empresa.com"
                        className="bg-slate-50 border-slate-200 focus:bg-white transition-all h-11"
                        required
                      />
                    )}
                    {errors.email && <p className="text-sm text-red-500">{errors.email}</p>}
                  </div>

                  <div className="space-y-2">
                    <Label htmlFor="signup-password">Criar Senha</Label>
                    <Input
                      id="signup-password"
                      name="signup-password"
                      type="password"
                      placeholder="Mínimo 6 caracteres"
                      className="bg-slate-50 border-slate-200 focus:bg-white transition-all h-11"
                      required
                    />
                  </div>

                  <Button type="submit" className="w-full h-11 bg-slate-900 hover:bg-slate-800 text-white font-medium" disabled={isLoading}>
                    {isLoading ? "Criando ambiente..." : (userType === "PJ" ? "Criar Conta Empresarial" : "Criar Conta Pessoal")}
                  </Button>
                </form>
              </TabsContent>
            </Tabs>

            {/* Footer de Segurança */}
            <div className="pt-6 border-t border-slate-100">
              <div className="flex items-center justify-center gap-6 text-slate-400">
                <div className="flex items-center gap-1.5" title="Conexão Segura">
                  <LockKeyhole className="h-3.5 w-3.5" />
                  <span className="text-[10px] font-medium uppercase tracking-wider">SSL Secured</span>
                </div>
                <div className="flex items-center gap-1.5" title="Em conformidade com a LGPD">
                  <Shield className="h-3.5 w-3.5" />
                  <span className="text-[10px] font-medium uppercase tracking-wider">LGPD Compliant</span>
                </div>
              </div>
            </div>

          </div>
        </div>
      </div>
    </div>
  );
};

export default AuthPage;