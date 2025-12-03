import { Dialog, DialogContent, DialogTrigger } from "@/components/ui/dialog";
import { AuditFlowManager } from "@/components/audit-flow/AuditFlowManager";
import { Button } from "@/components/ui/button";
import { Sparkles } from "lucide-react";
import { useState } from "react";

interface QuickAuditModalProps {
    trigger?: React.ReactNode;
    open?: boolean;
    onOpenChange?: (open: boolean) => void;
}

export function QuickAuditModal({ trigger, open, onOpenChange }: QuickAuditModalProps) {
    const [internalOpen, setInternalOpen] = useState(false);

    const isControlled = open !== undefined;
    const isOpen = isControlled ? open : internalOpen;
    const setIsOpen = isControlled ? onOpenChange : setInternalOpen;

    return (
        <Dialog open={isOpen} onOpenChange={setIsOpen}>
            {trigger && <DialogTrigger asChild>{trigger}</DialogTrigger>}
            <DialogContent className="max-w-5xl h-[90vh] overflow-y-auto p-0 bg-slate-50/50 backdrop-blur-xl border-none">
                <div className="p-6 md:p-8">
                    <div className="mb-6">
                        <h2 className="text-2xl font-bold flex items-center gap-2">
                            <Sparkles className="h-6 w-6 text-primary" />
                            Auditoria Rápida
                        </h2>
                        <p className="text-muted-foreground">
                            Faça uma nova análise sem sair desta tela.
                        </p>
                    </div>
                    <AuditFlowManager />
                </div>
            </DialogContent>
        </Dialog>
    );
}
