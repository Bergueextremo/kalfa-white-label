import { Dialog, DialogContent } from "@/components/ui/dialog";
import { AuditFlowManager } from "@/components/audit-flow/AuditFlowManager";
import { useAudit } from "@/contexts/AuditContext";

export function GlobalAuditModal() {
    const { isModalOpen, closeModal } = useAudit();

    return (
        <Dialog open={isModalOpen} onOpenChange={(open) => !open && closeModal()}>
            <DialogContent className="w-[95vw] max-w-7xl h-[90vh] overflow-y-auto p-4 sm:p-10 rounded-xl">
                <AuditFlowManager />
            </DialogContent>
        </Dialog>
    );
}
