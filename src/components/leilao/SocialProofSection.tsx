interface SocialProofSectionProps {
    isMobile?: boolean;
}

export const SocialProofSection = ({ isMobile = false }: SocialProofSectionProps) => (
    <div className={`flex items-center gap-4 transition-all ${isMobile ? 'mt-2 mb-8' : 'mt-2'}`} role="group" aria-label="Prova social: usuários satisfeitos">
        <div className="flex -space-x-3">
            {[11, 12, 13, 14].map((id) => (
                <div key={id} className={`rounded-full border-2 border-white bg-slate-200 flex items-center justify-center overflow-hidden shadow-sm ${isMobile ? 'w-8 h-8' : 'w-8 h-8'}`}>
                    <img
                        src={`https://i.pravatar.cc/150?u=${id}`}
                        alt={`Avatar de usuário satisfeito ${id}`}
                        className="w-full h-full object-cover"
                        loading="lazy"
                        width="32"
                        height="32"
                        decoding="async"
                    />
                </div>
            ))}
        </div>
        <div className="flex items-center">
            <span className={`${isMobile ? 'text-lg' : 'text-xl'} font-black text-[#1a2b4b] leading-none`}>+ 12.500</span>
            <span className={`${isMobile ? 'text-[8px]' : 'text-[9px]'} text-gray-500 uppercase font-black tracking-widest leading-none ml-2.5`}>EDITAIS ANALISADOS</span>
        </div>
    </div>
);
