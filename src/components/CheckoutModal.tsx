import { Dialog, DialogContent, DialogDescription, DialogHeader, DialogTitle, DialogTrigger } from "@/components/ui/dialog";
import { Button } from "@/components/ui/button";
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from "@/components/ui/card";
import { Check, CreditCard, Loader2 } from "lucide-react";
import { useState } from "react";
import { useCredits } from "@/contexts/CreditContext";
import { toast } from "sonner";

interface CheckoutModalProps {
    children?: React.ReactNode;
    open?: boolean;
    onOpenChange?: (open: boolean) => void;
}

export function CheckoutModal({ children, open, onOpenChange }: CheckoutModalProps) {
    const { addCredits } = useCredits();
    const [loading, setLoading] = useState(false);
    const [internalOpen, setInternalOpen] = useState(false);

    const isControlled = open !== undefined;
    const isOpen = isControlled ? open : internalOpen;
    const setIsOpen = isControlled ? onOpenChange : setInternalOpen;

    const handlePurchase = (amount: number, price: string) => {
        setLoading(true);
        // Simulate API call
        setTimeout(() => {
            addCredits(amount);
            setLoading(false);
            if (setIsOpen) setIsOpen(false);
            toast.success(`Compra de ${amount} créditos realizada!`);
        }, 1500);
    };

    const plans = [
        {
            name: "Pacote Básico",
            credits: 10,
            price: "R$ 49,00",
            features: ["10 Análises", "Validade Indeterminada"]
        },
        {
            name: "Pacote Pro",
            credits: 50,
            price: "R$ 199,00",
            features: ["50 Análises", "Prioridade na Fila"],
            popular: true
        }
    ];

    return (
        <Dialog open={isOpen} onOpenChange={setIsOpen}>
            {children && <DialogTrigger asChild>{children}</DialogTrigger>}
            <DialogContent className="sm:max-w-[600px]">
                <DialogHeader>
                    <DialogTitle>Adicionar Créditos</DialogTitle>
                    <DialogDescription>
                        Escolha um pacote para continuar realizando auditorias.
                    </DialogDescription>
                </DialogHeader>

                <div className="grid gap-4 py-4 md:grid-cols-2">
                    {plans.map((plan) => (
                        <Card key={plan.name} className={`cursor-pointer transition-all hover:border-primary ${plan.popular ? 'border-primary bg-primary/5' : ''}`}>
                            <CardHeader>
                                <CardTitle className="text-lg">{plan.name}</CardTitle>
                                <CardDescription>{plan.credits} créditos</CardDescription>
                            </CardHeader>
                            <CardContent>
                                <div className="text-2xl font-bold mb-4">{plan.price}</div>
                                <ul className="space-y-2 mb-6">
                                    {plan.features.map((feature, i) => (
                                        <li key={i} className="flex items-center text-sm text-muted-foreground">
                                            <Check className="h-4 w-4 mr-2 text-green-500" />
                                            {feature}
                                        </li>
                                    ))}
                                </ul>
                                <Button
                                    className="w-full"
                                    onClick={() => handlePurchase(plan.credits, plan.price)}
                                    disabled={loading}
                                    variant={plan.popular ? "default" : "outline"}
                                >
                                    {loading ? <Loader2 className="h-4 w-4 animate-spin" /> : "Comprar Agora"}
                                </Button>
                            </CardContent>
                        </Card>
                    ))}
                </div>

                <div className="bg-slate-50 p-4 rounded-lg flex items-center gap-3 text-sm text-muted-foreground">
                    <CreditCard className="h-5 w-5" />
                    <span>Pagamento seguro via Cartão de Crédito ou PIX (Simulado)</span>
                </div>
            </DialogContent>
        </Dialog>
    );
}
