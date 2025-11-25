import React, { useState } from 'react';
import { Zap, ArrowRight, FileCheck, Lock } from 'lucide-react';
import { Button } from '@/components/ui/button';
import { LegalCitation } from './LegalCitation';

interface Correction {
    original: string;
    corrected: string;
    savings: string;
    article: string;
}

interface CorrectionComparisonProps {
    corrections: Correction[];
}

export function CorrectionComparison({ corrections }: CorrectionComparisonProps) {
    const [isEnabled, setIsEnabled] = useState(false);

    return (
        <div className="bg-white rounded-2xl shadow-lg p-8 border-2 border-purple-100">
            <div className="text-center mb-8">
                <h2 className="text-2xl font-bold text-slate-900 mb-2">Reconstrução Contratual</h2>
                <p className="text-slate-600 mb-6">Compare as cláusulas originais com a versão blindada pela Autenticação Contractual.</p>

                {!isEnabled ? (
                    <Button
                        size="lg"
                        onClick={() => setIsEnabled(true)}
                        className="bg-purple-600 hover:bg-purple-700 text-white px-8 py-6 text-lg h-auto shadow-lg hover:shadow-xl transition-all animate-pulse"
                    >
                        <Zap className="mr-2 h-5 w-5" />
                        ATIVAR MENTALIDADE DE DOMÍNIO
                    </Button>
                ) : (
                    <div className="inline-flex items-center gap-2 px-4 py-2 bg-purple-100 text-purple-700 rounded-full font-bold">
                        <FileCheck className="w-5 h-5" />
                        VISÃO COMPARATIVA ATIVADA
                    </div>
                )}
            </div>

            {isEnabled && (
                <div className="space-y-8 animate-in fade-in slide-in-from-bottom-4 duration-700">
                    <div className="space-y-6">
                        <div className="grid grid-cols-1 md:grid-cols-2 gap-4 mb-4 text-sm font-bold text-slate-400 uppercase tracking-wider text-center">
                            <div>Original (Vulnerável)</div>
                            <div>Corrigido (Blindado)</div>
                        </div>

                        {corrections.map((item, idx) => (
                            <div key={idx} className="grid grid-cols-1 md:grid-cols-2 gap-0 md:gap-8 relative group">
                                {/* Connector Arrow (Desktop) */}
                                <div className="hidden md:flex absolute left-1/2 top-1/2 -translate-x-1/2 -translate-y-1/2 z-10 bg-white rounded-full p-1 border border-slate-200 text-slate-400">
                                    <ArrowRight className="w-4 h-4" />
                                </div>

                                {/* Original */}
                                <div className="p-6 bg-red-50/50 border border-red-100 rounded-xl relative opacity-70 group-hover:opacity-100 transition-opacity">
                                    <p className="text-slate-700 font-medium mb-2 line-through decoration-red-400">{item.original}</p>
                                </div>

                                {/* Corrected */}
                                <div className="p-6 bg-green-50 border border-green-200 rounded-xl relative shadow-sm">
                                    <div className="absolute -top-3 -right-3 bg-emerald-100 text-emerald-900 px-3 py-1 rounded-full text-xs font-bold shadow-sm border border-emerald-200">
                                        Economia: {item.savings}
                                    </div>
                                    <p className="text-slate-900 font-bold mb-2">{item.corrected}</p>

                                    <LegalCitation text={item.article} />
                                </div>
                            </div>
                        ))}
                    </div>
                </div>
            )}
        </div>
    );
}
