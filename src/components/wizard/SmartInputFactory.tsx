import { ContractVariable } from "../catalog/types";
import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { Select, SelectContent, SelectItem, SelectTrigger, SelectValue } from "@/components/ui/select";
import { SmartDocInput } from "./smart-inputs/SmartDocInput";
import { SmartMoneyInput } from "./smart-inputs/SmartMoneyInput";
import { SmartAddressInput } from "./smart-inputs/SmartAddressInput";
import { CheckCircle2 } from "lucide-react";

interface SmartInputFactoryProps {
    variable: ContractVariable;
    value: string;
    onChange: (value: string) => void;
    labelOverride?: string; // Allow overriding the DB label
    forceDocumentType?: 'cpf' | 'cnpj'; // Force specific doc type validation
}

export function SmartInputFactory({ variable, value, onChange, labelOverride, forceDocumentType }: SmartInputFactoryProps) {
    const nameLower = variable.name.toLowerCase();
    const labelLower = variable.label.toLowerCase();

    // Use override if provided, else DB label
    const displayLabel = labelOverride || variable.label;

    // Heuristics for special types
    const isCPFCNPJ = nameLower.includes('cpf') || nameLower.includes('cnpj') || labelLower.includes('cpf') || labelLower.includes('cnpj');
    const isMoney = variable.type === 'currency' || nameLower.includes('valor') || nameLower.includes('preco') || labelLower.includes('valor');
    const isAddress = variable.type === 'address' || nameLower.includes('endereco') || labelLower.includes('endereço');
    const isDate = variable.type === 'date' || nameLower.includes('data');
    const isSelect = variable.type === 'select' || (variable.options && variable.options.length > 0);

    // Common Label Wrapper
    const LabelWrapper = ({ children }: { children: React.ReactNode }) => (
        <div className="space-y-2 animate-in fade-in slide-in-from-bottom-1 duration-300">
            {/* Address handles its own label internally mostly, but for consistency we might want it here. 
                However, SmartAddressInput has complex structure. Let's return it directly if address.
             */}
            {!isAddress && (
                <Label htmlFor={variable.name} className="flex items-center gap-2">
                    {displayLabel}
                    {variable.required && <span className="text-red-500">*</span>}
                    {value && <CheckCircle2 className="h-3 w-3 text-green-500" />}
                </Label>
            )}
            {children}
        </div>
    );

    if (isAddress) {
        return (
            <div className="animate-in fade-in slide-in-from-bottom-1 duration-300">
                <SmartAddressInput
                    label={displayLabel}
                    value={value}
                    onChange={onChange}
                />
            </div>
        );
    }

    if (isCPFCNPJ) {
        // determine default type if possible
        let defaultType: 'cpf' | 'cnpj' = (nameLower.includes('cnpj') && !nameLower.includes('cpf')) ? 'cnpj' : 'cpf';

        // If forced type is present, use it.
        // Also if forced type is present, we likely want to hide the selector to avoid confusion, 
        // OR fix the selector to that type.
        if (forceDocumentType) {
            defaultType = forceDocumentType;
        }

        return (
            <div className="animate-in fade-in slide-in-from-bottom-1 duration-300">
                <SmartDocInput
                    label={displayLabel}
                    value={value}
                    onChange={onChange}
                    required={variable.required}
                    defaultType={defaultType}
                    // If forced, hide selector, or we can keep it if we want flexibility but default to forced.
                    // Let's hide it if forced to enforce the "Person Type" switch decision.
                    showTypeSelector={!forceDocumentType}
                />
            </div>
        );
    }

    if (isMoney) {
        return (
            <div className="animate-in fade-in slide-in-from-bottom-1 duration-300">
                <SmartMoneyInput
                    label={displayLabel}
                    value={value}
                    onChange={onChange}
                    required={variable.required}
                />
            </div>
        );
    }

    if (isSelect) {
        return (
            <LabelWrapper>
                <Select value={value} onValueChange={onChange}>
                    <SelectTrigger>
                        <SelectValue placeholder="Selecione..." />
                    </SelectTrigger>
                    <SelectContent>
                        {variable.options?.map((opt) => (
                            <SelectItem key={opt} value={opt}>
                                {opt}
                            </SelectItem>
                        ))}
                    </SelectContent>
                </Select>
            </LabelWrapper>
        );
    }

    if (isDate) {
        return (
            <LabelWrapper>
                <Input
                    id={variable.name}
                    type="date"
                    value={value}
                    onChange={(e) => onChange(e.target.value)}
                    className="transition-all focus:ring-2 focus:ring-primary/20"
                />
            </LabelWrapper>
        );
    }

    // Default Text Input
    return (
        <LabelWrapper>
            <Input
                id={variable.name}
                value={value}
                onChange={(e) => onChange(e.target.value)}
                placeholder={`Digite here...`}
                className="transition-all focus:ring-2 focus:ring-primary/20"
            />
        </LabelWrapper>
    );
}
