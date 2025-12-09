import { useState, useEffect } from 'react';
import {
    Dialog,
    DialogContent,
    DialogDescription,
    DialogFooter,
    DialogHeader,
    DialogTitle,
} from "@/components/ui/dialog";
import { Button } from "@/components/ui/button";
import { supabase } from "@/lib/supabase";
import { useAuth } from "@/contexts/AuthContext";
import { useNavigate } from 'react-router-dom';
import { Lock, FileText, CreditCard, ShieldCheck } from "lucide-react";

export function OnboardingTour() {
    const { user } = useAuth();
    const [open, setOpen] = useState(false);
    const [step, setStep] = useState(0);
    const navigate = useNavigate();

    // Fetch 'has_seen_onboarding' status
    useEffect(() => {
        if (user) {
            checkOnboardingStatus();
        }
    }, [user]);

    const checkOnboardingStatus = async () => {
        const { data, error } = await supabase
            .from('profiles')
            .select('has_seen_onboarding')
            .eq('id', user?.id)
            .single();

        if (!error && data && !data.has_seen_onboarding) {
            setOpen(true);
        }
    };

    const markAsSeen = async () => {
        if (user) {
            await supabase
                .from('profiles')
                .update({ has_seen_onboarding: true })
                .eq('id', user.id);
        }
    };

    const handleNext = () => {
        if (step < steps.length - 1) {
            setStep(step + 1);
        } else {
            handleComplete();
        }
    };

    const handleComplete = async () => {
        await markAsSeen();
        setOpen(false);
        navigate('/creditos'); // Redirect to plans page as requested ("encaminhar para a área de planos")
    };

    const steps = [
        {
            title: "Bem-vindo ao JusContratos!",
            description: "Sua plataforma de auditoria contratual com Tecnologia Avançada. Vamos te mostrar como blindar seus contratos.",
            icon: <ShieldCheck className="h-16 w-16 text-primary mx-auto mb-4" />
        },
        {
            title: "Autenticador Jurídico",
            description: "Faça upload de contratos em PDF ou DOCX. Nosso sistema detecta cláusulas abusivas e riscos jurídicos automaticamente.",
            icon: <FileText className="h-16 w-16 text-blue-500 mx-auto mb-4" />
        },
        {
            title: "Sistema de Créditos",
            description: "Para realizar análises, você precisa de créditos. Escolha um plano que se adapte à sua necessidade.",
            icon: <CreditCard className="h-16 w-16 text-green-500 mx-auto mb-4" />
        },
        {
            title: "Acesso Liberado",
            description: "Agora você precisa ativar sua conta adquirindo seu primeiro pacote de créditos.",
            icon: <Lock className="h-16 w-16 text-orange-500 mx-auto mb-4" />
        }
    ];

    return (
        <Dialog open={open} onOpenChange={() => { }}>
            <DialogContent className="sm:max-w-[500px] text-center [&>button]:hidden" onPointerDownOutside={(e) => e.preventDefault()} onEscapeKeyDown={(e) => e.preventDefault()}>
                <DialogHeader>
                    <div className="flex justify-center mb-4">
                        {steps[step].icon}
                    </div>
                    <DialogTitle className="text-2xl text-center mb-2">{steps[step].title}</DialogTitle>
                    <DialogDescription className="text-center text-lg">
                        {steps[step].description}
                    </DialogDescription>
                </DialogHeader>
                <div className="flex justify-center gap-2 mt-4">
                    {steps.map((_, i) => (
                        <div key={i} className={`h-2 w-2 rounded-full transition-colors ${i === step ? 'bg-primary' : 'bg-gray-200'}`} />
                    ))}
                </div>
                <DialogFooter className="sm:justify-center mt-6">
                    <Button onClick={handleNext} className="w-full sm:w-auto px-8">
                        {step === steps.length - 1 ? "Entendi, ir para Planos" : "Próximo"}
                    </Button>
                </DialogFooter>
            </DialogContent>
        </Dialog>
    );
}
