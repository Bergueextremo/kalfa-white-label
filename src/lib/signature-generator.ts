import { IContratoLocacao } from "@/types/contract-structure";

export function generateSignatures(data: IContratoLocacao): string {
    const { locador, locatario } = data;

    return `
<div class="legal-signature mt-12 pt-12 border-t-2 border-gray-100 break-inside-avoid">
    <p class="text-center mb-12 italic text-gray-600">
        E por estarem assim justos e contratados, assinam o presente instrumento em 02 (duas) vias de igual teor e forma, na presença de 02 (duas) testemunhas.
    </p>

    <div class="grid grid-cols-2 gap-12 mb-16">
        <div class="text-center">
            <div class="border-t border-black w-3/4 mx-auto mb-2"></div>
            <p class="font-bold uppercase text-sm">${locador.nome}</p>
            <p class="text-xs text-gray-500 uppercase">LOCADOR(A)</p>
        </div>
        <div class="text-center">
            <div class="border-t border-black w-3/4 mx-auto mb-2"></div>
            <p class="font-bold uppercase text-sm">${locatario.nome}</p>
            <p class="text-xs text-gray-500 uppercase">LOCATÁRIO(A)</p>
        </div>
    </div>

    <div class="mt-8">
        <p class="font-bold uppercase text-xs mb-6 text-gray-400">TESTEMUNHAS:</p>
        <div class="grid grid-cols-2 gap-12">
            <div class="text-center">
                <div class="border-t border-gray-400 w-3/4 mx-auto mb-2"></div>
                <p class="text-xs text-gray-500">Nome:</p>
                <p class="text-xs text-gray-500">CPF:</p>
            </div>
            <div class="text-center">
                <div class="border-t border-gray-400 w-3/4 mx-auto mb-2"></div>
                <p class="text-xs text-gray-500">Nome:</p>
                <p class="text-xs text-gray-500">CPF:</p>
            </div>
        </div>
    </div>
</div>
    `.trim();
}
