-- Batch 6

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Declaração de Autônomo',
    'declaracao-de-autonomo',
    (SELECT id FROM contract_categories WHERE slug = 'docs_rapidos'),
    29.90,
    'CONTRATO DE DECLARAÇÃO DE AUTÔNOMO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente DECLARAÇÃO DE AUTÔNOMO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Declaração de Autônomo.',
    'Garanta segurança jurídica com nosso modelo de Declaração de Autônomo, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'declaracao-de-autonomo'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'declaracao-de-autonomo'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'declaracao-de-autonomo'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'declaracao-de-autonomo'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Comodato de Imóvel Residencial',
    'contrato-de-comodato-de-imovel-residencial',
    (SELECT id FROM contract_categories WHERE slug = 'imobiliario_aluguel'),
    29.90,
    'CONTRATO DE CONTRATO DE COMODATO DE IMÓVEL RESIDENCIAL\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE COMODATO DE IMÓVEL RESIDENCIAL, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Comodato de Imóvel Residencial.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Comodato de Imóvel Residencial, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-comodato-de-imovel-residencial'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-comodato-de-imovel-residencial'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-comodato-de-imovel-residencial'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-comodato-de-imovel-residencial'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Comodato de Antena de Internet',
    'contrato-de-comodato-de-antena-de-internet',
    (SELECT id FROM contract_categories WHERE slug = 'docs_rapidos'),
    29.90,
    'CONTRATO DE CONTRATO DE COMODATO DE ANTENA DE INTERNET\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE COMODATO DE ANTENA DE INTERNET, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Comodato de Antena de Internet.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Comodato de Antena de Internet, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-comodato-de-antena-de-internet'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-comodato-de-antena-de-internet'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-comodato-de-antena-de-internet'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-comodato-de-antena-de-internet'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Comodato para Caseiro que Mora no Sítio ou Chácara',
    'contrato-de-comodato-para-caseiro-que-mora-no-sitio-ou-chacara',
    (SELECT id FROM contract_categories WHERE slug = 'imobiliario_aluguel'),
    29.90,
    'CONTRATO DE CONTRATO DE COMODATO PARA CASEIRO QUE MORA NO SÍTIO OU CHÁCARA\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE COMODATO PARA CASEIRO QUE MORA NO SÍTIO OU CHÁCARA, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Comodato para Caseiro que Mora no Sítio ou Chácara.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Comodato para Caseiro que Mora no Sítio ou Chácara, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-comodato-para-caseiro-que-mora-no-sitio-ou-chacara'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-comodato-para-caseiro-que-mora-no-sitio-ou-chacara'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-comodato-para-caseiro-que-mora-no-sitio-ou-chacara'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-comodato-para-caseiro-que-mora-no-sitio-ou-chacara'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Declaração de Prestação de Serviços',
    'declaracao-de-prestacao-de-servicos',
    (SELECT id FROM contract_categories WHERE slug = 'servicos_profissional'),
    29.90,
    'CONTRATO DE DECLARAÇÃO DE PRESTAÇÃO DE SERVIÇOS\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente DECLARAÇÃO DE PRESTAÇÃO DE SERVIÇOS, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Declaração de Prestação de Serviços.',
    'Garanta segurança jurídica com nosso modelo de Declaração de Prestação de Serviços, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'declaracao-de-prestacao-de-servicos'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'declaracao-de-prestacao-de-servicos'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'declaracao-de-prestacao-de-servicos'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'declaracao-de-prestacao-de-servicos'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Declaração de Compra e Venda',
    'declaracao-de-compra-e-venda',
    (SELECT id FROM contract_categories WHERE slug = 'empresarial_parcerias'),
    29.90,
    'CONTRATO DE DECLARAÇÃO DE COMPRA E VENDA\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente DECLARAÇÃO DE COMPRA E VENDA, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Declaração de Compra e Venda.',
    'Garanta segurança jurídica com nosso modelo de Declaração de Compra e Venda, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'declaracao-de-compra-e-venda'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'declaracao-de-compra-e-venda'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'declaracao-de-compra-e-venda'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'declaracao-de-compra-e-venda'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Declaração de Pagamento',
    'declaracao-de-pagamento',
    (SELECT id FROM contract_categories WHERE slug = 'docs_rapidos'),
    29.90,
    'CONTRATO DE DECLARAÇÃO DE PAGAMENTO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente DECLARAÇÃO DE PAGAMENTO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Declaração de Pagamento.',
    'Garanta segurança jurídica com nosso modelo de Declaração de Pagamento, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'declaracao-de-pagamento'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'declaracao-de-pagamento'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'declaracao-de-pagamento'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'declaracao-de-pagamento'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Declaração de Conteúdo Correios',
    'declaracao-de-conteudo-correios',
    (SELECT id FROM contract_categories WHERE slug = 'docs_rapidos'),
    29.90,
    'CONTRATO DE DECLARAÇÃO DE CONTEÚDO CORREIOS\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente DECLARAÇÃO DE CONTEÚDO CORREIOS, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Declaração de Conteúdo Correios.',
    'Garanta segurança jurídica com nosso modelo de Declaração de Conteúdo Correios, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'declaracao-de-conteudo-correios'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'declaracao-de-conteudo-correios'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'declaracao-de-conteudo-correios'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'declaracao-de-conteudo-correios'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Locação de Equipamento de Geração de Energia',
    'contrato-de-locacao-de-equipamento-de-geracao-de-energia',
    (SELECT id FROM contract_categories WHERE slug = 'imobiliario_aluguel'),
    29.90,
    'CONTRATO DE CONTRATO DE LOCAÇÃO DE EQUIPAMENTO DE GERAÇÃO DE ENERGIA\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE LOCAÇÃO DE EQUIPAMENTO DE GERAÇÃO DE ENERGIA, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Locação de Equipamento de Geração de Energia.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Locação de Equipamento de Geração de Energia, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-locacao-de-equipamento-de-geracao-de-energia'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-locacao-de-equipamento-de-geracao-de-energia'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-locacao-de-equipamento-de-geracao-de-energia'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-locacao-de-equipamento-de-geracao-de-energia'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Consultoria de Marketing',
    'contrato-de-consultoria-de-marketing',
    (SELECT id FROM contract_categories WHERE slug = 'servicos_profissional'),
    29.90,
    'CONTRATO DE CONTRATO DE CONSULTORIA DE MARKETING\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE CONSULTORIA DE MARKETING, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Consultoria de Marketing.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Consultoria de Marketing, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-consultoria-de-marketing'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-consultoria-de-marketing'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-consultoria-de-marketing'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-consultoria-de-marketing'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Consultoria de Imagem e Estilo',
    'contrato-de-consultoria-de-imagem-e-estilo',
    (SELECT id FROM contract_categories WHERE slug = 'servicos_profissional'),
    29.90,
    'CONTRATO DE CONTRATO DE CONSULTORIA DE IMAGEM E ESTILO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE CONSULTORIA DE IMAGEM E ESTILO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Consultoria de Imagem e Estilo.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Consultoria de Imagem e Estilo, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-consultoria-de-imagem-e-estilo'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-consultoria-de-imagem-e-estilo'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-consultoria-de-imagem-e-estilo'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-consultoria-de-imagem-e-estilo'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Consultoria de Software',
    'contrato-de-consultoria-de-software',
    (SELECT id FROM contract_categories WHERE slug = 'servicos_profissional'),
    29.90,
    'CONTRATO DE CONTRATO DE CONSULTORIA DE SOFTWARE\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE CONSULTORIA DE SOFTWARE, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Consultoria de Software.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Consultoria de Software, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-consultoria-de-software'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-consultoria-de-software'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-consultoria-de-software'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-consultoria-de-software'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Declaração de Estado Civil',
    'declaracao-de-estado-civil',
    (SELECT id FROM contract_categories WHERE slug = 'docs_rapidos'),
    29.90,
    'CONTRATO DE DECLARAÇÃO DE ESTADO CIVIL\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente DECLARAÇÃO DE ESTADO CIVIL, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Declaração de Estado Civil.',
    'Garanta segurança jurídica com nosso modelo de Declaração de Estado Civil, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'declaracao-de-estado-civil'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'declaracao-de-estado-civil'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'declaracao-de-estado-civil'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'declaracao-de-estado-civil'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Compra e Venda de Quotas de Sociedade',
    'contrato-de-compra-e-venda-de-quotas-de-sociedade',
    (SELECT id FROM contract_categories WHERE slug = 'empresarial_parcerias'),
    29.90,
    'CONTRATO DE CONTRATO DE COMPRA E VENDA DE QUOTAS DE SOCIEDADE\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE COMPRA E VENDA DE QUOTAS DE SOCIEDADE, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Compra e Venda de Quotas de Sociedade.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Compra e Venda de Quotas de Sociedade, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-compra-e-venda-de-quotas-de-sociedade'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-compra-e-venda-de-quotas-de-sociedade'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-compra-e-venda-de-quotas-de-sociedade'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-compra-e-venda-de-quotas-de-sociedade'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de União Estável',
    'contrato-de-uniao-estavel',
    (SELECT id FROM contract_categories WHERE slug = 'familia_pessoal'),
    29.90,
    'CONTRATO DE CONTRATO DE UNIÃO ESTÁVEL\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE UNIÃO ESTÁVEL, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de União Estável.',
    'Garanta segurança jurídica com nosso modelo de Contrato de União Estável, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-uniao-estavel'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-uniao-estavel'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-uniao-estavel'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-uniao-estavel'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Compra e Venda Internacional',
    'contrato-de-compra-e-venda-internacional',
    (SELECT id FROM contract_categories WHERE slug = 'empresarial_parcerias'),
    29.90,
    'CONTRATO DE CONTRATO DE COMPRA E VENDA INTERNACIONAL\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE COMPRA E VENDA INTERNACIONAL, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Compra e Venda Internacional.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Compra e Venda Internacional, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-compra-e-venda-internacional'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-compra-e-venda-internacional'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-compra-e-venda-internacional'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-compra-e-venda-internacional'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Aluguel de Veículo para Uber',
    'contrato-de-aluguel-de-veiculo-para-uber',
    (SELECT id FROM contract_categories WHERE slug = 'imobiliario_aluguel'),
    29.90,
    'CONTRATO DE CONTRATO DE ALUGUEL DE VEÍCULO PARA UBER\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE ALUGUEL DE VEÍCULO PARA UBER, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Aluguel de Veículo para Uber.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Aluguel de Veículo para Uber, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-aluguel-de-veiculo-para-uber'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-aluguel-de-veiculo-para-uber'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-aluguel-de-veiculo-para-uber'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-aluguel-de-veiculo-para-uber'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Locação/Aluguel de Terreno',
    'contrato-de-locacao-aluguel-de-terreno',
    (SELECT id FROM contract_categories WHERE slug = 'imobiliario_aluguel'),
    29.90,
    'CONTRATO DE CONTRATO DE LOCAÇÃO/ALUGUEL DE TERRENO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE LOCAÇÃO/ALUGUEL DE TERRENO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Locação/Aluguel de Terreno.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Locação/Aluguel de Terreno, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-locacao-aluguel-de-terreno'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-locacao-aluguel-de-terreno'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-locacao-aluguel-de-terreno'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-locacao-aluguel-de-terreno'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Compra e Venda de Bens Móveis',
    'contrato-de-compra-e-venda-de-bens-moveis',
    (SELECT id FROM contract_categories WHERE slug = 'empresarial_parcerias'),
    29.90,
    'CONTRATO DE CONTRATO DE COMPRA E VENDA DE BENS MÓVEIS\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE COMPRA E VENDA DE BENS MÓVEIS, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Compra e Venda de Bens Móveis.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Compra e Venda de Bens Móveis, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-compra-e-venda-de-bens-moveis'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-compra-e-venda-de-bens-moveis'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-compra-e-venda-de-bens-moveis'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-compra-e-venda-de-bens-moveis'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Declaração de Hipossuficiência',
    'declaracao-de-hipossuficiencia',
    (SELECT id FROM contract_categories WHERE slug = 'docs_rapidos'),
    29.90,
    'CONTRATO DE DECLARAÇÃO DE HIPOSSUFICIÊNCIA\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente DECLARAÇÃO DE HIPOSSUFICIÊNCIA, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Declaração de Hipossuficiência.',
    'Garanta segurança jurídica com nosso modelo de Declaração de Hipossuficiência, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'declaracao-de-hipossuficiencia'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'declaracao-de-hipossuficiencia'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'declaracao-de-hipossuficiencia'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'declaracao-de-hipossuficiencia'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Mútuo',
    'contrato-de-mutuo',
    (SELECT id FROM contract_categories WHERE slug = 'docs_rapidos'),
    29.90,
    'CONTRATO DE CONTRATO DE MÚTUO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE MÚTUO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Mútuo.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Mútuo, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-mutuo'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-mutuo'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-mutuo'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-mutuo'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Cessão de Quotas Sociais',
    'contrato-de-cessao-de-quotas-sociais',
    (SELECT id FROM contract_categories WHERE slug = 'empresarial_parcerias'),
    29.90,
    'CONTRATO DE CONTRATO DE CESSÃO DE QUOTAS SOCIAIS\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE CESSÃO DE QUOTAS SOCIAIS, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Cessão de Quotas Sociais.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Cessão de Quotas Sociais, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-cessao-de-quotas-sociais'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-cessao-de-quotas-sociais'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-cessao-de-quotas-sociais'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-cessao-de-quotas-sociais'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Cessão',
    'contrato-de-cessao',
    (SELECT id FROM contract_categories WHERE slug = 'empresarial_parcerias'),
    29.90,
    'CONTRATO DE CONTRATO DE CESSÃO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE CESSÃO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Cessão.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Cessão, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-cessao'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-cessao'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-cessao'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-cessao'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Declaração',
    'declaracao',
    (SELECT id FROM contract_categories WHERE slug = 'docs_rapidos'),
    29.90,
    'CONTRATO DE DECLARAÇÃO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente DECLARAÇÃO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Declaração.',
    'Garanta segurança jurídica com nosso modelo de Declaração, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'declaracao'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'declaracao'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'declaracao'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'declaracao'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Compra e Venda de Moto',
    'contrato-de-compra-e-venda-de-moto',
    (SELECT id FROM contract_categories WHERE slug = 'veiculos_maquinas'),
    29.90,
    'CONTRATO DE CONTRATO DE COMPRA E VENDA DE MOTO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE COMPRA E VENDA DE MOTO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Compra e Venda de Moto.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Compra e Venda de Moto, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-compra-e-venda-de-moto'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-compra-e-venda-de-moto'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-compra-e-venda-de-moto'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-compra-e-venda-de-moto'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Prestação de Serviços Musicais',
    'contrato-de-prestacao-de-servicos-musicais',
    (SELECT id FROM contract_categories WHERE slug = 'servicos_profissional'),
    29.90,
    'CONTRATO DE CONTRATO DE PRESTAÇÃO DE SERVIÇOS MUSICAIS\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PRESTAÇÃO DE SERVIÇOS MUSICAIS, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Prestação de Serviços Musicais.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Prestação de Serviços Musicais, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-musicais'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-musicais'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-musicais'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-musicais'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Prestação de Serviços de Segurança do Trabalho',
    'contrato-de-prestacao-de-servicos-de-seguranca-do-trabalho',
    (SELECT id FROM contract_categories WHERE slug = 'servicos_profissional'),
    29.90,
    'CONTRATO DE CONTRATO DE PRESTAÇÃO DE SERVIÇOS DE SEGURANÇA DO TRABALHO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PRESTAÇÃO DE SERVIÇOS DE SEGURANÇA DO TRABALHO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Prestação de Serviços de Segurança do Trabalho.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Prestação de Serviços de Segurança do Trabalho, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-de-seguranca-do-trabalho'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-de-seguranca-do-trabalho'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-de-seguranca-do-trabalho'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-de-seguranca-do-trabalho'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Compra e Venda de Arma',
    'contrato-de-compra-e-venda-de-arma',
    (SELECT id FROM contract_categories WHERE slug = 'empresarial_parcerias'),
    29.90,
    'CONTRATO DE CONTRATO DE COMPRA E VENDA DE ARMA\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE COMPRA E VENDA DE ARMA, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Compra e Venda de Arma.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Compra e Venda de Arma, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-compra-e-venda-de-arma'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-compra-e-venda-de-arma'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-compra-e-venda-de-arma'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-compra-e-venda-de-arma'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Prestação de Serviços Instalação',
    'contrato-de-prestacao-de-servicos-instalacao',
    (SELECT id FROM contract_categories WHERE slug = 'servicos_profissional'),
    29.90,
    'CONTRATO DE CONTRATO DE PRESTAÇÃO DE SERVIÇOS INSTALAÇÃO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PRESTAÇÃO DE SERVIÇOS INSTALAÇÃO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Prestação de Serviços Instalação.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Prestação de Serviços Instalação, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-instalacao'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-instalacao'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-instalacao'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-instalacao'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Prestação de Serviços Consultoria',
    'contrato-de-prestacao-de-servicos-consultoria',
    (SELECT id FROM contract_categories WHERE slug = 'servicos_profissional'),
    29.90,
    'CONTRATO DE CONTRATO DE PRESTAÇÃO DE SERVIÇOS CONSULTORIA\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PRESTAÇÃO DE SERVIÇOS CONSULTORIA, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Prestação de Serviços Consultoria.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Prestação de Serviços Consultoria, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-consultoria'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-consultoria'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-consultoria'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-consultoria'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Prestação de Serviços de Arquitetura',
    'contrato-de-prestacao-de-servicos-de-arquitetura',
    (SELECT id FROM contract_categories WHERE slug = 'servicos_profissional'),
    29.90,
    'CONTRATO DE CONTRATO DE PRESTAÇÃO DE SERVIÇOS DE ARQUITETURA\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PRESTAÇÃO DE SERVIÇOS DE ARQUITETURA, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Prestação de Serviços de Arquitetura.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Prestação de Serviços de Arquitetura, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-de-arquitetura'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-de-arquitetura'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-de-arquitetura'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-de-arquitetura'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Prestação de Serviços Design Gráfico',
    'contrato-de-prestacao-de-servicos-design-grafico',
    (SELECT id FROM contract_categories WHERE slug = 'servicos_profissional'),
    29.90,
    'CONTRATO DE CONTRATO DE PRESTAÇÃO DE SERVIÇOS DESIGN GRÁFICO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PRESTAÇÃO DE SERVIÇOS DESIGN GRÁFICO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Prestação de Serviços Design Gráfico.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Prestação de Serviços Design Gráfico, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-design-grafico'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-design-grafico'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-design-grafico'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-design-grafico'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Prestação de Serviços de Informática',
    'contrato-de-prestacao-de-servicos-de-informatica',
    (SELECT id FROM contract_categories WHERE slug = 'servicos_profissional'),
    29.90,
    'CONTRATO DE CONTRATO DE PRESTAÇÃO DE SERVIÇOS DE INFORMÁTICA\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PRESTAÇÃO DE SERVIÇOS DE INFORMÁTICA, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Prestação de Serviços de Informática.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Prestação de Serviços de Informática, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-de-informatica'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-de-informatica'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-de-informatica'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-de-informatica'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Prestação de Serviços de Limpeza',
    'contrato-de-prestacao-de-servicos-de-limpeza',
    (SELECT id FROM contract_categories WHERE slug = 'servicos_profissional'),
    29.90,
    'CONTRATO DE CONTRATO DE PRESTAÇÃO DE SERVIÇOS DE LIMPEZA\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PRESTAÇÃO DE SERVIÇOS DE LIMPEZA, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Prestação de Serviços de Limpeza.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Prestação de Serviços de Limpeza, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-de-limpeza'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-de-limpeza'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-de-limpeza'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-de-limpeza'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Prestação de Serviços de Marcenaria',
    'contrato-de-prestacao-de-servicos-de-marcenaria',
    (SELECT id FROM contract_categories WHERE slug = 'servicos_profissional'),
    29.90,
    'CONTRATO DE CONTRATO DE PRESTAÇÃO DE SERVIÇOS DE MARCENARIA\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PRESTAÇÃO DE SERVIÇOS DE MARCENARIA, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Prestação de Serviços de Marcenaria.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Prestação de Serviços de Marcenaria, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-de-marcenaria'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-de-marcenaria'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-de-marcenaria'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-de-marcenaria'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Prestação de Serviços Corretagem de Seguros',
    'contrato-de-prestacao-de-servicos-corretagem-de-seguros',
    (SELECT id FROM contract_categories WHERE slug = 'servicos_profissional'),
    29.90,
    'CONTRATO DE CONTRATO DE PRESTAÇÃO DE SERVIÇOS CORRETAGEM DE SEGUROS\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PRESTAÇÃO DE SERVIÇOS CORRETAGEM DE SEGUROS, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Prestação de Serviços Corretagem de Seguros.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Prestação de Serviços Corretagem de Seguros, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-corretagem-de-seguros'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-corretagem-de-seguros'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-corretagem-de-seguros'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-corretagem-de-seguros'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Prestação de Serviço Médico',
    'contrato-de-prestacao-de-servico-medico',
    (SELECT id FROM contract_categories WHERE slug = 'servicos_profissional'),
    29.90,
    'CONTRATO DE CONTRATO DE PRESTAÇÃO DE SERVIÇO MÉDICO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PRESTAÇÃO DE SERVIÇO MÉDICO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Prestação de Serviço Médico.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Prestação de Serviço Médico, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servico-medico'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servico-medico'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servico-medico'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servico-medico'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Prestação de Serviço de Pintura',
    'contrato-de-prestacao-de-servico-de-pintura',
    (SELECT id FROM contract_categories WHERE slug = 'servicos_profissional'),
    29.90,
    'CONTRATO DE CONTRATO DE PRESTAÇÃO DE SERVIÇO DE PINTURA\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PRESTAÇÃO DE SERVIÇO DE PINTURA, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Prestação de Serviço de Pintura.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Prestação de Serviço de Pintura, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servico-de-pintura'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servico-de-pintura'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servico-de-pintura'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servico-de-pintura'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Prestação de Serviços de Fotografia e/ou Filmagem',
    'contrato-de-prestacao-de-servicos-de-fotografia-e-ou-filmagem',
    (SELECT id FROM contract_categories WHERE slug = 'servicos_profissional'),
    29.90,
    'CONTRATO DE CONTRATO DE PRESTAÇÃO DE SERVIÇOS DE FOTOGRAFIA E/OU FILMAGEM\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PRESTAÇÃO DE SERVIÇOS DE FOTOGRAFIA E/OU FILMAGEM, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Prestação de Serviços de Fotografia e/ou Filmagem.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Prestação de Serviços de Fotografia e/ou Filmagem, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-de-fotografia-e-ou-filmagem'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-de-fotografia-e-ou-filmagem'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-de-fotografia-e-ou-filmagem'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-de-fotografia-e-ou-filmagem'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Subarrendamento Rural',
    'contrato-de-subarrendamento-rural',
    (SELECT id FROM contract_categories WHERE slug = 'empresarial_parcerias'),
    29.90,
    'CONTRATO DE CONTRATO DE SUBARRENDAMENTO RURAL\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE SUBARRENDAMENTO RURAL, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Subarrendamento Rural.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Subarrendamento Rural, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-subarrendamento-rural'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-subarrendamento-rural'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-subarrendamento-rural'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-subarrendamento-rural'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Arrendamento Rural de Pastagem',
    'contrato-de-arrendamento-rural-de-pastagem',
    (SELECT id FROM contract_categories WHERE slug = 'empresarial_parcerias'),
    29.90,
    'CONTRATO DE CONTRATO DE ARRENDAMENTO RURAL DE PASTAGEM\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE ARRENDAMENTO RURAL DE PASTAGEM, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Arrendamento Rural de Pastagem.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Arrendamento Rural de Pastagem, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-arrendamento-rural-de-pastagem'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-arrendamento-rural-de-pastagem'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-arrendamento-rural-de-pastagem'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-arrendamento-rural-de-pastagem'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Cessão de Uso/Posse de Imóvel',
    'contrato-de-cessao-de-uso-posse-de-imovel',
    (SELECT id FROM contract_categories WHERE slug = 'imobiliario_aluguel'),
    29.90,
    'CONTRATO DE CONTRATO DE CESSÃO DE USO/POSSE DE IMÓVEL\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE CESSÃO DE USO/POSSE DE IMÓVEL, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Cessão de Uso/Posse de Imóvel.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Cessão de Uso/Posse de Imóvel, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-cessao-de-uso-posse-de-imovel'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-cessao-de-uso-posse-de-imovel'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-cessao-de-uso-posse-de-imovel'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-cessao-de-uso-posse-de-imovel'
ON CONFLICT DO NOTHING;
