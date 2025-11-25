import React, { useState } from 'react';
import { Download, FileText, Scale, CheckCircle2 } from 'lucide-react';
import { Button } from '@/components/ui/button';
import { toast } from 'sonner';
import {
    Dialog,
    DialogContent,
    DialogHeader,
    DialogTitle,
    DialogTrigger,
    DialogFooter,
    DialogDescription
} from "@/components/ui/dialog";
import { Label } from "@/components/ui/label";
import { RadioGroup, RadioGroupItem } from "@/components/ui/radio-group";
import { Textarea } from "@/components/ui/textarea";

interface AuditActionsProps {
    auditData?: any; // Pass the full audit data here
}

export function AuditActions({ auditData }: AuditActionsProps) {
    const [isConsultationOpen, setIsConsultationOpen] = useState(false);
    const [consultationReason, setConsultationReason] = useState("duvidas");
    const [consultationNotes, setConsultationNotes] = useState("");

    const handleDownloadReport = () => {
        // Simulating PDF download - in a real app this would generate a PDF
        // For now, we can trigger the browser's print to PDF functionality
        window.print();
        toast.success("Preparando laudo para impressão/PDF...");
    };

    const handleDownloadContract = async () => {
        if (!auditData) {
            toast.error("Dados do contrato não disponíveis.");
            return;
        }

        try {
            // Dynamically import jspdf to avoid SSR issues if any
            const { default: jsPDF } = await import('jspdf');
            const { default: autoTable } = await import('jspdf-autotable');

            const doc = new jsPDF();

            // Header
            doc.setFontSize(20);
            doc.setTextColor(22, 163, 74); // Green color
            doc.text("ADITIVO DE BLINDAGEM CONTRATUAL", 105, 20, { align: "center" });

            doc.setFontSize(12);
            doc.setTextColor(0);
            doc.text(`Data da Emissão: ${new Date().toLocaleDateString()}`, 14, 35);
            doc.text(`Tipo de Contrato: ${auditData.contractType || 'Não Identificado'}`, 14, 42);

            doc.setLineWidth(0.5);
            doc.line(14, 48, 196, 48);

            // Content Preparation
            const issues = auditData.issues || [];
            const tableData = issues.map((issue: any, index: number) => [
                issue.clause || `Cláusula ${index + 1}`,
                issue.description || 'N/A',
                issue.correction || 'Consulte um advogado.'
            ]);

            // Table - Using functional approach for safety with dynamic imports
            autoTable(doc, {
                startY: 55,
                head: [['Cláusula', 'Problema Identificado', 'Nova Redação (Blindada)']],
                body: tableData,
                theme: 'grid',
                headStyles: { fillColor: [22, 163, 74], textColor: 255, fontStyle: 'bold' },
                styles: { fontSize: 10, cellPadding: 4 },
                columnStyles: {
                    0: { cellWidth: 40 },
                    1: { cellWidth: 60 },
                    2: { cellWidth: 'auto' }
                },
                didDrawPage: function (data: any) {
                    // Footer
                    doc.setFontSize(8);
                    doc.setTextColor(128);
                    doc.text(
                        'Este documento é um aditivo gerado por IA (Jus Audit Pro) e deve ser validado por um advogado.',
                        105,
                        290,
                        { align: 'center' }
                    );
                }
            });

            // Save
            doc.save(`Contrato_Blindado_${new Date().getTime()}.pdf`);
            toast.success("Contrato Blindado (PDF) baixado com sucesso!");

        } catch (error) {
            console.error("Erro ao gerar PDF:", error);
            // Show more detailed error if possible, or keep it simple for user
            toast.error("Erro ao gerar o PDF. Tente novamente.");
        }
    };

    const handleRequestConsultation = () => {
        // Here you would send the data to your backend
        console.log("Consultation requested:", { reason: consultationReason, notes: consultationNotes });
        setIsConsultationOpen(false);
        toast.success("Solicitação enviada! Nossa equipe entrará em contato.");
    };

    return (
        <>
            <div className="sticky bottom-0 z-20 bg-white/95 backdrop-blur supports-[backdrop-filter]:bg-white/60 border-t border-slate-200 p-4 -mx-4 sm:-mx-10 -mb-4 sm:-mb-10 mt-8 shadow-[0_-4px_6px_-1px_rgba(0,0,0,0.1)] flex flex-col md:flex-row gap-4 justify-center print:hidden transition-all duration-300">
                <Button
                    size="lg"
                    className="flex-1 bg-blue-600 hover:bg-blue-700 text-white h-auto py-4 text-lg shadow-md"
                    onClick={handleDownloadReport}
                >
                    <Download className="mr-2 h-5 w-5" />
                    Baixar Laudo Completo (PDF)
                </Button>

                <Button
                    size="lg"
                    className="flex-1 bg-green-600 hover:bg-green-700 text-white h-auto py-4 text-lg shadow-md"
                    onClick={handleDownloadContract}
                >
                    <FileText className="mr-2 h-5 w-5" />
                    BAIXAR CONTRATO BLINDADO
                </Button>

                <Dialog open={isConsultationOpen} onOpenChange={setIsConsultationOpen}>
                    <DialogTrigger asChild>
                        <Button
                            size="lg"
                            className="flex-1 bg-slate-700 hover:bg-slate-800 text-white h-auto py-4 text-lg shadow-md"
                        >
                            <Scale className="mr-2 h-5 w-5" />
                            Agendar Consultoria Jurídica
                        </Button>
                    </DialogTrigger>
                    <DialogContent className="sm:max-w-[500px]">
                        <DialogHeader>
                            <DialogTitle>Agendar Consultoria Especializada</DialogTitle>
                            <DialogDescription>
                                Nossa equipe de advogados especialistas analisará seu caso.
                            </DialogDescription>
                        </DialogHeader>
                        <div className="grid gap-6 py-4">
                            <div className="space-y-4">
                                <Label className="text-base">Qual o motivo do atendimento?</Label>
                                <RadioGroup value={consultationReason} onValueChange={setConsultationReason}>
                                    <div className="flex items-center space-x-2 border p-3 rounded-lg hover:bg-slate-50 cursor-pointer">
                                        <RadioGroupItem value="duvidas" id="r1" />
                                        <Label htmlFor="r1" className="cursor-pointer flex-1">Dúvidas sobre o Laudo</Label>
                                    </div>
                                    <div className="flex items-center space-x-2 border p-3 rounded-lg hover:bg-slate-50 cursor-pointer">
                                        <RadioGroupItem value="negociacao" id="r2" />
                                        <Label htmlFor="r2" className="cursor-pointer flex-1">Negociação Assistida (Extrajudicial)</Label>
                                    </div>
                                    <div className="flex items-center space-x-2 border p-3 rounded-lg hover:bg-slate-50 cursor-pointer">
                                        <RadioGroupItem value="judicial" id="r3" />
                                        <Label htmlFor="r3" className="cursor-pointer flex-1">Ação Judicial (Processo)</Label>
                                    </div>
                                    <div className="flex items-center space-x-2 border p-3 rounded-lg hover:bg-slate-50 cursor-pointer">
                                        <RadioGroupItem value="outros" id="r4" />
                                        <Label htmlFor="r4" className="cursor-pointer flex-1">Outros Assuntos</Label>
                                    </div>
                                </RadioGroup>
                            </div>
                            <div className="space-y-2">
                                <Label htmlFor="notes">Observações Adicionais (Opcional)</Label>
                                <Textarea
                                    id="notes"
                                    placeholder="Descreva brevemente sua necessidade..."
                                    value={consultationNotes}
                                    onChange={(e) => setConsultationNotes(e.target.value)}
                                />
                            </div>
                        </div>
                        <DialogFooter>
                            <Button variant="outline" onClick={() => setIsConsultationOpen(false)}>Cancelar</Button>
                            <Button onClick={handleRequestConsultation} className="bg-blue-600 hover:bg-blue-700">
                                <CheckCircle2 className="mr-2 h-4 w-4" />
                                Confirmar Solicitação
                            </Button>
                        </DialogFooter>
                    </DialogContent>
                </Dialog>
            </div>
        </>
    );
}
