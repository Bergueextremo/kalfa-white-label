import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { RadioGroup, RadioGroupItem } from "@/components/ui/radio-group";
import { cn } from "@/lib/utils";
import { formatCNPJ, formatCPF, validateCNPJ, validateCPF } from "@/lib/contract-utils";
import { useState, useEffect } from "react";
import { AlertCircle, CheckCircle2 } from "lucide-react";

interface SmartDocInputProps {
    value: string;
    onChange: (value: string) => void;
    label?: string;
    error?: string;
    required?: boolean;
    showTypeSelector?: boolean; // If true, shows radio to switch between CPF/CNPJ
    defaultType?: 'cpf' | 'cnpj';
}

export function SmartDocInput({
    value,
    onChange,
    label = "Documento",
    error,
    required = false,
    showTypeSelector = true,
    defaultType = 'cpf'
}: SmartDocInputProps) {
    const [type, setType] = useState<'cpf' | 'cnpj'>(defaultType);
    const [touched, setTouched] = useState(false);

    const isValid = type === 'cpf' ? validateCPF(value) : validateCNPJ(value);
    const showValidation = touched && value.length > 5;

    useEffect(() => {
        // Auto-detect type if not explicit? Maybe safer to let user switch.
    }, [value]);

    const handleChange = (e: React.ChangeEvent<HTMLInputElement>) => {
        const raw = e.target.value;
        const formatted = type === 'cpf' ? formatCPF(raw) : formatCNPJ(raw);
        onChange(formatted);
    };

    return (
        <div className="space-y-2">
            <div className="flex items-center justify-between">
                <Label className="flex items-center gap-2">
                    {label}
                    {required && <span className="text-red-500">*</span>}
                    {showValidation && isValid && <CheckCircle2 className="h-3 w-3 text-green-500" />}
                </Label>

                {showTypeSelector && (
                    <RadioGroup defaultValue={type} onValueChange={(v) => {
                        setType(v as 'cpf' | 'cnpj');
                        onChange(''); // Clear on type switch
                    }} className="flex items-center gap-2">
                        <div className="flex items-center space-x-2">
                            <RadioGroupItem value="cpf" id="r-cpf" />
                            <Label htmlFor="r-cpf" className="font-normal text-xs cursor-pointer">CPF</Label>
                        </div>
                        <div className="flex items-center space-x-2">
                            <RadioGroupItem value="cnpj" id="r-cnpj" />
                            <Label htmlFor="r-cnpj" className="font-normal text-xs cursor-pointer">CNPJ</Label>
                        </div>
                    </RadioGroup>
                )}
            </div>

            <div className="relative">
                <Input
                    value={value}
                    onChange={handleChange}
                    onBlur={() => setTouched(true)}
                    placeholder={type === 'cpf' ? "000.000.000-00" : "00.000.000/0000-00"}
                    className={cn(
                        "transition-all",
                        showValidation && !isValid ? "border-red-300 focus-visible:ring-red-200" : "",
                        showValidation && isValid ? "border-green-300 focus-visible:ring-green-200" : ""
                    )}
                    maxLength={type === 'cpf' ? 14 : 18}
                />
            </div>

            {showValidation && !isValid && (
                <p className="text-xs text-red-500 flex items-center gap-1">
                    <AlertCircle className="h-3 w-3" />
                    {type.toUpperCase()} inválido
                </p>
            )}
            {error && <p className="text-xs text-red-500">{error}</p>}
        </div>
    );
}
