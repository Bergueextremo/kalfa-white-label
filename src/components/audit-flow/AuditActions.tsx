import React, { useState } from 'react';
import { Download, FileText, Scale, CheckCircle2 } from 'lucide-react';
import { Button } from '@/components/ui/button';
import { toast } from 'sonner';

interface AuditActionsProps {
    auditData?: any; // Pass the full audit data here
}

export function AuditActions({ auditData }: AuditActionsProps) {

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
                        'Este documento é um aditivo gerado pelo Autenticador Jurídico (Jus Audit Pro) e deve ser validado por um advogado.',
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
        if (!auditData) {
            toast.error("Dados da análise não disponíveis.");
            return;
        }

        const phoneNumber = "5561998684615";
        const contractType = auditData.contractType || "Geral";
        const issues = auditData.issues || [];

        let message = `Olá! Gostaria de agendar uma consultoria jurídica.\n\n`;
        message += `Acabei de realizar uma auditoria no meu contrato de *${contractType}*.\n\n`;

        if (issues.length > 0) {
            message += `*Pontos Identificados na Análise:*\n`;
            issues.slice(0, 5).forEach((issue: any, index: number) => {
                const desc = issue.description || issue.problem || "Risco identificado";
                message += `${index + 1}. ${desc}\n`;
            });

            if (issues.length > 5) {
                message += `...e mais ${issues.length - 5} pontos.\n`;
            }
        }

        message += `\nAguardo seu retorno para prosseguirmos com o atendimento.`;

        const encodedMessage = encodeURIComponent(message);
        const whatsappUrl = `https://wa.me/${phoneNumber}?text=${encodedMessage}`;

        window.open(whatsappUrl, '_blank');
        toast.success("Redirecionando para o WhatsApp do atendimento...");
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

                <Button
                    size="lg"
                    className="flex-1 bg-slate-700 hover:bg-slate-800 text-white h-auto py-4 text-lg shadow-md"
                    onClick={handleRequestConsultation}
                >
                    <Scale className="mr-2 h-5 w-5" />
                    Agendar Consultoria Jurídica
                </Button>
            </div>
        </>
    );
}
