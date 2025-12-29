import { useRef, useMemo } from 'react';
import { ScrollArea } from '@/components/ui/scroll-area';
import { Button } from '@/components/ui/button';
import { Download, Printer, ShieldCheck } from 'lucide-react';
import { Contract, ContractVariable } from '../catalog/types';
import { IContratoLocacao } from '@/types/contract-structure';
import { generatePreamble } from '@/lib/preamble-generator';
import { generateSignatures } from '@/lib/signature-generator';
import { cn, normalizeKey } from '@/lib/utils';
import { useConditionalLogic } from '@/hooks/useConditionalLogic';

interface LivePreviewProps {
    robustTemplate: string;
    formData: Record<string, string>;
    contract?: Contract;
    variables?: ContractVariable[]; // Added variables prop
    structuredData?: IContratoLocacao; // New prop for authority data
}

export function LivePreview({ robustTemplate, formData, contract, variables = [], structuredData }: LivePreviewProps) {
    const previewRef = useRef<HTMLDivElement>(null);
    const { isVisible } = useConditionalLogic(formData);

    // Authority Injection Logic
    let finalContent = robustTemplate;

    // Fix literal newlines from DB text (if any)
    if (finalContent) {
        finalContent = finalContent.replace(/\\n/g, '<br/>');
    }

    // Flatten Structured Data for Variable Replacement
    const flatData: Record<string, string> = { ...formData };

    if (structuredData) {
        const mapToAliases = (obj: any, prefix: string, aliases: string[]) => {
            if (!obj) return;
            Object.entries(obj).forEach(([key, value]) => {
                if (typeof value === 'string' || typeof value === 'number') {
                    const valStr = String(value);
                    flatData[`${prefix}_${key}`] = valStr;
                    flatData[`${key}_${prefix}`] = valStr;
                    aliases.forEach(alias => {
                        flatData[`${alias}_${key}`] = valStr;
                        flatData[`${key}_${alias}`] = valStr;
                    });
                }
            });
        };

        mapToAliases(structuredData.locador, 'locador', ['locador', 'parte_1', 'contratante', 'comodante', 'vendedor']);
        mapToAliases(structuredData.locatario, 'locatario', ['locatario', 'parte_2', 'contratado', 'comodatario', 'comprador']);
        mapToAliases(structuredData.imovel, 'imovel', ['imovel', 'objeto']);
        mapToAliases(structuredData.financeiro, 'financeiro', ['financeiro', 'pagamento', 'valor']);
        mapToAliases(structuredData.prazo, 'prazo', ['prazo']);

        flatData['valor_aluguel'] = String(structuredData.financeiro.valorMensal || '');
        flatData['valor'] = String(structuredData.financeiro.valorMensal || '');
        flatData['dia_vencimento'] = String(structuredData.financeiro.diaVencimento || '');
        flatData['prazo_meses'] = String(structuredData.prazo.duracaoMeses || '');
        flatData['data_inicio'] = String(structuredData.prazo.dataInicio || '');
    }

    // Process variables into the HTML string with styling
    // 1. Combine all available variables (form + flat)
    const allVars = { ...flatData };

    // Function to get replacement span
    const getReplacement = (variableName: string, originalMatch: string) => {
        // Find if this variable exists in our definitions
        const variable = variables.find(v => v.name === variableName || normalizeKey(v.label) === variableName);

        // Check visibility
        const isVariableVisible = variable ? isVisible(variable) : true;

        // If hidden/not visible, we should not display it or display empty
        // However, for correct contract flow, we often want to replace it with nothing 
        // OR simply treat it as empty. 
        // If we treat it as empty, the logic below might show "bg-yellow-50" if we don't be careful.

        if (!isVariableVisible) {
            // It is hidden by logic. Return empty string so it disappears from the text flow.
            // But we should verify if surrounding text needs to process.
            // For now, replacing with empty string is "removing" it.
            return '';
        }

        const displayValue = allVars[variableName];
        const isMissing = !displayValue;

        // Apply Prefix/Suffix only if value is present
        const finalDisplay = !isMissing
            ? (variable?.prefix || '') + displayValue + (variable?.suffix || '')
            : originalMatch;

        const className = cn(
            "font-bold transition-all duration-300",
            !isMissing
                ? "text-black border-b border-dashed border-gray-400"
                : "bg-yellow-50 text-blue-600 border-b-2 border-blue-200 px-1"
        );

        return `<span class="${className}" title="${variableName}">${finalDisplay}</span>`;
    };

    // Replace {{variable}} items
    finalContent = finalContent.replace(/\{\{([^}]+)\}\}/g, (match, varName) => {
        return getReplacement(varName.trim(), match);
    });

    // Replace [Label] items
    finalContent = finalContent.replace(/\[([^\]]+)\]/g, (match, label) => {
        const varName = normalizeKey(label);
        return getReplacement(varName, match);
    });

    // Cleanup: Remove empty paragraphs that might result from hidden variables
    // This is a naive regex approach. Ideally we'd parse DOM.
    // Removing <p></p> or <p> </p>
    finalContent = finalContent.replace(/<p>\s*<\/p>/g, '');

    return (
        <ScrollArea className="flex-grow p-4 md:p-8 bg-slate-100/50 flex justify-center">
            {/* A4 Sheet Simulation */}
            <div
                className="mx-auto bg-white shadow-xl min-h-[29.7cm] w-[21cm] p-[2.5cm] origin-top scale-90 md:scale-100 transition-transform"
                style={{
                    boxShadow: "0 0 15px rgba(0,0,0,0.1)",
                    marginBottom: "2rem"
                }}
            >
                <div
                    className="font-serif text-[12pt] leading-[1.5] text-justify text-gray-900 prose-sm prose-slate max-w-none"
                    dangerouslySetInnerHTML={{ __html: finalContent }}
                />

                {/* Footer Marker */}
                <div className="mt-20 pt-8 border-t text-center text-[8pt] text-gray-400">
                    Documento gerado eletronicamente em {new Date().toLocaleDateString()}
                </div>
            </div>
        </ScrollArea>
    );
}
