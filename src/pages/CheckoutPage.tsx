import { useState, useEffect, useRef } from 'react';
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
    ArrowLeft,
    Lock,
    BadgeCheck
} from "lucide-react";
import { Header } from "@/components/Header";
import { Footer } from "@/components/Footer";

export default function CheckoutPage() {
    const navigate = useNavigate();
    const location = useLocation();
    const { toast } = useToast();

    // Recupera dados passados pela navegação anterior ou sessionStorage
    const locationState = location.state || {};

    // Tenta recuperar do sessionStorage se não vier do state (ex: refresh)
    const savedCheckoutData = JSON.parse(sessionStorage.getItem('checkout_data') || '{}');

    // Mapeamento dos planos disponíveis
    const plansMap: Record<string, { id: string; name: string; credits: number; price: number; priceFormatted: string }> = {
        start: { id: 'start', name: 'Start', credits: 10, price: 197, priceFormatted: 'R$ 197,00' },
        essencial: { id: 'essencial', name: 'Blindagem Essencial', credits: 30, price: 497, priceFormatted: 'R$ 497,00' },
        corporativo: { id: 'corporativo', name: 'Corporativo', credits: 100, price: 1497, priceFormatted: 'R$ 1.497,00' },
    };

    // NOVO: Ler plano da URL (query parameter) - TEM PRIORIDADE sobre sessionStorage
    const urlParams = new URLSearchParams(location.search);
    const planFromUrl = urlParams.get('plan');
    const planDataFromUrl = planFromUrl ? plansMap[planFromUrl] : null;

    // Se vier plano pela URL, limpa sessionStorage para evitar conflitos
    useEffect(() => {
        if (planDataFromUrl) {
            sessionStorage.removeItem('checkout_data');
        }
    }, [planFromUrl]);

    // PRIORIDADE: URL > State > SessionStorage
    const planFromLanding = planDataFromUrl || locationState.plan || savedCheckoutData.plan;
    const isNewUserFlow = !!planDataFromUrl || locationState.isNewUser || savedCheckoutData.isNewUser || false;

    const scanResult = locationState.scanResult || savedCheckoutData.scanResult;
    const leadData = locationState.leadData || savedCheckoutData.leadData;
    const auditId = locationState.auditId || savedCheckoutData.auditId;
    const filePath = locationState.filePath || savedCheckoutData.filePath;

    // NOVO: Suporte para compra de contrato individual
    const contractFromWizard = locationState.contract || savedCheckoutData.contract;
    const isContractPurchase = locationState.isContractPurchase || savedCheckoutData.isContractPurchase;
    const formData = locationState.formData || savedCheckoutData.formData;

    // Salva no sessionStorage sempre que tiver dados novos
    useEffect(() => {
        if (location.state) {
            sessionStorage.setItem('checkout_data', JSON.stringify(location.state));
        }
    }, [location.state]);

    const [loading, setLoading] = useState(false);
    const [paymentMethod, setPaymentMethod] = useState<'credit_card' | 'pix'>('credit_card');

    // --- DADOS DO CLIENTE ---
    const [name, setName] = useState(leadData?.name || '');
    const [email, setEmail] = useState(leadData?.email || '');
    const [phone, setPhone] = useState(leadData?.phone || '');
    const [cpf, setCpf] = useState('');

    // --- DADOS DE ENDEREÇO (Necessário para Antifraude Appmax) ---
    // --- DADOS DE ENDEREÇO (Padronizado para Digital) ---
    const [cep, setCep] = useState('00000-000');
    const [street, setStreet] = useState('Produto Digital');
    const [number, setNumber] = useState('0');
    const [complement, setComplement] = useState('');
    const [neighborhood, setNeighborhood] = useState('Digital');
    const [city, setCity] = useState('Digital');
    const [state, setState] = useState('SP');

    // --- DADOS DO CARTÃO ---
    const [cardNumber, setCardNumber] = useState('');
    const [cardName, setCardName] = useState('');
    const [cardExpiry, setCardExpiry] = useState('');
    const [cardCvv, setCardCvv] = useState('');

    // --- DADOS DO PIX (Retorno da API) ---
    const [pixQrCode, setPixQrCode] = useState('');
    const [pixCopyPaste, setPixCopyPaste] = useState('');
    const [currentAuditId, setCurrentAuditId] = useState<string | null>(null);
    const [currentOrderId, setCurrentOrderId] = useState<string | null>(null);
    const [pollingActive, setPollingActive] = useState(false);
    const [timeLeft, setTimeLeft] = useState<number | null>(null);
    const pollingIntervalRef = useRef<number | null>(null);

    // --- MÁSCARAS E FORMATAÇÃO ---

    const handleCpfChange = (e: React.ChangeEvent<HTMLInputElement>) => {
        let value = e.target.value.replace(/\D/g, '');
        if (value.length > 11) value = value.slice(0, 11);

        if (value.length > 9) value = `${value.slice(0, 3)}.${value.slice(3, 6)}.${value.slice(6, 9)}-${value.slice(9)}`;
        else if (value.length > 6) value = `${value.slice(0, 3)}.${value.slice(3, 6)}.${value.slice(6)}`;
        else if (value.length > 3) value = `${value.slice(0, 3)}.${value.slice(3)}`;

        setCpf(value);
    };

    const handlePhoneChange = (e: React.ChangeEvent<HTMLInputElement>) => {
        let value = e.target.value.replace(/\D/g, '');
        if (value.length > 11) value = value.slice(0, 11);

        if (value.length > 2) value = `(${value.slice(0, 2)}) ${value.slice(2)}`;
        if (value.length > 7) value = `${value.slice(0, 9)}-${value.slice(9)}`; // Ajuste para 9 dígitos

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
        if (value.length > 2) value = `${value.slice(0, 2)}/${value.slice(2)}`;
        setCardExpiry(value);
    };

    // --- VALIDAÇÃO ---
    const isAddressValid = cep.length >= 9 && street.length > 2 && number.length > 0 && city.length > 2 && state.length === 2;
    const isPersonalValid = name.length > 3 && email.includes('@') && phone.length >= 14 && cpf.length === 14;

    // Validação do cartão
    const isCardDataValid = cardNumber.replace(/\s/g, '').length === 16 &&
        cardName.length > 3 &&
        cardExpiry.length === 5 &&
        cardCvv.length >= 3;

    const isFormValid = isPersonalValid && isAddressValid && (paymentMethod === 'pix' || isCardDataValid);

    // --- POLLING DE STATUS DO PAGAMENTO ---
    const checkPaymentStatus = async () => {
        if (!currentAuditId && !currentOrderId) return;

        console.log('Verificando status do pagamento...', { auditId: currentAuditId, orderId: currentOrderId });

        try {
            const { data, error } = await supabase.functions.invoke('check-payment-status', {
                body: {
                    audit_id: currentAuditId,
                    order_id: currentOrderId
                }
            });

            if (error) {
                console.error('Erro ao verificar status:', error);
                return;
            }

            console.log('Status recebido:', data?.payment_status);

            if (data?.payment_status === 'approved') {
                console.log('✅ Pagamento aprovado! Redirecionando...');

                // Stop polling
                setPollingActive(false);
                if (pollingIntervalRef.current) {
                    clearInterval(pollingIntervalRef.current);
                    pollingIntervalRef.current = null;
                }

                toast({
                    title: "Pagamento confirmado!",
                    description: isNewUserFlow ? "Agora crie sua conta para acessar." : "Redirecionando para o resultado...",
                });

                setTimeout(() => {
                    // NOVO: Se for novo usuário, redireciona para signup
                    if (isNewUserFlow && planFromLanding) {
                        const signupUrl = `/auth?email=${encodeURIComponent(email)}&plan=${planFromLanding.id}&payment_confirmed=true`;
                        console.log('Redirecionando novo usuário para signup:', signupUrl);
                        navigate(signupUrl);
                        return;
                    }

                    // NOVO: Se for compra de contrato, redireciona para página de sucesso do contrato
                    if (isContractPurchase && contractFromWizard) {
                        navigate('/sucesso', {
                            state: {
                                contract: contractFromWizard,
                                formData: formData
                            }
                        });
                        return;
                    }

                    // Fluxo normal: redireciona para resultado
                    const finalId = data.audit_id || currentAuditId;

                    // Validate that we have a real UUID, not a temp ID
                    if (!finalId || finalId.toString().startsWith('temp-')) {
                        console.error('ID de auditoria inválido:', finalId);
                        toast({
                            title: "Erro",
                            description: "Não foi possível gerar a auditoria. Tente novamente.",
                            variant: "destructive"
                        });
                        return;
                    }

                    console.log('Navegando para /resultado/' + finalId);
                    navigate(`/resultado/${finalId}`);
                }, 1500);
            } else if (data?.payment_status === 'rejected' || data?.payment_status === 'cancelled') {
                console.log('❌ Pagamento recusado/cancelado');

                // Stop polling
                setPollingActive(false);
                if (pollingIntervalRef.current) {
                    clearInterval(pollingIntervalRef.current);
                    pollingIntervalRef.current = null;
                }

                toast({
                    title: "Pagamento não aprovado",
                    description: "O pagamento foi recusado ou cancelado.",
                    variant: "destructive"
                });

                setPixQrCode('');
                setPixCopyPaste('');
                setLoading(false);
            }
        } catch (error) {
            console.error('Erro ao verificar status:', error);
        }
    };

    // useEffect para iniciar/parar polling
    useEffect(() => {
        if (pollingActive && currentAuditId) {
            console.log('▶️ Iniciando polling de pagamento...');

            // Check immediately
            checkPaymentStatus();

            // Then check every 3 seconds
            pollingIntervalRef.current = window.setInterval(() => {
                checkPaymentStatus();
            }, 3000);

            // Timeout after 5 minutes
            const timeout = setTimeout(() => {
                console.log('⏱️ Timeout de 5 minutos atingido');
                setPollingActive(false);
                if (pollingIntervalRef.current) {
                    clearInterval(pollingIntervalRef.current);
                    pollingIntervalRef.current = null;
                }
                toast({
                    title: "Tempo esgotado",
                    description: "O QR Code PIX expirou. Gere um novo pagamento.",
                    variant: "destructive"
                });
            }, 5 * 60 * 1000); // 5 minutes

            // Cleanup
            return () => {
                if (pollingIntervalRef.current) {
                    clearInterval(pollingIntervalRef.current);
                }
                clearTimeout(timeout);
            };
        }
    }, [pollingActive, currentAuditId]);

    // Timer countdown effect
    useEffect(() => {
        if (timeLeft === null || timeLeft <= 0) return;

        const timerId = setInterval(() => {
            setTimeLeft((prev) => (prev !== null && prev > 0 ? prev - 1 : 0));
        }, 1000);

        return () => clearInterval(timerId);
    }, [timeLeft]);

    const formatTime = (seconds: number) => {
        const m = Math.floor(seconds / 60);
        const s = seconds % 60;
        return `${m.toString().padStart(2, '0')}:${s.toString().padStart(2, '0')}`;
    };

    // Cleanup on unmount
    useEffect(() => {
        return () => {
            if (pollingIntervalRef.current) {
                clearInterval(pollingIntervalRef.current);
            }
        };
    }, []);

    // --- ENVIO DO PEDIDO ---
    const handleSubmit = async () => {
        if (!isFormValid) {
            toast({
                title: "Dados incompletos",
                description: "Por favor, preencha todos os campos obrigatórios (incluindo endereço).",
                variant: "destructive"
            });
            return;
        }

        setLoading(true);

        try {
            // 1. Limpeza de dados (Remove formatação visual)
            const cleanCpf = cpf.replace(/\D/g, '');
            const cleanPhone = phone.replace(/\D/g, '');
            const cleanCep = cep.replace(/\D/g, '');
            const cleanCardNumber = cardNumber.replace(/\D/g, '');

            // Validação de file_path apenas para auditorias (não para compra de planos ou contratos)
            if (!planFromLanding && !isContractPurchase && !filePath) {
                toast({
                    title: "Erro no arquivo",
                    description: "O arquivo do contrato não foi encontrado. Por favor, refaça o upload.",
                    variant: "destructive"
                });
                setLoading(false);
                return;
            }

            // 2. Preparar Payload Base
            const payload: any = {
                customer: {
                    name,
                    email,
                    phone: cleanPhone,
                    cpf: cleanCpf,
                    address: {
                        zip_code: cleanCep,
                        street: street,
                        number: number,
                        complement: complement,
                        district: neighborhood,
                        city: city,
                        state: state
                    }
                },
                payment_method: paymentMethod,
                audit_id: auditId || 'temp-' + Date.now(),
                file_path: filePath, // Caminho do arquivo para auditoria premium
                installments: 1, // Padrão 1x (adicione um select na UI se quiser mudar)
                is_audit_purchase: !planFromLanding && !isContractPurchase, // Sinaliza que é uma auditoria avulsa

                // NOVO: Adicionar dados do plano se for compra de créditos
                ...(planFromLanding && {
                    plan_id: planFromLanding.id,
                    amount: planFromLanding.price,
                    credits: planFromLanding.credits,
                    plan_name: planFromLanding.name
                }),

                // NOVO: Adicionar dados do contrato se for compra individual
                ...(isContractPurchase && contractFromWizard && {
                    contract_id: contractFromWizard.id,
                    amount: contractFromWizard.price,
                    contract_name: contractFromWizard.title,
                    type: 'contract_purchase',
                    form_data: formData
                })
            };

            // 3. Adicionar dados específicos de Cartão
            if (paymentMethod === 'credit_card') {
                const [month, year] = cardExpiry.split('/'); // Separa 12/25 em 12 e 25

                payload.card_data = {
                    number: cleanCardNumber,
                    name: cardName,
                    month: month,
                    year: year,
                    cvv: cardCvv,
                    document_number: cleanCpf // Appmax exige CPF do titular
                };
            }

            // 4. Chamada ao Supabase Edge Function
            console.log('========================================');
            console.log('ENVIANDO PAGAMENTO PARA APPMAX');
            console.log('========================================');
            console.log('Método de Pagamento:', paymentMethod);
            console.log('Payload enviado:', JSON.stringify(payload, null, 2));

            const { data, error } = await supabase.functions.invoke('create-appmax-order', {
                body: payload
            });

            console.log('Resposta recebida:', JSON.stringify({ data, error }, null, 2));

            if (error) {
                console.error('Erro na chamada da Edge Function:', error);
                throw error;
            }
            if (!data || !data.success) {
                console.error('Erro no processamento:', data);
                throw new Error(data?.error || 'Erro desconhecido ao processar pagamento');
            }

            // --- TRATAMENTO DO RETORNO ---
            console.log('Success:', data.success);
            console.log('Payment Success:', data.payment_success);
            console.log('PIX Data:', data.pix_data);
            console.log('Audit ID retornado:', data.audit_id);

            //Update audit ID from backend if provided
            if (data.audit_id) {
                console.log('Atualizando currentAuditId de', currentAuditId, 'para', data.audit_id);
                setCurrentAuditId(data.audit_id);
            }

            // PIX gerado
            if (data.pix_data) {
                console.log('✓ PIX gerado com sucesso!');
                console.log('QR Code URL:', data.pix_data.qr_code_url || data.pix_data.qr_code);
                console.log('Copy/Paste:', data.pix_data.qr_code_text || data.pix_data.copy_paste);

                setPixQrCode(data.pix_data.qr_code_url || data.pix_data.qr_code);
                setPixCopyPaste(data.pix_data.qr_code_text || data.pix_data.copy_paste);

                // Start polling
                if (data.order_id) {
                    setCurrentOrderId(data.order_id);
                }

                if (data.audit_id) {
                    console.log('Iniciando polling para Audit ID:', data.audit_id);
                    setCurrentAuditId(data.audit_id);
                    setPollingActive(true);
                } else if (auditId) {
                    setCurrentAuditId(auditId);
                    setPollingActive(true);
                } else {
                    console.warn('Audit ID não disponível para polling');
                }

                setLoading(false);
                setTimeLeft(15 * 60); // 15 minutos em segundos
                toast({
                    title: "PIX gerado!",
                    description: "Escaneie o QR Code para finalizar.",
                });
            }
            // Cartão Aprovado
            else if (data.payment_success) {
                console.log('✓ Pagamento com cartão aprovado');
                toast({
                    title: "Pagamento aprovado!",
                    description: isNewUserFlow ? "Agora crie sua conta para acessar." : "Sua auditoria foi liberada.",
                });
                setTimeout(() => {
                    // NOVO: Se for novo usuário, redireciona para signup
                    if (isNewUserFlow && planFromLanding) {
                        const signupUrl = `/auth?email=${encodeURIComponent(email)}&plan=${planFromLanding.id}&payment_confirmed=true`;
                        console.log('Redirecionando novo usuário para signup:', signupUrl);
                        navigate(signupUrl);
                        return;
                    }

                    // NOVO: Se for compra de contrato, redireciona para página de sucesso do contrato
                    if (isContractPurchase && contractFromWizard) {
                        navigate('/sucesso', {
                            state: {
                                contract: contractFromWizard,
                                formData: formData
                            }
                        });
                        return;
                    }

                    // Fluxo normal: redireciona para resultado
                    const finalId = data.audit_id || auditId;

                    // Validate that we have a real UUID, not a temp ID
                    if (!finalId || finalId.toString().startsWith('temp-')) {
                        console.error('ID de auditoria inválido:', finalId);
                        toast({
                            title: "Erro",
                            description: "Não foi possível gerar a auditoria. Tente novamente.",
                            variant: "destructive"
                        });
                        return;
                    }

                    console.log('Navegando para /resultado/' + finalId);
                    navigate(`/resultado/${finalId}`);
                }, 2000);
            }
            // Cartão precisa de 3DS ou redirecionamento
            else if (data.checkout_url) {
                console.log('→ Redirecionando para checkout URL:', data.checkout_url);
                window.location.href = data.checkout_url;
            }
            // Cartão Recusado
            else if (paymentMethod === 'credit_card' && !data.payment_success) {
                console.log('❌ Pagamento recusado imediatamente');
                toast({
                    title: "Pagamento não aprovado",
                    description: data.error_message || "O pagamento foi recusado pelo banco.",
                    variant: "destructive"
                });
                setLoading(false);
            } else {
                console.error('✗ Estado de pagamento não reconhecido. Data recebida:', data);
                throw new Error('Estado de pagamento não reconhecido');
            }

        } catch (error: any) {
            console.error('Erro no checkout:', error);
            toast({
                title: "Erro no pagamento",
                description: error.message || "Verifique os dados e tente novamente.",
                variant: "destructive"
            });
            setLoading(false);
        }
    };

    const copyPixCode = () => {
        navigator.clipboard.writeText(pixCopyPaste);
        toast({
            title: "Código copiado!",
            description: "Cole no app do seu banco.",
        });
    };

    // Fallback se não houver sessão E não for compra de plano OU contrato
    if (!scanResult && !auditId && !planFromLanding && !isContractPurchase) {
        return (
            <div className="min-h-screen flex items-center justify-center bg-background">
                <Card className="max-w-md text-center p-6">
                    <h2 className="text-xl font-bold mb-2">Sessão expirada</h2>
                    <p className="text-muted-foreground mb-4">Inicie uma nova análise para continuar.</p>
                    <Button onClick={() => navigate('/')} className="w-full">Voltar ao Início</Button>
                </Card>
            </div>
        );
    }

    return (
        <div className="min-h-screen bg-slate-50 flex flex-col">
            <Header />
            <div className="flex-1 py-12 px-4">
                <div className="max-w-4xl mx-auto">
                    {/* Header Page Title */}
                    <div className="mb-8">
                        <Button variant="ghost" onClick={() => navigate(-1)} className="mb-4 pl-0 hover:pl-2 transition-all">
                            <ArrowLeft className="h-4 w-4 mr-2" /> Voltar
                        </Button>
                        <h1 className="text-3xl font-bold text-slate-900">Finalizar Pagamento</h1>
                        <p className="text-slate-600 mt-2">Dados seguros e criptografados.</p>
                    </div>

                    <div className="grid md:grid-cols-3 gap-6">

                        {/* Coluna da Esquerda: Resumo */}
                        <div className="md:col-span-1">
                            <Card className="sticky top-6">
                                <CardHeader>
                                    <CardTitle className="text-lg">Resumo do Pedido</CardTitle>
                                </CardHeader>
                                <CardContent className="space-y-4">
                                    <div className="flex items-start gap-3 p-3 bg-primary/5 rounded-lg">
                                        <ShieldCheck className="h-5 w-5 text-primary shrink-0 mt-0.5" />
                                        <div>
                                            <p className="font-semibold text-sm">
                                                {planFromLanding ? `Plano ${planFromLanding.name}` :
                                                    isContractPurchase && contractFromWizard ? contractFromWizard.title :
                                                        'Auditoria Jurídica Premium'}
                                            </p>
                                            <p className="text-xs text-muted-foreground">
                                                {planFromLanding ? `${planFromLanding.credits} créditos` :
                                                    isContractPurchase ? 'Emissão de Contrato Completo' :
                                                        'Laudo Completo + PDF'}
                                            </p>
                                        </div>
                                    </div>
                                    <div className="border-t pt-4 space-y-2">
                                        <div className="flex justify-between font-bold text-lg">
                                            <span>Total</span>
                                            <span className="text-primary">
                                                {planFromLanding ? planFromLanding.priceFormatted :
                                                    isContractPurchase && contractFromWizard ? `R$ ${contractFromWizard.price.toLocaleString('pt-BR', { minimumFractionDigits: 2 })}` :
                                                        'R$ 147,00'}
                                            </span>
                                        </div>
                                    </div>
                                    <div className="bg-emerald-50 border border-emerald-200 rounded-lg p-3 flex items-center gap-2 text-emerald-700 font-semibold text-xs">
                                        <CheckCircle2 className="h-4 w-4" />
                                        Ambiente 100% Seguro
                                    </div>
                                </CardContent>
                            </Card>
                        </div>

                        {/* Coluna da Direita: Formulários */}
                        <div className="md:col-span-2 space-y-6">

                            {/* 1. Dados Pessoais */}
                            <Card>
                                <CardHeader>
                                    <CardTitle>Dados Pessoais</CardTitle>
                                </CardHeader>
                                <CardContent className="space-y-4">
                                    <div className="grid md:grid-cols-2 gap-4">
                                        <div className="space-y-2">
                                            <Label>Nome Completo</Label>
                                            <Input value={name} onChange={(e) => setName(e.target.value)} placeholder="Seu nome" />
                                        </div>
                                        <div className="space-y-2">
                                            <Label>CPF</Label>
                                            <Input value={cpf} onChange={handleCpfChange} placeholder="000.000.000-00" maxLength={14} />
                                        </div>
                                    </div>
                                    <div className="grid md:grid-cols-2 gap-4">
                                        <div className="space-y-2">
                                            <Label>E-mail</Label>
                                            <Input type="email" value={email} onChange={(e) => setEmail(e.target.value)} placeholder="seu@email.com" />
                                        </div>
                                        <div className="space-y-2">
                                            <Label>Telefone (WhatsApp)</Label>
                                            <Input value={phone} onChange={handlePhoneChange} placeholder="(00) 00000-0000" maxLength={15} />
                                        </div>
                                    </div>
                                </CardContent>
                            </Card>

                            {/* 3. Pagamento */}
                            <Card>
                                <CardHeader>
                                    <CardTitle>Forma de Pagamento</CardTitle>
                                </CardHeader>
                                <CardContent>
                                    <Tabs value={paymentMethod} onValueChange={(v) => setPaymentMethod(v as any)}>
                                        <TabsList className="grid w-full grid-cols-2 mb-6">
                                            <TabsTrigger value="credit_card">
                                                <CreditCard className="h-4 w-4 mr-2" /> Cartão de Crédito
                                            </TabsTrigger>
                                            <TabsTrigger value="pix">
                                                <QrCode className="h-4 w-4 mr-2" /> PIX
                                            </TabsTrigger>
                                        </TabsList>

                                        <TabsContent value="credit_card" className="space-y-4">
                                            <div className="space-y-2">
                                                <Label>Número do Cartão</Label>
                                                <Input value={cardNumber} onChange={handleCardNumberChange} placeholder="0000 0000 0000 0000" maxLength={19} />
                                            </div>
                                            <div className="space-y-2">
                                                <Label>Nome Impresso no Cartão</Label>
                                                <Input value={cardName} onChange={(e) => setCardName(e.target.value.toUpperCase())} placeholder="NOME COMO NO CARTÃO" />
                                            </div>
                                            <div className="grid grid-cols-2 gap-4">
                                                <div className="space-y-2">
                                                    <Label>Validade (MM/AA)</Label>
                                                    <Input value={cardExpiry} onChange={handleExpiryChange} placeholder="MM/AA" maxLength={5} />
                                                </div>
                                                <div className="space-y-2">
                                                    <Label>CVV</Label>
                                                    <Input value={cardCvv} onChange={(e) => setCardCvv(e.target.value.replace(/\D/g, ''))} placeholder="123" maxLength={4} />
                                                </div>
                                            </div>
                                        </TabsContent>

                                        <TabsContent value="pix">
                                            <div className="flex flex-col items-center space-y-4 p-4 border rounded-lg bg-slate-50">
                                                {pixQrCode ? (
                                                    <>
                                                        <div className="bg-white p-2 rounded-lg shadow-sm">
                                                            <img
                                                                src={pixQrCode.startsWith('http') ? pixQrCode : `data:image/jpeg;base64,${pixQrCode.replace(/\s/g, '')}`}
                                                                onError={(e) => {
                                                                    // Fallback para gerador de QR Code externo se a imagem da Appmax falhar
                                                                    e.currentTarget.src = `https://api.qrserver.com/v1/create-qr-code/?size=200x200&data=${encodeURIComponent(pixCopyPaste)}`;
                                                                }}
                                                                alt="QR Code PIX"
                                                                className="w-48 h-48"
                                                            />
                                                        </div>
                                                        <div className="flex items-center gap-2 w-full max-w-sm">
                                                            <Input value={pixCopyPaste} readOnly className="font-mono text-xs" />
                                                            <Button size="icon" variant="outline" onClick={() => {
                                                                navigator.clipboard.writeText(pixCopyPaste);
                                                                toast({ title: "Copiado!" });
                                                            }}>
                                                                <Copy className="h-4 w-4" />
                                                            </Button>
                                                        </div>

                                                        {timeLeft !== null && (
                                                            <div className="text-center space-y-1">
                                                                <p className="text-sm text-muted-foreground">Tempo restante para pagar:</p>
                                                                <p className={`text-xl font-bold font-mono ${timeLeft < 60 ? 'text-red-500' : 'text-slate-700'}`}>
                                                                    {formatTime(timeLeft)}
                                                                </p>
                                                            </div>
                                                        )}

                                                        <div className="flex items-center gap-2 text-sm text-emerald-600 font-medium animate-pulse">
                                                            <div className="w-2 h-2 bg-emerald-600 rounded-full" />
                                                            Aguardando pagamento...
                                                        </div>
                                                    </>
                                                ) : (
                                                    <div className="text-center text-muted-foreground py-8">
                                                        <QrCode className="h-12 w-12 mx-auto mb-2 opacity-20" />
                                                        <p>O QR Code será gerado após clicar em Pagar</p>
                                                    </div>
                                                )}
                                            </div>
                                        </TabsContent>
                                    </Tabs>

                                    <Button
                                        className="w-full mt-6 h-12 text-lg font-bold"
                                        size="lg"
                                        onClick={handleSubmit}
                                        disabled={loading || !isFormValid}
                                    >
                                        {loading ? (
                                            <>
                                                <Loader2 className="mr-2 h-5 w-5 animate-spin" /> Processando...
                                            </>
                                        ) : (
                                            `Pagar ${planFromLanding ? planFromLanding.priceFormatted :
                                                isContractPurchase && contractFromWizard ? `R$ ${contractFromWizard.price.toLocaleString('pt-BR', { minimumFractionDigits: 2 })}` :
                                                    'R$ 147,00'}`
                                        )}
                                    </Button>

                                    {/* Selos de Segurança */}
                                    <div className="mt-6 pt-6 border-t border-slate-100">
                                        <div className="flex flex-col gap-4">
                                            <div className="flex items-center justify-center gap-6 text-slate-500 opacity-80">
                                                <div className="flex flex-col items-center gap-1">
                                                    <BadgeCheck className="h-6 w-6 text-emerald-600" />
                                                    <span className="text-[10px] font-medium text-center uppercase tracking-wider">Compra<br />Segura</span>
                                                </div>
                                                <div className="flex flex-col items-center gap-1">
                                                    <Lock className="h-6 w-6 text-slate-600" />
                                                    <span className="text-[10px] font-medium text-center uppercase tracking-wider">Dados<br />Protegidos</span>
                                                </div>
                                                <div className="flex flex-col items-center gap-1">
                                                    <ShieldCheck className="h-6 w-6 text-blue-600" />
                                                    <span className="text-[10px] font-medium text-center uppercase tracking-wider">Privacidade<br />Garantida</span>
                                                </div>
                                            </div>

                                            <div className="flex items-center justify-center gap-2 text-xs text-slate-400 bg-slate-50 p-2 rounded">
                                                <Lock className="h-3 w-3" />
                                                <span>Pagamento processado em ambiente criptografado (256-bit SSL).</span>
                                            </div>
                                        </div>
                                    </div>

                                    <div className="mt-4 flex justify-center gap-4 opacity-50 grayscale">
                                        {/* Ícones ilustrativos de bandeiras */}
                                        <div className="h-6 w-8 bg-slate-300 rounded"></div>
                                        <div className="h-6 w-8 bg-slate-300 rounded"></div>
                                        <div className="h-6 w-8 bg-slate-300 rounded"></div>
                                    </div>
                                </CardContent>
                            </Card>
                        </div>
                    </div>
                </div>
            </div>
            <Footer />
        </div>
    );
}