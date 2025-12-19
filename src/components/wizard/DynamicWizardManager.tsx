import { useState, useEffect } from "react";
import { ContractVariable } from "../catalog/types";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from "@/components/ui/select";
import { CheckCircle2, ChevronRight, FileText, ChevronLeft } from "lucide-react";
import { cn } from "@/lib/utils";
import { maskCPF, maskCNPJ, maskMoney } from "@/lib/masks";
import { toast } from "sonner";

interface DynamicWizardManagerProps {
    contractTitle: string;
    variables: ContractVariable[];
    formData: Record<string, string>;
    onChange: (name: string, value: string) => void;
    onComplete: () => void;
}

export function DynamicWizardManager({
    contractTitle,
    variables,
    formData,
    onChange,
    onComplete,
    wizardStages = [] // Should be passed from parent
}: DynamicWizardManagerProps & { wizardStages?: string[] | null }) {
    const [currentStep, setCurrentStep] = useState(0);

    // Group variables based on explicit stages order
    const stages = (wizardStages && wizardStages.length > 0) ? wizardStages : ["Informações Gerais"];

    const groupedVariables = variables.reduce((acc, v) => {
        const group = v.group_name && v.group_name !== '_default' && stages.includes(v.group_name)
            ? v.group_name
            : stages[0]; // Default to first stage if not set or stage was deleted

        if (!acc[group]) acc[group] = [];
        acc[group].push(v);
        return acc;
    }, {} as Record<string, ContractVariable[]>);

    // Use explicit stages as the definitive list of steps
    const groups = stages.filter(s => groupedVariables[s] && groupedVariables[s].length > 0);
    const totalSteps = groups.length;
    const currentGroup = groups[currentStep];
    const currentVariables = groupedVariables[currentGroup] || [];


    const isLastStep = currentStep === totalSteps - 1 || totalSteps === 0;

    const handleNext = () => {
        // Validation: Verify all required variables in the CURRENT group
        const missingField = currentVariables.find(v => v.required && !formData[v.name]);
        if (missingField) {
            toast.error(`O campo "${missingField.label}" é obrigatório.`);
            return;
        }

        if (isLastStep) {
            onComplete();
        } else {
            setCurrentStep(prev => prev + 1);
        }
    };


    const handlePrev = () => {
        if (currentStep > 0) {
            setCurrentStep(prev => prev - 1);
        }
    };

    const renderInput = (variable: ContractVariable) => {
        const value = formData[variable.name] || '';

        const handleMaskedChange = (val: string, maskFn?: (v: string) => string) => {
            const maskedValue = maskFn ? maskFn(val) : val;
            onChange(variable.name, maskedValue);
        };

        switch (variable.type) {
            case 'date':
                return (
                    <Input
                        type="date"
                        value={value}
                        onChange={e => onChange(variable.name, e.target.value)}
                    />
                );
            case 'number':
                return (
                    <Input
                        type="number"
                        value={value}
                        onChange={e => onChange(variable.name, e.target.value)}
                        placeholder="0"
                    />
                );
            case 'money':
            case 'currency':
                return (
                    <Input
                        type="text"
                        value={value}
                        onChange={e => handleMaskedChange(e.target.value, maskMoney)}
                        placeholder="R$ 0,00"
                    />
                );
            case 'cpf':
                return (
                    <Input
                        type="text"
                        value={value}
                        onChange={e => handleMaskedChange(e.target.value, maskCPF)}
                        placeholder="000.000.000-00"
                        maxLength={14}
                    />
                );
            case 'cnpj':
                return (
                    <Input
                        type="text"
                        value={value}
                        onChange={e => handleMaskedChange(e.target.value, maskCNPJ)}
                        placeholder="00.000.000/0000-00"
                        maxLength={18}
                    />
                );
            case 'select':
                return (
                    <Select
                        value={value}
                        onValueChange={val => onChange(variable.name, val)}
                    >
                        <SelectTrigger>
                            <SelectValue placeholder="Selecione..." />
                        </SelectTrigger>
                        <SelectContent>
                            {variable.options?.map(opt => (
                                <SelectItem key={opt} value={opt}>{opt}</SelectItem>
                            ))}
                        </SelectContent>
                    </Select>
                );
            case 'text':
            default:
                return (
                    <Input
                        type="text"
                        value={value}
                        onChange={e => onChange(variable.name, e.target.value)}
                        placeholder={variable.label}
                    />
                );
        }
    };

    if (variables.length === 0) {
        return (
            <div className="text-center py-10">
                <p className="text-muted-foreground">Este contrato não requer preenchimento de variáveis.</p>
                <Button onClick={onComplete} className="mt-4">
                    Continuar para Pagamento
                </Button>
            </div>
        );
    }

    return (
        <div className="flex flex-col h-full bg-card border rounded-xl shadow-sm overflow-hidden">
            {/* Header */}
            <div className="bg-muted/30 border-b p-4">
                <div className="flex items-center justify-between mb-4">
                    <div className="flex flex-col">
                        <h3 className="font-semibold text-lg flex items-center gap-2">
                            <FileText className="h-5 w-5 text-primary" />
                            {contractTitle}
                        </h3>
                        <span className="text-xs text-muted-foreground font-medium">
                            {currentGroup}
                        </span>
                    </div>
                    <div className="text-xs font-mono text-muted-foreground bg-background px-2 py-1 rounded border">
                        Etapa {currentStep + 1} de {totalSteps}
                    </div>
                </div>
                {/* Progress Bar */}
                <div className="flex gap-1 mb-2">
                    {Array.from({ length: totalSteps }).map((_, idx) => (
                        <div
                            key={idx}
                            className={cn(
                                "h-1 flex-1 rounded-full transition-all duration-300",
                                idx <= currentStep ? "bg-primary" : "bg-primary/20"
                            )}
                        />
                    ))}
                </div>
            </div>

            {/* Content */}
            <div className="flex-1 overflow-y-auto p-6 space-y-6">
                {currentVariables.map(variable => (
                    <div key={variable.id || variable.name} className="space-y-2">
                        <Label className="flex items-center gap-1">
                            {variable.label}
                            {variable.required && <span className="text-red-500">*</span>}
                        </Label>
                        {renderInput(variable)}
                    </div>
                ))}
            </div>

            {/* Footer */}
            <div className="p-4 border-t bg-muted/10 flex justify-between items-center gap-4">
                <Button
                    variant="ghost"
                    onClick={handlePrev}
                    disabled={currentStep === 0}
                    className="w-1/3"
                >
                    <ChevronLeft className="mr-2 h-4 w-4" /> Voltar
                </Button>

                <Button
                    onClick={handleNext}
                    className={cn(
                        "w-2/3 bg-gradient-to-r from-primary to-primary/80 hover:to-primary transition-all text-xs font-bold uppercase tracking-wider"
                    )}
                >
                    {isLastStep ? (
                        <>Emitir Contrato <CheckCircle2 className="ml-2 h-4 w-4" /></>
                    ) : (
                        <>Próximo <ChevronRight className="ml-2 h-4 w-4" /></>
                    )}
                </Button>
            </div>
        </div>
    );
}
