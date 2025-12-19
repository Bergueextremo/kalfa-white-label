import { IContratoLocacao } from "@/types/contract-structure";
import { formatCPF, formatCNPJ, formatCurrency } from "./contract-utils";

/**
 * Generates the "Preamble" (qualification of parties) for the contract.
 * This guarantees "Safety Authority" by ensuring all legal details are present.
 */
export function generatePreamble(data: IContratoLocacao): string {
    const { locador, locatario } = data;

    // Helper to format a party
    const qualificarParte = (parte: typeof locador, label: string) => {
        const docLabel = parte.tipo === 'PF' ? 'CPF' : 'CNPJ';
        const docValue = parte.tipo === 'PF' ? formatCPF(parte.documento) : formatCNPJ(parte.documento);
        const rgLabel = parte.tipo === 'PF' ? 'RG' : 'I.E.';

        let text = `**${label.toUpperCase()}:** ${parte.nome.toUpperCase()}, `;

        if (parte.tipo === 'PJ') {
            text += `pessoa jurídica de direito privado, inscrita no CNPJ sob nº ${docValue}, `;
            if (parte.rg_ie) text += `inscrição estadual nº ${parte.rg_ie}, `;
            text += `com sede em ${parte.endereco}.`;
        } else {
            text += `${parte.nacionalidade}, ${parte.estadoCivil}, ${parte.profissao}, `;
            text += `portador(a) do RG nº ${parte.rg_ie} e inscrito(a) no CPF sob nº ${docValue}, `;
            text += `residente e domiciliado(a) em ${parte.endereco}.`;
        }

        return text;
    };

    return `
<div class="legal-preamble">
    <p class="text-justify mb-6">
        ${qualificarParte(locador, 'LOCADOR(A)')}
    </p>

    <p class="text-justify mb-6">
        ${qualificarParte(locatario, 'LOCATÁRIO(A)')}
    </p>

    <p class="text-justify mb-6">
        As partes acima qualificadas têm, entre si, justo e contratado o presente <strong>CONTRATO DE LOCAÇÃO</strong>, que se regerá pelas cláusulas e condições seguintes:
    </p>
</div>
    `.trim();
}
