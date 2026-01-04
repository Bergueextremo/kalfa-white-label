import React from 'react';
import { Scale, AlertTriangle, CheckCircle, TrendingUp } from 'lucide-react';

interface ScoreCardProps {
    score: number;
    riskLevel: string;
    contractType: string;
    title?: string;
    subtitle?: string;
    hideHeader?: boolean;
}

export function ScoreCard({ score, riskLevel, contractType, title = "Score de Conformidade", subtitle = "Análise de Conformidade", hideHeader = false }: ScoreCardProps) {
    // Serasa Style: 4 Segments
    // Red -> Yellow -> Light Green -> Dark Green
    // Knob indicator moves along the arc.

    const [displayScore, setDisplayScore] = React.useState(0);

    React.useEffect(() => {
        let start = 0;
        const end = score;
        const duration = 1500;
        const startTime = performance.now();

        const animate = (currentTime: number) => {
            const elapsed = currentTime - startTime;
            const progress = Math.min(elapsed / duration, 1);
            const ease = 1 - Math.pow(1 - progress, 4);
            const current = Math.floor(start + (end - start) * ease);
            setDisplayScore(current);

            if (progress < 1) {
                requestAnimationFrame(animate);
            }
        };

        requestAnimationFrame(animate);
    }, [score]);

    // SVG Config
    const radius = 80;
    const stroke = 10;
    const center = 100;

    // Helper to create arc paths
    const describeArc = (x: number, y: number, radius: number, startAngle: number, endAngle: number) => {
        const start = polarToCartesian(x, y, radius, endAngle);
        const end = polarToCartesian(x, y, radius, startAngle);
        const largeArcFlag = endAngle - startAngle <= 180 ? "0" : "1";
        return [
            "M", start.x, start.y,
            "A", radius, radius, 0, largeArcFlag, 0, end.x, end.y
        ].join(" ");
    };

    const polarToCartesian = (centerX: number, centerY: number, radius: number, angleInDegrees: number) => {
        const angleInRadians = (angleInDegrees - 180) * Math.PI / 180.0;
        return {
            x: centerX + (radius * Math.cos(angleInRadians)),
            y: centerY + (radius * Math.sin(angleInRadians))
        };
    };

    // Segments (Total 180 degrees, 4 segments, ~42deg each + gaps)
    // Angles are 0 (left) to 180 (right) for calculation simplicity in my helper? 
    // Wait, my helper uses -180 offset. 
    // Let's map: 
    // Left (Start) = 0 deg input to helper -> maps to -180 rads (Left)
    // Right (End) = 180 deg input to helper -> maps to 0 rads (Right)

    // Segment 1 (Red): 0 to 40
    // Segment 2 (Yellow): 45 to 85
    // Segment 3 (Light Green): 90 to 130
    // Segment 4 (Dark Green): 135 to 180

    // Knob Position
    const knobAngle = (displayScore / 100) * 180;
    const knobPos = polarToCartesian(center, center, radius, knobAngle);

    return (
        <div className="bg-white rounded-2xl shadow-lg p-8 h-full flex flex-col relative overflow-hidden">
            {!hideHeader && (
                <div className="flex items-center gap-3 mb-6 z-10">
                    <div className="p-3 bg-slate-50 rounded-lg">
                        <Scale className="w-6 h-6 text-slate-700" />
                    </div>
                    <div>
                        <h2 className="text-xl font-bold text-slate-900">{title}</h2>
                        <p className="text-sm text-slate-500">{subtitle}</p>
                    </div>
                </div>
            )}

            <div className="flex-1 flex flex-col items-center justify-center py-4">
                <div className="relative w-64 h-40 mb-2">
                    <svg className="w-full h-full overflow-visible" viewBox="0 0 200 110">
                        {/* Segment 1: Red */}
                        <path
                            d={describeArc(center, center, radius, 0, 40)}
                            fill="none"
                            stroke="#ef4444"
                            strokeWidth={stroke}
                            strokeLinecap="round"
                        />
                        {/* Segment 2: Yellow */}
                        <path
                            d={describeArc(center, center, radius, 45, 85)}
                            fill="none"
                            stroke="#fbbf24"
                            strokeWidth={stroke}
                            strokeLinecap="round"
                        />
                        {/* Segment 3: Light Green */}
                        <path
                            d={describeArc(center, center, radius, 90, 130)}
                            fill="none"
                            stroke="#84cc16"
                            strokeWidth={stroke}
                            strokeLinecap="round"
                        />
                        {/* Segment 4: Dark Green */}
                        <path
                            d={describeArc(center, center, radius, 135, 180)}
                            fill="none"
                            stroke="#22c55e"
                            strokeWidth={stroke}
                            strokeLinecap="round"
                        />

                        {/* Knob Indicator */}
                        <circle
                            cx={knobPos.x}
                            cy={knobPos.y}
                            r="8"
                            fill="white"
                            stroke="#1e293b"
                            strokeWidth="4"
                            className="drop-shadow-md transition-all duration-75 ease-out"
                        />
                    </svg>

                    {/* Central Score Display */}
                    <div className="absolute bottom-0 left-1/2 transform -translate-x-1/2 translate-y-1/4 text-center">
                        <span className="text-6xl font-black tracking-tighter text-slate-900">
                            {displayScore}
                        </span>
                        <div className="text-slate-400 font-medium text-lg -mt-1">
                            / 100
                        </div>
                    </div>
                </div>

                <div className="mt-6 text-center space-y-2">
                    <div className="inline-flex items-center gap-2 px-4 py-1.5 rounded-full bg-slate-100 text-slate-700 font-bold text-sm uppercase tracking-wide">
                        {score >= 61 ? <AlertTriangle className="w-4 h-4 text-red-500" /> : score >= 31 ? <TrendingUp className="w-4 h-4 text-yellow-500" /> : <CheckCircle className="w-4 h-4 text-green-500" />}
                        {riskLevel}
                    </div>
                    <p className="text-slate-500 text-sm font-medium max-w-[200px] mx-auto leading-tight">
                        {contractType}
                    </p>
                </div>
            </div>
        </div>
    );
}
