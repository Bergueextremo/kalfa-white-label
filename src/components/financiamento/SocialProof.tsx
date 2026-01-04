interface SocialProofProps {
    count?: string;
    label?: string;
}

export const SocialProof = ({ count = "+18.400", label = "Auditorias Realizadas" }: SocialProofProps) => (
    <div className="flex items-center gap-4 transition-all mt-4" role="group" aria-label="Prova social: usuários satisfeitos">
        <div className="flex -space-x-3">
            {[21, 22, 23, 24].map((id) => (
                <div key={id} className="w-8 h-8 rounded-full border-2 border-white bg-slate-200 flex items-center justify-center overflow-hidden shadow-sm">
                    <img
                        src={`https://i.pravatar.cc/150?u=${id}`}
                        alt={`Avatar de usuário satisfeito ${id}`}
                        className="w-full h-full object-cover"
                        loading="lazy"
                        width="32"
                        height="32"
                    />
                </div>
            ))}
        </div>
        <div className="flex flex-col">
            <span className="text-xl font-black text-[#1a2b4b] leading-tight">{count}</span>
            <span className="text-[10px] text-gray-400 uppercase font-black tracking-widest leading-tight">{label}</span>
        </div>
    </div>
);
