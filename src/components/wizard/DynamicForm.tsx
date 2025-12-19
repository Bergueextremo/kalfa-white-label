import { ContractVariable } from '../catalog/types';
import { Input } from '@/components/ui/input';
import { Label } from '@/components/ui/label';
import { Progress } from '@/components/ui/progress';
import { ShieldCheck, CheckCircle2 } from 'lucide-react';

interface DynamicFormProps {
    variables: ContractVariable[];
    formData: Record<string, string>;
    onChange: (name: string, value: string) => void;
}

export function DynamicForm({ variables, formData, onChange }: DynamicFormProps) {
    // Calculate completion percentage
    const totalRequired = variables.filter(v => v.required).length;
    const filledRequired = variables.filter(v => v.required && formData[v.name]?.length > 0).length;
    const progress = totalRequired > 0 ? (filledRequired / totalRequired) * 100 : 0;

    return (
        <div className="space-y-6 p-6 bg-card border rounded-xl shadow-sm h-full overflow-y-auto">
            <div className="mb-6 space-y-2">
                <h3 className="font-semibold text-lg flex items-center gap-2">
                    <ShieldCheck className="h-5 w-5 text-primary" />
                    Dados do Contrato
                </h3>
                <div className="space-y-1">
                    <div className="flex justify-between text-xs text-muted-foreground">
                        <span>Score de Segurança</span>
                        <span>{Math.round(progress)}% Blindado</span>
                    </div>
                    <Progress value={progress} className="h-2" />
                </div>
            </div>

            <div className="space-y-4">
                {variables.map((variable) => (
                    <div key={variable.id} className="space-y-2 animate-in fade-in slide-in-from-bottom-2 duration-500">
                        <Label htmlFor={variable.name} className="flex items-center gap-2">
                            {variable.label}
                            {variable.required && <span className="text-red-500">*</span>}
                            {formData[variable.name] && <CheckCircle2 className="h-3 w-3 text-green-500" />}
                        </Label>

                        {variable.type === 'text' || variable.type === 'currency' ? (
                            <Input
                                id={variable.name}
                                value={formData[variable.name] || ''}
                                onChange={(e) => onChange(variable.name, e.target.value)}
                                placeholder={`Digite ${variable.label.toLowerCase()}...`}
                                className="transition-all focus:ring-2 focus:ring-primary/20"
                            />
                        ) : variable.type === 'date' ? (
                            <Input
                                id={variable.name}
                                type="date"
                                value={formData[variable.name] || ''}
                                onChange={(e) => onChange(variable.name, e.target.value)}
                                className="transition-all focus:ring-2 focus:ring-primary/20"
                            />
                        ) : (
                            // Fallback for other types
                            <Input
                                id={variable.name}
                                value={formData[variable.name] || ''}
                                onChange={(e) => onChange(variable.name, e.target.value)}
                            />
                        )}
                    </div>
                ))}
            </div>

            {progress === 100 && (
                <div className="mt-6 p-4 bg-green-500/10 border border-green-500/20 rounded-lg flex items-center gap-3 text-green-700">
                    <CheckCircle2 className="h-5 w-5" />
                    <p className="text-sm font-medium">Dados completos! Seu contrato está pronto para revisão.</p>
                </div>
            )}
        </div>
    );
}
