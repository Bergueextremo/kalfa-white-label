import { useAudit } from "@/contexts/AuditContext";
import { Loader2, Maximize2 } from "lucide-react";
import { Button } from "@/components/ui/button";

export function AuditProgressWidget() {
    const { isMinimized, auditState, selectedFile, maximize } = useAudit();

    if (!isMinimized || auditState === 'idle') return null;

    return (
        <div className="fixed bottom-6 right-6 z-50 animate-in slide-in-from-bottom-4 fade-in duration-300">
            <div className="bg-white rounded-lg shadow-2xl border border-slate-200 p-4 w-80 flex items-center gap-4">
                <div className="bg-blue-50 p-2 rounded-full">
                    {auditState === 'processing' ? (
                        <Loader2 className="w-5 h-5 text-blue-600 animate-spin" />
                    ) : (
                        <Maximize2 className="w-5 h-5 text-blue-600" />
                    )}
                </div>
                <div className="flex-1 min-w-0">
                    <p className="text-sm font-semibold text-slate-900 truncate">
                        {auditState === 'processing' ? 'Auditando...' : 'Análise Concluída'}
                    </p>
                    <p className="text-xs text-slate-500 truncate">
                        {selectedFile?.name || "Contrato"}
                    </p>
                </div>
                <Button variant="ghost" size="icon" onClick={maximize} className="h-8 w-8">
                    <Maximize2 className="w-4 h-4 text-slate-400" />
                </Button>
            </div>
        </div>
    );
}
