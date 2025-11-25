import { Layout } from "@/components/Layout";
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card";
import { Label } from "@/components/ui/label";
import { Input } from "@/components/ui/input";
import { Button } from "@/components/ui/button";
import { Switch } from "@/components/ui/switch";
import { Tabs, TabsContent, TabsList, TabsTrigger } from "@/components/ui/tabs";
import { useAuth } from "@/contexts/AuthContext";
import { User, Bell, Shield, Globe } from "lucide-react";
import { useState } from "react";
import { toast } from "sonner";

const Configuracoes = () => {
    const { user } = useAuth();
    const [emailNotifications, setEmailNotifications] = useState(true);
    const [marketingEmails, setMarketingEmails] = useState(false);

    const handleSaveProfile = () => {
        toast.success("Perfil atualizado com sucesso!");
    };

    const handlePasswordReset = () => {
        toast.info("Link de redefinição de senha enviado para seu e-mail.");
    };

    return (
        <Layout>
            <div className="max-w-4xl mx-auto space-y-8">
                <div>
                    <h1 className="text-3xl font-bold text-slate-900">Configurações</h1>
                    <p className="text-slate-600 mt-2">Gerencie suas preferências e dados da conta.</p>
                </div>

                <Tabs defaultValue="profile" className="w-full">
                    <TabsList className="grid w-full grid-cols-4 lg:w-[400px]">
                        <TabsTrigger value="profile">Perfil</TabsTrigger>
                        <TabsTrigger value="notifications">Notificações</TabsTrigger>
                        <TabsTrigger value="security">Segurança</TabsTrigger>
                        <TabsTrigger value="preferences">Preferências</TabsTrigger>
                    </TabsList>

                    {/* Perfil */}
                    <TabsContent value="profile" className="mt-6">
                        <Card>
                            <CardHeader>
                                <div className="flex items-center gap-2">
                                    <User className="h-5 w-5 text-blue-600" />
                                    <CardTitle>Informações Pessoais</CardTitle>
                                </div>
                                <CardDescription>Atualize seus dados de identificação.</CardDescription>
                            </CardHeader>
                            <CardContent className="space-y-4">
                                <div className="grid gap-2">
                                    <Label htmlFor="name">Nome Completo</Label>
                                    <Input id="name" defaultValue={user?.name || ""} placeholder="Seu nome" />
                                </div>
                                <div className="grid gap-2">
                                    <Label htmlFor="email">E-mail</Label>
                                    <Input id="email" defaultValue={user?.email || ""} disabled className="bg-slate-50" />
                                    <p className="text-xs text-muted-foreground">O e-mail não pode ser alterado.</p>
                                </div>
                                <Button onClick={handleSaveProfile} className="mt-4">Salvar Alterações</Button>
                            </CardContent>
                        </Card>
                    </TabsContent>

                    {/* Notificações */}
                    <TabsContent value="notifications" className="mt-6">
                        <Card>
                            <CardHeader>
                                <div className="flex items-center gap-2">
                                    <Bell className="h-5 w-5 text-blue-600" />
                                    <CardTitle>Preferências de Notificação</CardTitle>
                                </div>
                                <CardDescription>Escolha como você quer ser notificado.</CardDescription>
                            </CardHeader>
                            <CardContent className="space-y-6">
                                <div className="flex items-center justify-between space-x-2">
                                    <Label htmlFor="audit-ready" className="flex flex-col space-y-1">
                                        <span>Auditorias Concluídas</span>
                                        <span className="font-normal text-xs text-muted-foreground">Receba um e-mail quando sua análise estiver pronta.</span>
                                    </Label>
                                    <Switch id="audit-ready" checked={emailNotifications} onCheckedChange={setEmailNotifications} />
                                </div>
                                <div className="flex items-center justify-between space-x-2">
                                    <Label htmlFor="marketing" className="flex flex-col space-y-1">
                                        <span>Novidades e Promoções</span>
                                        <span className="font-normal text-xs text-muted-foreground">Receba ofertas de créditos e atualizações do sistema.</span>
                                    </Label>
                                    <Switch id="marketing" checked={marketingEmails} onCheckedChange={setMarketingEmails} />
                                </div>
                            </CardContent>
                        </Card>
                    </TabsContent>

                    {/* Segurança */}
                    <TabsContent value="security" className="mt-6">
                        <Card>
                            <CardHeader>
                                <div className="flex items-center gap-2">
                                    <Shield className="h-5 w-5 text-blue-600" />
                                    <CardTitle>Segurança da Conta</CardTitle>
                                </div>
                                <CardDescription>Gerencie sua senha e acesso.</CardDescription>
                            </CardHeader>
                            <CardContent className="space-y-4">
                                <div className="flex flex-col gap-2">
                                    <Label>Senha</Label>
                                    <Button variant="outline" onClick={handlePasswordReset} className="w-full sm:w-auto justify-start">
                                        Redefinir Senha
                                    </Button>
                                    <p className="text-xs text-muted-foreground">Você receberá um e-mail com instruções.</p>
                                </div>
                            </CardContent>
                        </Card>
                    </TabsContent>

                    {/* Preferências */}
                    <TabsContent value="preferences" className="mt-6">
                        <Card>
                            <CardHeader>
                                <div className="flex items-center gap-2">
                                    <Globe className="h-5 w-5 text-blue-600" />
                                    <CardTitle>Preferências do Sistema</CardTitle>
                                </div>
                                <CardDescription>Personalize sua experiência.</CardDescription>
                            </CardHeader>
                            <CardContent className="space-y-4">
                                <div className="grid gap-2">
                                    <Label htmlFor="language">Idioma</Label>
                                    <select id="language" className="flex h-10 w-full items-center justify-between rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background placeholder:text-muted-foreground focus:outline-none focus:ring-2 focus:ring-ring focus:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50">
                                        <option value="pt-BR">Português (Brasil)</option>
                                        <option value="en">English</option>
                                        <option value="es">Español</option>
                                    </select>
                                </div>
                                <div className="grid gap-2">
                                    <Label htmlFor="theme">Tema</Label>
                                    <select id="theme" className="flex h-10 w-full items-center justify-between rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background placeholder:text-muted-foreground focus:outline-none focus:ring-2 focus:ring-ring focus:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50">
                                        <option value="light">Claro</option>
                                        <option value="dark">Escuro</option>
                                        <option value="system">Sistema</option>
                                    </select>
                                </div>
                            </CardContent>
                        </Card>
                    </TabsContent>
                </Tabs>
            </div>
        </Layout>
    );
};

export default Configuracoes;
