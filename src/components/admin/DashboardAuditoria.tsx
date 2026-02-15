import { AuditFlowManager } from "@/components/audit-flow/AuditFlowManager";
import { Card, CardContent } from "@/components/ui/card";

export function DashboardAuditoria() {
    return (
        <div className="space-y-6">
            <div>
                <h2 className="text-2xl font-bold text-slate-900">Nova Auditoria</h2>
                <p className="text-slate-500 mt-1 text-sm">Realize uma consulta completa de contrato (Gratuito para Admin)</p>
            </div>
            <Card className="border-none shadow-none bg-transparent">
                <CardContent className="p-0">
                    <AuditFlowManager />
                </CardContent>
            </Card>
        </div>
    );
}
