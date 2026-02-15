import React from 'react';
import { AlertTriangle, CheckCircle, Info, XCircle, ShieldAlert, Gavel, Banknote, Lock, Users, ChevronDown, ChevronUp } from 'lucide-react';
import {
    Accordion,
    AccordionContent,
    AccordionItem,
    AccordionTrigger,
} from "@/components/ui/accordion"

interface Issue {
    type: string;
    severity: string;
    clause: string;
    description: string;
    riskCategory: string; // New field
    financialImpact: string; // New field
    originalText: string; // New field
}

interface IssuesListProps {
    issues: Issue[];
}

export function IssuesList({ issues }: IssuesListProps) {

    // Helper to get icon for Risk Category
    const getCategoryIcon = (category: string) => {
        const cat = category.toUpperCase();
        if (cat.includes('FINANCEIRO')) return <Banknote className="w-5 h-5" />;
        if (cat.includes('TRABALHISTA') || cat.includes('RH')) return <Users className="w-5 h-5" />;
        if (cat.includes('SIGILO') || cat.includes('LGPD')) return <Lock className="w-5 h-5" />;
        if (cat.includes('CONSUMIDOR')) return <ShieldAlert className="w-5 h-5" />;
        return <Gavel className="w-5 h-5" />;
    };

    // Group issues by category for the "Battle Map"
    const riskMap = issues.reduce((acc, issue) => {
        const cat = issue.riskCategory || 'Geral';
        if (!acc[cat]) acc[cat] = 0;
        acc[cat]++;
        return acc;
    }, {} as Record<string, number>);

    return (
        <div className="space-y-8">
            {/* 1. Battle Map (Risk Cards) */}
            <div className="grid md:grid-cols-3 gap-4">
                {Object.entries(riskMap).map(([category, count], idx) => (
                    <div key={idx} className="bg-white p-4 rounded-xl shadow-sm border border-slate-100 flex items-center gap-4 hover:shadow-md transition-shadow">
                        <div className="p-3 bg-blue-50 text-blue-700 rounded-lg">
                            {getCategoryIcon(category)}
                        </div>
                        <div>
                            <h3 className="font-bold text-slate-900 text-sm uppercase tracking-wide">{category}</h3>
                            <p className="text-slate-500 text-xs">{count} {count === 1 ? 'Vulnerabilidade' : 'Vulnerabilidades'}</p>
                        </div>
                    </div>
                ))}
            </div>

            {/* 2. Detailed Accordion List */}
            <div className="bg-white rounded-2xl shadow-lg p-8">
                <h2 className="text-xl font-bold mb-6 text-slate-900 flex items-center gap-2">
                    <ShieldAlert className="w-6 h-6 text-blue-700" />
                    Mapa de Vulnerabilidades
                </h2>

                <Accordion type="multiple" defaultValue={issues.map((_, idx) => `item-${idx}`)} className="w-full space-y-4">
                    {issues.map((issue, idx) => (
                        <AccordionItem key={idx} value={`item-${idx}`} className="border border-slate-200 rounded-xl px-4 data-[state=open]:bg-slate-50 transition-colors">
                            <AccordionTrigger className="hover:no-underline py-4">
                                <div className="flex items-center gap-4 w-full text-left">
                                    <div className={`p-2 rounded-full ${issue.severity === 'high' ? 'bg-red-100 text-red-600' : 'bg-yellow-100 text-yellow-600'}`}>
                                        {issue.severity === 'high' ? <XCircle className="w-5 h-5" /> : <AlertTriangle className="w-5 h-5" />}
                                    </div>
                                    <div className="flex-1">
                                        <div className="flex items-center gap-2 mb-1">
                                            <span className="font-bold text-slate-900 text-lg">{issue.clause}</span>
                                            <span className="text-xs bg-blue-100 text-blue-800 px-2 py-0.5 rounded-full font-semibold uppercase">
                                                {issue.riskCategory}
                                            </span>
                                        </div>
                                        <p className="text-slate-500 text-sm line-clamp-1">{issue.description}</p>
                                    </div>
                                    {issue.financialImpact && issue.financialImpact !== 'R$ 0,00' && (
                                        <div className="text-right mr-4 hidden sm:block">
                                            <p className="text-xs text-slate-500 font-medium uppercase">Impacto Evitado</p>
                                            <p className="text-green-600 font-bold">{issue.financialImpact}</p>
                                        </div>
                                    )}
                                </div>
                            </AccordionTrigger>
                            <AccordionContent className="pt-2 pb-6">
                                <div className="grid md:grid-cols-2 print:grid-cols-1 gap-6">
                                    {/* Left: Original Risk */}
                                    <div className="space-y-2">
                                        <h4 className="text-sm font-bold text-red-700 uppercase flex items-center gap-2">
                                            <XCircle className="w-4 h-4" />
                                            Texto Original (Risco)
                                        </h4>
                                        <div className="p-4 bg-red-50 rounded-lg border border-red-100 text-slate-700 text-sm italic leading-relaxed">
                                            "{issue.originalText}"
                                        </div>
                                    </div>

                                    {/* Right: Analysis & Impact */}
                                    <div className="space-y-4">
                                        <div>
                                            <h4 className="text-sm font-bold text-blue-700 uppercase flex items-center gap-2 mb-2">
                                                <Gavel className="w-4 h-4" />
                                                Análise Jurídica
                                            </h4>
                                            <p className="text-slate-700 text-sm leading-relaxed">
                                                {issue.description}
                                            </p>
                                        </div>

                                        {issue.financialImpact && issue.financialImpact !== 'R$ 0,00' && (
                                            <div className="bg-green-50 p-4 rounded-lg border border-green-100 flex items-center gap-3">
                                                <div className="p-2 bg-green-100 rounded-full text-green-700">
                                                    <Banknote className="w-5 h-5" />
                                                </div>
                                                <div>
                                                    <p className="text-xs text-green-800 font-bold uppercase">Economia / Resgate</p>
                                                    <p className="text-xl font-black text-green-700">{issue.financialImpact}</p>
                                                </div>
                                            </div>
                                        )}
                                    </div>
                                </div>
                            </AccordionContent>
                        </AccordionItem>
                    ))}
                </Accordion>
            </div>
        </div>
    );
}
