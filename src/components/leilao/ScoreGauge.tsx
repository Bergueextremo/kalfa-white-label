import { useState, useEffect } from "react";

interface ScoreGaugeProps {
    initialScore?: number;
    duration?: number;
}

export const ScoreGauge = ({ initialScore = 0, duration = 1500 }: ScoreGaugeProps) => {
    const [animatedScore, setAnimatedScore] = useState(initialScore);

    useEffect(() => {
        const startTime = performance.now();

        const animate = (currentTime: number) => {
            const elapsed = currentTime - startTime;
            const progress = Math.min(elapsed / duration, 1);

            // Ease out cubic
            const easeProgress = 1 - Math.pow(1 - progress, 3);
            setAnimatedScore(Math.floor(easeProgress * 100));

            if (progress < 1) {
                requestAnimationFrame(animate);
            }
        };

        requestAnimationFrame(animate);
    }, [duration]);

    // Needle Calculation
    const angle = 180 - (animatedScore * 1.8);
    const rad = (angle * Math.PI) / 180;
    const needleX = 160 + 110 * Math.cos(rad);
    const needleY = 160 - 110 * Math.sin(rad);

    return (
        <div className="relative mb-8 transform hover:scale-105 transition-transform duration-500" aria-label={`Score de segurança: ${animatedScore} de 100`}>
            <svg width="320" height="180" viewBox="0 0 320 180" className="mx-auto" role="img">
                <title>Medidor de nível de segurança</title>
                {/* Background arc */}
                <path
                    d="M 50 160 A 110 110 0 0 1 270 160"
                    fill="none"
                    stroke="#f1f5f9"
                    strokeWidth="24"
                    strokeLinecap="round"
                />
                {/* Red section (Alert) */}
                <path
                    d="M 50 160 A 110 110 0 0 1 105 64"
                    fill="none"
                    stroke="#ff4d4d"
                    strokeWidth="24"
                    strokeLinecap="round"
                />
                {/* Yellow section (Warning) */}
                <path
                    d="M 105 64 A 110 110 0 0 1 160 50"
                    fill="none"
                    stroke="#ffbd00"
                    strokeWidth="24"
                    strokeLinecap="round"
                />
                {/* Green section (Success) */}
                <path
                    d="M 160 50 A 110 110 0 0 1 270 160"
                    fill="none"
                    stroke="#00c851"
                    strokeWidth="24"
                    strokeLinecap="round"
                />
                {/* Designer Needle - Animated position */}
                <circle cx={needleX} cy={needleY} r="10" fill="#1a2b4b" stroke="white" strokeWidth="3" className="transition-all duration-75" />
            </svg>

            {/* Score number - Centered under arc */}
            <div className="absolute top-[80px] left-1/2 -translate-x-1/2 text-center">
                <div className="text-7xl font-black text-[#1a2b4b] leading-none tracking-tighter transition-all">
                    {animatedScore}
                </div>
                <div className="text-gray-500 text-sm font-semibold mt-1">/100</div>
            </div>
        </div>
    );
};
