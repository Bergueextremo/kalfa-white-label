import { Dialog, DialogContent, DialogDescription, DialogHeader, DialogTitle } from "@/components/ui/dialog";
import { Button } from "@/components/ui/button";
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { RadioGroup, RadioGroupItem } from "@/components/ui/radio-group";
import { Check, CreditCard, Loader2, QrCode, ArrowLeft, Copy } from "lucide-react";
import { useState } from "react";
import { useCredits } from "@/contexts/CreditContext";
import { useAuth } from "@/contexts/AuthContext";
import { toast } from "sonner";
import { supabase } from "@/lib/supabase";

interface CheckoutModalProps {
    children?: React.ReactNode;
    open?: boolean;
    onOpenChange?: (open: boolean) => void;
}

type Step = 'plan' | 'customer' | 'payment' | 'processing' | 'success';
type PaymentMethod = 'pix' | 'credit_card';

interface PlanData {
    name: string;
    credits: number;
    price: number;
    priceFormatted: string;
    features: string[];
    popular?: boolean;
}

export function CheckoutModal({ children, open, onOpenChange }: CheckoutModalProps) {
    const { addCredits } = useCredits();
    const { user } = useAuth();
    const [loading, setLoading] = useState(false);
    const [step, setStep] = useState<Step>('plan');
    const [selectedPlan, setSelectedPlan] = useState<PlanData | null>(null);
    const [paymentMethod, setPaymentMethod] = useState<PaymentMethod>('credit_card');
    const [qrCodeData, setQrCodeData] = useState<string>('');
    const [pixCode, setPixCode] = useState<string>('');
    const [orderId, setOrderId] = useState<string>('');

    const [customerData, setCustomerData] = useState({
        name: '',
        email: user?.email || '',
        cpf: '',
        phone: ''
    });

    const [cardData, setCardData] = useState({
        number: '',
        expiry: '',
        cvv: '',
        holderName: ''
    });

    const plans: PlanData[] = [
        {
            name: "Start",
            credits: 10,
            price: 97.00,
            priceFormatted: "R$ 97,00",
            features: ["10 análises completas", "Suporte por email", "Laudos em PDF"]
        },
        {
            name: "Essencial",
            credits: 50,
            price: 324.00,
            priceFormatted: "R$ 324,00",
            features: ["50 análises completas", "Suporte prioritário", "Laudos personalizados", "Acesso multi-dispositivo"],
            popular: true
        },
        {
            name: "Enterprise",
            credits: 200,
            price: 997.00,
            priceFormatted: "R$ 997,00",
            features: ["200 análises completas", "Gerente de conta dedicado", "API de integração", "Integrações customizadas", "SLA garantido"]
        }
    ];

    const handlePlanSelect = (plan: PlanData) => {
        setSelectedPlan(plan);
        setStep('customer');
    };

    const handleCustomerSubmit = (e: React.FormEvent) => {
        e.preventDefault();
        if (!customerData.name || !customerData.email || !customerData.cpf || !customerData.phone) {
            toast.error('Preencha todos os campos');
            return;
        }
        setStep('payment');
    };

    const handlePaymentSubmit = async (e: React.FormEvent) => {
        e.preventDefault();
        if (!selectedPlan) return;

        setLoading(true);
        setStep('processing');

        try {
            const payload = {
                customer: {
                    name: customerData.name,
                    email: customerData.email,
                    cpf: customerData.cpf,
                    phone: customerData.phone
                },
                payment_method: paymentMethod,
                audit_id: 'temp-credit-' + Date.now(), // ID temporário para compra de créditos
                amount: selectedPlan.price, // Valor do plano
                credits: selectedPlan.credits, // Quantidade de créditos
                plan_name: selectedPlan.name, // Nome do plano
                ...(paymentMethod === 'credit_card' && {
                    card_data: {
                        number: cardData.number.replace(/\s/g, ''),
                        cvv: cardData.cvv,
                        month: cardData.expiry.split('/')[0],
                        year: cardData.expiry.split('/')[1],
                        name: cardData.holderName
                    }
                })
            };

            console.log('Enviando pagamento para create-appmax-order:', payload);

            const { data, error } = await supabase.functions.invoke('create-appmax-order', {
                body: payload
            });

            console.log('Resposta recebida:', data);

            if (error) throw error;

            if (paymentMethod === 'pix') {
                // Ler dados PIX com fallbacks (igual ao CheckoutPage)
                if (data.pix_data) {
                    const qrCode = data.pix_data.qr_code_url || data.pix_data.qr_code;
                    const copyPaste = data.pix_data.qr_code_text || data.pix_data.copy_paste;

                    console.log('PIX gerado:', { qrCode, copyPaste });

                    setQrCodeData(qrCode);
                    setPixCode(copyPaste);
                    setOrderId(data.order_id);
                    setStep('processing');
                    setLoading(false);

                    // Iniciar polling para verificar pagamento
                    startPaymentPolling(data.order_id);
                    return;
                } else {
                    console.error('Resposta sem pix_data:', data);
                    throw new Error('Dados PIX não retornados pela API');
                }
            } else {
                // Cartão de crédito - aprovação imediata
                if (data.payment_success && data.payment_status === 'approved') {
                    addCredits(selectedPlan.credits);
                    setStep('success');
                    toast.success(`${selectedPlan.credits} créditos adicionados!`);
                } else {
                    throw new Error(data.error_message || 'Pagamento recusado');
                }
            }
        } catch (error: any) {
            console.error('Erro no pagamento:', error);
            toast.error(error.message || 'Erro ao processar pagamento');
            setStep('payment');
        } finally {
            setLoading(false);
        }
    };

    const startPaymentPolling = (orderId: string) => {
        const interval = setInterval(async () => {
            try {
                const { data, error } = await supabase.functions.invoke('check-payment-status', {
                    body: { order_id: orderId }
                });

                if (error) throw error;

                if (data.status === 'approved' && selectedPlan) {
                    clearInterval(interval);
                    addCredits(selectedPlan.credits);
                    setStep('success');
                    toast.success(`${selectedPlan.credits} créditos adicionados!`);
                } else if (data.status === 'failed') {
                    clearInterval(interval);
                    toast.error('Pagamento não aprovado');
                    setStep('payment');
                }
            } catch (error) {
                console.error('Erro ao verificar status:', error);
            }
        }, 3000);

        // Limpar após 5 minutos
        setTimeout(() => clearInterval(interval), 300000);
    };

    const resetModal = () => {
        setStep('plan');
        setSelectedPlan(null);
        setCustomerData({ name: '', email: user?.email || '', cpf: '', phone: '' });
        setCardData({ number: '', expiry: '', cvv: '', holderName: '' });
        setQrCodeData('');
        setPixCode('');
        setOrderId('');
    };

    const handleClose = () => {
        resetModal();
        onOpenChange?.(false);
    };

    return (
        <Dialog open={open} onOpenChange={handleClose}>
            <DialogContent className="sm:max-w-[700px] max-h-[90vh] overflow-y-auto">
                <DialogHeader>
                    <DialogTitle>
                        {step === 'plan' && 'Escolha seu Plano'}
                        {step === 'customer' && 'Dados do Cliente'}
                        {step === 'payment' && 'Forma de Pagamento'}
                        {step === 'processing' && 'Processando Pagamento'}
                        {step === 'success' && 'Compra Realizada!'}
                    </DialogTitle>
                    <DialogDescription>
                        {step === 'plan' && 'Selecione o plano ideal para suas necessidades'}
                        {step === 'customer' && 'Preencha seus dados para continuar'}
                        {step === 'payment' && 'Escolha como deseja pagar'}
                        {step === 'processing' && paymentMethod === 'pix' && 'Escaneie o QR Code para pagar'}
                        {step === 'success' && 'Seus créditos foram adicionados com sucesso'}
                    </DialogDescription>
                </DialogHeader>

                {/* Step 1: Plan Selection */}
                {step === 'plan' && (
                    <div className="grid gap-4 py-4 md:grid-cols-3">
                        {plans.map((plan) => (
                            <Card
                                key={plan.name}
                                className={`cursor-pointer transition-all hover:border-primary ${plan.popular ? 'border-primary bg-primary/5' : ''}`}
                                onClick={() => handlePlanSelect(plan)}
                            >
                                {plan.popular && (
                                    <div className="bg-primary text-primary-foreground text-center py-1 text-xs font-medium rounded-t-lg">
                                        Mais Popular
                                    </div>
                                )}
                                <CardHeader>
                                    <CardTitle className="text-lg">{plan.name}</CardTitle>
                                    <CardDescription>{plan.credits} créditos</CardDescription>
                                </CardHeader>
                                <CardContent>
                                    <div className="text-2xl font-bold mb-4">{plan.priceFormatted}</div>
                                    <ul className="space-y-2 mb-6">
                                        {plan.features.map((feature, i) => (
                                            <li key={i} className="flex items-center text-sm text-muted-foreground">
                                                <Check className="h-4 w-4 mr-2 text-green-500" />
                                                {feature}
                                            </li>
                                        ))}
                                    </ul>
                                    <Button className="w-full" variant={plan.popular ? "default" : "outline"}>
                                        Selecionar
                                    </Button>
                                </CardContent>
                            </Card>
                        ))}
                    </div>
                )}

                {/* Step 2: Customer Data */}
                {step === 'customer' && (
                    <form onSubmit={handleCustomerSubmit} className="space-y-4 py-4">
                        <div className="space-y-2">
                            <Label htmlFor="name">Nome Completo</Label>
                            <Input
                                id="name"
                                value={customerData.name}
                                onChange={(e) => setCustomerData({ ...customerData, name: e.target.value })}
                                required
                            />
                        </div>
                        <div className="space-y-2">
                            <Label htmlFor="email">Email</Label>
                            <Input
                                id="email"
                                type="email"
                                value={customerData.email}
                                readOnly
                                disabled
                                className="bg-muted"
                                required
                            />
                            <p className="text-xs text-muted-foreground">Email da sua conta</p>
                        </div>
                        <div className="space-y-2">
                            <Label htmlFor="cpf">CPF</Label>
                            <Input
                                id="cpf"
                                value={customerData.cpf}
                                onChange={(e) => setCustomerData({ ...customerData, cpf: e.target.value })}
                                placeholder="000.000.000-00"
                                required
                            />
                        </div>
                        <div className="space-y-2">
                            <Label htmlFor="phone">Telefone</Label>
                            <Input
                                id="phone"
                                value={customerData.phone}
                                onChange={(e) => setCustomerData({ ...customerData, phone: e.target.value })}
                                placeholder="(00) 00000-0000"
                                required
                            />
                        </div>
                        <div className="flex gap-2 pt-4">
                            <Button type="button" variant="outline" onClick={() => setStep('plan')}>
                                <ArrowLeft className="h-4 w-4 mr-2" />
                                Voltar
                            </Button>
                            <Button type="submit" className="flex-1">
                                Continuar
                            </Button>
                        </div>
                    </form>
                )}

                {/* Step 3: Payment Method */}
                {step === 'payment' && (
                    <form onSubmit={handlePaymentSubmit} className="space-y-4 py-4">
                        <div className="space-y-4">
                            <Label>Método de Pagamento</Label>
                            <RadioGroup value={paymentMethod} onValueChange={(value) => setPaymentMethod(value as PaymentMethod)}>
                                <div className="flex items-center space-x-2 border rounded-lg p-4 cursor-pointer hover:border-primary">
                                    <RadioGroupItem value="credit_card" id="credit_card" />
                                    <Label htmlFor="credit_card" className="flex-1 cursor-pointer">
                                        <div className="flex items-center gap-2">
                                            <CreditCard className="h-5 w-5" />
                                            <span>Cartão de Crédito</span>
                                        </div>
                                    </Label>
                                </div>
                                <div className="flex items-center space-x-2 border rounded-lg p-4 cursor-pointer hover:border-primary">
                                    <RadioGroupItem value="pix" id="pix" />
                                    <Label htmlFor="pix" className="flex-1 cursor-pointer">
                                        <div className="flex items-center gap-2">
                                            <QrCode className="h-5 w-5" />
                                            <span>PIX</span>
                                        </div>
                                    </Label>
                                </div>
                            </RadioGroup>
                        </div>

                        {paymentMethod === 'credit_card' && (
                            <div className="space-y-4 pt-4">
                                <div className="space-y-2">
                                    <Label htmlFor="cardNumber">Número do Cartão</Label>
                                    <Input
                                        id="cardNumber"
                                        value={cardData.number}
                                        onChange={(e) => setCardData({ ...cardData, number: e.target.value })}
                                        placeholder="0000 0000 0000 0000"
                                        required
                                    />
                                </div>
                                <div className="grid grid-cols-2 gap-4">
                                    <div className="space-y-2">
                                        <Label htmlFor="expiry">Validade</Label>
                                        <Input
                                            id="expiry"
                                            value={cardData.expiry}
                                            onChange={(e) => setCardData({ ...cardData, expiry: e.target.value })}
                                            placeholder="MM/AA"
                                            required
                                        />
                                    </div>
                                    <div className="space-y-2">
                                        <Label htmlFor="cvv">CVV</Label>
                                        <Input
                                            id="cvv"
                                            value={cardData.cvv}
                                            onChange={(e) => setCardData({ ...cardData, cvv: e.target.value })}
                                            placeholder="000"
                                            required
                                        />
                                    </div>
                                </div>
                                <div className="space-y-2">
                                    <Label htmlFor="holderName">Nome no Cartão</Label>
                                    <Input
                                        id="holderName"
                                        value={cardData.holderName}
                                        onChange={(e) => setCardData({ ...cardData, holderName: e.target.value })}
                                        required
                                    />
                                </div>
                            </div>
                        )}

                        <div className="flex gap-2 pt-4">
                            <Button type="button" variant="outline" onClick={() => setStep('customer')}>
                                <ArrowLeft className="h-4 w-4 mr-2" />
                                Voltar
                            </Button>
                            <Button type="submit" className="flex-1" disabled={loading}>
                                {loading ? <Loader2 className="h-4 w-4 animate-spin" /> : `Pagar ${selectedPlan?.priceFormatted}`}
                            </Button>
                        </div>
                    </form>
                )}

                {/* Step 4: Processing (PIX QR Code) */}
                {step === 'processing' && paymentMethod === 'pix' && qrCodeData && (
                    <div className="flex flex-col items-center justify-center py-8 space-y-4">
                        <div className="bg-white p-4 rounded-lg">
                            <img src={qrCodeData} alt="QR Code PIX" className="w-64 h-64" />
                        </div>
                        <p className="text-center text-sm text-muted-foreground">
                            Escaneie o QR Code com o app do seu banco para pagar
                        </p>

                        {pixCode && (
                            <div className="flex items-center gap-2 w-full max-w-md">
                                <Input value={pixCode} readOnly className="font-mono text-xs" />
                                <Button size="icon" variant="outline" onClick={() => {
                                    navigator.clipboard.writeText(pixCode);
                                    toast.success("Código PIX copiado!");
                                }}>
                                    <Copy className="h-4 w-4" />
                                </Button>
                            </div>
                        )}

                        <Loader2 className="h-6 w-6 animate-spin text-primary" />
                        <p className="text-sm text-muted-foreground">Aguardando confirmação do pagamento...</p>
                    </div>
                )}

                {/* Step 5: Success */}
                {step === 'success' && (
                    <div className="flex flex-col items-center justify-center py-8 space-y-4">
                        <div className="h-16 w-16 bg-green-100 rounded-full flex items-center justify-center">
                            <Check className="h-8 w-8 text-green-600" />
                        </div>
                        <h3 className="text-xl font-semibold">Pagamento Aprovado!</h3>
                        <p className="text-center text-muted-foreground">
                            {selectedPlan?.credits} créditos foram adicionados à sua conta
                        </p>
                        <Button onClick={handleClose} className="mt-4">
                            Fechar
                        </Button>
                    </div>
                )}
            </DialogContent>
        </Dialog>
    );
}
