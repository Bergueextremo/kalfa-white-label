export const FluxoSection = () => {
    return (
        <section id="como-funciona" className="py-24 bg-white" aria-labelledby="fluxo-title">
            <div className="container mx-auto px-4">
                <div className="text-center mb-20">
                    <h2 id="fluxo-title" className="text-3xl font-bold text-[#1a2b4b] mb-4">Fluxo Operacional</h2>
                    <p className="text-gray-500 uppercase tracking-wide text-sm font-semibold">Tecnologia jurídica aplicada para garantir sua arrematação</p>
                </div>

                <div className="grid md:grid-cols-3 gap-8 relative max-w-5xl mx-auto">
                    {/* Connecting Line (Desktop) */}
                    <div className="hidden md:block absolute top-[2.5rem] left-[20%] right-[20%] h-[2px] bg-gray-100 z-0" aria-hidden="true"></div>

                    {/* Step 1 */}
                    <div className="relative z-10 text-center" role="listitem">
                        <div className="w-20 h-20 bg-white border-2 border-slate-100 rounded-full flex items-center justify-center text-xl font-bold text-[#1a2b4b] mx-auto mb-6 shadow-sm">
                            1
                        </div>
                        <h3 className="font-bold text-[#1a2b4b] text-lg mb-2">Upload de Edital</h3>
                        <p className="text-sm text-gray-600 max-w-[200px] mx-auto font-medium">
                            Protocolo Online: Basta enviar o PDF ou o Link do Edital.
                        </p>
                    </div>

                    {/* Step 2 */}
                    <div className="relative z-10 text-center" role="listitem">
                        <div className="w-20 h-20 bg-white border-2 border-slate-100 rounded-full flex items-center justify-center text-xl font-bold text-[#1a2b4b] mx-auto mb-6 shadow-sm">
                            2
                        </div>
                        <h3 className="font-bold text-[#1a2b4b] text-lg mb-2">Processamento</h3>
                        <p className="text-sm text-gray-600 max-w-[200px] mx-auto font-medium">
                            Cruzamento de dados na Blockchain da Alfa Consultoria.
                        </p>
                    </div>

                    {/* Step 3 */}
                    <div className="relative z-10 text-center" role="listitem">
                        <div className="w-20 h-20 bg-[#002B5C] rounded-full flex items-center justify-center text-xl font-bold text-white mx-auto mb-6 shadow-lg">
                            3
                        </div>
                        <h3 className="font-bold text-[#1a2b4b] text-lg mb-2">Laudo Técnico</h3>
                        <p className="text-sm text-gray-600 max-w-[200px] mx-auto font-medium">
                            Emissão de Documento de Viabilidade Financeira e Jurídica.
                        </p>
                    </div>
                </div>
            </div>
        </section>
    );
};
