import { useState, useEffect } from "react";

interface AbusividadeGaugeProps {
    targetScore?: number;
    duration?: number;
}

export const AbusividadeGauge = ({ targetScore = 87, duration = 2000 }: AbusividadeGaugeProps) => {
    const [animatedScore, setAnimatedScore] = useState(0);

    useEffect(() => {
        const startTime = performance.now();

        const animate = (currentTime: number) => {
            const elapsed = currentTime - startTime;
            const progress = Math.min(elapsed / duration, 1);

            // Ease out cubic
            const easeProgress = 1 - Math.pow(1 - progress, 3);
            setAnimatedScore(Math.floor(easeProgress * targetScore));

            if (progress < 1) {
                requestAnimationFrame(animate);
            }
        };

        requestAnimationFrame(animate);
    }, [targetScore, duration]);

    // Needle Calculation
    // 0 score = Left (180 deg)
    // 100 score = Right (0 deg)
    const angle = 180 - (animatedScore * 1.8);
    const rad = (angle * Math.PI) / 180;
    const needleX = 160 + 110 * Math.cos(rad);
    const needleY = 160 - 110 * Math.sin(rad);

    return (
        <div className="relative mb-8 transform transition-transform duration-500" aria-label={`Índice de abusividade: ${animatedScore}%`}>
            <svg width="320" height="180" viewBox="0 0 320 180" className="mx-auto" role="img">
                <title>Medidor de Abusividade Contratual</title>
                {/* Background arc */}
                <path
                    d="M 50 160 A 110 110 0 0 1 270 160"
                    fill="none"
                    stroke="#f1f5f9"
                    strokeWidth="24"
                    strokeLinecap="round"
                />

                {/* Green section (Low risk) - Left */}
                <path
                    d="M 50 160 A 110 110 0 0 1 105 64"
                    fill="none"
                    stroke="#00c851"
                    strokeWidth="24"
                    strokeLinecap="round"
                />

                {/* Yellow section (Medium risk) - Middle */}
                <path
                    d="M 105 64 A 110 110 0 0 1 215 64"
                    fill="none"
                    stroke="#ffbd00"
                    strokeWidth="24"
                    strokeLinecap="round"
                />

                {/* Red section (High risk) - Right */}
                <path
                    d="M 215 64 A 110 110 0 0 1 270 160"
                    fill="none"
                    stroke="#ff4d4d"
                    strokeWidth="24"
                    strokeLinecap="round"
                />

                {/* Designer Needle - Animated position */}
                <circle cx={needleX} cy={needleY} r="10" fill="#1a2b4b" stroke="white" strokeWidth="3" className="transition-all duration-75" />

                {/* Pointer Line (optional for premium look) */}
                <line
                    x1="160" y1="160"
                    x2={needleX} y2={needleY}
                    stroke="#1a2b4b"
                    strokeWidth="4"
                    strokeLinecap="round"
                />
                <circle cx="160" cy="160" r="12" fill="#1a2b4b" />
            </svg>

            {/* Score number - Centered under arc */}
            <div className="absolute top-[85px] left-1/2 -translate-x-1/2 text-center">
                <div className={`text-7xl font-black leading-none tracking-tighter transition-all ${animatedScore > 70 ? 'text-red-600' : 'text-[#1a2b4b]'}`}>
                    {animatedScore}%
                </div>
                <div className="text-gray-500 text-xs font-bold uppercase tracking-widest mt-2 px-4 py-1 bg-slate-100 rounded-full inline-block">
                    {animatedScore > 70 ? 'Risco Crítico' : 'Analisando'}
                </div>
            </div>
        </div>
    );
};
