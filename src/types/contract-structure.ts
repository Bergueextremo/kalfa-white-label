export interface IContratoLocacao {
  // Dados do Locador (Quem aluga o imóvel)
  locador: {
    tipo: 'PF' | 'PJ';
    nome: string;
    documento: string; // CPF ou CNPJ
    rg_ie: string;     // RG para PF ou Inscrição Estadual para PJ
    nacionalidade: string;
    estadoCivil: string;
    profissao: string;
    endereco: string;
  };

  // Dados do Locatário (Quem vai morar/usar)
  locatario: {
    tipo: 'PF' | 'PJ';
    nome: string;
    documento: string; // CPF ou CNPJ
    rg_ie: string;
    enderecoAtual: string; // Endereço de origem/atual antes de mudar
  };

  // Objeto da Locação (O Imóvel)
  imovel: {
    tipo: 'Residencial' | 'Comercial';
    enderecoCompleto: string;
    caracteristicas: string; // Ex: "Salão comercial com 50m², 2 banheiros"
    finalidade: string;      // Ex: "Igreja Evangélica"
  };

  // Financeiro e Prazos
  financeiro: {
    valorMensal: number;
    diaVencimento: number;
    indiceReajuste: 'IGP-M' | 'IPCA' | 'Outro';
    formaPagamento: string;
    multaAtraso: number; // Porcentagem (ex: 10%)
    jurosMora: number;   // Geralmente 1% ao mês
  };

  prazo: {
    duracaoMeses: number;
    dataInicio: string;
    dataFinal: string;
  };
}

// Helper to initialize empty state
export const initialContractState: IContratoLocacao = {
  locador: {
    tipo: 'PF',
    nome: '',
    documento: '',
    rg_ie: '',
    nacionalidade: 'Brasileiro(a)',
    estadoCivil: 'Solteiro(a)',
    profissao: '',
    endereco: ''
  },
  locatario: {
    tipo: 'PF',
    nome: '',
    documento: '',
    rg_ie: '',
    enderecoAtual: ''
  },
  imovel: {
    tipo: 'Residencial',
    enderecoCompleto: '',
    caracteristicas: '',
    finalidade: 'Moradia'
  },
  financeiro: {
    valorMensal: 0,
    diaVencimento: 5,
    indiceReajuste: 'IGP-M',
    formaPagamento: 'Boleto Bancário',
    multaAtraso: 10,
    jurosMora: 1
  },
  prazo: {
    duracaoMeses: 12,
    dataInicio: new Date().toISOString().split('T')[0],
    dataFinal: ''
  }
};
