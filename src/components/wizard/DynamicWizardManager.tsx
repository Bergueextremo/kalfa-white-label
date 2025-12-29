import { useState, useEffect, useMemo } from "react";
import { ContractVariable } from "../catalog/types";
import { Button } from "@/components/ui/button";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from "@/components/ui/select";
import { CheckCircle2, ChevronRight, FileText, ChevronLeft } from "lucide-react";
import { cn } from "@/lib/utils";
import { maskCPF, maskCNPJ, maskMoney } from "@/lib/masks";
import { toast } from "sonner";
import { useConditionalLogic } from "@/hooks/useConditionalLogic";

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

    // Conditional logic hook for dynamic visibility
    const { isVisible, getHiddenFieldNames } = useConditionalLogic(formData);

    // Reset values of hidden fields to prevent stale data
    useEffect(() => {
        const hiddenFields = getHiddenFieldNames(variables);
        hiddenFields.forEach(fieldName => {
            if (formData[fieldName]) {
                onChange(fieldName, '');
                localStorage.removeItem(`jus_var_${fieldName}`);
            }
        });
    }, [formData, variables, getHiddenFieldNames, onChange]);

    // Memory: Load values from localStorage on mount
    // Memory: Load values from localStorage on mount - DISABLED per user request for always empty start
    /*
    useEffect(() => {
        variables.forEach(v => {
            const savedValue = localStorage.getItem(`jus_var_${v.name}`);
            if (savedValue && !formData[v.name]) {
                onChange(v.name, savedValue);
            }
        });
    }, [variables]); 
    */

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
    const rawVariables = groupedVariables[currentGroup] || [];

    // Deduplicate and filter by visibility rules
    const currentVariables = useMemo(() => {
        return rawVariables
            .filter(v => isVisible(v)) // Apply conditional logic
            .reduce((acc, v) => {
                if (!acc.find(item => item.label === v.label || item.name === v.name)) {
                    acc.push(v);
                }
                return acc;
            }, [] as ContractVariable[]);
    }, [rawVariables, isVisible]);

    const isLastStep = currentStep === totalSteps - 1 || totalSteps === 0;

    const handleNext = () => {
        // Validation: Verify all required variables in the CURRENT group
        // We check against rawVariables because all of them must be eventually filled (via sync)
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

            // Save to memory
            localStorage.setItem(`jus_var_${variable.name}`, maskedValue);

            // Sync all variables with the same label or name across the entire formData
            const relatedVars = variables.filter(v =>
                v.label === variable.label ||
                v.name === variable.name
            );

            relatedVars.forEach(v => {
                onChange(v.name, maskedValue);
                localStorage.setItem(`jus_var_${v.name}`, maskedValue);
            });
        };

        const handleChange = (val: string) => {
            // Save to memory
            localStorage.setItem(`jus_var_${variable.name}`, val);

            // Sync all variables with the same label or name
            const relatedVars = variables.filter(v =>
                v.label === variable.label ||
                v.name === variable.name
            );

            relatedVars.forEach(v => {
                onChange(v.name, val);
                // Also save related ones to memory if they differ
                localStorage.setItem(`jus_var_${v.name}`, val);
            });
        };

        switch (variable.type) {
            case 'date':
                return (
                    <Input
                        type="date"
                        value={value}
                        onChange={e => handleChange(e.target.value)}
                    />
                );
            case 'number':
                return (
                    <Input
                        type="number"
                        value={value}
                        onChange={e => handleChange(e.target.value)}
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
                        onValueChange={val => handleChange(val)}
                    >
                        <SelectTrigger>
                            <SelectValue placeholder="Selecione" />
                        </SelectTrigger>
                        <SelectContent>
                            {variable.options?.map(opt => {
                                const [label, val] = opt.includes('|') ? opt.split('|').map(s => s.trim()) : [opt, opt];
                                return <SelectItem key={val} value={val}>{label}</SelectItem>;
                            })}
                        </SelectContent>
                    </Select>
                );
            case 'text':
            default:
                return (
                    <Input
                        type="text"
                        value={value}
                        onChange={e => handleChange(e.target.value)}
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
                <div className="flex items-center justify-between mb-2">
                    <div className="flex items-center gap-2">
                        <div className="h-8 w-8 rounded-lg bg-primary/10 flex items-center justify-center">
                            <FileText className="h-4 w-4 text-primary" />
                        </div>
                        <span className="text-sm font-bold text-primary uppercase tracking-tight">Etapa {currentStep + 1} de {totalSteps}</span>
                    </div>
                </div>
                {/* Progress Bar */}
                <div className="flex gap-1">
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
            <div className="flex-1 overflow-y-auto p-6">
                {/* Moved Title & Group here for better UX as requested */}
                <div className="mb-8 border-b pb-4">
                    <h2 className="text-2xl font-bold text-slate-900 mb-1">{contractTitle}</h2>
                    <p className="text-slate-500 font-medium flex items-center gap-2">
                        <span className="h-2 w-2 rounded-full bg-primary" />
                        {currentGroup}
                    </p>
                </div>

                <div className="space-y-6">
                    {currentVariables.map(variable => (
                        <div
                            key={variable.id || variable.name}
                            className="space-y-2 animate-in fade-in slide-in-from-bottom-2 duration-300"
                        >
                            <Label className="flex items-center gap-1">
                                {variable.label}
                                {variable.required && <span className="text-red-500">*</span>}
                            </Label>
                            {renderInput(variable)}
                        </div>
                    ))}
                </div>
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
