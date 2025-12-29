-- Insert Contract Categories if not exist
INSERT INTO contract_categories (name, slug, description)
VALUES 
    ('Imóveis', 'imoveis', 'Contratos de locação, compra e venda')
ON CONFLICT (slug) DO NOTHING;

-- Insert the Complex Contract Template
WITH new_contract AS (
    INSERT INTO contracts (
        title, 
        slug, 
        description, 
        category_id, 
        price, 
        is_active, 
        wizard_stages,
        template_body
    ) 
    SELECT 
        'Contrato de Aluguel Completo (Demo)', 
        'contrato-aluguel-demo', 
        'Contrato com lógica condicional complexa (PF/PJ, Fiador, Cônjuge) igual ao concorrente.', 
        id, 
        29.90, 
        true, 
        ARRAY['Dados do Locador', 'Dados do Locatário', 'Detalhes do Imóvel', 'Garantia e Pagamento', 'Disposições Finais'],
        '<h2 style="text-align: center;">CONTRATO DE LOCAÇÃO DE IMÓVEL RESIDENCIAL</h2>
        <p><strong>LOCADOR:</strong> [Nome do Locador], [Nacionalidade do Locador], [Estado Civil do Locador], [Profissão do Locador], portador do CPF nº [CPF do Locador] e RG nº [RG do Locador], residente e domiciliado em [Endereço do Locador]. (Se PJ: [Razão Social do Locador], CNPJ [CNPJ do Locador], representada por [Representante do Locador]).</p>
        
        <p><strong>LOCATÁRIO:</strong> [Nome do Locatário], [Nacionalidade do Locatário], [Estado Civil do Locatário], [Profissão do Locatário], portador do CPF nº [CPF do Locatário] e RG nº [RG do Locatário], residente e domiciliado em [Endereço do Locatário].</p>
        
        <p>As partes acima qualificadas têm, entre si, justo e contratado o presente Contrato de Locação, que se regerá pelas seguintes cláusulas:</p>
        
        <h3>DO OBJETO</h3>
        <p>O presente contrato tem como objeto a locação do imóvel residencial situado em: [Endereço do Imóvel].</p>
        
        <h3>DO PRAZO</h3>
        <p>O prazo da locação é de [Prazo do Contrato], iniciando-se em [Data de Início] e terminando em [Data de Término].</p>
        
        <h3>DO ALUGUEL</h3>
        <p>O valor mensal do aluguel é de [Valor do Aluguel], a ser pago até o dia [Dia do Vencimento] de cada mês.</p>
        
        <h3>DA GARANTIA</h3>
        <p>Para garantir o cumprimento das obrigações, o Locatário apresenta: [Tipo de Garantia].</p>
        <p>[Detalhes da Garantia]</p>
        <p>[Nome do Fiador], CPF [CPF do Fiador] (Se houver).</p>
        
        <p>E, por estarem assim justos e contratados, assinam o presente instrumento em duas vias.</p>
        <br>
        <p>[Cidade da Assinatura], [Data da Assinatura].</p>
        <br><br>
        <p>_____________________________________</p>
        <p>LOCADOR</p>
        <br>
        <p>_____________________________________</p>
        <p>LOCATÁRIO</p>'
    FROM contract_categories WHERE slug = 'imoveis' LIMIT 1
    RETURNING id
)
INSERT INTO contract_variables (contract_id, name, label, type, options, required, group_name, order_index, visibility_rule)
SELECT 
    id, name, label, type, options, required, group_name, order_index, visibility_rule::jsonb
FROM new_contract, (VALUES
    -- ETAPA 1: DADOS DO LOCADOR
    ('tipo_locador', 'O Locador é:', 'select', ARRAY['Pessoa Física', 'Pessoa Jurídica'], true, 'Dados do Locador', 1, null),
    
    -- Locador PF
    ('nome_locador', 'Nome do Locador', 'text', null, true, 'Dados do Locador', 2, '{"dependsOn": "tipo_locador", "operator": "equals", "value": "Pessoa Física"}'),
    ('nacionalidade_locador', 'Nacionalidade do Locador', 'text', null, true, 'Dados do Locador', 3, '{"dependsOn": "tipo_locador", "operator": "equals", "value": "Pessoa Física"}'),
    ('estado_civil_locador', 'Estado Civil do Locador', 'select', ARRAY['Solteiro(a)', 'Casado(a)', 'Divorciado(a)', 'Viúvo(a)'], true, 'Dados do Locador', 4, '{"dependsOn": "tipo_locador", "operator": "equals", "value": "Pessoa Física"}'),
    ('profissao_locador', 'Profissão do Locador', 'text', null, true, 'Dados do Locador', 5, '{"dependsOn": "tipo_locador", "operator": "equals", "value": "Pessoa Física"}'),
    ('cpf_locador', 'CPF do Locador', 'cpf', null, true, 'Dados do Locador', 6, '{"dependsOn": "tipo_locador", "operator": "equals", "value": "Pessoa Física"}'),
    ('rg_locador', 'RG do Locador', 'text', null, true, 'Dados do Locador', 7, '{"dependsOn": "tipo_locador", "operator": "equals", "value": "Pessoa Física"}'),
    
    -- Cônjuge Locador (Se casado)
    ('tem_conjuge_locador', 'Incluir Cônjuge?', 'select', ARRAY['Sim', 'Não'], true, 'Dados do Locador', 8, '{"dependsOn": "estado_civil_locador", "operator": "equals", "value": "Casado(a)"}'),
    ('nome_conjuge_locador', 'Nome do Cônjuge', 'text', null, true, 'Dados do Locador', 9, '{"dependsOn": "tem_conjuge_locador", "operator": "equals", "value": "Sim"}'),
    ('cpf_conjuge_locador', 'CPF do Cônjuge', 'cpf', null, true, 'Dados do Locador', 10, '{"dependsOn": "tem_conjuge_locador", "operator": "equals", "value": "Sim"}'),

    -- Locador PJ
    ('razao_social_locador', 'Razão Social do Locador', 'text', null, true, 'Dados do Locador', 11, '{"dependsOn": "tipo_locador", "operator": "equals", "value": "Pessoa Jurídica"}'),
    ('cnpj_locador', 'CNPJ do Locador', 'cnpj', null, true, 'Dados do Locador', 12, '{"dependsOn": "tipo_locador", "operator": "equals", "value": "Pessoa Jurídica"}'),
    ('representante_locador', 'Nome do Representante Legal', 'text', null, true, 'Dados do Locador', 13, '{"dependsOn": "tipo_locador", "operator": "equals", "value": "Pessoa Jurídica"}'),
    
    -- Comum
    ('endereco_locador', 'Endereço Completo do Locador', 'text', null, true, 'Dados do Locador', 14, null),

    -- ETAPA 2: DADOS DO LOCATÁRIO
    ('tipo_locatario', 'O Locatário é:', 'select', ARRAY['Pessoa Física', 'Pessoa Jurídica'], true, 'Dados do Locatário', 15, null),
    
    -- Locatário PF
    ('nome_locatario', 'Nome do Locatário', 'text', null, true, 'Dados do Locatário', 16, '{"dependsOn": "tipo_locatario", "operator": "equals", "value": "Pessoa Física"}'),
    ('cpf_locatario', 'CPF do Locatário', 'cpf', null, true, 'Dados do Locatário', 17, '{"dependsOn": "tipo_locatario", "operator": "equals", "value": "Pessoa Física"}'),
    ('estado_civil_locatario', 'Estado Civil do Locatário', 'select', ARRAY['Solteiro(a)', 'Casado(a)', 'Divorciado(a)', 'Viúvo(a)'], true, 'Dados do Locatário', 18, '{"dependsOn": "tipo_locatario", "operator": "equals", "value": "Pessoa Física"}'),
    
    -- Locatário PJ
    ('razao_social_locatario', 'Razão Social do Locatário', 'text', null, true, 'Dados do Locatário', 19, '{"dependsOn": "tipo_locatario", "operator": "equals", "value": "Pessoa Jurídica"}'),
    ('cnpj_locatario', 'CNPJ do Locatário', 'cnpj', null, true, 'Dados do Locatário', 20, '{"dependsOn": "tipo_locatario", "operator": "equals", "value": "Pessoa Jurídica"}'),

    ('endereco_locatario', 'Endereço Completo do Locatário', 'text', null, true, 'Dados do Locatário', 21, null),

    -- ETAPA 3: IMÓVEL
    ('endereco_imovel', 'Endereço do Imóvel Alugado', 'text', null, true, 'Detalhes do Imóvel', 22, null),
    ('finalidade_locacao', 'Finalidade', 'select', ARRAY['Residencial', 'Comercial'], true, 'Detalhes do Imóvel', 23, null),
    ('prazo_contrato', 'Prazo do Contrato (meses)', 'text', null, true, 'Detalhes do Imóvel', 24, null),
    ('data_inicio', 'Data de Início', 'date', null, true, 'Detalhes do Imóvel', 25, null),
    ('data_termino', 'Data de Término', 'date', null, true, 'Detalhes do Imóvel', 26, null),


    -- ETAPA 4: GARANTIA
    ('tipo_garantia', 'Tipo de Garantia', 'select', ARRAY['Caução', 'Fiador', 'Seguro Fiança', 'Sem Garantia'], true, 'Garantia e Pagamento', 27, null),
    
    -- Caução
    ('valor_caucao', 'Valor do Caução (R$)', 'money', null, true, 'Garantia e Pagamento', 28, '{"dependsOn": "tipo_garantia", "operator": "equals", "value": "Caução"}'),
    ('detalhes_garantia', 'Detalhes da Garantia', 'text', null, false, 'Garantia e Pagamento', 28, '{"dependsOn": "tipo_garantia", "operator": "equals", "value": "Caução"}'),
    
    -- Fiador
    ('nome_fiador', 'Nome do Fiador', 'text', null, true, 'Garantia e Pagamento', 29, '{"dependsOn": "tipo_garantia", "operator": "equals", "value": "Fiador"}'),
    ('cpf_fiador', 'CPF do Fiador', 'cpf', null, true, 'Garantia e Pagamento', 30, '{"dependsOn": "tipo_garantia", "operator": "equals", "value": "Fiador"}'),

    -- Pagamento
    ('valor_aluguel', 'Valor do Aluguel Mensal', 'money', null, true, 'Garantia e Pagamento', 31, null),
    ('dia_vencimento', 'Dia do Vencimento', 'number', null, true, 'Garantia e Pagamento', 32, null),

    -- ETAPA 5: DISPOSIÇÕES FINAIS
    ('cidade_assinatura', 'Cidade de Assinatura', 'text', null, true, 'Disposições Finais', 33, null),
    ('data_assinatura', 'Data de Assinatura', 'date', null, true, 'Disposições Finais', 34, null)

) AS v(name, label, type, options, required, group_name, order_index, visibility_rule);
