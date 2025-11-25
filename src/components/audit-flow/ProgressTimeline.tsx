import React from 'react';
import { CheckCircle, LucideIcon } from 'lucide-react';

export interface Step {
    id: string;
    title: string;
    icon: LucideIcon;
    status: 'pending' | 'current' | 'completed';
    duration: string;
    substeps?: string[];
}

interface ProgressTimelineProps {
    steps: Step[];
}

export function ProgressTimeline({ steps }: ProgressTimelineProps) {
    return (
        <div className="bg-white rounded-2xl shadow-lg p-8 mb-6">
            <h2 className="text-xl font-bold mb-6 text-slate-900">Roadmap da Vitória</h2>
            <div className="relative">
                {steps.map((step, idx) => {
                    const Icon = step.icon;
                    const isActive = step.status === 'current';
                    const isCompleted = step.status === 'completed';

                    return (
                        <div key={step.id} className="relative mb-8 last:mb-0">
                            <div className="flex items-start gap-4">
                                {/* Icon */}
                                <div className={`relative z-10 flex items-center justify-center w-12 h-12 rounded-full border-4 
                  ${isCompleted ? 'bg-green-500 border-green-200' :
                                        isActive ? 'bg-blue-500 border-blue-200 animate-pulse' :
                                            'bg-slate-200 border-slate-100'}`}>
                                    <Icon className={`w-6 h-6 ${isCompleted || isActive ? 'text-white' : 'text-slate-400'}`} />
                                </div>

                                {/* Content */}
                                <div className="flex-1">
                                    <div className="flex items-center gap-3 mb-2">
                                        <h3 className={`text-lg font-semibold ${isActive ? 'text-blue-600' : 'text-slate-700'}`}>
                                            {step.title}
                                        </h3>
                                        <span className="text-xs bg-slate-100 px-2 py-1 rounded text-slate-600">
                                            ~{step.duration}
                                        </span>
                                        {isCompleted && <CheckCircle className="w-5 h-5 text-green-500" />}
                                    </div>

                                    {/* Substeps for active step */}
                                    {isActive && step.substeps && (
                                        <div className="mt-3 space-y-2">
                                            {step.substeps.map((substep, subIdx) => (
                                                <div key={subIdx} className="flex items-center gap-2 text-sm text-slate-600">
                                                    <div className="w-2 h-2 bg-blue-500 rounded-full animate-pulse"></div>
                                                    {substep}
                                                </div>
                                            ))}
                                        </div>
                                    )}
                                </div>
                            </div>

                            {/* Connector line */}
                            {idx < steps.length - 1 && (
                                <div className={`absolute left-6 top-12 w-0.5 h-8 -ml-px
                  ${isCompleted ? 'bg-green-500' : 'bg-slate-200'}`} />
                            )}
                        </div>
                    );
                })}
            </div>
        </div>
    );
}
