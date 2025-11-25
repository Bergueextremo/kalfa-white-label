import { Button } from "@/components/ui/button";
import { PlusCircle } from "lucide-react";
import { useAudit } from "@/contexts/AuditContext";

export function NewAuditModal() {
    const { openModal } = useAudit();

    return (
        <Button
            className="gap-2 bg-blue-600 hover:bg-blue-700 text-white shadow-sm"
            onClick={openModal}
        >
            <PlusCircle className="h-4 w-4" />
            <span className="hidden sm:inline">Nova Auditoria</span>
        </Button>
    );
}
