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
        <div className="relative mb-0 transform transition-transform duration-500" aria-label={`Índice de abusividade: ${animatedScore}%`}>
            <svg width="360" height="210" viewBox="0 20 360 210" className="mx-auto" role="img">
                <title>Medidor de Abusividade Contratual</title>

                {/* Background arc */}
                <path
                    d="M 60 180 A 120 120 0 0 1 300 180"
                    fill="none"
                    stroke="#f1f5f9"
                    strokeWidth="28"
                    strokeLinecap="round"
                />

                {/* Green section (Low risk) - Left */}
                <path
                    d="M 60 180 A 120 120 0 0 1 120 76"
                    fill="none"
                    stroke="#00c851"
                    strokeWidth="28"
                    strokeLinecap="round"
                />

                {/* Yellow section (Medium risk) - Middle */}
                <path
                    d="M 120 76 A 120 120 0 0 1 240 76"
                    fill="none"
                    stroke="#ffbd00"
                    strokeWidth="28"
                    strokeLinecap="round"
                />

                {/* Red section (High risk) - Right */}
                <path
                    d="M 240 76 A 120 120 0 0 1 300 180"
                    fill="none"
                    stroke="#ff4d4d"
                    strokeWidth="28"
                    strokeLinecap="round"
                />

                {/* Score number - Centered under arc */}
                <text
                    x="180"
                    y="162"
                    textAnchor="middle"
                    className={`font-black tracking-tighter transition-all fill-current ${animatedScore > 70 ? 'text-[#e63939]' : 'text-[#1a2b4b]'}`}
                    style={{ fontSize: '76px', fontWeight: 900 }}
                >
                    {animatedScore}%
                </text>

                {/* Seta (Needle) - Must be on top of the arc and text */}
                <g className="transition-all duration-300">
                    <line
                        x1="180" y1="180"
                        x2={180 + 120 * Math.cos((180 - (animatedScore * 1.8)) * Math.PI / 180)}
                        y2={180 - 120 * Math.sin((180 - (animatedScore * 1.8)) * Math.PI / 180)}
                        stroke="#1a2b4b"
                        strokeWidth="4"
                        strokeLinecap="round"
                    />
                    <circle cx="180" cy="180" r="8" fill="#1a2b4b" />
                    <circle
                        cx={180 + 120 * Math.cos((180 - (animatedScore * 1.8)) * Math.PI / 180)}
                        cy={180 - 120 * Math.sin((180 - (animatedScore * 1.8)) * Math.PI / 180)}
                        r="8"
                        fill="#1a2b4b"
                        stroke="white"
                        strokeWidth="3"
                    />
                </g>

                {/* Risco label placeholder */}
                <foreignObject x="0" y="200" width="360" height="32">
                    <div className="flex justify-center">
                        <div className="text-[#1a2b4b] text-[10px] font-bold uppercase tracking-[0.2em] px-6 py-1 bg-[#f1f5f9] rounded-full shadow-sm">
                            {animatedScore > 70 ? 'RISCO CRÍTICO' : 'ANALISANDO'}
                        </div>
                    </div>
                </foreignObject>
            </svg>
        </div>
    );
};
