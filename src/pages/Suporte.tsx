import { Layout } from "@/components/Layout";
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { Textarea } from "@/components/ui/textarea";
import { HeadphonesIcon, Mail, Phone, MessageSquare } from "lucide-react";
import { toast } from "sonner";

const Suporte = () => {
  const handleSubmit = (e: React.FormEvent) => {
    e.preventDefault();
    toast.success("Mensagem enviada! Responderemos em até 24 horas.");
  };

  return (
    <Layout>
      <div className="max-w-4xl mx-auto space-y-6">
        <div>
          <h1 className="text-3xl font-bold text-foreground">Suporte Jurídico</h1>
          <p className="text-muted-foreground mt-1">
            Nossa equipe está pronta para auxiliar em suas questões
          </p>
        </div>

        {/* Contact Cards */}
        <div className="grid md:grid-cols-3 gap-4">
          <Card className="shadow-md hover:shadow-lg transition-shadow">
            <CardContent className="pt-6 text-center">
              <div className="p-3 bg-primary/10 rounded-full w-fit mx-auto mb-4">
                <Phone className="h-6 w-6 text-primary" />
              </div>
              <h3 className="font-semibold mb-2">Telefone</h3>
              <a href="tel:61998684615" className="text-sm text-muted-foreground hover:text-primary transition-colors">(61) 99868-4615</a>
            </CardContent>
          </Card>

          <Card className="shadow-md hover:shadow-lg transition-shadow">
            <CardContent className="pt-6 text-center">
              <div className="p-3 bg-primary/10 rounded-full w-fit mx-auto mb-4">
                <Mail className="h-6 w-6 text-primary" />
              </div>
              <h3 className="font-semibold mb-2">E-mail</h3>
              <p className="text-sm text-muted-foreground">suporte@alfaconsultoria.com.br</p>
            </CardContent>
          </Card>

          <Card className="shadow-md hover:shadow-lg transition-shadow">
            <CardContent className="pt-6 text-center">
              <div className="p-3 bg-primary/10 rounded-full w-fit mx-auto mb-4">
                <MessageSquare className="h-6 w-6 text-primary" />
              </div>
              <h3 className="font-semibold mb-2">Chat Online</h3>
              <a href="https://wa.me/5561998684615" target="_blank" rel="noreferrer" className="text-sm text-muted-foreground hover:text-primary transition-colors">WhatsApp: (61) 99868-4615</a>
            </CardContent>
          </Card>
        </div>

        {/* Contact Form */}
        <Card className="shadow-lg">
          <CardHeader>
            <div className="flex items-center gap-2">
              <HeadphonesIcon className="h-5 w-5 text-primary" />
              <CardTitle>Envie sua Dúvida</CardTitle>
            </div>
            <CardDescription>
              Preencha o formulário abaixo e nossa equipe jurídica responderá em até 24 horas
            </CardDescription>
          </CardHeader>
          <CardContent>
            <form onSubmit={handleSubmit} className="space-y-6">
              <div className="grid md:grid-cols-2 gap-4">
                <div className="space-y-2">
                  <Label htmlFor="nome">Nome Completo</Label>
                  <Input id="nome" placeholder="Seu nome" required />
                </div>
                <div className="space-y-2">
                  <Label htmlFor="email">E-mail</Label>
                  <Input id="email" type="email" placeholder="seu@email.com" required />
                </div>
              </div>

              <div className="space-y-2">
                <Label htmlFor="assunto">Assunto</Label>
                <Input id="assunto" placeholder="Resumo da sua questão" required />
              </div>

              <div className="space-y-2">
                <Label htmlFor="mensagem">Mensagem</Label>
                <Textarea
                  id="mensagem"
                  placeholder="Descreva detalhadamente sua dúvida ou questão jurídica..."
                  rows={6}
                  required
                />
              </div>

              <Button type="submit" size="lg" className="w-full md:w-auto">
                Enviar Mensagem
              </Button>
            </form>
          </CardContent>
        </Card>

        {/* FAQ Preview */}
        <Card className="bg-muted/50">
          <CardHeader>
            <CardTitle>Perguntas Frequentes</CardTitle>
          </CardHeader>
          <CardContent>
            <div className="space-y-4">
              <div>
                <h4 className="font-medium text-foreground mb-1">
                  Quanto tempo leva uma análise?
                </h4>
                <p className="text-sm text-muted-foreground">
                  O processamento de cada contrato leva em média 10 segundos. Análises mais
                  complexas podem levar até 30 segundos.
                </p>
              </div>
              <div>
                <h4 className="font-medium text-foreground mb-1">
                  Os créditos têm validade?
                </h4>
                <p className="text-sm text-muted-foreground">
                  Não, seus créditos não expiram. Você pode utilizá-los quando precisar, sem
                  limitação de tempo.
                </p>
              </div>
              <div>
                <h4 className="font-medium text-foreground mb-1">
                  Posso usar o laudo em processo judicial?
                </h4>
                <p className="text-sm text-muted-foreground">
                  Sim, nossos laudos são tecnicamente fundamentados e podem servir como base para
                  ações judiciais. Recomendamos consultar seu advogado.
                </p>
              </div>
            </div>
          </CardContent>
        </Card>
      </div>
    </Layout>
  );
};

export default Suporte;
