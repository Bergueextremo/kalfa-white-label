import { Contract } from '@/components/catalog/types';
import { normalizeKey } from '@/lib/utils';

/**
 * Generates a robust, legally valid contract structure by wrapping the specific template body
 * with standard professional legal clauses.
 */
export function generateRobustContract(contract: Contract, variables: Record<string, string>): string {
    const robustTemplate = getRobustTemplate(contract);
    return fillVariables(robustTemplate, variables);
}

/**
 * Returns the robust template structure (with placeholders) suitable for the LivePreview.
 */
export function getRobustTemplate(contract: Contract): string {
    const date = new Date().toLocaleDateString('pt-BR', { year: 'numeric', month: 'long', day: 'numeric' });

    return `
<div class="contract-wrapper">
    <h1 style="text-align: center; font-weight: bold; font-size: 16pt; margin-bottom: 5pt;">MINUTA DE CONTRATO</h1>
    <h2 style="text-align: center; font-weight: bold; font-size: 14pt; margin-bottom: 20pt;">${contract.title.toUpperCase()}</h2>

    <h3 style="font-weight: bold; text-decoration: underline; margin-top: 15pt; margin-bottom: 10pt;">IDENTIFICAÇÃO DAS PARTES</h3>

    <p style="margin-bottom: 10pt; text-indent: 0;">
        <strong>{{nome_parte_1}}</strong> (CONTRATANTE), inscrito(a) no CPF/CNPJ sob o nº <strong>{{doc_parte_1}}</strong>, residente e domiciliado(a) em ________________________________________.
    </p>

    <p style="margin-bottom: 10pt; text-indent: 0;">
        <strong>{{nome_parte_2}}</strong> (CONTRATADO(A)), inscrito(a) no CPF/CNPJ sob o nº <strong>{{doc_parte_2}}</strong>, residente e domiciliado(a) em ________________________________________.
    </p>

    <p style="margin-bottom: 20pt; text-indent: 0;">
        As partes acima identificadas têm, entre si, justo e acertado o presente Contrato, que se regerá pelas cláusulas seguintes e pelas condições descritas no presente.
    </p>

    <div class="user-content" style="margin-top: 20pt; margin-bottom: 20pt;">
        ${contract.template_body}
    </div>

    <h3 style="font-weight: bold; margin-top: 15pt; margin-bottom: 10pt;">CLÁUSULA GERAL - DAS OBRIGAÇÕES DAS PARTES</h3>
    <p style="margin-bottom: 10pt;">
        As partes se comprometem a cumprir fielmente o estipulado neste instrumento, agindo sempre com boa-fé objetiva e probidade, zelando pela correta execução do objeto contratual.
    </p>

    <h3 style="font-weight: bold; margin-top: 15pt; margin-bottom: 10pt;">CLÁUSULA DE PRAZO E VIGÊNCIA</h3>
    <p style="margin-bottom: 10pt;">
        Salvo disposição específica no corpo deste instrumento, a vigência deste contrato inicia-se na data de sua assinatura e perdurará até o cumprimento total das obrigações aqui assumidas.
    </p>

    <h3 style="font-weight: bold; margin-top: 15pt; margin-bottom: 10pt;">CLÁUSULA DE CONFIDENCIALIDADE E PROTEÇÃO DE DADOS (LGPD)</h3>
    <p style="margin-bottom: 10pt;">
        As partes comprometem-se a manter o mais absoluto sigilo sobre quaisquer dados confidenciais a que tiverem acesso em razão deste contrato.
        Em conformidade com a Lei Geral de Proteção de Dados (Lei nº 13.709/2018), as partes declaram que o tratamento de dados pessoais envolvido na execução deste contrato será realizado estritamente para os fins aqui estabelecidos, vedada a utilização para fins diversos sem o prévio consentimento.
    </p>

    <h3 style="font-weight: bold; margin-top: 15pt; margin-bottom: 10pt;">CLÁUSULA DE RESCISÃO E MULTA</h3>
    <p style="margin-bottom: 10pt;">
        O presente contrato poderá ser rescindido por qualquer das partes, mediante aviso prévio de 30 (trinta) dias, por escrito.
        O descumprimento de qualquer cláusula deste instrumento poderá ensejar a rescisão imediata por justa causa, sem prejuízo da aplicação de multa de 10% (dez por cento) sobre o valor total do contrato ou valor estimado da causa, além de perdas e danos.
    </p>

    <h3 style="font-weight: bold; margin-top: 15pt; margin-bottom: 10pt;">CLÁUSULA DE FORO</h3>
    <p style="margin-bottom: 10pt;">
        Para dirimir quaisquer controvérsias oriundas do CONTRATO, as partes elegem o foro da comarca de residência do Contratante, renunciando a qualquer outro, por mais privilegiado que seja.
    </p>

    <p style="margin-top: 20pt; margin-bottom: 20pt;">
        E, por estarem assim justos e contratados, firmam o presente instrumento, em duas vias de igual teor.
    </p>

    <p style="margin-bottom: 30pt;">
        _________________________, ${date}.
    </p>

    <div style="margin-top: 40pt; margin-bottom: 40pt;">
        <p style="margin-bottom: 5pt;">________________________________________________</p>
        <p style="font-weight: bold;">{{nome_parte_1}}</p>
    </div>

    <div style="margin-top: 40pt; margin-bottom: 40pt;">
        <p style="margin-bottom: 5pt;">________________________________________________</p>
        <p style="font-weight: bold;">{{nome_parte_2}}</p>
    </div>

    <h4 style="font-weight: bold; margin-top: 20pt;">TESTEMUNHAS:</h4>
    
    <div style="margin-top: 20pt;">
        <p>1. _____________________________________________</p>
        <p>CPF:</p>
    </div>

    <div style="margin-top: 20pt;">
        <p>2. _____________________________________________</p>
        <p>CPF:</p>
    </div>
</div>
    `.trim();
}

/**
 * Replaces handlebars-style variables {{var_name}} with values from the form.
 */
function fillVariables(template: string, variables: Record<string, string>): string {
    let result = template;
    // Sort keys by length (descending) to avoid partial replacement issues if names overlap
    // 1. Handle {{variable}} syntax (Legacy/Standard)
    let keys = Object.keys(variables).sort((a, b) => b.length - a.length);
    for (const key of keys) {
        const regex = new RegExp(`{{${key}}}`, 'g');
        const value = variables[key] || `[${key.replace(/_/g, ' ').toUpperCase()}]`;
        result = result.replace(regex, value);
    }

    // 2. Handle [Variable Name] syntax (New Auto-Detection)
    // Matches [Anything except brackets]
    const bracketRegex = /\[([^\]]+)\]/g;
    result = result.replace(bracketRegex, (match, capturedLabel) => {
        const key = normalizeKey(capturedLabel);
        // If we have a value for this normalized key, use it.
        // Otherwise keep the bracketed text so user sees it's missing (or we could show placeholder).
        // If the key exists in variables map (even if empty string value), use it.
        if (Object.prototype.hasOwnProperty.call(variables, key)) {
            return variables[key] || match;
        }
        return match;
    });

    // Cleanup any remaining brackets if needed, or leave them for user to see missing fields
    return result;
}
