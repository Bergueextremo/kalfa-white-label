-- Batch 1

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Aluguel de Imóvel Residencial',
    'contrato-de-aluguel-de-imovel-residencial',
    (SELECT id FROM contract_categories WHERE slug = 'imobiliario_aluguel'),
    29.90,
    'CONTRATO DE CONTRATO DE ALUGUEL DE IMÓVEL RESIDENCIAL\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE ALUGUEL DE IMÓVEL RESIDENCIAL, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Aluguel de Imóvel Residencial.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Aluguel de Imóvel Residencial, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-aluguel-de-imovel-residencial'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-aluguel-de-imovel-residencial'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-aluguel-de-imovel-residencial'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-aluguel-de-imovel-residencial'
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
    'Declaração de União Estável',
    'declaracao-de-uniao-estavel',
    (SELECT id FROM contract_categories WHERE slug = 'familia_pessoal'),
    29.90,
    'CONTRATO DE DECLARAÇÃO DE UNIÃO ESTÁVEL\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente DECLARAÇÃO DE UNIÃO ESTÁVEL, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Declaração de União Estável.',
    'Garanta segurança jurídica com nosso modelo de Declaração de União Estável, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'declaracao-de-uniao-estavel'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'declaracao-de-uniao-estavel'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'declaracao-de-uniao-estavel'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'declaracao-de-uniao-estavel'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Aluguel de Apartamento',
    'contrato-de-aluguel-de-apartamento',
    (SELECT id FROM contract_categories WHERE slug = 'imobiliario_aluguel'),
    29.90,
    'CONTRATO DE CONTRATO DE ALUGUEL DE APARTAMENTO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE ALUGUEL DE APARTAMENTO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Aluguel de Apartamento.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Aluguel de Apartamento, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-aluguel-de-apartamento'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-aluguel-de-apartamento'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-aluguel-de-apartamento'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-aluguel-de-apartamento'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Aluguel de Casa',
    'contrato-de-aluguel-de-casa',
    (SELECT id FROM contract_categories WHERE slug = 'imobiliario_aluguel'),
    29.90,
    'CONTRATO DE CONTRATO DE ALUGUEL DE CASA\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE ALUGUEL DE CASA, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Aluguel de Casa.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Aluguel de Casa, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-aluguel-de-casa'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-aluguel-de-casa'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-aluguel-de-casa'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-aluguel-de-casa'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Aluguel de Imóvel Comercial',
    'contrato-de-aluguel-de-imovel-comercial',
    (SELECT id FROM contract_categories WHERE slug = 'imobiliario_aluguel'),
    29.90,
    'CONTRATO DE CONTRATO DE ALUGUEL DE IMÓVEL COMERCIAL\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE ALUGUEL DE IMÓVEL COMERCIAL, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Aluguel de Imóvel Comercial.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Aluguel de Imóvel Comercial, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-aluguel-de-imovel-comercial'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-aluguel-de-imovel-comercial'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-aluguel-de-imovel-comercial'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-aluguel-de-imovel-comercial'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Aluguel de Sala Comercial',
    'contrato-de-aluguel-de-sala-comercial',
    (SELECT id FROM contract_categories WHERE slug = 'imobiliario_aluguel'),
    29.90,
    'CONTRATO DE CONTRATO DE ALUGUEL DE SALA COMERCIAL\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE ALUGUEL DE SALA COMERCIAL, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Aluguel de Sala Comercial.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Aluguel de Sala Comercial, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-aluguel-de-sala-comercial'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-aluguel-de-sala-comercial'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-aluguel-de-sala-comercial'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-aluguel-de-sala-comercial'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Locação por Temporada',
    'contrato-de-locacao-por-temporada',
    (SELECT id FROM contract_categories WHERE slug = 'imobiliario_aluguel'),
    29.90,
    'CONTRATO DE CONTRATO DE LOCAÇÃO POR TEMPORADA\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE LOCAÇÃO POR TEMPORADA, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Locação por Temporada.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Locação por Temporada, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-locacao-por-temporada'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-locacao-por-temporada'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-locacao-por-temporada'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-locacao-por-temporada'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Locação de Veículo',
    'contrato-de-locacao-de-veiculo',
    (SELECT id FROM contract_categories WHERE slug = 'imobiliario_aluguel'),
    29.90,
    'CONTRATO DE CONTRATO DE LOCAÇÃO DE VEÍCULO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE LOCAÇÃO DE VEÍCULO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Locação de Veículo.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Locação de Veículo, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-locacao-de-veiculo'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-locacao-de-veiculo'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-locacao-de-veiculo'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-locacao-de-veiculo'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Compra e Venda de Veículo',
    'contrato-de-compra-e-venda-de-veiculo',
    (SELECT id FROM contract_categories WHERE slug = 'veiculos_maquinas'),
    29.90,
    'CONTRATO DE CONTRATO DE COMPRA E VENDA DE VEÍCULO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE COMPRA E VENDA DE VEÍCULO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Compra e Venda de Veículo.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Compra e Venda de Veículo, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-compra-e-venda-de-veiculo'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-compra-e-venda-de-veiculo'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-compra-e-venda-de-veiculo'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-compra-e-venda-de-veiculo'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Promessa de Compra e Venda',
    'contrato-de-promessa-de-compra-e-venda',
    (SELECT id FROM contract_categories WHERE slug = 'empresarial_parcerias'),
    29.90,
    'CONTRATO DE CONTRATO DE PROMESSA DE COMPRA E VENDA\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PROMESSA DE COMPRA E VENDA, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Promessa de Compra e Venda.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Promessa de Compra e Venda, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-promessa-de-compra-e-venda'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-promessa-de-compra-e-venda'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-promessa-de-compra-e-venda'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-promessa-de-compra-e-venda'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Compra e Venda',
    'contrato-de-compra-e-venda',
    (SELECT id FROM contract_categories WHERE slug = 'empresarial_parcerias'),
    29.90,
    'CONTRATO DE CONTRATO DE COMPRA E VENDA\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE COMPRA E VENDA, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Compra e Venda.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Compra e Venda, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-compra-e-venda'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-compra-e-venda'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-compra-e-venda'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-compra-e-venda'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Compra e Venda de Imóvel',
    'contrato-de-compra-e-venda-de-imovel',
    (SELECT id FROM contract_categories WHERE slug = 'imobiliario_aluguel'),
    29.90,
    'CONTRATO DE CONTRATO DE COMPRA E VENDA DE IMÓVEL\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE COMPRA E VENDA DE IMÓVEL, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Compra e Venda de Imóvel.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Compra e Venda de Imóvel, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-compra-e-venda-de-imovel'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-compra-e-venda-de-imovel'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-compra-e-venda-de-imovel'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-compra-e-venda-de-imovel'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Compra e Venda de Terreno',
    'contrato-de-compra-e-venda-de-terreno',
    (SELECT id FROM contract_categories WHERE slug = 'imobiliario_aluguel'),
    29.90,
    'CONTRATO DE CONTRATO DE COMPRA E VENDA DE TERRENO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE COMPRA E VENDA DE TERRENO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Compra e Venda de Terreno.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Compra e Venda de Terreno, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-compra-e-venda-de-terreno'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-compra-e-venda-de-terreno'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-compra-e-venda-de-terreno'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-compra-e-venda-de-terreno'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Gaveta de Compra e Venda de Imóvel',
    'contrato-de-gaveta-de-compra-e-venda-de-imovel',
    (SELECT id FROM contract_categories WHERE slug = 'imobiliario_aluguel'),
    29.90,
    'CONTRATO DE CONTRATO DE GAVETA DE COMPRA E VENDA DE IMÓVEL\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE GAVETA DE COMPRA E VENDA DE IMÓVEL, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Gaveta de Compra e Venda de Imóvel.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Gaveta de Compra e Venda de Imóvel, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-gaveta-de-compra-e-venda-de-imovel'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-gaveta-de-compra-e-venda-de-imovel'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-gaveta-de-compra-e-venda-de-imovel'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-gaveta-de-compra-e-venda-de-imovel'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Compra e Venda de Equipamentos',
    'contrato-de-compra-e-venda-de-equipamentos',
    (SELECT id FROM contract_categories WHERE slug = 'veiculos_maquinas'),
    29.90,
    'CONTRATO DE CONTRATO DE COMPRA E VENDA DE EQUIPAMENTOS\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE COMPRA E VENDA DE EQUIPAMENTOS, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Compra e Venda de Equipamentos.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Compra e Venda de Equipamentos, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-compra-e-venda-de-equipamentos'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-compra-e-venda-de-equipamentos'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-compra-e-venda-de-equipamentos'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-compra-e-venda-de-equipamentos'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Aluguel',
    'contrato-de-aluguel',
    (SELECT id FROM contract_categories WHERE slug = 'imobiliario_aluguel'),
    29.90,
    'CONTRATO DE CONTRATO DE ALUGUEL\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE ALUGUEL, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Aluguel.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Aluguel, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-aluguel'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-aluguel'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-aluguel'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-aluguel'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Sublocação de Imóvel Comercial',
    'contrato-de-sublocacao-de-imovel-comercial',
    (SELECT id FROM contract_categories WHERE slug = 'imobiliario_aluguel'),
    29.90,
    'CONTRATO DE CONTRATO DE SUBLOCAÇÃO DE IMÓVEL COMERCIAL\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE SUBLOCAÇÃO DE IMÓVEL COMERCIAL, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Sublocação de Imóvel Comercial.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Sublocação de Imóvel Comercial, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-sublocacao-de-imovel-comercial'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-sublocacao-de-imovel-comercial'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-sublocacao-de-imovel-comercial'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-sublocacao-de-imovel-comercial'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Procuração por Instrumento Particular ou Público',
    'procuracao-por-instrumento-particular-ou-publico',
    (SELECT id FROM contract_categories WHERE slug = 'docs_rapidos'),
    29.90,
    'CONTRATO DE PROCURAÇÃO POR INSTRUMENTO PARTICULAR OU PÚBLICO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente PROCURAÇÃO POR INSTRUMENTO PARTICULAR OU PÚBLICO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Procuração por Instrumento Particular ou Público.',
    'Garanta segurança jurídica com nosso modelo de Procuração por Instrumento Particular ou Público, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'procuracao-por-instrumento-particular-ou-publico'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'procuracao-por-instrumento-particular-ou-publico'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'procuracao-por-instrumento-particular-ou-publico'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'procuracao-por-instrumento-particular-ou-publico'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Compra e Venda de Empresa/ Ponto Comercial/ Trespasse',
    'contrato-de-compra-e-venda-de-empresa-ponto-comercial-trespasse',
    (SELECT id FROM contract_categories WHERE slug = 'empresarial_parcerias'),
    29.90,
    'CONTRATO DE CONTRATO DE COMPRA E VENDA DE EMPRESA/ PONTO COMERCIAL/ TRESPASSE\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE COMPRA E VENDA DE EMPRESA/ PONTO COMERCIAL/ TRESPASSE, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Compra e Venda de Empresa/ Ponto Comercial/ Trespasse.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Compra e Venda de Empresa/ Ponto Comercial/ Trespasse, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-compra-e-venda-de-empresa-ponto-comercial-trespasse'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-compra-e-venda-de-empresa-ponto-comercial-trespasse'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-compra-e-venda-de-empresa-ponto-comercial-trespasse'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-compra-e-venda-de-empresa-ponto-comercial-trespasse'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Locação de Equipamentos e Máquinas',
    'contrato-de-locacao-de-equipamentos-e-maquinas',
    (SELECT id FROM contract_categories WHERE slug = 'imobiliario_aluguel'),
    29.90,
    'CONTRATO DE CONTRATO DE LOCAÇÃO DE EQUIPAMENTOS E MÁQUINAS\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE LOCAÇÃO DE EQUIPAMENTOS E MÁQUINAS, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Locação de Equipamentos e Máquinas.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Locação de Equipamentos e Máquinas, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-locacao-de-equipamentos-e-maquinas'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-locacao-de-equipamentos-e-maquinas'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-locacao-de-equipamentos-e-maquinas'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-locacao-de-equipamentos-e-maquinas'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato Social',
    'contrato-social',
    (SELECT id FROM contract_categories WHERE slug = 'empresarial_parcerias'),
    29.90,
    'CONTRATO DE CONTRATO SOCIAL\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO SOCIAL, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato Social.',
    'Garanta segurança jurídica com nosso modelo de Contrato Social, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-social'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-social'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-social'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-social'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Empréstimo de Dinheiro',
    'contrato-de-emprestimo-de-dinheiro',
    (SELECT id FROM contract_categories WHERE slug = 'docs_rapidos'),
    29.90,
    'CONTRATO DE CONTRATO DE EMPRÉSTIMO DE DINHEIRO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE EMPRÉSTIMO DE DINHEIRO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Empréstimo de Dinheiro.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Empréstimo de Dinheiro, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-emprestimo-de-dinheiro'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-emprestimo-de-dinheiro'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-emprestimo-de-dinheiro'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-emprestimo-de-dinheiro'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Prestação de Serviços',
    'contrato-de-prestacao-de-servicos',
    (SELECT id FROM contract_categories WHERE slug = 'servicos_profissional'),
    29.90,
    'CONTRATO DE CONTRATO DE PRESTAÇÃO DE SERVIÇOS\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PRESTAÇÃO DE SERVIÇOS, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Prestação de Serviços.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Prestação de Serviços, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Trabalho',
    'contrato-de-trabalho',
    (SELECT id FROM contract_categories WHERE slug = 'trabalhista'),
    29.90,
    'CONTRATO DE CONTRATO DE TRABALHO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE TRABALHO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Trabalho.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Trabalho, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-trabalho'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-trabalho'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-trabalho'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-trabalho'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Doação',
    'contrato-de-doacao',
    (SELECT id FROM contract_categories WHERE slug = 'familia_pessoal'),
    29.90,
    'CONTRATO DE CONTRATO DE DOAÇÃO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE DOAÇÃO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Doação.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Doação, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-doacao'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-doacao'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-doacao'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-doacao'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Parceria Empresarial',
    'contrato-de-parceria-empresarial',
    (SELECT id FROM contract_categories WHERE slug = 'empresarial_parcerias'),
    29.90,
    'CONTRATO DE CONTRATO DE PARCERIA EMPRESARIAL\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PARCERIA EMPRESARIAL, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Parceria Empresarial.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Parceria Empresarial, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-parceria-empresarial'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-parceria-empresarial'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-parceria-empresarial'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-parceria-empresarial'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Cessão de Direitos Hereditários',
    'contrato-de-cessao-de-direitos-hereditarios',
    (SELECT id FROM contract_categories WHERE slug = 'empresarial_parcerias'),
    29.90,
    'CONTRATO DE CONTRATO DE CESSÃO DE DIREITOS HEREDITÁRIOS\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE CESSÃO DE DIREITOS HEREDITÁRIOS, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Cessão de Direitos Hereditários.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Cessão de Direitos Hereditários, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-cessao-de-direitos-hereditarios'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-cessao-de-direitos-hereditarios'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-cessao-de-direitos-hereditarios'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-cessao-de-direitos-hereditarios'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Notificação Extrajudicial no Cartório',
    'notificacao-extrajudicial-no-cartorio',
    (SELECT id FROM contract_categories WHERE slug = 'docs_rapidos'),
    29.90,
    'CONTRATO DE NOTIFICAÇÃO EXTRAJUDICIAL NO CARTÓRIO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente NOTIFICAÇÃO EXTRAJUDICIAL NO CARTÓRIO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Notificação Extrajudicial no Cartório.',
    'Garanta segurança jurídica com nosso modelo de Notificação Extrajudicial no Cartório, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'notificacao-extrajudicial-no-cartorio'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'notificacao-extrajudicial-no-cartorio'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'notificacao-extrajudicial-no-cartorio'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'notificacao-extrajudicial-no-cartorio'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Notificação Extrajudicial por Desocupação de Imóvel',
    'notificacao-extrajudicial-por-desocupacao-de-imovel',
    (SELECT id FROM contract_categories WHERE slug = 'imobiliario_aluguel'),
    29.90,
    'CONTRATO DE NOTIFICAÇÃO EXTRAJUDICIAL POR DESOCUPAÇÃO DE IMÓVEL\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente NOTIFICAÇÃO EXTRAJUDICIAL POR DESOCUPAÇÃO DE IMÓVEL, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Notificação Extrajudicial por Desocupação de Imóvel.',
    'Garanta segurança jurídica com nosso modelo de Notificação Extrajudicial por Desocupação de Imóvel, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'notificacao-extrajudicial-por-desocupacao-de-imovel'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'notificacao-extrajudicial-por-desocupacao-de-imovel'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'notificacao-extrajudicial-por-desocupacao-de-imovel'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'notificacao-extrajudicial-por-desocupacao-de-imovel'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Notificação Extrajudicial de Cobrança de Aluguel',
    'notificacao-extrajudicial-de-cobranca-de-aluguel',
    (SELECT id FROM contract_categories WHERE slug = 'imobiliario_aluguel'),
    29.90,
    'CONTRATO DE NOTIFICAÇÃO EXTRAJUDICIAL DE COBRANÇA DE ALUGUEL\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente NOTIFICAÇÃO EXTRAJUDICIAL DE COBRANÇA DE ALUGUEL, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Notificação Extrajudicial de Cobrança de Aluguel.',
    'Garanta segurança jurídica com nosso modelo de Notificação Extrajudicial de Cobrança de Aluguel, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'notificacao-extrajudicial-de-cobranca-de-aluguel'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'notificacao-extrajudicial-de-cobranca-de-aluguel'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'notificacao-extrajudicial-de-cobranca-de-aluguel'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'notificacao-extrajudicial-de-cobranca-de-aluguel'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Arrendamento Rural',
    'contrato-de-arrendamento-rural',
    (SELECT id FROM contract_categories WHERE slug = 'empresarial_parcerias'),
    29.90,
    'CONTRATO DE CONTRATO DE ARRENDAMENTO RURAL\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE ARRENDAMENTO RURAL, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Arrendamento Rural.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Arrendamento Rural, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-arrendamento-rural'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-arrendamento-rural'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-arrendamento-rural'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-arrendamento-rural'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Arrendamento',
    'contrato-de-arrendamento',
    (SELECT id FROM contract_categories WHERE slug = 'empresarial_parcerias'),
    29.90,
    'CONTRATO DE CONTRATO DE ARRENDAMENTO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE ARRENDAMENTO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Arrendamento.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Arrendamento, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-arrendamento'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-arrendamento'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-arrendamento'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-arrendamento'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Testamento',
    'testamento',
    (SELECT id FROM contract_categories WHERE slug = 'familia_pessoal'),
    29.90,
    'CONTRATO DE TESTAMENTO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente TESTAMENTO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Testamento.',
    'Garanta segurança jurídica com nosso modelo de Testamento, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'testamento'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'testamento'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'testamento'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'testamento'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Sublocação de Imóvel Residencial',
    'contrato-de-sublocacao-de-imovel-residencial',
    (SELECT id FROM contract_categories WHERE slug = 'imobiliario_aluguel'),
    29.90,
    'CONTRATO DE CONTRATO DE SUBLOCAÇÃO DE IMÓVEL RESIDENCIAL\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE SUBLOCAÇÃO DE IMÓVEL RESIDENCIAL, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Sublocação de Imóvel Residencial.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Sublocação de Imóvel Residencial, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-sublocacao-de-imovel-residencial'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-sublocacao-de-imovel-residencial'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-sublocacao-de-imovel-residencial'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-sublocacao-de-imovel-residencial'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Aluguel de Vaga de Garagem',
    'contrato-de-aluguel-de-vaga-de-garagem',
    (SELECT id FROM contract_categories WHERE slug = 'imobiliario_aluguel'),
    29.90,
    'CONTRATO DE CONTRATO DE ALUGUEL DE VAGA DE GARAGEM\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE ALUGUEL DE VAGA DE GARAGEM, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Aluguel de Vaga de Garagem.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Aluguel de Vaga de Garagem, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-aluguel-de-vaga-de-garagem'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-aluguel-de-vaga-de-garagem'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-aluguel-de-vaga-de-garagem'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-aluguel-de-vaga-de-garagem'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Aluguel/Locação de Espaço para Festas e Eventos',
    'contrato-de-aluguel-locacao-de-espaco-para-festas-e-eventos',
    (SELECT id FROM contract_categories WHERE slug = 'imobiliario_aluguel'),
    29.90,
    'CONTRATO DE CONTRATO DE ALUGUEL/LOCAÇÃO DE ESPAÇO PARA FESTAS E EVENTOS\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE ALUGUEL/LOCAÇÃO DE ESPAÇO PARA FESTAS E EVENTOS, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Aluguel/Locação de Espaço para Festas e Eventos.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Aluguel/Locação de Espaço para Festas e Eventos, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-aluguel-locacao-de-espaco-para-festas-e-eventos'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-aluguel-locacao-de-espaco-para-festas-e-eventos'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-aluguel-locacao-de-espaco-para-festas-e-eventos'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-aluguel-locacao-de-espaco-para-festas-e-eventos'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Prestação de Serviço Autônomo',
    'contrato-de-prestacao-de-servico-autonomo',
    (SELECT id FROM contract_categories WHERE slug = 'servicos_profissional'),
    29.90,
    'CONTRATO DE CONTRATO DE PRESTAÇÃO DE SERVIÇO AUTÔNOMO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PRESTAÇÃO DE SERVIÇO AUTÔNOMO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Prestação de Serviço Autônomo.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Prestação de Serviço Autônomo, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servico-autonomo'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servico-autonomo'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servico-autonomo'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servico-autonomo'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Prestação de Serviços Advocatícios',
    'contrato-de-prestacao-de-servicos-advocaticios',
    (SELECT id FROM contract_categories WHERE slug = 'servicos_profissional'),
    29.90,
    'CONTRATO DE CONTRATO DE PRESTAÇÃO DE SERVIÇOS ADVOCATÍCIOS\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PRESTAÇÃO DE SERVIÇOS ADVOCATÍCIOS, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Prestação de Serviços Advocatícios.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Prestação de Serviços Advocatícios, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-advocaticios'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-advocaticios'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-advocaticios'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-advocaticios'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Prestação de Serviços de Pessoa Física',
    'contrato-de-prestacao-de-servicos-de-pessoa-fisica',
    (SELECT id FROM contract_categories WHERE slug = 'servicos_profissional'),
    29.90,
    'CONTRATO DE CONTRATO DE PRESTAÇÃO DE SERVIÇOS DE PESSOA FÍSICA\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PRESTAÇÃO DE SERVIÇOS DE PESSOA FÍSICA, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Prestação de Serviços de Pessoa Física.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Prestação de Serviços de Pessoa Física, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-de-pessoa-fisica'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-de-pessoa-fisica'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-de-pessoa-fisica'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-de-pessoa-fisica'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Prestação de Serviço de Construção Civil',
    'contrato-de-prestacao-de-servico-de-construcao-civil',
    (SELECT id FROM contract_categories WHERE slug = 'servicos_profissional'),
    29.90,
    'CONTRATO DE CONTRATO DE PRESTAÇÃO DE SERVIÇO DE CONSTRUÇÃO CIVIL\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PRESTAÇÃO DE SERVIÇO DE CONSTRUÇÃO CIVIL, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Prestação de Serviço de Construção Civil.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Prestação de Serviço de Construção Civil, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servico-de-construcao-civil'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servico-de-construcao-civil'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servico-de-construcao-civil'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servico-de-construcao-civil'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Prestação de Serviços de Pessoa Jurídica',
    'contrato-de-prestacao-de-servicos-de-pessoa-juridica',
    (SELECT id FROM contract_categories WHERE slug = 'servicos_profissional'),
    29.90,
    'CONTRATO DE CONTRATO DE PRESTAÇÃO DE SERVIÇOS DE PESSOA JURÍDICA\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PRESTAÇÃO DE SERVIÇOS DE PESSOA JURÍDICA, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Prestação de Serviços de Pessoa Jurídica.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Prestação de Serviços de Pessoa Jurídica, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-de-pessoa-juridica'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-de-pessoa-juridica'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-de-pessoa-juridica'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-de-pessoa-juridica'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Prestação de Serviços Contábeis',
    'contrato-de-prestacao-de-servicos-contabeis',
    (SELECT id FROM contract_categories WHERE slug = 'servicos_profissional'),
    29.90,
    'CONTRATO DE CONTRATO DE PRESTAÇÃO DE SERVIÇOS CONTÁBEIS\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PRESTAÇÃO DE SERVIÇOS CONTÁBEIS, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Prestação de Serviços Contábeis.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Prestação de Serviços Contábeis, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-contabeis'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-contabeis'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-contabeis'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-contabeis'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Declaração de Trabalho',
    'declaracao-de-trabalho',
    (SELECT id FROM contract_categories WHERE slug = 'trabalhista'),
    29.90,
    'CONTRATO DE DECLARAÇÃO DE TRABALHO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente DECLARAÇÃO DE TRABALHO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Declaração de Trabalho.',
    'Garanta segurança jurídica com nosso modelo de Declaração de Trabalho, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'declaracao-de-trabalho'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'declaracao-de-trabalho'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'declaracao-de-trabalho'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'declaracao-de-trabalho'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Trabalho por prazo determinado',
    'contrato-de-trabalho-por-prazo-determinado',
    (SELECT id FROM contract_categories WHERE slug = 'trabalhista'),
    29.90,
    'CONTRATO DE CONTRATO DE TRABALHO POR PRAZO DETERMINADO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE TRABALHO POR PRAZO DETERMINADO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Trabalho por prazo determinado.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Trabalho por prazo determinado, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-trabalho-por-prazo-determinado'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-trabalho-por-prazo-determinado'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-trabalho-por-prazo-determinado'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-trabalho-por-prazo-determinado'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Trabalho Temporário',
    'contrato-de-trabalho-temporario',
    (SELECT id FROM contract_categories WHERE slug = 'trabalhista'),
    29.90,
    'CONTRATO DE CONTRATO DE TRABALHO TEMPORÁRIO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE TRABALHO TEMPORÁRIO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Trabalho Temporário.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Trabalho Temporário, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-trabalho-temporario'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-trabalho-temporario'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-trabalho-temporario'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-trabalho-temporario'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Jovem Aprendiz',
    'contrato-de-jovem-aprendiz',
    (SELECT id FROM contract_categories WHERE slug = 'trabalhista'),
    29.90,
    'CONTRATO DE CONTRATO DE JOVEM APRENDIZ\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE JOVEM APRENDIZ, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Jovem Aprendiz.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Jovem Aprendiz, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-jovem-aprendiz'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-jovem-aprendiz'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-jovem-aprendiz'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-jovem-aprendiz'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Experiência de Trabalho',
    'contrato-de-experiencia-de-trabalho',
    (SELECT id FROM contract_categories WHERE slug = 'trabalhista'),
    29.90,
    'CONTRATO DE CONTRATO DE EXPERIÊNCIA DE TRABALHO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE EXPERIÊNCIA DE TRABALHO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Experiência de Trabalho.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Experiência de Trabalho, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-experiencia-de-trabalho'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-experiencia-de-trabalho'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-experiencia-de-trabalho'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-experiencia-de-trabalho'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'C­­ontrato de Comodato',
    'c-ontrato-de-comodato',
    (SELECT id FROM contract_categories WHERE slug = 'docs_rapidos'),
    29.90,
    'CONTRATO DE C­­ONTRATO DE COMODATO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente C­­ONTRATO DE COMODATO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de C­­ontrato de Comodato.',
    'Garanta segurança jurídica com nosso modelo de C­­ontrato de Comodato, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'c-ontrato-de-comodato'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'c-ontrato-de-comodato'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'c-ontrato-de-comodato'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'c-ontrato-de-comodato'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Arrendamento Comercial/Mercantil/Empresa/Ponto Comercial',
    'contrato-de-arrendamento-comercial-mercantil-empresa-ponto-comercial',
    (SELECT id FROM contract_categories WHERE slug = 'empresarial_parcerias'),
    29.90,
    'CONTRATO DE CONTRATO DE ARRENDAMENTO COMERCIAL/MERCANTIL/EMPRESA/PONTO COMERCIAL\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE ARRENDAMENTO COMERCIAL/MERCANTIL/EMPRESA/PONTO COMERCIAL, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Arrendamento Comercial/Mercantil/Empresa/Ponto Comercial.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Arrendamento Comercial/Mercantil/Empresa/Ponto Comercial, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-arrendamento-comercial-mercantil-empresa-ponto-comercial'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-arrendamento-comercial-mercantil-empresa-ponto-comercial'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-arrendamento-comercial-mercantil-empresa-ponto-comercial'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-arrendamento-comercial-mercantil-empresa-ponto-comercial'
ON CONFLICT DO NOTHING;
