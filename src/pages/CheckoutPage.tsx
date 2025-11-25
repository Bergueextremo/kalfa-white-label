import { useState } from 'react';
import { useNavigate, useLocation } from 'react-router-dom';
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { Card, CardContent, CardHeader, CardTitle, CardDescription } from "@/components/ui/card";
import { Tabs, TabsContent, TabsList, TabsTrigger } from "@/components/ui/tabs";
import { useToast } from "@/hooks/use-toast";
import { supabase } from "@/lib/supabase";
import {
    Loader2,
    CreditCard,
    QrCode,
    ShieldCheck,
    CheckCircle2,
    Copy,
    ArrowLeft
} from "lucide-react";

export default function CheckoutPage() {
    const navigate = useNavigate();
    const location = useLocation();
    const { toast } = useToast();

    const { scanResult, leadData, auditId } = location.state || {};

    const [loading, setLoading] = useState(false);
    const [paymentMethod, setPaymentMethod] = useState<'credit_card' | 'pix'>('credit_card');

    // Customer Data
    const [name, setName] = useState(leadData?.name || '');
    const [email, setEmail] = useState(leadData?.email || '');
    const [phone, setPhone] = useState(leadData?.phone || '');
    const [cpf, setCpf] = useState('');

    // Card Data
    const [cardNumber, setCardNumber] = useState('');
    const [cardName, setCardName] = useState('');
    const [cardExpiry, setCardExpiry] = useState('');
    const [cardCvv, setCardCvv] = useState('');

    // PIX Data
    const [pixQrCode, setPixQrCode] = useState('');
    const [pixCopyPaste, setPixCopyPaste] = useState('');

    // Máscaras
    const handleCpfChange = (e: React.ChangeEvent<HTMLInputElement>) => {
        let value = e.target.value.replace(/\D/g, '');
        if (value.length > 11) value = value.slice(0, 11);

        if (value.length > 9) {
            value = `${value.slice(0, 3)}.${value.slice(3, 6)}.${value.slice(6, 9)}-${value.slice(9)}`;
        } else if (value.length > 6) {
            value = `${value.slice(0, 3)}.${value.slice(3, 6)}.${value.slice(6)}`;
        } else if (value.length > 3) {
            value = `${value.slice(0, 3)}.${value.slice(3)}`;
        }
        setCpf(value);
    };

    const handlePhoneChange = (e: React.ChangeEvent<HTMLInputElement>) => {
        let value = e.target.value.replace(/\D/g, '');
        if (value.length > 11) value = value.slice(0, 11);

        if (value.length > 2) {
            value = `(${value.slice(0, 2)}) ${value.slice(2)}`;
        }
        if (value.length > 9) {
            value = `${value.slice(0, 10)}-${value.slice(10)}`;
        }
        setPhone(value);
    };

    const handleCardNumberChange = (e: React.ChangeEvent<HTMLInputElement>) => {
        let value = e.target.value.replace(/\D/g, '');
        if (value.length > 16) value = value.slice(0, 16);

        value = value.match(/.{1,4}/g)?.join(' ') || value;
        setCardNumber(value);
    };

    const handleExpiryChange = (e: React.ChangeEvent<HTMLInputElement>) => {
        let value = e.target.value.replace(/\D/g, '');
        if (value.length > 4) value = value.slice(0, 4);

        if (value.length > 2) {
            value = `${value.slice(0, 2)}/${value.slice(2)}`;
        }
        setCardExpiry(value);
    };

    const isFormValid = name.length > 3 && email.includes('@') && phone.length >= 14 && cpf.length === 14;
    const isCardValid = paymentMethod === 'pix' || (cardNumber.length === 19 && cardName.length > 3 && cardExpiry.length === 5 && cardCvv.length >= 3);

    const handleSubmit = async () => {
        if (!isFormValid || !isCardValid) {
            toast({
                title: "Dados incompletos",
                description: "Por favor, preencha todos os campos obrigatórios.",
                variant: "destructive"
            });
            return;
        }

        setLoading(true);

        try {
            // Criar pedido na Appmax
            const { data, error } = await supabase.functions.invoke('create-appmax-order', {
                body: {
                    customer: {
                        name,
                        email,
                        phone,
                        cpf
                    },
                    payment_method: paymentMethod,
                    audit_id: auditId || 'temp-' + Date.now()
                }
            });

            if (error) throw error;
            if (!data.success) throw new Error(data.error);

            // Se for PIX, mostrar QR Code
            if (paymentMethod === 'pix' && data.pix_data) {
                setPixQrCode(data.pix_data.qr_code_url || data.pix_data.qr_code);
                setPixCopyPaste(data.pix_data.qr_code_text || data.pix_data.copy_paste);
                setLoading(false);

                toast({
                    title: "PIX gerado com sucesso!",
                    description: "Escaneie o QR Code ou copie o código para pagar.",
                });
            }
            // Se for Cartão, redirecionar para checkout
            else if (data.checkout_url) {
                window.location.href = data.checkout_url;
            } else {
                throw new Error('Dados de pagamento não retornados');
            }

        } catch (error: any) {
            console.error('Checkout error:', error);
            toast({
                title: "Erro no pagamento",
                description: error.message || "Não foi possível processar seu pagamento. Tente novamente.",
                variant: "destructive"
            });
            setLoading(false);
        }
    };

    const copyPixCode = () => {
        navigator.clipboard.writeText(pixCopyPaste);
        toast({
            title: "Código copiado!",
            description: "Cole no app do seu banco para pagar.",
        });
    };

    if (!scanResult) {
        return (
            <div className="min-h-screen flex items-center justify-center bg-background">
                <Card className="max-w-md">
                    <CardHeader>
                        <CardTitle>Sessão expirada</CardTitle>
                        <CardDescription>Por favor, inicie uma nova análise.</CardDescription>
                    </CardHeader>
                    <CardContent>
                        <Button onClick={() => navigate('/scan-gratis')} className="w-full">
                            Voltar para Análise Gratuita
                        </Button>
                    </CardContent>
                </Card>
            </div>
        );
    }

    return (
        <div className="min-h-screen bg-gradient-to-br from-slate-50 to-slate-100 py-12 px-4">
            <div className="max-w-4xl mx-auto">

                {/* Header */}
                <div className="mb-8">
                    <Button variant="ghost" onClick={() => navigate(-1)} className="mb-4">
                        <ArrowLeft className="h-4 w-4 mr-2" />
                        Voltar
                    </Button>
                    <h1 className="text-3xl font-bold text-slate-900">Finalizar Pagamento</h1>
                    <p className="text-slate-600 mt-2">Complete os dados para liberar sua auditoria completa</p>
                </div>

                <div className="grid md:grid-cols-3 gap-6">

                    {/* Resumo do Pedido */}
                    <div className="md:col-span-1">
                        <Card className="sticky top-6">
                            <CardHeader>
                                <CardTitle className="text-lg">Resumo do Pedido</CardTitle>
                            </CardHeader>
                            <CardContent className="space-y-4">
                                <div className="space-y-2">
                                    <div className="flex items-start gap-3 p-3 bg-primary/5 rounded-lg">
                                        <ShieldCheck className="h-5 w-5 text-primary shrink-0 mt-0.5" />
                                        <div>
                                            <p className="font-semibold text-sm">Auditoria Jurídica Premium</p>
                                            <p className="text-xs text-muted-foreground">Análise completa + Laudo técnico</p>
                                        </div>
                                    </div>
                                </div>

                                <div className="border-t pt-4 space-y-2">
                                    <div className="flex justify-between text-sm">
                                        <span className="text-muted-foreground">Subtotal</span>
                                        <span>R$ 49,00</span>
                                    </div>
                                    <div className="flex justify-between font-bold text-lg">
                                        <span>Total</span>
                                        <span className="text-primary">R$ 49,00</span>
                                    </div>
                                </div>

                                <div className="bg-emerald-50 border border-emerald-200 rounded-lg p-3 space-y-2">
                                    <div className="flex items-center gap-2 text-emerald-700 font-semibold text-sm">
                                        <CheckCircle2 className="h-4 w-4" />
                                        Garantia de 7 dias
                                    </div>
                                    <p className="text-xs text-emerald-600">
                                        100% do seu dinheiro de volta se não ficar satisfeito
                                    </p>
                                </div>
                            </CardContent>
                        </Card>
                    </div>

                    {/* Formulário de Pagamento */}
                    <div className="md:col-span-2">
                        <Card>
                            <CardHeader>
                                <CardTitle>Dados Pessoais</CardTitle>
                                <CardDescription>Preencha seus dados para continuar</CardDescription>
                            </CardHeader>
                            <CardContent className="space-y-4">
                                <div className="grid md:grid-cols-2 gap-4">
                                    <div className="space-y-2">
                                        <Label htmlFor="name">Nome Completo</Label>
                                        <Input
                                            id="name"
                                            placeholder="Seu nome completo"
                                            value={name}
                                            onChange={(e) => setName(e.target.value)}
                                        />
                                    </div>

                                    <div className="space-y-2">
                                        <Label htmlFor="cpf">CPF</Label>
                                        <Input
                                            id="cpf"
                                            placeholder="000.000.000-00"
                                            value={cpf}
                                            onChange={handleCpfChange}
                                        />
                                    </div>
                                </div>

                                <div className="grid md:grid-cols-2 gap-4">
                                    <div className="space-y-2">
                                        <Label htmlFor="email">E-mail</Label>
                                        <Input
                                            id="email"
                                            type="email"
                                            placeholder="seu@email.com"
                                            value={email}
                                            onChange={(e) => setEmail(e.target.value)}
                                        />
                                    </div>

                                    <div className="space-y-2">
                                        <Label htmlFor="phone">Telefone</Label>
                                        <Input
                                            id="phone"
                                            placeholder="(11) 99999-9999"
                                            value={phone}
                                            onChange={handlePhoneChange}
                                        />
                                    </div>
                                </div>
                            </CardContent>
                        </Card>

                        <Card className="mt-6">
                            <CardHeader>
                                <CardTitle>Método de Pagamento</CardTitle>
                            </CardHeader>
                            <CardContent>
                                <Tabs value={paymentMethod} onValueChange={(v) => setPaymentMethod(v as any)}>
                                    <TabsList className="grid w-full grid-cols-2">
                                        <TabsTrigger value="credit_card">
                                            <CreditCard className="h-4 w-4 mr-2" />
                                            Cartão de Crédito
                                        </TabsTrigger>
                                        <TabsTrigger value="pix">
                                            <QrCode className="h-4 w-4 mr-2" />
                                            PIX
                                        </TabsTrigger>
                                    </TabsList>

                                    <TabsContent value="credit_card" className="space-y-4 mt-6">
                                        <div className="space-y-2">
                                            <Label htmlFor="cardNumber">Número do Cartão</Label>
                                            <Input
                                                id="cardNumber"
                                                placeholder="0000 0000 0000 0000"
                                                value={cardNumber}
                                                onChange={handleCardNumberChange}
                                            />
                                        </div>

                                        <div className="space-y-2">
                                            <Label htmlFor="cardName">Nome no Cartão</Label>
                                            <Input
                                                id="cardName"
                                                placeholder="Como está no cartão"
                                                value={cardName}
                                                onChange={(e) => setCardName(e.target.value.toUpperCase())}
                                            />
                                        </div>

                                        <div className="grid grid-cols-2 gap-4">
                                            <div className="space-y-2">
                                                <Label htmlFor="cardExpiry">Validade</Label>
                                                <Input
                                                    id="cardExpiry"
                                                    placeholder="MM/AA"
                                                    value={cardExpiry}
                                                    onChange={handleExpiryChange}
                                                />
                                            </div>

                                            <div className="space-y-2">
                                                <Label htmlFor="cardCvv">CVV</Label>
                                                <Input
                                                    id="cardCvv"
                                                    placeholder="123"
                                                    maxLength={4}
                                                    value={cardCvv}
                                                    onChange={(e) => setCardCvv(e.target.value.replace(/\D/g, ''))}
                                                />
                                            </div>
                                        </div>
                                    </TabsContent>

                                    <TabsContent value="pix" className="space-y-4 mt-6">
                                        {!pixQrCode ? (
                                            <div className="text-center py-8 space-y-4">
                                                <QrCode className="h-16 w-16 mx-auto text-primary" />
                                                <div>
                                                    <h3 className="font-semibold text-lg">Pagamento via PIX</h3>
                                                    <p className="text-sm text-muted-foreground mt-2">
                                                        Aprovação imediata após confirmação do pagamento
                                                    </p>
                                                </div>
                                                <div className="bg-blue-50 border border-blue-200 rounded-lg p-4 text-left">
                                                    <p className="text-sm text-blue-900 font-medium mb-2">Como funciona:</p>
                                                    <ol className="text-sm text-blue-800 space-y-1 list-decimal list-inside">
                                                        <li>Clique em "Gerar QR Code PIX"</li>
                                                        <li>Escaneie o código no app do seu banco</li>
                                                        <li>Confirme o pagamento de R$ 49,00</li>
                                                        <li>Acesso liberado automaticamente</li>
                                                    </ol>
                                                </div>
                                            </div>
                                        ) : (
                                            <div className="space-y-4">
                                                <div className="bg-white border-2 border-primary/20 rounded-lg p-6 flex justify-center">
                                                    <img src={pixQrCode} alt="QR Code PIX" className="w-64 h-64" />
                                                </div>
                                                <div className="space-y-2">
                                                    <Label>Código PIX Copia e Cola</Label>
                                                    <div className="flex gap-2">
                                                        <Input value={pixCopyPaste} readOnly className="font-mono text-xs" />
                                                        <Button onClick={copyPixCode} variant="outline">
                                                            <Copy className="h-4 w-4" />
                                                        </Button>
                                                    </div>
                                                </div>
                                            </div>
                                        )}
                                    </TabsContent>
                                </Tabs>

                                <Button
                                    className="w-full mt-6 h-12 text-lg"
                                    disabled={loading || !isFormValid || !isCardValid}
                                    onClick={handleSubmit}
                                >
                                    {loading ? (
                                        <>
                                            <Loader2 className="mr-2 h-5 w-5 animate-spin" />
                                            Processando...
                                        </>
                                    ) : (
                                        <>
                                            Finalizar Pagamento - R$ 49,00
                                        </>
                                    )}
                                </Button>

                                <p className="text-xs text-center text-muted-foreground mt-4">
                                    Ao continuar, você concorda com nossos Termos de Uso e Política de Privacidade
                                </p>
                            </CardContent>
                        </Card>
                    </div>

                </div>
            </div>
        </div>
    );
}
