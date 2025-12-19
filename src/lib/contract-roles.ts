export interface ContractRoles {
    party1: string; // Label for Parte 1 (e.g. Locador)
    party2: string; // Label for Parte 2 (e.g. Locatário)
}

export function getContractRoles(title: string): ContractRoles {
    const lowerTitle = title.toLowerCase();

    // Rental / Lease
    if (lowerTitle.includes('aluguel') || lowerTitle.includes('locação') || lowerTitle.includes('locacao')) {
        return {
            party1: 'Locador(a)',
            party2: 'Locatário(a)'
        };
    }

    // Purchase and Sale
    if (lowerTitle.includes('venda') || lowerTitle.includes('compra')) {
        return {
            party1: 'Vendedor(a)',
            party2: 'Comprador(a)'
        };
    }

    // Service Provision
    if (lowerTitle.includes('serviço') || lowerTitle.includes('servico') || lowerTitle.includes('consultoria')) {
        return {
            party1: 'Contratante',
            party2: 'Contratado(a)'
        };
    }

    // Partnership / Society
    if (lowerTitle.includes('sociedade') || lowerTitle.includes('parceria')) {
        return {
            party1: 'Sócio(a) 1',
            party2: 'Sócio(a) 2'
        };
    }

    // Donation
    if (lowerTitle.includes('doação') || lowerTitle.includes('doacao')) {
        return {
            party1: 'Doador(a)',
            party2: 'Donatário(a)'
        };
    }

    // Loan (Mutuo)
    if (lowerTitle.includes('mútuo') || lowerTitle.includes('mutuo') || lowerTitle.includes('empréstimo')) {
        return {
            party1: 'Mutuante',
            party2: 'Mutuário'
        };
    }

    // Default
    return {
        party1: 'Parte 1 (Contratante)',
        party2: 'Parte 2 (Contratado)'
    };
}
