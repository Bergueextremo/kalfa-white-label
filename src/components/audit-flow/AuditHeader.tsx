import React from 'react';
import { Sparkles } from 'lucide-react';

export function AuditHeader() {
    return (
        <div className="bg-white rounded-2xl shadow-lg p-6 mb-6">
            <div className="flex flex-col md:flex-row items-start md:items-center justify-between gap-4">
                <div>
                    <h1 className="text-2xl md:text-3xl font-bold text-slate-900 mb-2">Estratégia de Análise Contratual</h1>
                    <p className="text-slate-600 text-sm md:text-base">O Sistema de Autenticação é **cirúrgico**: foco em conformidade e mitigação de riscos.</p>
                </div>
                <div className="flex items-center gap-2 bg-blue-50 px-3 py-2 md:px-4 md:py-2 rounded-lg w-full md:w-auto justify-center md:justify-start">
                    <Sparkles className="w-4 h-4 md:w-5 md:h-5 text-blue-600 flex-shrink-0" />
                    <span className="text-xs md:text-sm font-semibold text-blue-900">Análise Preditiva - Padrão Auditor</span>
                </div>
            </div>
        </div>
    );
}
