export function InfiniteScrollBanner() {
    return (
        <div className="w-full bg-slate-900 py-3 overflow-hidden">
            <div className="flex animate-scroll whitespace-nowrap">
                {/* Duplicate content for seamless loop */}
                {[...Array(3)].map((_, i) => (
                    <div key={i} className="flex items-center">
                        <span className="text-white font-bold text-sm md:text-base tracking-wider mx-8">
                            NÃO CORRA RISCOS
                        </span>
                        <span className="text-white text-sm md:text-base mx-2">•</span>
                        <span className="text-white font-bold text-sm md:text-base tracking-wider mx-8">
                            BLINDE SEU CONTRATO
                        </span>
                        <span className="text-white text-sm md:text-base mx-2">•</span>
                    </div>
                ))}
            </div>
            <style>{`
                @keyframes scroll {
                    0% {
                        transform: translateX(0);
                    }
                    100% {
                        transform: translateX(-33.333%);
                    }
                }
                .animate-scroll {
                    animation: scroll 20s linear infinite;
                }
            `}</style>
        </div>
    );
}
