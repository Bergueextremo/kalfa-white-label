
import { useState, useMemo, useEffect } from 'react';
import { ContractVariable } from '../catalog/types';
import { Button } from '@/components/ui/button';
import { SmartInputFactory } from './SmartInputFactory';
import { ChevronRight, ChevronLeft, CheckCircle2, ShieldCheck, FileText, User, DollarSign, Building2, Eye } from 'lucide-react';
import { cn } from '@/lib/utils';
import { toast } from 'sonner';
import { RadioGroup, RadioGroupItem } from "@/components/ui/radio-group";
import { Label } from "@/components/ui/label";
import { Input } from "@/components/ui/input";
import { IContratoLocacao, initialContractState } from '@/types/contract-structure';

interface WizardManagerProps {
    contractTitle: string;
    variables: ContractVariable[];
    formData: Record<string, string>;
    onChange: (name: string, value: string) => void;
    onComplete: (data: IContratoLocacao) => void;
    onDataChange?: (data: IContratoLocacao) => void; // Support RT updates
}

export function WizardManager({ contractTitle, formData, onChange, onComplete, onDataChange }: WizardManagerProps) {
    // Local state for strict contract structure
    const [contractData, setContractData] = useState<IContratoLocacao>(initialContractState);

    // Sync to parent for Live Preview
    useEffect(() => {
        if (onDataChange) {
            onDataChange(contractData);
        }
    }, [contractData, onDataChange]);
    const [currentStepIndex, setCurrentStepIndex] = useState(0);

    // Keep legacy formData in sync for preview if necessary, although eventually Preview should use contractData
    // For now, let's focus on collecting contractData cleanly.

    const steps = [
        { id: 'locador', title: 'Qualificação do Locador', icon: User },
        { id: 'locatario', title: 'Qualificação do Locatário', icon: User },
        { id: 'imovel', title: 'Objeto do Contrato', icon: Building2 },
        { id: 'regras', title: 'Regras e Valores', icon: DollarSign },
        { id: 'revisao', title: 'Revisão Final', icon: Eye },
    ];

    const currentStep = steps[currentStepIndex];
    const isLastStep = currentStepIndex === steps.length - 1;

    const updateLocador = (field: keyof typeof contractData.locador, value: any) => {
        setContractData(prev => ({ ...prev, locador: { ...prev.locador, [field]: value } }));
    };

    const updateLocatario = (field: keyof typeof contractData.locatario, value: any) => {
        setContractData(prev => ({ ...prev, locatario: { ...prev.locatario, [field]: value } }));
    };

    const updateImovel = (field: keyof typeof contractData.imovel, value: any) => {
        setContractData(prev => ({ ...prev, imovel: { ...prev.imovel, [field]: value } }));
    };

    const updateFinanceiro = (field: keyof typeof contractData.financeiro, value: any) => {
        setContractData(prev => ({ ...prev, financeiro: { ...prev.financeiro, [field]: value } }));
    };

    const updatePrazo = (field: keyof typeof contractData.prazo, value: any) => {
        setContractData(prev => ({ ...prev, prazo: { ...prev.prazo, [field]: value } }));
    };

    const handleNext = () => {
        // Basic required checks can go here
        if (isLastStep) {
            onComplete(contractData);
        } else {
            setCurrentStepIndex(prev => prev + 1);
            document.getElementById('wizard-form-container')?.scrollTo(0, 0);
        }
    };

    const handlePrev = () => {
        if (currentStepIndex > 0) setCurrentStepIndex(prev => prev - 1);
    };

    const renderStepContent = () => {
        switch (currentStep.id) {
            case 'locador':
                return (
                    <div className="space-y-4 animate-in fade-in slide-in-from-right-4 duration-300">
                        <Label>Tipo de Pessoa</Label>
                        <RadioGroup
                            value={contractData.locador.tipo}
                            onValueChange={(v: 'PF' | 'PJ') => updateLocador('tipo', v)}
                            className="flex gap-4 mb-4"
                        >
                            <div className="flex items-center space-x-2 border p-3 rounded hover:bg-slate-50 cursor-pointer">
                                <RadioGroupItem value="PF" id="loc_pf" />
                                <Label htmlFor="loc_pf">Pessoa Física</Label>
                            </div>
                            <div className="flex items-center space-x-2 border p-3 rounded hover:bg-slate-50 cursor-pointer">
                                <RadioGroupItem value="PJ" id="loc_pj" />
                                <Label htmlFor="loc_pj">Pessoa Jurídica</Label>
                            </div>
                        </RadioGroup>

                        <div className="space-y-2">
                            <Label>Nome Completo / Razão Social</Label>
                            <Input value={contractData.locador.nome} onChange={e => updateLocador('nome', e.target.value)} />
                        </div>

                        <div className="grid grid-cols-2 gap-4">
                            <div className="space-y-2">
                                <Label>{contractData.locador.tipo === 'PF' ? 'CPF' : 'CNPJ'}</Label>
                                <Input value={contractData.locador.documento} onChange={e => updateLocador('documento', e.target.value)} />
                            </div>
                            <div className="space-y-2">
                                <Label>{contractData.locador.tipo === 'PF' ? 'RG' : 'Inscrição Estadual'}</Label>
                                <Input value={contractData.locador.rg_ie} onChange={e => updateLocador('rg_ie', e.target.value)} />
                            </div>
                        </div>

                        {contractData.locador.tipo === 'PF' && (
                            <div className="grid grid-cols-3 gap-4">
                                <div className="space-y-2">
                                    <Label>Nacionalidade</Label>
                                    <Input value={contractData.locador.nacionalidade} onChange={e => updateLocador('nacionalidade', e.target.value)} />
                                </div>
                                <div className="space-y-2">
                                    <Label>Estado Civil</Label>
                                    <Input value={contractData.locador.estadoCivil} onChange={e => updateLocador('estadoCivil', e.target.value)} />
                                </div>
                                <div className="space-y-2">
                                    <Label>Profissão</Label>
                                    <Input value={contractData.locador.profissao} onChange={e => updateLocador('profissao', e.target.value)} />
                                </div>
                            </div>
                        )}

                        <div className="space-y-2">
                            <Label>Endereço Completo</Label>
                            <Input value={contractData.locador.endereco} onChange={e => updateLocador('endereco', e.target.value)} placeholder="Rua, Número, Bairro, Cidade - UF" />
                        </div>
                    </div>
                );
            case 'locatario':
                return (
                    <div className="space-y-4 animate-in fade-in slide-in-from-right-4 duration-300">
                        <Label>Tipo de Pessoa</Label>
                        <RadioGroup
                            value={contractData.locatario.tipo}
                            onValueChange={(v: 'PF' | 'PJ') => updateLocatario('tipo', v)}
                            className="flex gap-4 mb-4"
                        >
                            <div className="flex items-center space-x-2 border p-3 rounded hover:bg-slate-50 cursor-pointer">
                                <RadioGroupItem value="PF" id="locat_pf" />
                                <Label htmlFor="locat_pf">Pessoa Física</Label>
                            </div>
                            <div className="flex items-center space-x-2 border p-3 rounded hover:bg-slate-50 cursor-pointer">
                                <RadioGroupItem value="PJ" id="locat_pj" />
                                <Label htmlFor="locat_pj">Pessoa Jurídica</Label>
                            </div>
                        </RadioGroup>

                        <div className="space-y-2">
                            <Label>Nome Completo / Razão Social</Label>
                            <Input value={contractData.locatario.nome} onChange={e => updateLocatario('nome', e.target.value)} />
                        </div>

                        <div className="grid grid-cols-2 gap-4">
                            <div className="space-y-2">
                                <Label>{contractData.locatario.tipo === 'PF' ? 'CPF' : 'CNPJ'}</Label>
                                <Input value={contractData.locatario.documento} onChange={e => updateLocatario('documento', e.target.value)} />
                            </div>
                            <div className="space-y-2">
                                <Label>{contractData.locatario.tipo === 'PF' ? 'RG' : 'Inscrição Estadual'}</Label>
                                <Input value={contractData.locatario.rg_ie} onChange={e => updateLocatario('rg_ie', e.target.value)} />
                            </div>
                        </div>

                        <div className="space-y-2">
                            <Label>Endereço Atual</Label>
                            <Input value={contractData.locatario.enderecoAtual} onChange={e => updateLocatario('enderecoAtual', e.target.value)} placeholder="Endereço antes da locação" />
                        </div>
                    </div>
                );
            case 'imovel':
                return (
                    <div className="space-y-4 animate-in fade-in slide-in-from-right-4 duration-300">
                        <Label>Tipo de Imóvel</Label>
                        <RadioGroup
                            value={contractData.imovel.tipo}
                            onValueChange={(v: 'Residencial' | 'Comercial') => updateImovel('tipo', v)}
                            className="flex gap-4 mb-4"
                        >
                            <div className="flex items-center space-x-2 border p-3 rounded hover:bg-slate-50 cursor-pointer">
                                <RadioGroupItem value="Residencial" id="imo_res" />
                                <Label htmlFor="imo_res">Residencial</Label>
                            </div>
                            <div className="flex items-center space-x-2 border p-3 rounded hover:bg-slate-50 cursor-pointer">
                                <RadioGroupItem value="Comercial" id="imo_com" />
                                <Label htmlFor="imo_com">Comercial</Label>
                            </div>
                        </RadioGroup>

                        <div className="space-y-2">
                            <Label>Endereço do Imóvel</Label>
                            <Input value={contractData.imovel.enderecoCompleto} onChange={e => updateImovel('enderecoCompleto', e.target.value)} />
                        </div>

                        <div className="space-y-2">
                            <Label>Características</Label>
                            <Input value={contractData.imovel.caracteristicas} onChange={e => updateImovel('caracteristicas', e.target.value)} placeholder="Ex: Casa com 3 quartos, 1 suíte..." />
                        </div>

                        {contractData.imovel.tipo === 'Comercial' && (
                            <div className="space-y-2">
                                <Label>Finalidade Específica</Label>
                                <Input value={contractData.imovel.finalidade} onChange={e => updateImovel('finalidade', e.target.value)} placeholder="Ex: Loja de Roupas, Igreja..." />
                            </div>
                        )}
                    </div>
                );
            case 'regras':
                return (
                    <div className="space-y-4 animate-in fade-in slide-in-from-right-4 duration-300">
                        <div className="grid grid-cols-2 gap-4">
                            <div className="space-y-2">
                                <Label>Valor Mensal (R$)</Label>
                                <Input type="number" value={contractData.financeiro.valorMensal} onChange={e => updateFinanceiro('valorMensal', e.target.value)} />
                            </div>
                            <div className="space-y-2">
                                <Label>Dia do Vencimento</Label>
                                <Input type="number" min="1" max="31" value={contractData.financeiro.diaVencimento} onChange={e => updateFinanceiro('diaVencimento', e.target.value)} />
                            </div>
                        </div>

                        <div className="grid grid-cols-2 gap-4">
                            <div className="space-y-2">
                                <Label>Duração (Meses)</Label>
                                <Input type="number" value={contractData.prazo.duracaoMeses} onChange={e => updatePrazo('duracaoMeses', e.target.value)} />
                            </div>
                            <div className="space-y-2">
                                <Label>Data de Início</Label>
                                <Input type="date" value={contractData.prazo.dataInicio} onChange={e => updatePrazo('dataInicio', e.target.value)} />
                            </div>
                        </div>
                    </div>
                );
            case 'revisao':
                return (
                    <div className="bg-slate-50 p-6 rounded-lg space-y-4 text-sm">
                        <h4 className="font-bold text-center border-b pb-2">Resumo dos Dados</h4>
                        <div className="grid grid-cols-2 gap-4">
                            <div>
                                <p className="font-semibold text-gray-500">Locador</p>
                                <p>{contractData.locador.nome} ({contractData.locador.documento})</p>
                            </div>
                            <div>
                                <p className="font-semibold text-gray-500">Locatário</p>
                                <p>{contractData.locatario.nome} ({contractData.locatario.documento})</p>
                            </div>
                            <div>
                                <p className="font-semibold text-gray-500">Imóvel</p>
                                <p>{contractData.imovel.enderecoCompleto}</p>
                            </div>
                            <div>
                                <p className="font-semibold text-gray-500">Valor</p>
                                <p>R$ {contractData.financeiro.valorMensal},00</p>
                            </div>
                        </div>
                    </div>
                );
            default:
                return null;
        }
    };

    return (
        <div className="flex flex-col h-full bg-card border rounded-xl shadow-sm overflow-hidden">
            {/* Header */}
            <div className="bg-muted/30 border-b p-4">
                <div className="flex items-center justify-between mb-4">
                    <h3 className="font-semibold text-lg flex items-center gap-2">
                        <ShieldCheck className="h-5 w-5 text-primary" />
                        {currentStep.title}
                    </h3>
                    <div className="text-xs font-mono text-muted-foreground bg-background px-2 py-1 rounded border">
                        Etapa {currentStepIndex + 1} de {steps.length}
                    </div>
                </div>
                {/* Progress Bar */}
                <div className="flex gap-1 mb-2">
                    {steps.map((step, idx) => (
                        <div
                            key={step.id}
                            className={cn(
                                "h-1 flex-1 rounded-full transition-all duration-300",
                                idx <= currentStepIndex ? "bg-primary" : "bg-primary/20"
                            )}
                        />
                    ))}
                </div>
            </div>

            {/* Content */}
            <div id="wizard-form-container" className="flex-1 overflow-y-auto p-6">
                {renderStepContent()}
            </div>

            {/* Footer */}
            <div className="p-4 border-t bg-muted/10 flex justify-between items-center gap-4">
                <Button
                    variant="ghost"
                    onClick={handlePrev}
                    disabled={currentStepIndex === 0}
                    className="w-1/3"
                >
                    <ChevronLeft className="mr-2 h-4 w-4" /> Voltar
                </Button>

                <Button
                    onClick={handleNext}
                    className={cn(
                        "w-2/3 bg-gradient-to-r from-primary to-primary/80 hover:to-primary transition-all"
                    )}
                >
                    {isLastStep ? (
                        <>Gerar Contrato <CheckCircle2 className="ml-2 h-4 w-4" /></>
                    ) : (
                        <>Próximo <ChevronRight className="ml-2 h-4 w-4" /></>
                    )}
                </Button>
            </div>
        </div>
    );
}
