export const TickerBar = () => {
    const items = [
        "ARREMATAÇÃO SEGURA",
        "BLINDE SEU LANCE",
        "AUDITORIA DE EDITAL",
        "NÃO CORRA RISCOS",
        "JUSCONTRATOS",
        "EVITE PREJUÍZOS"
    ];

    // Repeat items to ensure a continuous loop
    const repeatedItems = [...items, ...items, ...items, ...items];

    return (
        <div className="bg-[#009624] py-3 overflow-hidden border-y border-[#006418] select-none" aria-hidden="true">
            <div className="flex whitespace-nowrap animate-marquee">
                {repeatedItems.map((item, index) => (
                    <div key={index} className="flex items-center">
                        <span className="text-white font-black text-xs md:text-sm tracking-[0.2em] uppercase mx-8">
                            {item}
                        </span>
                        <span className="text-white/30 font-black text-xs md:text-sm">
                            •
                        </span>
                    </div>
                ))}
            </div>
        </div>
    );
};
