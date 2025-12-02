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
    ArrowLeft,
    MapPin
} from "lucide-react";

export default function CheckoutPage() {
    const navigate = useNavigate();
    const location = useLocation();
    const { toast } = useToast();

    // Recupera dados passados pela navegação anterior
    const { scanResult, leadData, auditId } = location.state || {};

    const [loading, setLoading] = useState(false);
    const [paymentMethod, setPaymentMethod] = useState<'credit_card' | 'pix'>('credit_card');

    // --- DADOS DO CLIENTE ---
    const [name, setName] = useState(leadData?.name || '');
    const [email, setEmail] = useState(leadData?.email || '');
    const [phone, setPhone] = useState(leadData?.phone || '');
    const [cpf, setCpf] = useState('');

    // --- DADOS DE ENDEREÇO (Necessário para Antifraude Appmax) ---
    const [cep, setCep] = useState('');
    const [street, setStreet] = useState('');
    const [number, setNumber] = useState('');
    const [complement, setComplement] = useState('');
    const [neighborhood, setNeighborhood] = useState('');
    const [city, setCity] = useState('');
    const [state, setState] = useState('');

    // --- DADOS DO CARTÃO ---
    const [cardNumber, setCardNumber] = useState('');
    const [cardName, setCardName] = useState('');
    const [cardExpiry, setCardExpiry] = useState('');
    const [cardCvv, setCardCvv] = useState('');

    // --- DADOS DO PIX (Retorno da API) ---
    const [pixQrCode, setPixQrCode] = useState('');
    const [pixCopyPaste, setPixCopyPaste] = useState('');

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

    const handleCepChange = (e: React.ChangeEvent<HTMLInputElement>) => {
        let value = e.target.value.replace(/\D/g, '');
        if (value.length > 8) value = value.slice(0, 8);
        if (value.length > 5) value = `${value.slice(0, 5)}-${value.slice(5)}`;
        setCep(value);
        // Aqui você poderia adicionar uma chamada de API para buscar o CEP automaticamente
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
                installments: 1 // Padrão 1x (adicione um select na UI se quiser mudar)
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
            console.log('========================================');
            console.log('PROCESSANDO RESPOSTA DO PAGAMENTO');
            console.log('========================================');

            // PIX
            if (paymentMethod === 'pix' && data.pix_data) {
                console.log('✓ PIX detectado na resposta');
                console.log('QR Code URL:', data.pix_data.qr_code_url || data.pix_data.qr_code);
                console.log('Copy/Paste:', data.pix_data.qr_code_text || data.pix_data.copy_paste);

                setPixQrCode(data.pix_data.qr_code_url || data.pix_data.qr_code);
                setPixCopyPaste(data.pix_data.qr_code_text || data.pix_data.copy_paste);
                setLoading(false);
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
                    description: "Sua auditoria foi liberada.",
                });
                setTimeout(() => {
                    navigate('/resultado', { state: { auditId } });
                }, 2000);
            }
            // Cartão precisa de 3DS ou redirecionamento
            else if (data.checkout_url) {
                console.log('→ Redirecionando para checkout URL:', data.checkout_url);
                window.location.href = data.checkout_url;
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

    // Fallback se não houver sessão
    if (!scanResult && !auditId) {
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
        <div className="min-h-screen bg-slate-50 py-12 px-4">
            <div className="max-w-4xl mx-auto">
                {/* Header */}
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
                                        <p className="font-semibold text-sm">Auditoria Jurídica Premium</p>
                                        <p className="text-xs text-muted-foreground">Laudo Completo + PDF</p>
                                    </div>
                                </div>
                                <div className="border-t pt-4 space-y-2">
                                    <div className="flex justify-between font-bold text-lg">
                                        <span>Total</span>
                                        <span className="text-primary">R$ 49,00</span>
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

                        {/* 2. Endereço (NOVO - Obrigatório para cartão) */}
                        <Card>
                            <CardHeader>
                                <CardTitle className="flex items-center gap-2">
                                    <MapPin className="h-5 w-5" /> Endereço de Cobrança
                                </CardTitle>
                            </CardHeader>
                            <CardContent className="space-y-4">
                                <div className="grid grid-cols-3 gap-4">
                                    <div className="space-y-2 col-span-1">
                                        <Label>CEP</Label>
                                        <Input value={cep} onChange={handleCepChange} placeholder="00000-000" maxLength={9} />
                                    </div>
                                    <div className="space-y-2 col-span-2">
                                        <Label>Rua</Label>
                                        <Input value={street} onChange={(e) => setStreet(e.target.value)} placeholder="Nome da rua" />
                                    </div>
                                </div>
                                <div className="grid grid-cols-4 gap-4">
                                    <div className="space-y-2 col-span-1">
                                        <Label>Número</Label>
                                        <Input value={number} onChange={(e) => setNumber(e.target.value)} placeholder="123" />
                                    </div>
                                    <div className="space-y-2 col-span-3">
                                        <Label>Complemento (Opcional)</Label>
                                        <Input value={complement} onChange={(e) => setComplement(e.target.value)} placeholder="Apto 101" />
                                    </div>
                                </div>
                                <div className="grid grid-cols-3 gap-4">
                                    <div className="space-y-2">
                                        <Label>Bairro</Label>
                                        <Input value={neighborhood} onChange={(e) => setNeighborhood(e.target.value)} />
                                    </div>
                                    <div className="space-y-2">
                                        <Label>Cidade</Label>
                                        <Input value={city} onChange={(e) => setCity(e.target.value)} />
                                    </div>
                                    <div className="space-y-2">
                                        <Label>Estado (UF)</Label>
                                        <Input value={state} onChange={(e) => setState(e.target.value.toUpperCase())} maxLength={2} placeholder="SP" />
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
                                        {!pixQrCode ? (
                                            <div className="text-center py-6">
                                                <QrCode className="h-12 w-12 mx-auto text-primary mb-2" />
                                                <p className="font-medium">Pagamento Instantâneo</p>
                                                <p className="text-sm text-muted-foreground">Clique em finalizar para gerar o código.</p>
                                            </div>
                                        ) : (
                                            <div className="space-y-4 animate-in fade-in slide-in-from-bottom-4">
                                                <div className="flex justify-center bg-white p-4 border rounded-lg">
                                                    <img src={pixQrCode} alt="QR Code PIX" className="w-48 h-48" />
                                                </div>
                                                <div className="flex gap-2">
                                                    <Input value={pixCopyPaste} readOnly className="font-mono text-xs bg-slate-50" />
                                                    <Button onClick={copyPixCode} variant="outline" size="icon">
                                                        <Copy className="h-4 w-4" />
                                                    </Button>
                                                </div>
                                                <p className="text-center text-sm text-emerald-600 font-medium">Aguardando pagamento...</p>
                                            </div>
                                        )}
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
                                        `Pagar R$ 49,00`
                                    )}
                                </Button>

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
    );
}