import { Input } from "@/components/ui/input";
import { Label } from "@/components/ui/label";
import { cn } from "@/lib/utils";
import { formatMoney } from "@/lib/contract-utils";
import { useState } from "react";
import { DollarSign } from "lucide-react";

interface SmartMoneyInputProps {
    value: string;
    onChange: (value: string) => void;
    label?: string;
    required?: boolean;
}

export function SmartMoneyInput({
    value,
    onChange,
    label = "Valor",
    required = false
}: SmartMoneyInputProps) {
    const [displayValue, setDisplayValue] = useState(value || '');

    const handleChange = (e: React.ChangeEvent<HTMLInputElement>) => {
        const rawValue = e.target.value.replace(/\D/g, ''); // Remove non-digits

        if (!rawValue) {
            setDisplayValue('');
            onChange('');
            return;
        }

        const formatted = formatMoney(rawValue);
        setDisplayValue(formatted);
        onChange(formatted);
    };

    return (
        <div className="space-y-2">
            <Label className="flex items-center gap-2">
                {label}
                {required && <span className="text-red-500">*</span>}
            </Label>
            <div className="relative">
                <DollarSign className="absolute left-3 top-2.5 h-4 w-4 text-muted-foreground" />
                <Input
                    value={displayValue}
                    onChange={handleChange}
                    placeholder="R$ 0,00"
                    className="pl-9"
                />
            </div>
        </div>
    );
}
