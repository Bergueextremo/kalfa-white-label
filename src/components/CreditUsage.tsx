import { Progress } from "@/components/ui/progress";
import { Button } from "@/components/ui/button";
import { useCredits } from "@/contexts/CreditContext";
import { CheckoutModal } from "@/components/CheckoutModal";
import { Zap } from "lucide-react";
import { useState } from "react";

export function CreditUsage() {
    const { credits, maxCredits } = useCredits();
    const [showCheckout, setShowCheckout] = useState(false);

    const percentage = Math.min((credits / maxCredits) * 100, 100);
    const isLow = credits < 3;

    return (
        <div className="space-y-3 px-2">
            <div className="flex justify-between text-xs font-medium text-muted-foreground">
                <span>Créditos Disponíveis</span>
                <span>{credits}/{maxCredits}</span>
            </div>

            <Progress value={percentage} className={`h-2 ${isLow ? "bg-red-100" : "bg-slate-100"}`} />

            {isLow && (
                <Button
                    variant="outline"
                    size="sm"
                    className="w-full text-xs h-7 border-red-200 text-red-600 hover:bg-red-50 hover:text-red-700"
                    onClick={() => setShowCheckout(true)}
                >
                    <Zap className="h-3 w-3 mr-1" />
                    Repor Créditos
                </Button>
            )}

            <CheckoutModal open={showCheckout} onOpenChange={setShowCheckout} />
        </div>
    );
}
