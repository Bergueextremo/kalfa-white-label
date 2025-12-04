export const mockUsers = [
    {
        id: '1',
        name: 'João Silva',
        email: 'joao.silva@email.com',
        type: 'PF',
        credits: 12,
        status: 'Active',
        document: '123.456.789-00',
        phone: '(11) 98765-4321',
        joinedAt: '2024-01-15',
        purchases: [
            { id: 'p1', date: '2024-01-15', item: 'Pacote Básico', amount: 49.90 },
            { id: 'p2', date: '2024-02-10', item: 'Pacote Pro', amount: 99.90 }
        ],
        activity: [
            { id: 'a1', date: '2024-02-12', contract: 'Contrato de Aluguel.pdf', result: 'Risco Médio' },
            { id: 'a2', date: '2024-02-15', contract: 'Financiamento Veículo.pdf', result: 'Risco Alto' }
        ]
    },
    {
        id: '2',
        name: 'Empresa XYZ Ltda',
        email: 'contato@xyz.com',
        type: 'PJ',
        credits: 50,
        status: 'Active',
        document: '12.345.678/0001-90',
        phone: '(11) 3333-4444',
        joinedAt: '2024-03-01',
        purchases: [
            { id: 'p3', date: '2024-03-01', item: 'Pacote Enterprise', amount: 499.90 }
        ],
        activity: [
            { id: 'a3', date: '2024-03-02', contract: 'Contrato Social.pdf', result: 'Risco Baixo' }
        ]
    },
    {
        id: '3',
        name: 'Maria Oliveira',
        email: 'maria.o@email.com',
        type: 'PF',
        credits: 0,
        status: 'Banned',
        document: '987.654.321-11',
        phone: '(21) 99999-8888',
        joinedAt: '2023-11-20',
        purchases: [],
        activity: []
    },
    {
        id: '4',
        name: 'Carlos Santos',
        email: 'carlos.santos@email.com',
        type: 'PF',
        credits: 5,
        status: 'Active',
        document: '456.789.123-44',
        phone: '(31) 98888-7777',
        joinedAt: '2024-02-20',
        purchases: [
            { id: 'p4', date: '2024-02-20', item: 'Pacote Básico', amount: 49.90 }
        ],
        activity: []
    },
    {
        id: '5',
        name: 'Ana Costa',
        email: 'ana.costa@email.com',
        type: 'PF',
        credits: 2,
        status: 'Active',
        document: '789.123.456-55',
        phone: '(41) 97777-6666',
        joinedAt: '2024-03-05',
        purchases: [
            { id: 'p5', date: '2024-03-05', item: 'Pacote Básico', amount: 49.90 }
        ],
        activity: []
    }
];

export const mockTransactions = [
    { id: 't1', user: 'João Silva', date: '2024-02-10', item: 'Pacote Pro', amount: 99.90, status: 'Approved' },
    { id: 't2', user: 'Empresa XYZ Ltda', date: '2024-03-01', item: 'Pacote Enterprise', amount: 499.90, status: 'Approved' },
    { id: 't3', user: 'Carlos Santos', date: '2024-03-05', item: 'Pacote Básico', amount: 49.90, status: 'Pending' },
    { id: 't4', user: 'Ana Costa', date: '2024-03-06', item: 'Pacote Básico', amount: 49.90, status: 'Failed' },
    { id: 't5', user: 'João Silva', date: '2024-01-15', item: 'Pacote Básico', amount: 49.90, status: 'Approved' },
    { id: 't6', user: 'Pedro Souza', date: '2024-03-07', item: 'Pacote Pro', amount: 99.90, status: 'Approved' },
    { id: 't7', user: 'Lucia Lima', date: '2024-03-08', item: 'Pacote Básico', amount: 49.90, status: 'Pending' },
    { id: 't8', user: 'Roberto Alves', date: '2024-03-08', item: 'Pacote Enterprise', amount: 499.90, status: 'Approved' },
    { id: 't9', user: 'Fernanda Dias', date: '2024-03-09', item: 'Pacote Básico', amount: 49.90, status: 'Failed' },
    { id: 't10', user: 'Marcos Rocha', date: '2024-03-10', item: 'Pacote Pro', amount: 99.90, status: 'Approved' }
];

export const mockMetrics = {
    totalConsultations: 1250,
    totalRevenue: 15430.50,
    totalUsers: 342,
    conversionRate: 3.2
};
