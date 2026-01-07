
import santanderLogo from "@/assets/logos/santander.png";
import itauLogo from "@/assets/logos/itau.png";
import caixaLogo from "@/assets/logos/caixa.png";
import bbLogo from "@/assets/logos/bb.png";
import bvLogo from "@/assets/logos/bv.png";

const logos = [
    { name: "Santander", src: santanderLogo },
    { name: "Banco do Brasil", src: bbLogo },
    { name: "Itaú", src: itauLogo },
    { name: "Caixa", src: caixaLogo },
    { name: "BV Financeira", src: bvLogo },
];

export const BankLogoCarousel = () => {
    return (
        <div className="w-full inline-flex flex-nowrap overflow-hidden [mask-image:_linear-gradient(to_right,transparent_0,_black_128px,_black_calc(100%-128px),transparent_100%)]">
            <ul className="flex items-center justify-center md:justify-start [&_li]:mx-8 [&_li]:max-w-[150px] animate-infinite-scroll">
                {logos.map((logo, index) => (
                    <li key={index} className="flex flex-col items-center justify-center h-16 md:h-20 w-32 md:w-40">
                        <img
                            src={logo.src}
                            alt={logo.name}
                            className="h-full w-full object-contain filter grayscale opacity-40 hover:grayscale-0 hover:opacity-100 transition-all duration-500"
                        />
                    </li>
                ))}
            </ul>
            <ul className="flex items-center justify-center md:justify-start [&_li]:mx-8 [&_li]:max-w-[150px] animate-infinite-scroll" aria-hidden="true">
                {logos.map((logo, index) => (
                    <li key={`duplicate-${index}`} className="flex flex-col items-center justify-center h-16 md:h-20 w-32 md:w-40">
                        <img
                            src={logo.src}
                            alt={logo.name}
                            className="h-full w-full object-contain filter grayscale opacity-40 hover:grayscale-0 hover:opacity-100 transition-all duration-500"
                        />
                    </li>
                ))}
            </ul>
            <style>{`
        @keyframes infinite-scroll {
          from { transform: translateX(0); }
          to { transform: translateX(-100%); }
        }
        .animate-infinite-scroll {
          animation: infinite-scroll 20s linear infinite;
        }
      `}</style>
        </div>
    );
};
