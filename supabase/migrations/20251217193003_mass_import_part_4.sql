-- Batch 4

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Agenciamento',
    'contrato-de-agenciamento',
    (SELECT id FROM contract_categories WHERE slug = 'empresarial_parcerias'),
    29.90,
    'CONTRATO DE CONTRATO DE AGENCIAMENTO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE AGENCIAMENTO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Agenciamento.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Agenciamento, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-agenciamento'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-agenciamento'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-agenciamento'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-agenciamento'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Patrocínio Simples',
    'contrato-de-patrocinio-simples',
    (SELECT id FROM contract_categories WHERE slug = 'empresarial_parcerias'),
    29.90,
    'CONTRATO DE CONTRATO DE PATROCÍNIO SIMPLES\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PATROCÍNIO SIMPLES, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Patrocínio Simples.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Patrocínio Simples, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-patrocinio-simples'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-patrocinio-simples'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-patrocinio-simples'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-patrocinio-simples'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Trabalho Cargo de Confiança',
    'contrato-de-trabalho-cargo-de-confianca',
    (SELECT id FROM contract_categories WHERE slug = 'trabalhista'),
    29.90,
    'CONTRATO DE CONTRATO DE TRABALHO CARGO DE CONFIANÇA\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE TRABALHO CARGO DE CONFIANÇA, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Trabalho Cargo de Confiança.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Trabalho Cargo de Confiança, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-trabalho-cargo-de-confianca'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-trabalho-cargo-de-confianca'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-trabalho-cargo-de-confianca'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-trabalho-cargo-de-confianca'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Parceria de Trabalho',
    'contrato-de-parceria-de-trabalho',
    (SELECT id FROM contract_categories WHERE slug = 'empresarial_parcerias'),
    29.90,
    'CONTRATO DE CONTRATO DE PARCERIA DE TRABALHO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PARCERIA DE TRABALHO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Parceria de Trabalho.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Parceria de Trabalho, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-parceria-de-trabalho'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-parceria-de-trabalho'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-parceria-de-trabalho'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-parceria-de-trabalho'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Trabalho Voluntário',
    'contrato-de-trabalho-voluntario',
    (SELECT id FROM contract_categories WHERE slug = 'trabalhista'),
    29.90,
    'CONTRATO DE CONTRATO DE TRABALHO VOLUNTÁRIO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE TRABALHO VOLUNTÁRIO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Trabalho Voluntário.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Trabalho Voluntário, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-trabalho-voluntario'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-trabalho-voluntario'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-trabalho-voluntario'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-trabalho-voluntario'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Prestação de Serviços de Formatura',
    'contrato-de-prestacao-de-servicos-de-formatura',
    (SELECT id FROM contract_categories WHERE slug = 'servicos_profissional'),
    29.90,
    'CONTRATO DE CONTRATO DE PRESTAÇÃO DE SERVIÇOS DE FORMATURA\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PRESTAÇÃO DE SERVIÇOS DE FORMATURA, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Prestação de Serviços de Formatura.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Prestação de Serviços de Formatura, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-de-formatura'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-de-formatura'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-de-formatura'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-de-formatura'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Convênio Empresarial',
    'contrato-de-convenio-empresarial',
    (SELECT id FROM contract_categories WHERE slug = 'empresarial_parcerias'),
    29.90,
    'CONTRATO DE CONTRATO DE CONVÊNIO EMPRESARIAL\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE CONVÊNIO EMPRESARIAL, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Convênio Empresarial.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Convênio Empresarial, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-convenio-empresarial'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-convenio-empresarial'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-convenio-empresarial'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-convenio-empresarial'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato Joint Venture',
    'contrato-joint-venture',
    (SELECT id FROM contract_categories WHERE slug = 'empresarial_parcerias'),
    29.90,
    'CONTRATO DE CONTRATO JOINT VENTURE\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO JOINT VENTURE, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato Joint Venture.',
    'Garanta segurança jurídica com nosso modelo de Contrato Joint Venture, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-joint-venture'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-joint-venture'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-joint-venture'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-joint-venture'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de transferência de dívidas de veículos',
    'contrato-de-transferencia-de-dividas-de-veiculos',
    (SELECT id FROM contract_categories WHERE slug = 'veiculos_maquinas'),
    29.90,
    'CONTRATO DE CONTRATO DE TRANSFERÊNCIA DE DÍVIDAS DE VEÍCULOS\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE TRANSFERÊNCIA DE DÍVIDAS DE VEÍCULOS, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de transferência de dívidas de veículos.',
    'Garanta segurança jurídica com nosso modelo de Contrato de transferência de dívidas de veículos, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-transferencia-de-dividas-de-veiculos'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-transferencia-de-dividas-de-veiculos'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-transferencia-de-dividas-de-veiculos'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-transferencia-de-dividas-de-veiculos'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Inventário Negativo',
    'inventario-negativo',
    (SELECT id FROM contract_categories WHERE slug = 'familia_pessoal'),
    29.90,
    'CONTRATO DE INVENTÁRIO NEGATIVO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente INVENTÁRIO NEGATIVO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Inventário Negativo.',
    'Garanta segurança jurídica com nosso modelo de Inventário Negativo, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'inventario-negativo'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'inventario-negativo'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'inventario-negativo'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'inventario-negativo'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Termo de Responsabilidade',
    'termo-de-responsabilidade',
    (SELECT id FROM contract_categories WHERE slug = 'docs_rapidos'),
    29.90,
    'CONTRATO DE TERMO DE RESPONSABILIDADE\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente TERMO DE RESPONSABILIDADE, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Termo de Responsabilidade.',
    'Garanta segurança jurídica com nosso modelo de Termo de Responsabilidade, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'termo-de-responsabilidade'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'termo-de-responsabilidade'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'termo-de-responsabilidade'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'termo-de-responsabilidade'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Termo de Compromisso de Estágio',
    'termo-de-compromisso-de-estagio',
    (SELECT id FROM contract_categories WHERE slug = 'trabalhista'),
    29.90,
    'CONTRATO DE TERMO DE COMPROMISSO DE ESTÁGIO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente TERMO DE COMPROMISSO DE ESTÁGIO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Termo de Compromisso de Estágio.',
    'Garanta segurança jurídica com nosso modelo de Termo de Compromisso de Estágio, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'termo-de-compromisso-de-estagio'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'termo-de-compromisso-de-estagio'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'termo-de-compromisso-de-estagio'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'termo-de-compromisso-de-estagio'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Termo de Quitação',
    'termo-de-quitacao',
    (SELECT id FROM contract_categories WHERE slug = 'docs_rapidos'),
    29.90,
    'CONTRATO DE TERMO DE QUITAÇÃO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente TERMO DE QUITAÇÃO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Termo de Quitação.',
    'Garanta segurança jurídica com nosso modelo de Termo de Quitação, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'termo-de-quitacao'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'termo-de-quitacao'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'termo-de-quitacao'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'termo-de-quitacao'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Termo de Acordo',
    'termo-de-acordo',
    (SELECT id FROM contract_categories WHERE slug = 'docs_rapidos'),
    29.90,
    'CONTRATO DE TERMO DE ACORDO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente TERMO DE ACORDO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Termo de Acordo.',
    'Garanta segurança jurídica com nosso modelo de Termo de Acordo, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'termo-de-acordo'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'termo-de-acordo'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'termo-de-acordo'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'termo-de-acordo'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Termo de Entrega',
    'termo-de-entrega',
    (SELECT id FROM contract_categories WHERE slug = 'docs_rapidos'),
    29.90,
    'CONTRATO DE TERMO DE ENTREGA\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente TERMO DE ENTREGA, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Termo de Entrega.',
    'Garanta segurança jurídica com nosso modelo de Termo de Entrega, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'termo-de-entrega'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'termo-de-entrega'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'termo-de-entrega'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'termo-de-entrega'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Termo de Consentimento',
    'termo-de-consentimento',
    (SELECT id FROM contract_categories WHERE slug = 'docs_rapidos'),
    29.90,
    'CONTRATO DE TERMO DE CONSENTIMENTO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente TERMO DE CONSENTIMENTO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Termo de Consentimento.',
    'Garanta segurança jurídica com nosso modelo de Termo de Consentimento, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'termo-de-consentimento'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'termo-de-consentimento'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'termo-de-consentimento'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'termo-de-consentimento'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Manutenção Industrial',
    'contrato-de-manutencao-industrial',
    (SELECT id FROM contract_categories WHERE slug = 'servicos_profissional'),
    29.90,
    'CONTRATO DE CONTRATO DE MANUTENÇÃO INDUSTRIAL\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE MANUTENÇÃO INDUSTRIAL, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Manutenção Industrial.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Manutenção Industrial, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-manutencao-industrial'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-manutencao-industrial'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-manutencao-industrial'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-manutencao-industrial'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Comodato de Equipamento',
    'contrato-de-comodato-de-equipamento',
    (SELECT id FROM contract_categories WHERE slug = 'veiculos_maquinas'),
    29.90,
    'CONTRATO DE CONTRATO DE COMODATO DE EQUIPAMENTO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE COMODATO DE EQUIPAMENTO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Comodato de Equipamento.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Comodato de Equipamento, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-comodato-de-equipamento'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-comodato-de-equipamento'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-comodato-de-equipamento'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-comodato-de-equipamento'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Arrendamento Industrial',
    'contrato-de-arrendamento-industrial',
    (SELECT id FROM contract_categories WHERE slug = 'empresarial_parcerias'),
    29.90,
    'CONTRATO DE CONTRATO DE ARRENDAMENTO INDUSTRIAL\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE ARRENDAMENTO INDUSTRIAL, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Arrendamento Industrial.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Arrendamento Industrial, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-arrendamento-industrial'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-arrendamento-industrial'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-arrendamento-industrial'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-arrendamento-industrial'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Prestação de Serviços de Montagem Industrial',
    'contrato-de-prestacao-de-servicos-de-montagem-industrial',
    (SELECT id FROM contract_categories WHERE slug = 'servicos_profissional'),
    29.90,
    'CONTRATO DE CONTRATO DE PRESTAÇÃO DE SERVIÇOS DE MONTAGEM INDUSTRIAL\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PRESTAÇÃO DE SERVIÇOS DE MONTAGEM INDUSTRIAL, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Prestação de Serviços de Montagem Industrial.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Prestação de Serviços de Montagem Industrial, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-de-montagem-industrial'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-de-montagem-industrial'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-de-montagem-industrial'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-de-montagem-industrial'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Locação/Aluguel de Galpão Industrial',
    'contrato-de-locacao-aluguel-de-galpao-industrial',
    (SELECT id FROM contract_categories WHERE slug = 'imobiliario_aluguel'),
    29.90,
    'CONTRATO DE CONTRATO DE LOCAÇÃO/ALUGUEL DE GALPÃO INDUSTRIAL\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE LOCAÇÃO/ALUGUEL DE GALPÃO INDUSTRIAL, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Locação/Aluguel de Galpão Industrial.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Locação/Aluguel de Galpão Industrial, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-locacao-aluguel-de-galpao-industrial'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-locacao-aluguel-de-galpao-industrial'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-locacao-aluguel-de-galpao-industrial'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-locacao-aluguel-de-galpao-industrial'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Prestação de Serviços de AutoEscola',
    'contrato-de-prestacao-de-servicos-de-autoescola',
    (SELECT id FROM contract_categories WHERE slug = 'servicos_profissional'),
    29.90,
    'CONTRATO DE CONTRATO DE PRESTAÇÃO DE SERVIÇOS DE AUTOESCOLA\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PRESTAÇÃO DE SERVIÇOS DE AUTOESCOLA, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Prestação de Serviços de AutoEscola.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Prestação de Serviços de AutoEscola, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-de-autoescola'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-de-autoescola'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-de-autoescola'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-de-autoescola'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Sigilo Industrial',
    'contrato-de-sigilo-industrial',
    (SELECT id FROM contract_categories WHERE slug = 'docs_rapidos'),
    29.90,
    'CONTRATO DE CONTRATO DE SIGILO INDUSTRIAL\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE SIGILO INDUSTRIAL, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Sigilo Industrial.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Sigilo Industrial, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-sigilo-industrial'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-sigilo-industrial'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-sigilo-industrial'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-sigilo-industrial'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Locação/Aluguel de Máquinas Industriais',
    'contrato-de-locacao-aluguel-de-maquinas-industriais',
    (SELECT id FROM contract_categories WHERE slug = 'imobiliario_aluguel'),
    29.90,
    'CONTRATO DE CONTRATO DE LOCAÇÃO/ALUGUEL DE MÁQUINAS INDUSTRIAIS\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE LOCAÇÃO/ALUGUEL DE MÁQUINAS INDUSTRIAIS, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Locação/Aluguel de Máquinas Industriais.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Locação/Aluguel de Máquinas Industriais, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-locacao-aluguel-de-maquinas-industriais'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-locacao-aluguel-de-maquinas-industriais'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-locacao-aluguel-de-maquinas-industriais'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-locacao-aluguel-de-maquinas-industriais'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Prestação de Serviços Escolares',
    'contrato-de-prestacao-de-servicos-escolares',
    (SELECT id FROM contract_categories WHERE slug = 'servicos_profissional'),
    29.90,
    'CONTRATO DE CONTRATO DE PRESTAÇÃO DE SERVIÇOS ESCOLARES\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PRESTAÇÃO DE SERVIÇOS ESCOLARES, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Prestação de Serviços Escolares.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Prestação de Serviços Escolares, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-escolares'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-escolares'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-escolares'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-escolares'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Arrendamento Rural Para Plantio de Soja',
    'contrato-de-arrendamento-rural-para-plantio-de-soja',
    (SELECT id FROM contract_categories WHERE slug = 'empresarial_parcerias'),
    29.90,
    'CONTRATO DE CONTRATO DE ARRENDAMENTO RURAL PARA PLANTIO DE SOJA\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE ARRENDAMENTO RURAL PARA PLANTIO DE SOJA, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Arrendamento Rural Para Plantio de Soja.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Arrendamento Rural Para Plantio de Soja, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-arrendamento-rural-para-plantio-de-soja'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-arrendamento-rural-para-plantio-de-soja'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-arrendamento-rural-para-plantio-de-soja'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-arrendamento-rural-para-plantio-de-soja'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Trabalho por prazo Indeterminado',
    'contrato-de-trabalho-por-prazo-indeterminado',
    (SELECT id FROM contract_categories WHERE slug = 'trabalhista'),
    29.90,
    'CONTRATO DE CONTRATO DE TRABALHO POR PRAZO INDETERMINADO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE TRABALHO POR PRAZO INDETERMINADO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Trabalho por prazo Indeterminado.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Trabalho por prazo Indeterminado, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-trabalho-por-prazo-indeterminado'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-trabalho-por-prazo-indeterminado'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-trabalho-por-prazo-indeterminado'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-trabalho-por-prazo-indeterminado'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Prestação de Serviços de Reforço Escolar ou Monitoria',
    'contrato-de-prestacao-de-servicos-de-reforco-escolar-ou-monitoria',
    (SELECT id FROM contract_categories WHERE slug = 'servicos_profissional'),
    29.90,
    'CONTRATO DE CONTRATO DE PRESTAÇÃO DE SERVIÇOS DE REFORÇO ESCOLAR OU MONITORIA\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PRESTAÇÃO DE SERVIÇOS DE REFORÇO ESCOLAR OU MONITORIA, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Prestação de Serviços de Reforço Escolar ou Monitoria.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Prestação de Serviços de Reforço Escolar ou Monitoria, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-de-reforco-escolar-ou-monitoria'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-de-reforco-escolar-ou-monitoria'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-de-reforco-escolar-ou-monitoria'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-de-reforco-escolar-ou-monitoria'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Comodato de Impressora',
    'contrato-de-comodato-de-impressora',
    (SELECT id FROM contract_categories WHERE slug = 'docs_rapidos'),
    29.90,
    'CONTRATO DE CONTRATO DE COMODATO DE IMPRESSORA\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE COMODATO DE IMPRESSORA, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Comodato de Impressora.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Comodato de Impressora, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-comodato-de-impressora'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-comodato-de-impressora'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-comodato-de-impressora'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-comodato-de-impressora'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Prestação de Serviços de Bombeiro Civil',
    'contrato-de-prestacao-de-servicos-de-bombeiro-civil',
    (SELECT id FROM contract_categories WHERE slug = 'servicos_profissional'),
    29.90,
    'CONTRATO DE CONTRATO DE PRESTAÇÃO DE SERVIÇOS DE BOMBEIRO CIVIL\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PRESTAÇÃO DE SERVIÇOS DE BOMBEIRO CIVIL, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Prestação de Serviços de Bombeiro Civil.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Prestação de Serviços de Bombeiro Civil, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-de-bombeiro-civil'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-de-bombeiro-civil'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-de-bombeiro-civil'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-de-bombeiro-civil'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Prestação de Serviços de Gestor de Tráfego',
    'contrato-de-prestacao-de-servicos-de-gestor-de-trafego',
    (SELECT id FROM contract_categories WHERE slug = 'servicos_profissional'),
    29.90,
    'CONTRATO DE CONTRATO DE PRESTAÇÃO DE SERVIÇOS DE GESTOR DE TRÁFEGO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PRESTAÇÃO DE SERVIÇOS DE GESTOR DE TRÁFEGO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Prestação de Serviços de Gestor de Tráfego.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Prestação de Serviços de Gestor de Tráfego, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-de-gestor-de-trafego'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-de-gestor-de-trafego'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-de-gestor-de-trafego'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-de-gestor-de-trafego'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Compra e Venda de Caminhão',
    'contrato-de-compra-e-venda-de-caminhao',
    (SELECT id FROM contract_categories WHERE slug = 'veiculos_maquinas'),
    29.90,
    'CONTRATO DE CONTRATO DE COMPRA E VENDA DE CAMINHÃO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE COMPRA E VENDA DE CAMINHÃO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Compra e Venda de Caminhão.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Compra e Venda de Caminhão, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-compra-e-venda-de-caminhao'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-compra-e-venda-de-caminhao'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-compra-e-venda-de-caminhao'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-compra-e-venda-de-caminhao'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Compra e Venda de Academia de Ginástica e Musculação',
    'contrato-de-compra-e-venda-de-academia-de-ginastica-e-musculacao',
    (SELECT id FROM contract_categories WHERE slug = 'empresarial_parcerias'),
    29.90,
    'CONTRATO DE CONTRATO DE COMPRA E VENDA DE ACADEMIA DE GINÁSTICA E MUSCULAÇÃO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE COMPRA E VENDA DE ACADEMIA DE GINÁSTICA E MUSCULAÇÃO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Compra e Venda de Academia de Ginástica e Musculação.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Compra e Venda de Academia de Ginástica e Musculação, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-compra-e-venda-de-academia-de-ginastica-e-musculacao'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-compra-e-venda-de-academia-de-ginastica-e-musculacao'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-compra-e-venda-de-academia-de-ginastica-e-musculacao'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-compra-e-venda-de-academia-de-ginastica-e-musculacao'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Compra e Venda de Roupas',
    'contrato-de-compra-e-venda-de-roupas',
    (SELECT id FROM contract_categories WHERE slug = 'empresarial_parcerias'),
    29.90,
    'CONTRATO DE CONTRATO DE COMPRA E VENDA DE ROUPAS\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE COMPRA E VENDA DE ROUPAS, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Compra e Venda de Roupas.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Compra e Venda de Roupas, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-compra-e-venda-de-roupas'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-compra-e-venda-de-roupas'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-compra-e-venda-de-roupas'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-compra-e-venda-de-roupas'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Compra e Venda de Trailer de Lanches',
    'contrato-de-compra-e-venda-de-trailer-de-lanches',
    (SELECT id FROM contract_categories WHERE slug = 'empresarial_parcerias'),
    29.90,
    'CONTRATO DE CONTRATO DE COMPRA E VENDA DE TRAILER DE LANCHES\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE COMPRA E VENDA DE TRAILER DE LANCHES, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Compra e Venda de Trailer de Lanches.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Compra e Venda de Trailer de Lanches, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-compra-e-venda-de-trailer-de-lanches'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-compra-e-venda-de-trailer-de-lanches'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-compra-e-venda-de-trailer-de-lanches'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-compra-e-venda-de-trailer-de-lanches'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Prestação de Serviços de Decoração de Casamento',
    'contrato-de-prestacao-de-servicos-de-decoracao-de-casamento',
    (SELECT id FROM contract_categories WHERE slug = 'imobiliario_aluguel'),
    29.90,
    'CONTRATO DE CONTRATO DE PRESTAÇÃO DE SERVIÇOS DE DECORAÇÃO DE CASAMENTO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PRESTAÇÃO DE SERVIÇOS DE DECORAÇÃO DE CASAMENTO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Prestação de Serviços de Decoração de Casamento.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Prestação de Serviços de Decoração de Casamento, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-de-decoracao-de-casamento'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-de-decoracao-de-casamento'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-de-decoracao-de-casamento'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-de-decoracao-de-casamento'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Prestação de Serviços Buffet',
    'contrato-de-prestacao-de-servicos-buffet',
    (SELECT id FROM contract_categories WHERE slug = 'servicos_profissional'),
    29.90,
    'CONTRATO DE CONTRATO DE PRESTAÇÃO DE SERVIÇOS BUFFET\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PRESTAÇÃO DE SERVIÇOS BUFFET, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Prestação de Serviços Buffet.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Prestação de Serviços Buffet, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-buffet'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-buffet'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-buffet'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-buffet'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Compra e Venda de Imóvel Inventariado',
    'contrato-de-compra-e-venda-de-imovel-inventariado',
    (SELECT id FROM contract_categories WHERE slug = 'imobiliario_aluguel'),
    29.90,
    'CONTRATO DE CONTRATO DE COMPRA E VENDA DE IMÓVEL INVENTARIADO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE COMPRA E VENDA DE IMÓVEL INVENTARIADO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Compra e Venda de Imóvel Inventariado.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Compra e Venda de Imóvel Inventariado, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-compra-e-venda-de-imovel-inventariado'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-compra-e-venda-de-imovel-inventariado'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-compra-e-venda-de-imovel-inventariado'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-compra-e-venda-de-imovel-inventariado'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Compra e Venda de Imóvel de Herdeiros',
    'contrato-de-compra-e-venda-de-imovel-de-herdeiros',
    (SELECT id FROM contract_categories WHERE slug = 'imobiliario_aluguel'),
    29.90,
    'CONTRATO DE CONTRATO DE COMPRA E VENDA DE IMÓVEL DE HERDEIROS\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE COMPRA E VENDA DE IMÓVEL DE HERDEIROS, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Compra e Venda de Imóvel de Herdeiros.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Compra e Venda de Imóvel de Herdeiros, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-compra-e-venda-de-imovel-de-herdeiros'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-compra-e-venda-de-imovel-de-herdeiros'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-compra-e-venda-de-imovel-de-herdeiros'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-compra-e-venda-de-imovel-de-herdeiros'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Compra e Venda de Lancha',
    'contrato-de-compra-e-venda-de-lancha',
    (SELECT id FROM contract_categories WHERE slug = 'veiculos_maquinas'),
    29.90,
    'CONTRATO DE CONTRATO DE COMPRA E VENDA DE LANCHA\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE COMPRA E VENDA DE LANCHA, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Compra e Venda de Lancha.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Compra e Venda de Lancha, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-compra-e-venda-de-lancha'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-compra-e-venda-de-lancha'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-compra-e-venda-de-lancha'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-compra-e-venda-de-lancha'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Prestação de Serviços de Decoração para Eventos',
    'contrato-de-prestacao-de-servicos-de-decoracao-para-eventos',
    (SELECT id FROM contract_categories WHERE slug = 'servicos_profissional'),
    29.90,
    'CONTRATO DE CONTRATO DE PRESTAÇÃO DE SERVIÇOS DE DECORAÇÃO PARA EVENTOS\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PRESTAÇÃO DE SERVIÇOS DE DECORAÇÃO PARA EVENTOS, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Prestação de Serviços de Decoração para Eventos.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Prestação de Serviços de Decoração para Eventos, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-de-decoracao-para-eventos'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-de-decoracao-para-eventos'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-de-decoracao-para-eventos'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-de-decoracao-para-eventos'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Prestação de Serviços para Atendimento Psicológico',
    'contrato-de-prestacao-de-servicos-para-atendimento-psicologico',
    (SELECT id FROM contract_categories WHERE slug = 'servicos_profissional'),
    29.90,
    'CONTRATO DE CONTRATO DE PRESTAÇÃO DE SERVIÇOS PARA ATENDIMENTO PSICOLÓGICO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PRESTAÇÃO DE SERVIÇOS PARA ATENDIMENTO PSICOLÓGICO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Prestação de Serviços para Atendimento Psicológico.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Prestação de Serviços para Atendimento Psicológico, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-para-atendimento-psicologico'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-para-atendimento-psicologico'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-para-atendimento-psicologico'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-para-atendimento-psicologico'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Prestação de Serviços de Beleza ou Salão de Beleza',
    'contrato-de-prestacao-de-servicos-de-beleza-ou-salao-de-beleza',
    (SELECT id FROM contract_categories WHERE slug = 'servicos_profissional'),
    29.90,
    'CONTRATO DE CONTRATO DE PRESTAÇÃO DE SERVIÇOS DE BELEZA OU SALÃO DE BELEZA\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PRESTAÇÃO DE SERVIÇOS DE BELEZA OU SALÃO DE BELEZA, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Prestação de Serviços de Beleza ou Salão de Beleza.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Prestação de Serviços de Beleza ou Salão de Beleza, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-de-beleza-ou-salao-de-beleza'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-de-beleza-ou-salao-de-beleza'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-de-beleza-ou-salao-de-beleza'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-de-beleza-ou-salao-de-beleza'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Prestação de Serviços Academia e Professor',
    'contrato-de-prestacao-de-servicos-academia-e-professor',
    (SELECT id FROM contract_categories WHERE slug = 'servicos_profissional'),
    29.90,
    'CONTRATO DE CONTRATO DE PRESTAÇÃO DE SERVIÇOS ACADEMIA E PROFESSOR\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PRESTAÇÃO DE SERVIÇOS ACADEMIA E PROFESSOR, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Prestação de Serviços Academia e Professor.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Prestação de Serviços Academia e Professor, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-academia-e-professor'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-academia-e-professor'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-academia-e-professor'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-academia-e-professor'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Prestação de Serviço de Curso',
    'contrato-de-prestacao-de-servico-de-curso',
    (SELECT id FROM contract_categories WHERE slug = 'servicos_profissional'),
    29.90,
    'CONTRATO DE CONTRATO DE PRESTAÇÃO DE SERVIÇO DE CURSO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PRESTAÇÃO DE SERVIÇO DE CURSO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Prestação de Serviço de Curso.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Prestação de Serviço de Curso, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servico-de-curso'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servico-de-curso'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servico-de-curso'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servico-de-curso'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Compra e Venda de Animais',
    'contrato-de-compra-e-venda-de-animais',
    (SELECT id FROM contract_categories WHERE slug = 'empresarial_parcerias'),
    29.90,
    'CONTRATO DE CONTRATO DE COMPRA E VENDA DE ANIMAIS\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE COMPRA E VENDA DE ANIMAIS, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Compra e Venda de Animais.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Compra e Venda de Animais, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-compra-e-venda-de-animais'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-compra-e-venda-de-animais'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-compra-e-venda-de-animais'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-compra-e-venda-de-animais'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Compra e Venda de Imóvel Rural',
    'contrato-de-compra-e-venda-de-imovel-rural',
    (SELECT id FROM contract_categories WHERE slug = 'imobiliario_aluguel'),
    29.90,
    'CONTRATO DE CONTRATO DE COMPRA E VENDA DE IMÓVEL RURAL\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE COMPRA E VENDA DE IMÓVEL RURAL, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Compra e Venda de Imóvel Rural.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Compra e Venda de Imóvel Rural, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-compra-e-venda-de-imovel-rural'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-compra-e-venda-de-imovel-rural'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-compra-e-venda-de-imovel-rural'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-compra-e-venda-de-imovel-rural'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Prestação de Serviço de Estacionamento Rotativo',
    'contrato-de-prestacao-de-servico-de-estacionamento-rotativo',
    (SELECT id FROM contract_categories WHERE slug = 'servicos_profissional'),
    29.90,
    'CONTRATO DE CONTRATO DE PRESTAÇÃO DE SERVIÇO DE ESTACIONAMENTO ROTATIVO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PRESTAÇÃO DE SERVIÇO DE ESTACIONAMENTO ROTATIVO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Prestação de Serviço de Estacionamento Rotativo.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Prestação de Serviço de Estacionamento Rotativo, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servico-de-estacionamento-rotativo'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servico-de-estacionamento-rotativo'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servico-de-estacionamento-rotativo'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servico-de-estacionamento-rotativo'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Aluguel de Brinquedos para Festa Infantil',
    'contrato-de-aluguel-de-brinquedos-para-festa-infantil',
    (SELECT id FROM contract_categories WHERE slug = 'imobiliario_aluguel'),
    29.90,
    'CONTRATO DE CONTRATO DE ALUGUEL DE BRINQUEDOS PARA FESTA INFANTIL\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE ALUGUEL DE BRINQUEDOS PARA FESTA INFANTIL, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Aluguel de Brinquedos para Festa Infantil.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Aluguel de Brinquedos para Festa Infantil, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-aluguel-de-brinquedos-para-festa-infantil'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-aluguel-de-brinquedos-para-festa-infantil'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-aluguel-de-brinquedos-para-festa-infantil'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-aluguel-de-brinquedos-para-festa-infantil'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Prestação de Serviços de Zelador de Igreja',
    'contrato-de-prestacao-de-servicos-de-zelador-de-igreja',
    (SELECT id FROM contract_categories WHERE slug = 'servicos_profissional'),
    29.90,
    'CONTRATO DE CONTRATO DE PRESTAÇÃO DE SERVIÇOS DE ZELADOR DE IGREJA\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PRESTAÇÃO DE SERVIÇOS DE ZELADOR DE IGREJA, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Prestação de Serviços de Zelador de Igreja.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Prestação de Serviços de Zelador de Igreja, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-de-zelador-de-igreja'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-de-zelador-de-igreja'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-de-zelador-de-igreja'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-de-zelador-de-igreja'
ON CONFLICT DO NOTHING;
