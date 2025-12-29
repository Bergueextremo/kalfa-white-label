-- Modelo de Contrato com Esquema UX Completo
-- Este script cria um contrato modelo com todas as variáveis, etapas e lógicas condicionais

-- 1. Inserir Contrato Modelo (atualizar se já existir)
INSERT INTO contracts (id, title, slug, description, category_id, price, template_body, is_active, wizard_stages)
SELECT 
    '00000000-0000-0000-0000-000000000001'::uuid,
    'CONTRATO MODELO COM LÓGICA CONDICIONAL',
    'contrato-modelo-ux',
    'Modelo de contrato com todas as variáveis e lógicas condicionais configuradas',
    (SELECT id FROM contract_categories LIMIT 1),
    0,
    '<h1 style="text-align: center;">CONTRATO</h1>

<h3>IDENTIFICAÇÃO DAS PARTES</h3>

<p><strong>CONTRATANTE:</strong></p>
<p>Tipo de Pessoa: [Tipo de Pessoa]</p>

<!-- Pessoa Física -->
<p>[Nome Completo], [Nacionalidade], [Estado Civil], [Profissão], inscrito(a) no CPF sob o nº [CPF], portador(a) do RG nº [RG], residente e domiciliado(a) em [Endereço Completo].</p>

<!-- Dados do Cônjuge (se casado) -->
<p>Cônjuge: [Nome do Cônjuge], inscrito(a) no CPF sob o nº [CPF do Cônjuge], portador(a) do RG nº [RG do Cônjuge]. Regime de Bens: [Regime de Bens].</p>

<!-- Pessoa Jurídica -->
<p>[Razão Social], pessoa jurídica de direito privado, inscrita no CNPJ sob o nº [CNPJ], Inscrição Estadual nº [Inscrição Estadual], com sede em [Endereço da Empresa], neste ato representada por [Nome do Representante], [Cargo do Representante], inscrito(a) no CPF sob o nº [CPF do Representante].</p>

<h3>OBJETO DO CONTRATO</h3>
<p>[Descrição do Objeto]</p>

<h3>VALOR E FORMA DE PAGAMENTO</h3>
<p>Valor Total: [Valor Total]</p>
<p>Forma de Pagamento: [Forma de Pagamento]</p>
<p>Número de Parcelas: [Número de Parcelas]</p>
<p>Valor da Entrada: [Valor da Entrada]</p>
<p>Tipo de Juros: [Tipo de Juros]</p>
<p>Taxa de Juros: [Taxa de Juros]% a.m.</p>
<p>Indexador: [Indexador]</p>
<p>Spread: [Spread]%</p>

<h3>PRAZO</h3>
<p>Data de Início: [Data de Início]</p>
<p>Data de Término: [Data de Término]</p>
<p>Prazo: [Prazo em Meses] meses</p>

<h3>FORO</h3>
<p>Fica eleito o foro da cidade de [Cidade do Foro] - [Estado do Foro], para dirimir quaisquer dúvidas oriundas do presente contrato.</p>

<p>E, por estarem assim justos e contratados, firmam o presente instrumento em duas vias de igual teor.</p>

<p>[Cidade do Foro], [Data de Assinatura].</p>

<div style="margin-top: 60px;">
<p>_______________________________________</p>
<p><strong>CONTRATANTE</strong></p>
</div>

<div style="margin-top: 40px;">
<p>_______________________________________</p>
<p><strong>CONTRATADO</strong></p>
</div>',
    true,
    ARRAY['Tipo de Contratante', 'Qualificação Pessoa Física', 'Qualificação Pessoa Jurídica', 'Dados do Cônjuge', 'Objeto do Contrato', 'Valores e Condições', 'Prazos', 'Foro e Assinatura']
ON CONFLICT (id) DO UPDATE SET
    title = EXCLUDED.title,
    template_body = EXCLUDED.template_body,
    wizard_stages = EXCLUDED.wizard_stages;

-- 2. Limpar variáveis antigas deste contrato
DELETE FROM contract_variables WHERE contract_id = '00000000-0000-0000-0000-000000000001'::uuid;

-- 3. Inserir Variáveis com Lógica Condicional

-- ETAPA 1: Tipo de Contratante
INSERT INTO contract_variables (contract_id, name, label, type, options, required, group_name, order_index, visibility_rule) VALUES
('00000000-0000-0000-0000-000000000001'::uuid, 'tipo_pessoa', 'Tipo de Pessoa', 'select', '["Física", "Jurídica"]', true, 'Tipo de Contratante', 1, null);

-- ETAPA 2: Qualificação Pessoa Física (Mostrar se tipo_pessoa = Física)
INSERT INTO contract_variables (contract_id, name, label, type, options, required, group_name, order_index, visibility_rule) VALUES
('00000000-0000-0000-0000-000000000001'::uuid, 'nome_completo', 'Nome Completo', 'text', null, true, 'Qualificação Pessoa Física', 2, '{"dependsOn": "tipo_pessoa", "operator": "equals", "value": "Física"}'),
('00000000-0000-0000-0000-000000000001'::uuid, 'cpf', 'CPF', 'cpf', null, true, 'Qualificação Pessoa Física', 3, '{"dependsOn": "tipo_pessoa", "operator": "equals", "value": "Física"}'),
('00000000-0000-0000-0000-000000000001'::uuid, 'rg', 'RG', 'text', null, true, 'Qualificação Pessoa Física', 4, '{"dependsOn": "tipo_pessoa", "operator": "equals", "value": "Física"}'),
('00000000-0000-0000-0000-000000000001'::uuid, 'nacionalidade', 'Nacionalidade', 'select', '["Brasileiro(a)", "Brasileiro(a) Naturalizado(a)", "Estrangeiro(a)"]', true, 'Qualificação Pessoa Física', 5, '{"dependsOn": "tipo_pessoa", "operator": "equals", "value": "Física"}'),
('00000000-0000-0000-0000-000000000001'::uuid, 'estado_civil', 'Estado Civil', 'select', '["Solteiro(a)", "Casado(a)", "Divorciado(a)", "Viúvo(a)", "União Estável", "Separado(a) Judicialmente"]', true, 'Qualificação Pessoa Física', 6, '{"dependsOn": "tipo_pessoa", "operator": "equals", "value": "Física"}'),
('00000000-0000-0000-0000-000000000001'::uuid, 'profissao', 'Profissão', 'text', null, true, 'Qualificação Pessoa Física', 7, '{"dependsOn": "tipo_pessoa", "operator": "equals", "value": "Física"}'),
('00000000-0000-0000-0000-000000000001'::uuid, 'endereco_completo', 'Endereço Completo', 'text', null, true, 'Qualificação Pessoa Física', 8, '{"dependsOn": "tipo_pessoa", "operator": "equals", "value": "Física"}');

-- ETAPA 3: Qualificação Pessoa Jurídica (Mostrar se tipo_pessoa = Jurídica)
INSERT INTO contract_variables (contract_id, name, label, type, options, required, group_name, order_index, visibility_rule) VALUES
('00000000-0000-0000-0000-000000000001'::uuid, 'razao_social', 'Razão Social', 'text', null, true, 'Qualificação Pessoa Jurídica', 10, '{"dependsOn": "tipo_pessoa", "operator": "equals", "value": "Jurídica"}'),
('00000000-0000-0000-0000-000000000001'::uuid, 'cnpj', 'CNPJ', 'cnpj', null, true, 'Qualificação Pessoa Jurídica', 11, '{"dependsOn": "tipo_pessoa", "operator": "equals", "value": "Jurídica"}'),
('00000000-0000-0000-0000-000000000001'::uuid, 'inscricao_estadual', 'Inscrição Estadual', 'text', null, false, 'Qualificação Pessoa Jurídica', 12, '{"dependsOn": "tipo_pessoa", "operator": "equals", "value": "Jurídica"}'),
('00000000-0000-0000-0000-000000000001'::uuid, 'endereco_empresa', 'Endereço da Empresa', 'text', null, true, 'Qualificação Pessoa Jurídica', 13, '{"dependsOn": "tipo_pessoa", "operator": "equals", "value": "Jurídica"}'),
('00000000-0000-0000-0000-000000000001'::uuid, 'representante_nome', 'Nome do Representante', 'text', null, true, 'Qualificação Pessoa Jurídica', 14, '{"dependsOn": "tipo_pessoa", "operator": "equals", "value": "Jurídica"}'),
('00000000-0000-0000-0000-000000000001'::uuid, 'representante_cpf', 'CPF do Representante', 'cpf', null, true, 'Qualificação Pessoa Jurídica', 15, '{"dependsOn": "tipo_pessoa", "operator": "equals", "value": "Jurídica"}'),
('00000000-0000-0000-0000-000000000001'::uuid, 'representante_cargo', 'Cargo do Representante', 'text', null, true, 'Qualificação Pessoa Jurídica', 16, '{"dependsOn": "tipo_pessoa", "operator": "equals", "value": "Jurídica"}');

-- ETAPA 4: Dados do Cônjuge (Mostrar se estado_civil = Casado(a) ou União Estável)
INSERT INTO contract_variables (contract_id, name, label, type, options, required, group_name, order_index, visibility_rule) VALUES
('00000000-0000-0000-0000-000000000001'::uuid, 'conjuge_nome', 'Nome do Cônjuge', 'text', null, true, 'Dados do Cônjuge', 20, '{"dependsOn": "estado_civil", "operator": "equals", "value": "Casado(a)"}'),
('00000000-0000-0000-0000-000000000001'::uuid, 'conjuge_cpf', 'CPF do Cônjuge', 'cpf', null, true, 'Dados do Cônjuge', 21, '{"dependsOn": "estado_civil", "operator": "equals", "value": "Casado(a)"}'),
('00000000-0000-0000-0000-000000000001'::uuid, 'conjuge_rg', 'RG do Cônjuge', 'text', null, true, 'Dados do Cônjuge', 22, '{"dependsOn": "estado_civil", "operator": "equals", "value": "Casado(a)"}'),
('00000000-0000-0000-0000-000000000001'::uuid, 'regime_bens', 'Regime de Bens', 'select', '["Comunhão Parcial de Bens", "Comunhão Universal de Bens", "Separação Total de Bens", "Participação Final nos Aquestos"]', true, 'Dados do Cônjuge', 23, '{"dependsOn": "estado_civil", "operator": "equals", "value": "Casado(a)"}');

-- ETAPA 5: Objeto do Contrato
INSERT INTO contract_variables (contract_id, name, label, type, options, required, group_name, order_index, visibility_rule) VALUES
('00000000-0000-0000-0000-000000000001'::uuid, 'objeto_descricao', 'Descrição do Objeto', 'textarea', null, true, 'Objeto do Contrato', 30, null);

-- ETAPA 6: Valores e Condições
INSERT INTO contract_variables (contract_id, name, label, type, options, required, group_name, order_index, visibility_rule) VALUES
('00000000-0000-0000-0000-000000000001'::uuid, 'valor_total', 'Valor Total', 'money', null, true, 'Valores e Condições', 40, null),
('00000000-0000-0000-0000-000000000001'::uuid, 'forma_pagamento', 'Forma de Pagamento', 'select', '["À Vista", "Parcelado", "Entrada + Parcelas", "Financiamento Bancário"]', true, 'Valores e Condições', 41, null),
('00000000-0000-0000-0000-000000000001'::uuid, 'num_parcelas', 'Número de Parcelas', 'number', null, false, 'Valores e Condições', 42, '{"dependsOn": "forma_pagamento", "operator": "contains", "value": "Parcel"}'),
('00000000-0000-0000-0000-000000000001'::uuid, 'valor_entrada', 'Valor da Entrada', 'money', null, false, 'Valores e Condições', 43, '{"dependsOn": "forma_pagamento", "operator": "equals", "value": "Entrada + Parcelas"}'),
('00000000-0000-0000-0000-000000000001'::uuid, 'tipo_juros', 'Tipo de Juros', 'select', '["Fixo", "Variável", "Sem Juros"]', false, 'Valores e Condições', 44, null),
('00000000-0000-0000-0000-000000000001'::uuid, 'taxa_juros', 'Taxa de Juros (% a.m.)', 'number', null, false, 'Valores e Condições', 45, '{"dependsOn": "tipo_juros", "operator": "equals", "value": "Fixo"}'),
('00000000-0000-0000-0000-000000000001'::uuid, 'indexador', 'Indexador', 'select', '["CDI", "IPCA", "IGP-M", "INPC", "Poupança", "TR"]', false, 'Valores e Condições', 46, '{"dependsOn": "tipo_juros", "operator": "equals", "value": "Variável"}'),
('00000000-0000-0000-0000-000000000001'::uuid, 'spread', 'Spread (%)', 'number', null, false, 'Valores e Condições', 47, '{"dependsOn": "tipo_juros", "operator": "equals", "value": "Variável"}');

-- ETAPA 7: Prazos
INSERT INTO contract_variables (contract_id, name, label, type, options, required, group_name, order_index, visibility_rule) VALUES
('00000000-0000-0000-0000-000000000001'::uuid, 'data_inicio', 'Data de Início', 'date', null, true, 'Prazos', 50, null),
('00000000-0000-0000-0000-000000000001'::uuid, 'data_termino', 'Data de Término', 'date', null, false, 'Prazos', 51, null),
('00000000-0000-0000-0000-000000000001'::uuid, 'prazo_meses', 'Prazo em Meses', 'number', null, false, 'Prazos', 52, null);

-- ETAPA 8: Foro e Assinatura
INSERT INTO contract_variables (contract_id, name, label, type, options, required, group_name, order_index, visibility_rule) VALUES
('00000000-0000-0000-0000-000000000001'::uuid, 'cidade_foro', 'Cidade do Foro', 'text', null, true, 'Foro e Assinatura', 60, null),
('00000000-0000-0000-0000-000000000001'::uuid, 'estado_foro', 'Estado do Foro', 'select', '["AC", "AL", "AP", "AM", "BA", "CE", "DF", "ES", "GO", "MA", "MT", "MS", "MG", "PA", "PB", "PR", "PE", "PI", "RJ", "RN", "RS", "RO", "RR", "SC", "SP", "SE", "TO"]', true, 'Foro e Assinatura', 61, null),
('00000000-0000-0000-0000-000000000001'::uuid, 'data_assinatura', 'Data de Assinatura', 'date', null, true, 'Foro e Assinatura', 62, null);
