import { Button } from "@/components/ui/button";
import { useCredits } from "@/contexts/CreditContext";
import { Zap } from "lucide-react";
import { useNavigate } from "react-router-dom";

export function CreditUsage() {
    const { credits } = useCredits();
    const navigate = useNavigate();
    const isLow = credits < 3;

    return (
        <div className="space-y-3 px-2">
            <div className="flex flex-col gap-1">
                <span className="text-xs font-medium text-sidebar-foreground/70 uppercase tracking-wider">Saldo em Conta</span>
                <div className="flex items-center gap-2">
                    <Zap className={`h-5 w-5 ${isLow ? 'text-red-500' : 'text-blue-500'}`} />
                    <span className={`text-2xl font-bold ${isLow ? 'text-red-500' : 'text-sidebar-foreground'}`}>
                        {credits}
                    </span>
                    <span className="text-sm text-sidebar-foreground/70 self-end mb-1">créditos</span>
                </div>
            </div>

            <Button
                variant="default"
                size="sm"
                className={`w-full text-xs h-7 font-semibold transition-all duration-300 ${isLow
                        ? "bg-red-600 hover:bg-red-700 text-white shadow-red-900/20"
                        : "bg-emerald-600 hover:bg-emerald-700 text-white shadow-emerald-900/20 shadow-sm"
                    }`}
                onClick={() => navigate('/creditos')}
            >
                {isLow ? "Recarregar Agora" : "Adicionar Créditos"}
            </Button>
        </div>
    );
}
