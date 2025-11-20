import { useState } from "react";
import { Scale, Shield, ArrowLeft } from "lucide-react";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card";
import { Tabs, TabsContent, TabsList, TabsTrigger } from "@/components/ui/tabs";
import { useNavigate } from "react-router-dom";
import { useAuth } from "@/contexts/AuthContext";
import { toast } from "sonner";
import { z } from "zod";

const loginSchema = z.object({
  email: z
    .string()
    .trim()
    .email({ message: "E-mail inválido" })
    .max(255, { message: "E-mail muito longo" }),
  password: z
    .string()
    .min(6, { message: "Senha deve ter no mínimo 6 caracteres" })
    .max(100, { message: "Senha muito longa" }),
});

const signupSchema = z.object({
  name: z
    .string()
    .trim()
    .min(2, { message: "Nome deve ter no mínimo 2 caracteres" })
    .max(100, { message: "Nome muito longo" }),
  email: z
    .string()
    .trim()
    .email({ message: "E-mail inválido" })
    .max(255, { message: "E-mail muito longo" }),
  password: z
    .string()
    .min(6, { message: "Senha deve ter no mínimo 6 caracteres" })
    .max(100, { message: "Senha muito longa" }),
});

const AuthPage = () => {
  const navigate = useNavigate();
  const { login, signup, isAuthenticated } = useAuth();
  const [isLoading, setIsLoading] = useState(false);
  const [errors, setErrors] = useState<Record<string, string>>({});

  // Redirecionar se já estiver autenticado
  if (isAuthenticated) {
    navigate("/dashboard");
    return null;
  }

  const handleLogin = async (e: React.FormEvent<HTMLFormElement>) => {
    e.preventDefault();
    setErrors({});
    
    const formData = new FormData(e.currentTarget);
    const data = {
      email: formData.get("email") as string,
      password: formData.get("password") as string,
    };

    try {
      const validated = loginSchema.parse(data);
      setIsLoading(true);
      
      await login(validated.email, validated.password);
      toast.success("Login realizado com sucesso");
    } catch (error) {
      if (error instanceof z.ZodError) {
        const fieldErrors: Record<string, string> = {};
        error.errors.forEach((err) => {
          if (err.path[0]) {
            fieldErrors[err.path[0] as string] = err.message;
          }
        });
        setErrors(fieldErrors);
      } else {
        toast.error("Erro ao fazer login");
      }
    } finally {
      setIsLoading(false);
    }
  };

  const handleSignup = async (e: React.FormEvent<HTMLFormElement>) => {
    e.preventDefault();
    setErrors({});
    
    const formData = new FormData(e.currentTarget);
    const data = {
      name: formData.get("name") as string,
      email: formData.get("signup-email") as string,
      password: formData.get("signup-password") as string,
    };

    try {
      const validated = signupSchema.parse(data);
      setIsLoading(true);
      
      await signup(validated.name, validated.email, validated.password);
      toast.success("Conta criada com sucesso");
    } catch (error) {
      if (error instanceof z.ZodError) {
        const fieldErrors: Record<string, string> = {};
        error.errors.forEach((err) => {
          if (err.path[0]) {
            fieldErrors[err.path[0] as string] = err.message;
          }
        });
        setErrors(fieldErrors);
      } else {
        toast.error("Erro ao criar conta");
      }
    } finally {
      setIsLoading(false);
    }
  };

  return (
    <div className="min-h-screen flex items-center justify-center bg-gradient-to-br from-primary via-primary/95 to-primary/90 p-4">
      <div className="w-full max-w-md">
        {/* Back button */}
        <Button
          variant="ghost"
          size="sm"
          className="mb-4 text-white hover:bg-white/10"
          onClick={() => navigate("/")}
        >
          <ArrowLeft className="h-4 w-4 mr-2" />
          Voltar
        </Button>

        {/* Logo e título */}
        <div className="text-center mb-8">
          <div className="flex items-center justify-center gap-3 mb-4">
            <Scale className="h-12 w-12 text-white" />
            <h1 className="text-4xl font-bold text-white">JusContratos</h1>
          </div>
          <p className="text-white/90 text-lg font-medium">
            Acesse sua Blindagem Jurídica
          </p>
        </div>

        <Card className="shadow-xl">
          <CardHeader className="space-y-1">
            <CardTitle className="text-2xl text-center">Bem-vindo</CardTitle>
            <CardDescription className="text-center">
              Entre ou crie sua conta para começar
            </CardDescription>
          </CardHeader>
          <CardContent>
            <Tabs defaultValue="login" className="w-full">
              <TabsList className="grid w-full grid-cols-2 mb-6">
                <TabsTrigger value="login" onClick={() => setErrors({})}>
                  Login
                </TabsTrigger>
                <TabsTrigger value="signup" onClick={() => setErrors({})}>
                  Cadastro
                </TabsTrigger>
              </TabsList>

              <TabsContent value="login">
                <form onSubmit={handleLogin} className="space-y-4">
                  <div className="space-y-2">
                    <Label htmlFor="email">E-mail</Label>
                    <Input
                      id="email"
                      name="email"
                      type="email"
                      placeholder="seu@email.com"
                      required
                      className={errors.email ? "border-destructive" : ""}
                    />
                    {errors.email && (
                      <p className="text-sm text-destructive">{errors.email}</p>
                    )}
                  </div>
                  <div className="space-y-2">
                    <Label htmlFor="password">Senha</Label>
                    <Input
                      id="password"
                      name="password"
                      type="password"
                      placeholder="••••••••"
                      required
                      className={errors.password ? "border-destructive" : ""}
                    />
                    {errors.password && (
                      <p className="text-sm text-destructive">{errors.password}</p>
                    )}
                  </div>
                  <Button type="submit" className="w-full" disabled={isLoading}>
                    {isLoading ? "Entrando..." : "Entrar"}
                  </Button>
                </form>
              </TabsContent>

              <TabsContent value="signup">
                <form onSubmit={handleSignup} className="space-y-4">
                  <div className="space-y-2">
                    <Label htmlFor="name">Nome Completo</Label>
                    <Input
                      id="name"
                      name="name"
                      type="text"
                      placeholder="Seu nome completo"
                      required
                      className={errors.name ? "border-destructive" : ""}
                    />
                    {errors.name && (
                      <p className="text-sm text-destructive">{errors.name}</p>
                    )}
                  </div>
                  <div className="space-y-2">
                    <Label htmlFor="signup-email">E-mail</Label>
                    <Input
                      id="signup-email"
                      name="signup-email"
                      type="email"
                      placeholder="seu@email.com"
                      required
                      className={errors.email ? "border-destructive" : ""}
                    />
                    {errors.email && (
                      <p className="text-sm text-destructive">{errors.email}</p>
                    )}
                  </div>
                  <div className="space-y-2">
                    <Label htmlFor="signup-password">Senha</Label>
                    <Input
                      id="signup-password"
                      name="signup-password"
                      type="password"
                      placeholder="••••••••"
                      required
                      className={errors.password ? "border-destructive" : ""}
                    />
                    {errors.password && (
                      <p className="text-sm text-destructive">{errors.password}</p>
                    )}
                  </div>
                  <Button type="submit" className="w-full" disabled={isLoading}>
                    {isLoading ? "Criando conta..." : "Criar Conta"}
                  </Button>
                </form>
              </TabsContent>
            </Tabs>

            <div className="mt-6 flex items-center gap-2 text-sm text-muted-foreground justify-center">
              <Shield className="h-4 w-4" />
              <span>Seus dados estão protegidos</span>
            </div>
          </CardContent>
        </Card>
      </div>
    </div>
  );
};

export default AuthPage;
