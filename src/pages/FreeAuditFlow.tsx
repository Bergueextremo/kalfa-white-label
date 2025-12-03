import { useState, useEffect } from 'react';
import { useNavigate, useLocation } from 'react-router-dom';
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { Card, CardContent, CardHeader, CardTitle, CardDescription } from "@/components/ui/card";
import { useToast } from "@/hooks/use-toast";
import { supabase } from "@/lib/supabase";
import {
    Loader2,
    UploadCloud,
    FileText,
    CheckCircle2,
    ShieldCheck,
    Lock,
    AlertTriangle,
    Unlock,
    ArrowRight,
    Check
} from "lucide-react";
import { cn } from "@/lib/utils";

type Step = 'input' | 'processing' | 'result';

interface ScanResult {
    detected_risks: string[];
    risk_count: number;
    estimated_savings_hint: number;
}

export default function FreeAuditFlow() {
    const navigate = useNavigate();
    const location = useLocation();
    const { toast } = useToast();
    const [step, setStep] = useState<Step>('input');

    // Form State
    const [name, setName] = useState('');
    const [email, setEmail] = useState('');
    const [whatsapp, setWhatsapp] = useState('');
    const [file, setFile] = useState<File | null>(null);
    const [contractType, setContractType] = useState<string>('geral');

    // Processing State
    const [progressStep, setProgressStep] = useState(0);
    const [scanResult, setScanResult] = useState<ScanResult | null>(null);
    const [uploadedFilePath, setUploadedFilePath] = useState<string | null>(null);

    useEffect(() => {
        if (location.state?.contractType) {
            setContractType(location.state.contractType);
        }
    }, [location.state]);

    // Simple WhatsApp Mask
    const handleWhatsappChange = (e: React.ChangeEvent<HTMLInputElement>) => {
        let value = e.target.value.replace(/\D/g, '');
        if (value.length > 11) value = value.slice(0, 11);

        if (value.length > 2) {
            value = `(${value.slice(0, 2)}) ${value.slice(2)}`;
        }
        if (value.length > 9) {
            value = `${value.slice(0, 9)}-${value.slice(9)}`;
        }
        setWhatsapp(value);
    };

    const isFormValid = name.length > 3 && email.includes('@') && whatsapp.length >= 14;

    const handleFileDrop = (e: React.DragEvent) => {
        e.preventDefault();
        if (!isFormValid) return;

        const droppedFile = e.dataTransfer.files[0];
        if (droppedFile && (droppedFile.type === 'application/pdf' || droppedFile.type === 'application/vnd.openxmlformats-officedocument.wordprocessingml.document')) {
            setFile(droppedFile);
        } else {
            toast({
                title: "Formato inválido",
                description: "Por favor, envie um arquivo PDF ou DOCX.",
                variant: "destructive"
            });
        }
    };

    const handleFileSelect = (e: React.ChangeEvent<HTMLInputElement>) => {
        if (e.target.files && e.target.files[0]) {
            setFile(e.target.files[0]);
        }
    };

    const startAnalysis = async () => {
        if (!file || !isFormValid) return;

        setStep('processing');

        // Start Roadmap Animation
        const interval = setInterval(() => {
            setProgressStep(prev => {
                if (prev >= 3) {
                    clearInterval(interval);
                    return 3;
                }
                return prev + 1;
            });
        }, 1500); // Simulate progress steps

        try {
            // 1. Upload File
            const fileName = `${crypto.randomUUID()}-${file.name.replace(/[^\x00-\x7F]/g, '')}`;
            const { error: uploadError } = await supabase.storage
                .from('contracts')
                .upload(`temp-scans/${fileName}`, file);

            if (uploadError) throw uploadError;

            const fullPath = `temp-scans/${fileName}`;
            setUploadedFilePath(fullPath);

            // 2. Call Edge Function
            const { data, error } = await supabase.functions.invoke('scan-contract-light', {
                body: {
                    file_path: `temp-scans/${fileName}`,
                    contract_type: contractType
                }
            });

            if (error) throw error;
            if (data && !data.success && data.error) throw new Error(data.error);

            const result = data.data || data;
            setScanResult(result);

            // Wait for animation to finish at least a bit
            setTimeout(() => {
                clearInterval(interval);
                setStep('result');
            }, 4500);

        } catch (error: any) {
            console.error('Scan error:', error);
            toast({
                title: "Erro na análise",
                description: error.message || "Ocorreu um erro ao processar seu contrato.",
                variant: "destructive"
            });
            setStep('input');
            setProgressStep(0);
        }
    };

    const handleUnlock = () => {
        navigate('/checkout', {
            state: {
                scanResult,
                leadData: { name, email, phone: whatsapp },
                auditId: null, // Will be created during checkout
                filePath: uploadedFilePath
            }
        });
    };

    return (
        <div className="min-h-screen flex flex-col md:flex-row bg-background">

            {/* LEFT COLUMN */}
            <div className="w-full md:w-1/2 p-6 md:p-12 flex flex-col justify-center relative overflow-y-auto">
                <div className="max-w-md mx-auto w-full space-y-8">

                    {step === 'input' && (
                        <div className="space-y-6 animate-in fade-in slide-in-from-left-4 duration-500">
                            <div className="space-y-2">
                                <h1 className="text-3xl font-bold tracking-tight text-foreground">
                                    Inicie sua Auditoria <span className="text-primary">Gratuita</span>
                                </h1>
                                <p className="text-muted-foreground">
                                    Preencha seus dados para liberar a análise forense preliminar do seu contrato.
                                </p>
                            </div>

                            <div className="space-y-4">
                                <div className="space-y-2">
                                    <Label htmlFor="name">Nome Completo</Label>
                                    <Input
                                        id="name"
                                        placeholder="Seu nome"
                                        value={name}
                                        onChange={(e) => setName(e.target.value)}
                                    />
                                </div>

                                <div className="space-y-2">
                                    <Label htmlFor="whatsapp">WhatsApp</Label>
                                    <Input
                                        id="whatsapp"
                                        placeholder="(11) 99999-9999"
                                        value={whatsapp}
                                        onChange={handleWhatsappChange}
                                    />
                                </div>

                                <div className="space-y-2">
                                    <Label htmlFor="email">E-mail Profissional</Label>
                                    <Input
                                        id="email"
                                        type="email"
                                        placeholder="seu@email.com"
                                        value={email}
                                        onChange={(e) => setEmail(e.target.value)}
                                    />
                                </div>
                            </div>

                            <div className={cn(
                                "border-2 border-dashed rounded-xl p-8 text-center transition-all duration-300",
                                isFormValid
                                    ? "border-primary/50 bg-primary/5 cursor-pointer hover:bg-primary/10"
                                    : "border-muted bg-muted/30 opacity-50 cursor-not-allowed"
                            )}
                                onDragOver={(e) => e.preventDefault()}
                                onDrop={handleFileDrop}
                                onClick={() => isFormValid && document.getElementById('file-upload')?.click()}
                            >
                                <input
                                    type="file"
                                    id="file-upload"
                                    className="hidden"
                                    accept=".pdf,.docx"
                                    onChange={handleFileSelect}
                                    disabled={!isFormValid}
                                />

                                {file ? (
                                    <div className="flex flex-col items-center gap-2 text-primary">
                                        <FileText className="h-10 w-10" />
                                        <span className="font-medium">{file.name}</span>
                                        <span className="text-xs text-muted-foreground">Clique para trocar</span>
                                    </div>
                                ) : (
                                    <div className="flex flex-col items-center gap-2 text-muted-foreground">
                                        <UploadCloud className="h-10 w-10" />
                                        <span className="font-medium">
                                            {isFormValid ? "Arraste seu contrato ou clique aqui" : "Preencha os dados para liberar o upload"}
                                        </span>
                                        <span className="text-xs">PDF ou DOCX (Max 10MB)</span>
                                    </div>
                                )}
                            </div>

                            <Button
                                className="w-full h-12 text-lg"
                                disabled={!file || !isFormValid}
                                onClick={startAnalysis}
                            >
                                Analisar Contrato Agora
                                <ArrowRight className="ml-2 h-5 w-5" />
                            </Button>

                            <div className="flex justify-center gap-6 text-xs text-muted-foreground pt-4">
                                <div className="flex items-center gap-1">
                                    <ShieldCheck className="h-4 w-4" /> Sigilo Absoluto
                                </div>
                                <div className="flex items-center gap-1">
                                    <Lock className="h-4 w-4" /> Criptografia SSL
                                </div>
                            </div>
                        </div>
                    )}

                    {step === 'processing' && (
                        <div className="flex flex-col items-center justify-center space-y-6 animate-in fade-in zoom-in duration-500 text-center">
                            <div className="relative">
                                <div className="absolute inset-0 bg-primary/20 blur-xl rounded-full animate-pulse" />
                                <Loader2 className="h-16 w-16 text-primary animate-spin relative z-10" />
                            </div>
                            <h2 className="text-2xl font-bold">Processando seu Contrato...</h2>
                            <p className="text-muted-foreground max-w-xs">
                                Nossa IA está analisando cada cláusula em busca de irregularidades. Isso pode levar alguns segundos.
                            </p>
                        </div>
                    )}

                    {step === 'result' && scanResult && (
                        <div className="space-y-6 animate-in fade-in slide-in-from-bottom-4 duration-500">
                            <div className="bg-destructive/10 border border-destructive/20 rounded-lg p-6 text-center space-y-2">
                                <div className="flex justify-center mb-2">
                                    <div className="bg-destructive/20 p-3 rounded-full">
                                        <AlertTriangle className="h-8 w-8 text-destructive" />
                                    </div>
                                </div>
                                <h2 className="text-2xl font-bold text-destructive">
                                    {scanResult.risk_count} Riscos Detectados
                                </h2>
                                <p className="text-muted-foreground">
                                    Encontramos cláusulas que podem estar custando caro para você.
                                </p>
                            </div>

                            <div className="space-y-4">
                                <h3 className="font-semibold text-lg">Resumo da Análise:</h3>
                                <ul className="space-y-3">
                                    {scanResult.detected_risks.map((risk, i) => (
                                        <li key={i} className="flex items-start gap-3 p-3 bg-card border rounded-md">
                                            <CheckCircle2 className="h-5 w-5 text-destructive shrink-0 mt-0.5" />
                                            <span className="text-sm font-medium">{risk}</span>
                                        </li>
                                    ))}
                                </ul>
                            </div>

                            {scanResult.estimated_savings_hint > 0 && (
                                <div className="bg-emerald-500/10 border border-emerald-500/20 rounded-lg p-4 flex items-center justify-between">
                                    <span className="text-emerald-700 font-medium">Economia Estimada:</span>
                                    <span className="text-xl font-bold text-emerald-700">
                                        R$ {scanResult.estimated_savings_hint.toLocaleString('pt-BR', { minimumFractionDigits: 2 })}
                                    </span>
                                </div>
                            )}

                            <div className="pt-4 space-y-3">
                                <Button size="lg" className="w-full h-14 text-lg animate-pulse" onClick={handleUnlock}>
                                    <Unlock className="mr-2 h-5 w-5" />
                                    Desbloquear Laudo Completo
                                </Button>
                                <p className="text-center text-xs text-muted-foreground">
                                    Apenas R$ 49,00 - Acesso Imediato
                                </p>
                            </div>
                        </div>
                    )}

                </div>
            </div>

            {/* RIGHT COLUMN (Visual Roadmap) */}
            <div className="hidden md:flex w-1/2 bg-slate-950 text-white relative overflow-hidden flex-col justify-center p-12">
                {/* Background Effects */}
                <div className="absolute inset-0 bg-[radial-gradient(ellipse_at_center,_var(--tw-gradient-stops))] from-slate-900 via-slate-950 to-black opacity-80" />
                <div className="absolute inset-0 bg-[url('https://grainy-gradients.vercel.app/noise.svg')] opacity-20" />

                <div className="relative z-10 max-w-md mx-auto w-full">
                    {step === 'result' ? (
                        // Blurred Preview
                        <div className="relative rounded-xl overflow-hidden border border-white/10 shadow-2xl bg-white/5 backdrop-blur-sm">
                            <div className="absolute inset-0 bg-black/60 backdrop-blur-md z-20 flex flex-col items-center justify-center text-center p-6">
                                <Lock className="h-12 w-12 text-white/50 mb-4" />
                                <h3 className="text-xl font-bold text-white mb-2">Conteúdo Bloqueado</h3>
                                <p className="text-white/70 text-sm">
                                    O detalhamento técnico e jurídico das cláusulas está disponível apenas no laudo completo.
                                </p>
                            </div>

                            {/* Fake Content Background */}
                            <div className="p-8 space-y-6 opacity-30 pointer-events-none select-none filter blur-sm">
                                <div className="h-8 bg-white/20 w-3/4 rounded" />
                                <div className="space-y-3">
                                    <div className="h-4 bg-white/10 w-full rounded" />
                                    <div className="h-4 bg-white/10 w-5/6 rounded" />
                                    <div className="h-4 bg-white/10 w-4/6 rounded" />
                                </div>
                                <div className="h-32 bg-white/5 rounded border border-white/10" />
                                <div className="space-y-3">
                                    <div className="h-4 bg-white/10 w-full rounded" />
                                    <div className="h-4 bg-white/10 w-11/12 rounded" />
                                </div>
                            </div>
                        </div>
                    ) : (
                        // Roadmap
                        <div className="space-y-8">
                            <div className="space-y-2">
                                <h2 className="text-3xl font-bold tracking-tight">Auditoria Forense em Tempo Real</h2>
                                <p className="text-slate-400">Acompanhe o processamento do seu documento pela nossa IA.</p>
                            </div>

                            <div className="space-y-6">
                                {[
                                    "Recebendo Arquivo Seguro...",
                                    "Identificando Tipo de Contrato...",
                                    "Escaneando Cláusulas Abusivas...",
                                    "Gerando Laudo Preliminar..."
                                ].map((label, index) => {
                                    const isActive = step === 'processing' && progressStep === index;
                                    const isCompleted = step === 'processing' && progressStep > index;

                                    return (
                                        <div key={index} className={cn(
                                            "flex items-center gap-4 transition-all duration-500",
                                            isActive || isCompleted ? "opacity-100" : "opacity-30"
                                        )}>
                                            <div className={cn(
                                                "h-8 w-8 rounded-full flex items-center justify-center border-2 transition-all duration-500",
                                                isCompleted ? "bg-emerald-500 border-emerald-500 text-white" :
                                                    isActive ? "border-primary text-primary animate-pulse" :
                                                        "border-slate-700 text-slate-700"
                                            )}>
                                                {isCompleted ? <Check className="h-4 w-4" /> : <div className={cn("h-2 w-2 rounded-full", isActive ? "bg-primary" : "bg-slate-700")} />}
                                            </div>
                                            <span className={cn(
                                                "text-lg font-medium",
                                                isActive ? "text-primary" : isCompleted ? "text-emerald-400" : "text-slate-500"
                                            )}>
                                                {label}
                                            </span>
                                        </div>
                                    );
                                })}
                            </div>
                        </div>
                    )}
                </div>
            </div>
        </div>
    );
}
