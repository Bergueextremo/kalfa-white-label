-- Seed Categories
INSERT INTO contract_categories (name, slug, icon, description) VALUES
('Imobiliário & Aluguel', 'imobiliario_aluguel', 'Building', 'Residencial, Comercial, Temporada, Built to Suit'),
('Veículos & Máquinas', 'veiculos_maquinas', 'Car', 'Compra e Venda, Locação, Uber, Arrendamento'),
('Serviços & Profissional', 'servicos_profissional', 'Briefcase', 'Advocacia, Marketing, TI, Saúde, Freelancer'),
('Empresarial & Parcerias', 'empresarial_parcerias', 'Building2', 'Contrato Social, Franquia, Parcerias, NDAs'),
('Trabalhista', 'trabalhista', 'FileText', 'CLT, Home Office, Estágio, Diarista'),
('Agronegócio', 'agronegocio', 'Tractor', 'Arrendamento Rural, Parceria, Pastoreio'),
('Família & Pessoal', 'familia_pessoal', 'Heart', 'União Estável, Namoro, Doação, Testamento'),
('Documentos Rápidos', 'docs_rapidos', 'Zap', 'Notificações, Procurações, Promissórias')
ON CONFLICT (slug) DO UPDATE SET 
    name = EXCLUDED.name,
    icon = EXCLUDED.icon,
    description = EXCLUDED.description;

-- Add new contracts for demonstration
DO $$
DECLARE
    cat_id uuid;
BEGIN
    SELECT id INTO cat_id FROM contract_categories WHERE slug = 'trabalhista';
    
    INSERT INTO contracts (title, slug, description, full_description, category_id, price, template_body) 
    VALUES (
        'Contrato de Home Office', 
        'home-office', 
        'Regulamente o teletrabalho com segurança jurídica.',
        'Contrato completo para regime de teletrabalho, com cláusulas de infraestrutura, controle de jornada e confidencialidade.',
        cat_id,
        49.90,
        'CONTRATO DE TELETRABALHO... Pelo presente, a empresa {{nome_empresa}}, inscrita no CNPJ sob nº {{cnpj_empresa}}, contrata o funcionário {{nome_funcionario}}, CPF {{cpf_funcionario}}, para exercer suas funções em regime de Home Office...'
    ) ON CONFLICT (slug) DO NOTHING;

    -- Variables for Home Office
    INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
    SELECT id, 'nome_empresa', 'Nome da Empresa', 'text', true, 1 FROM contracts WHERE slug = 'home-office'
    UNION ALL
    SELECT id, 'cnpj_empresa', 'CNPJ da Empresa', 'text', true, 2 FROM contracts WHERE slug = 'home-office'
    UNION ALL
    SELECT id, 'nome_funcionario', 'Nome do Funcionário', 'text', true, 3 FROM contracts WHERE slug = 'home-office'
    UNION ALL
    SELECT id, 'cpf_funcionario', 'CPF do Funcionário', 'text', true, 4 FROM contracts WHERE slug = 'home-office'
    ON CONFLICT DO NOTHING;
END $$;
