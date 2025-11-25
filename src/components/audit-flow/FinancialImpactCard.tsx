import React from 'react';
import { DollarSign, TrendingUp, ArrowDown, ArrowUp } from 'lucide-react';

interface FinancialImpactCardProps {
    totalCharged: number;
    legalValue: number;
    potentialSavings: number;
}

export function FinancialImpactCard({ totalCharged, legalValue, potentialSavings }: FinancialImpactCardProps) {
    const formatCurrency = (value: number) => {
        return new Intl.NumberFormat('pt-BR', { style: 'currency', currency: 'BRL' }).format(value);
    };

    return (
        <div className="bg-white rounded-2xl shadow-lg p-8 h-full">
            <div className="flex items-center gap-3 mb-6">
                <div className="p-3 bg-green-100 rounded-lg">
                    <DollarSign className="w-6 h-6 text-green-600" />
                </div>
                <div>
                    <h2 className="text-xl font-bold text-slate-900">Impacto no Caixa</h2>
                    <p className="text-sm text-slate-600">Recuperação de capital e estancamento de perdas.</p>
                </div>
            </div>

            <div className="space-y-6">
                <div className="p-4 bg-slate-50 rounded-xl border border-slate-100">
                    <p className="text-sm text-slate-500 mb-1">Valor Total Cobrado (Contrato)</p>
                    <p className="text-2xl font-bold text-slate-900">{formatCurrency(totalCharged)}</p>
                </div>

                <div className="p-4 bg-blue-50 rounded-xl border border-blue-100">
                    <p className="text-sm text-blue-600 mb-1">Valor Legal (Recalculado)</p>
                    <p className="text-2xl font-bold text-blue-900">{formatCurrency(legalValue)}</p>
                </div>

                <div className="p-4 bg-green-50 rounded-xl border border-green-100 relative overflow-hidden">
                    <div className="absolute right-0 top-0 p-4 opacity-10">
                        <TrendingUp className="w-24 h-24 text-green-600" />
                    </div>
                    <div className="relative z-10">
                        <p className="text-sm text-green-700 font-bold mb-1 flex items-center gap-2">
                            <ArrowUp className="w-4 h-4" />
                            POTENCIAL DE ECONOMIA
                        </p>
                        <p className="text-3xl font-extrabold text-green-700">{formatCurrency(potentialSavings)}</p>
                    </div>
                </div>
            </div>
        </div>
    );
}
