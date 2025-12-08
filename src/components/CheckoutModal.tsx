import { Dialog, DialogContent, DialogDescription, DialogHeader, DialogTitle } from "@/components/ui/dialog";
import { Button } from "@/components/ui/button";
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { RadioGroup, RadioGroupItem } from "@/components/ui/radio-group";
import { Check, CreditCard, Loader2, QrCode, ArrowLeft, Copy, User, Lock, Mail, Phone, FileText } from "lucide-react";
import { useState, useEffect } from "react";
import { useCredits } from "@/contexts/CreditContext";
import { useAuth } from "@/contexts/AuthContext";
import { toast } from "sonner";
import { supabase } from "@/lib/supabase";

interface PlanData {
    name: string;
    credits: number;
    price: number;
    priceFormatted: string;
    features: string[];
    popular?: boolean;
}

interface CheckoutModalProps {
    open?: boolean;
    onOpenChange?: (open: boolean) => void;
    initialPlan?: PlanData | null;
}

type Step = 'payment' | 'processing' | 'success';
type PaymentMethod = 'pix' | 'credit_card';

export function CheckoutModal({ open, onOpenChange, initialPlan }: CheckoutModalProps) {
    const { addCredits } = useCredits();
    const { user } = useAuth();
    const [loading, setLoading] = useState(false);
    const [step, setStep] = useState<Step>('payment');
    const [paymentMethod, setPaymentMethod] = useState<PaymentMethod>('credit_card');
    const [qrCodeData, setQrCodeData] = useState<string>('');
    const [pixCode, setPixCode] = useState<string>('');
    const [orderId, setOrderId] = useState<string>('');
    const [pixExpiryTime, setPixExpiryTime] = useState<number | null>(null);
    const [timeRemaining, setTimeRemaining] = useState<number | null>(null);

    const [customerData, setCustomerData] = useState({
        name: '',
        email: '',
        cpf: '',
        phone: ''
    });

    // Format helpers
    const formatCPF = (value: string) => {
        return value
            .replace(/\D/g, '')
            .replace(/(\d{3})(\d)/, '$1.$2')
            .replace(/(\d{3})(\d)/, '$1.$2')
            .replace(/(\d{3})(\d{1,2})/, '$1-$2')
            .replace(/(-\d{2})\d+?$/, '$1');
    };

    const formatPhone = (value: string) => {
        return value
            .replace(/\D/g, '')
            .replace(/(\d{2})(\d)/, '($1) $2')
            .replace(/(\d{5})(\d)/, '$1-$2')
            .replace(/(-\d{4})\d+?$/, '$1');
    };

    const [cardData, setCardData] = useState({
        number: '',
        expiry: '',
        cvv: '',
        holderName: ''
    });

    // Fetch user profile data on mount/open
    // Fetch user profile data on mount/open
    useEffect(() => {
        if (open && user) {
            const fetchProfile = async () => {
                const { data, error } = await supabase
                    .from('profiles')
                    .select('*')
                    .eq('id', user.id)
                    .single();

                if (!error && data) {
                    setCustomerData(prev => ({
                        name: user.name || data.name || '',
                        email: user.email || '',
                        cpf: data.cpf || prev.cpf || '',
                        phone: data.phone || prev.phone || ''
                    }));
                } else {
                    // Fallback to auth data
                    setCustomerData(prev => ({
                        ...prev,
                        name: user.name || '',
                        email: user.email || ''
                    }));
                }
            };
            fetchProfile();
        }
    }, [open]);

    useEffect(() => {
        if (!open) {
            resetModal();
        }
    }, [open]);

    const handlePaymentSubmit = async (e: React.FormEvent) => {
        e.preventDefault();
        if (!initialPlan) return;

        // Basic Formatting Validation
        const cleanCPF = customerData.cpf.replace(/\D/g, '');
        const cleanPhone = customerData.phone.replace(/\D/g, '');

        if (cleanCPF.length !== 11) {
            toast.error('CPF inválido. Verifique os números.');
            return;
        }
        if (cleanPhone.length < 10) {
            toast.error('Telefone inválido. Inclua o DDD.');
            return;
        }

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
                audit_id: 'temp-credit-' + Date.now(),
                amount: initialPlan.price,
                credits: initialPlan.credits,
                plan_name: initialPlan.name,
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

            console.log('Enviando pagamento:', payload);

            const { data, error } = await supabase.functions.invoke('create-appmax-order', {
                body: payload
            });

            console.log('Resposta recebida:', data);

            if (error) throw error;

            if (data.error) throw new Error(data.error);

            if (paymentMethod === 'pix') {
                if (data.pix_data) {
                    const qrCode = data.pix_data.qr_code_url || data.pix_data.qr_code;
                    const copyPaste = data.pix_data.qr_code_text || data.pix_data.copy_paste;

                    setQrCodeData(qrCode);
                    setPixCode(copyPaste);
                    setOrderId(data.order_id);
                    setStep('processing');
                    setLoading(false);

                    const expiry = Date.now() + 15 * 60 * 1000; // 15 minutes
                    setPixExpiryTime(expiry);
                    setTimeRemaining(15 * 60);

                    startPaymentPolling(data.order_id);
                } else {
                    throw new Error('Dados PIX não retornados pela API');
                }
            } else {
                if (data.payment_success && data.payment_status === 'approved') {
                    addCredits(initialPlan.credits);
                    setStep('success');
                    toast.success(`${initialPlan.credits} créditos adicionados!`);
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

                if (data.status === 'approved' && initialPlan) {
                    clearInterval(interval);
                    addCredits(initialPlan.credits);
                    setStep('success');
                    toast.success(`${initialPlan.credits} créditos adicionados!`);
                } else if (data.status === 'failed') {
                    clearInterval(interval);
                    toast.error('Pagamento não aprovado');
                    setStep('payment');
                }
            } catch (error) {
                console.error('Erro ao verificar status:', error);
            }
        }, 3000);

        setTimeout(() => clearInterval(interval), 300000);
    };

    const resetModal = () => {
        setStep('payment');
        setPaymentMethod('credit_card');
        setQrCodeData('');
        setPixCode('');
        setOrderId('');
        setCardData({ number: '', expiry: '', cvv: '', holderName: '' });
    };

    const handleClose = () => {
        resetModal();
        onOpenChange?.(false);
    };



    // Timer Effect
    useEffect(() => {
        if (!pixExpiryTime) return;

        const interval = setInterval(() => {
            const now = Date.now();
            const diff = Math.max(0, Math.ceil((pixExpiryTime - now) / 1000));
            setTimeRemaining(diff);

            if (diff <= 0) {
                clearInterval(interval);
            }
        }, 1000);

        return () => clearInterval(interval);
    }, [pixExpiryTime]);

    const formatTime = (seconds: number) => {
        const m = Math.floor(seconds / 60);
        const s = seconds % 60;
        return `${m.toString().padStart(2, '0')}:${s.toString().padStart(2, '0')}`;
    };

    const handleRegeneratePix = () => {
        setQrCodeData('');
        setPixCode('');
        setOrderId('');
        setPixExpiryTime(null);
        setTimeRemaining(null);
        handlePaymentSubmit({ preventDefault: () => { } } as React.FormEvent);
    };

    if (!initialPlan) return null;


    // ... inside handlePaymentSubmit, success block for PIX:
    /*
        setQrCodeData(qrCode);
        setPixCode(copyPaste);
        setOrderId(data.order_id);
        const expiry = Date.now() + 15 * 60 * 1000; // 15 minutes
        setPixExpiryTime(expiry); 
        setTimeRemaining(15 * 60);
        setStep('processing');
    */

    // ... UI render replacement for PIX block
    /*
        {/* Timer UI *}
        {timeRemaining !== null && (
            <div className={`text-center font-mono text-lg font-bold mb-4 ${timeRemaining < 120 ? 'text-red-500 animate-pulse' : 'text-primary'}`}>
                Expira em: {formatTime(timeRemaining)}
            </div>
        )}

        {timeRemaining === 0 ? (
           // Expired View
           <div className="flex flex-col items-center justify-center space-y-4">
               <div className="h-48 w-48 bg-gray-100 rounded-lg flex items-center justify-center relative overflow-hidden">
                   <QrCode className="h-16 w-16 text-gray-300" />
                   <div className="absolute inset-0 bg-white/80 flex items-center justify-center backdrop-blur-sm">
                       <span className="text-red-500 font-bold">Expirado</span>
                   </div>
               </div>
               <p className="text-center text-sm text-muted-foreground">
                   Este código PIX expirou. Gere um novo para continuar.
               </p>
               <Button onClick={handleRegeneratePix} className="w-full">
                   Gerar Novo Código
               </Button>
           </div>
        ) : (
           // Normal QR Code View
           // ... existing QR code render ...
        )}
    */

    // To apply this correctly I will replace the component body parts.

    return (
        <Dialog open={open} onOpenChange={handleClose}>
            <DialogContent className="sm:max-w-[900px] p-0 overflow-hidden bg-background">
                {step === 'success' ? (
                    <div className="flex flex-col items-center justify-center py-16 space-y-6">
                        <div className="h-20 w-20 bg-green-100 rounded-full flex items-center justify-center">
                            <Check className="h-10 w-10 text-green-600" />
                        </div>
                        <div className="text-center space-y-2">
                            <h3 className="text-2xl font-bold">Pagamento Confirmado!</h3>
                            <p className="text-muted-foreground text-lg">
                                {initialPlan.credits} créditos foram adicionados à sua conta
                            </p>
                        </div>
                        <Button onClick={handleClose} size="lg" className="min-w-[200px]">
                            Fechar
                        </Button>
                    </div>
                ) : (
                    <div className="grid md:grid-cols-2 h-full max-h-[90vh]">
                        {/* Esquerda: Dados e Resumo */}
                        <div className="bg-muted/30 p-8 border-r overflow-y-auto">
                            <div className="space-y-8">
                                <div>
                                    <h3 className="text-lg font-semibold mb-1">Dados Cadastrais</h3>
                                    <p className="text-sm text-muted-foreground mb-6">Confirme seus dados para a nota fiscal</p>

                                    <div className="space-y-4">
                                        <div className="space-y-2">
                                            <Label className="flex items-center gap-2 text-muted-foreground">
                                                <User className="h-4 w-4" /> Nome Completo
                                            </Label>
                                            <div className="font-medium p-2 bg-background rounded-md border text-sm">
                                                {customerData.name || user?.name || 'Não informado'}
                                            </div>
                                        </div>
                                        <div className="space-y-2">
                                            <Label className="flex items-center gap-2 text-muted-foreground">
                                                <Mail className="h-4 w-4" /> Email
                                            </Label>
                                            <div className="font-medium p-2 bg-background rounded-md border text-sm">
                                                {customerData.email || user?.email}
                                            </div>
                                        </div>
                                        <div className="grid grid-cols-2 gap-4">
                                            <div className="space-y-2">
                                                <Label className="flex items-center gap-2 text-muted-foreground">
                                                    <FileText className="h-4 w-4" /> CPF
                                                </Label>
                                                <Input
                                                    value={customerData.cpf}
                                                    onChange={e => setCustomerData(prev => ({ ...prev, cpf: formatCPF(e.target.value) }))}
                                                    placeholder="000.000.000-00"
                                                    className="bg-white"
                                                    maxLength={14}
                                                />
                                            </div>
                                            <div className="space-y-2">
                                                <Label className="flex items-center gap-2 text-muted-foreground">
                                                    <Phone className="h-4 w-4" /> Telefone
                                                </Label>
                                                <Input
                                                    value={customerData.phone}
                                                    onChange={e => setCustomerData(prev => ({ ...prev, phone: formatPhone(e.target.value) }))}
                                                    placeholder="(00) 00000-0000"
                                                    className="bg-white"
                                                    maxLength={15}
                                                />
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div className="pt-6 border-t">
                                    <h3 className="text-lg font-semibold mb-4">Resumo do Pedido</h3>
                                    <Card className="bg-background shadow-sm">
                                        <CardContent className="p-4">
                                            <div className="flex justify-between items-start mb-2">
                                                <div>
                                                    <span className="font-semibold block">{initialPlan.name}</span>
                                                    <span className="text-sm text-muted-foreground">{initialPlan.credits} créditos de análise</span>
                                                </div>
                                                <span className="font-bold text-lg">{initialPlan.priceFormatted}</span>
                                            </div>
                                            <div className="text-xs text-muted-foreground bg-blue-50 text-blue-700 p-2 rounded flex items-center gap-2 mt-4">
                                                <Lock className="h-3 w-3" />
                                                Pagamento 100% seguro via Appmax
                                            </div>
                                        </CardContent>
                                    </Card>
                                </div>
                            </div>
                        </div>

                        {/* Direita: Pagamento */}
                        <div className="p-8 overflow-y-auto bg-white">
                            <div className="space-y-6">
                                <div>
                                    <h3 className="text-lg font-semibold mb-1">Pagamento</h3>
                                    <p className="text-sm text-muted-foreground">Escolha como deseja pagar</p>
                                </div>

                                {step === 'processing' && paymentMethod === 'pix' ? (
                                    <div className="flex flex-col items-center justify-center py-4 space-y-4 animate-in fade-in">

                                        {/* Timer UI */}
                                        {timeRemaining !== null && timeRemaining > 0 && (
                                            <div className={`text-center font-mono text-2xl font-bold ${timeRemaining < 120 ? 'text-red-500 animate-pulse' : 'text-primary'}`}>
                                                {formatTime(timeRemaining)}
                                            </div>
                                        )}

                                        {timeRemaining === 0 ? (
                                            <div className="flex flex-col items-center justify-center space-y-4 w-full">
                                                <div className="h-48 w-48 bg-gray-100 rounded-lg flex items-center justify-center relative overflow-hidden border">
                                                    <QrCode className="h-16 w-16 text-gray-300" />
                                                    <div className="absolute inset-0 bg-white/90 flex flex-col items-center justify-center backdrop-blur-sm z-10">
                                                        <span className="text-red-500 font-bold mb-2">PIX Expirado</span>
                                                        <span className="text-xs text-muted-foreground px-4 text-center">Gere um novo código para pagar</span>
                                                    </div>
                                                </div>
                                                <Button onClick={handleRegeneratePix} className="w-full">
                                                    Gerar Novo Código
                                                </Button>
                                            </div>
                                        ) : (
                                            <>
                                                <div className="bg-white p-4 rounded-lg border shadow-sm">
                                                    {qrCodeData ? (
                                                        <img src={qrCodeData} alt="QR Code PIX" className="w-48 h-48" />
                                                    ) : (
                                                        <div className="w-48 h-48 flex items-center justify-center bg-gray-100 rounded-lg">
                                                            <Loader2 className="h-8 w-8 animate-spin text-muted-foreground" />
                                                        </div>
                                                    )}
                                                </div>
                                                <p className="text-center text-sm text-muted-foreground">
                                                    Abra seu app do banco e escaneie o QR Code
                                                </p>

                                                {pixCode && (
                                                    <div className="w-full">
                                                        <div className="flex items-center gap-2 w-full">
                                                            <Input value={pixCode} readOnly className="font-mono text-xs" />
                                                            <Button size="icon" variant="outline" onClick={() => {
                                                                navigator.clipboard.writeText(pixCode);
                                                                toast.success("Código PIX copiado!");
                                                            }}>
                                                                <Copy className="h-4 w-4" />
                                                            </Button>
                                                        </div>
                                                    </div>
                                                )}

                                                <div className="flex items-center justify-center gap-2 text-sm text-primary animate-pulse">
                                                    <Loader2 className="h-4 w-4 animate-spin" />
                                                    Aguardando confirmação...
                                                </div>
                                            </>
                                        )}
                                    </div>
                                ) : (
                                    <form onSubmit={handlePaymentSubmit} className="space-y-6">
                                        <RadioGroup value={paymentMethod} onValueChange={(value) => setPaymentMethod(value as PaymentMethod)} className="grid grid-cols-2 gap-4">
                                            <div className={`flex flex-col items-center justify-center p-4 rounded-xl border-2 cursor-pointer transition-all ${paymentMethod === 'credit_card' ? 'border-primary bg-primary/5 text-primary' : 'border-muted hover:border-primary/50'}`} onClick={() => setPaymentMethod('credit_card')}>
                                                <CreditCard className="h-6 w-6 mb-2" />
                                                <span className="font-medium text-sm">Cartão de Crédito</span>
                                                <span className="text-xs text-muted-foreground">Em até 12x</span>
                                            </div>
                                            <div className={`flex flex-col items-center justify-center p-4 rounded-xl border-2 cursor-pointer transition-all ${paymentMethod === 'pix' ? 'border-primary bg-primary/5 text-primary' : 'border-muted hover:border-primary/50'}`} onClick={() => setPaymentMethod('pix')}>
                                                <QrCode className="h-6 w-6 mb-2" />
                                                <span className="font-medium text-sm">PIX</span>
                                                <span className="text-xs text-muted-foreground">Aprovação imediata</span>
                                            </div>
                                        </RadioGroup>

                                        {paymentMethod === 'credit_card' && (
                                            <div className="space-y-4 pt-2 animate-in slide-in-from-top-2">
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
                                                            maxLength={5}
                                                        />
                                                    </div>
                                                    <div className="space-y-2">
                                                        <Label htmlFor="cvv">CVV</Label>
                                                        <Input
                                                            id="cvv"
                                                            value={cardData.cvv}
                                                            onChange={(e) => setCardData({ ...cardData, cvv: e.target.value })}
                                                            placeholder="123"
                                                            required
                                                            maxLength={4}
                                                        />
                                                    </div>
                                                </div>
                                                <div className="space-y-2">
                                                    <Label htmlFor="holderName">Nome no Cartão</Label>
                                                    <Input
                                                        id="holderName"
                                                        value={cardData.holderName}
                                                        onChange={(e) => setCardData({ ...cardData, holderName: e.target.value })}
                                                        placeholder="Ex: JOAO S SILVA"
                                                        required
                                                    />
                                                </div>
                                            </div>
                                        )}

                                        <Button type="submit" className="w-full h-12 text-base shadow-lg" disabled={loading || (!customerData.cpf && !user)}>
                                            {loading ? <Loader2 className="h-5 w-5 animate-spin mr-2" /> : `Pagar ${initialPlan.priceFormatted}`}
                                        </Button>

                                        <p className="text-xs text-center text-muted-foreground">
                                            Ao confirmar, você concorda com nossos termos de serviço.
                                        </p>
                                    </form>
                                )}
                            </div>
                        </div>
                    </div>
                )}
            </DialogContent>
        </Dialog>
    );
}
