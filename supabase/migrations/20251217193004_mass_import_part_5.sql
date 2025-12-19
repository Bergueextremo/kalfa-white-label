-- Batch 5

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Prestação de Serviços de Programação',
    'contrato-de-prestacao-de-servicos-de-programacao',
    (SELECT id FROM contract_categories WHERE slug = 'servicos_profissional'),
    29.90,
    'CONTRATO DE CONTRATO DE PRESTAÇÃO DE SERVIÇOS DE PROGRAMAÇÃO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PRESTAÇÃO DE SERVIÇOS DE PROGRAMAÇÃO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Prestação de Serviços de Programação.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Prestação de Serviços de Programação, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-de-programacao'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-de-programacao'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-de-programacao'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-de-programacao'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Prestação de Serviço Pacote Mensal para Manicure',
    'contrato-de-prestacao-de-servico-pacote-mensal-para-manicure',
    (SELECT id FROM contract_categories WHERE slug = 'servicos_profissional'),
    29.90,
    'CONTRATO DE CONTRATO DE PRESTAÇÃO DE SERVIÇO PACOTE MENSAL PARA MANICURE\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PRESTAÇÃO DE SERVIÇO PACOTE MENSAL PARA MANICURE, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Prestação de Serviço Pacote Mensal para Manicure.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Prestação de Serviço Pacote Mensal para Manicure, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servico-pacote-mensal-para-manicure'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servico-pacote-mensal-para-manicure'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servico-pacote-mensal-para-manicure'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servico-pacote-mensal-para-manicure'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Prestação de Serviços de Microempreendedor Individual (MEI)',
    'contrato-de-prestacao-de-servicos-de-microempreendedor-individual-mei',
    (SELECT id FROM contract_categories WHERE slug = 'servicos_profissional'),
    29.90,
    'CONTRATO DE CONTRATO DE PRESTAÇÃO DE SERVIÇOS DE MICROEMPREENDEDOR INDIVIDUAL (MEI)\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PRESTAÇÃO DE SERVIÇOS DE MICROEMPREENDEDOR INDIVIDUAL (MEI), mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Prestação de Serviços de Microempreendedor Individual (MEI).',
    'Garanta segurança jurídica com nosso modelo de Contrato de Prestação de Serviços de Microempreendedor Individual (MEI), revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-de-microempreendedor-individual-mei'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-de-microempreendedor-individual-mei'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-de-microempreendedor-individual-mei'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-de-microempreendedor-individual-mei'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Prestação de Serviços Food Truck',
    'contrato-de-prestacao-de-servicos-food-truck',
    (SELECT id FROM contract_categories WHERE slug = 'servicos_profissional'),
    29.90,
    'CONTRATO DE CONTRATO DE PRESTAÇÃO DE SERVIÇOS FOOD TRUCK\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PRESTAÇÃO DE SERVIÇOS FOOD TRUCK, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Prestação de Serviços Food Truck.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Prestação de Serviços Food Truck, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-food-truck'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-food-truck'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-food-truck'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-food-truck'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Aluguel de Quarto por Temporada',
    'contrato-de-aluguel-de-quarto-por-temporada',
    (SELECT id FROM contract_categories WHERE slug = 'imobiliario_aluguel'),
    29.90,
    'CONTRATO DE CONTRATO DE ALUGUEL DE QUARTO POR TEMPORADA\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE ALUGUEL DE QUARTO POR TEMPORADA, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Aluguel de Quarto por Temporada.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Aluguel de Quarto por Temporada, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-aluguel-de-quarto-por-temporada'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-aluguel-de-quarto-por-temporada'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-aluguel-de-quarto-por-temporada'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-aluguel-de-quarto-por-temporada'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Prestação de Serviços de Segurança',
    'contrato-de-prestacao-de-servicos-de-seguranca',
    (SELECT id FROM contract_categories WHERE slug = 'servicos_profissional'),
    29.90,
    'CONTRATO DE CONTRATO DE PRESTAÇÃO DE SERVIÇOS DE SEGURANÇA\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PRESTAÇÃO DE SERVIÇOS DE SEGURANÇA, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Prestação de Serviços de Segurança.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Prestação de Serviços de Segurança, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-de-seguranca'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-de-seguranca'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-de-seguranca'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-de-seguranca'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Prestação de Serviços Publicitários',
    'contrato-de-prestacao-de-servicos-publicitarios',
    (SELECT id FROM contract_categories WHERE slug = 'servicos_profissional'),
    29.90,
    'CONTRATO DE CONTRATO DE PRESTAÇÃO DE SERVIÇOS PUBLICITÁRIOS\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PRESTAÇÃO DE SERVIÇOS PUBLICITÁRIOS, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Prestação de Serviços Publicitários.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Prestação de Serviços Publicitários, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-publicitarios'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-publicitarios'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-publicitarios'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-publicitarios'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Aluguel de Consultório Odontológico',
    'contrato-de-aluguel-de-consultorio-odontologico',
    (SELECT id FROM contract_categories WHERE slug = 'imobiliario_aluguel'),
    29.90,
    'CONTRATO DE CONTRATO DE ALUGUEL DE CONSULTÓRIO ODONTOLÓGICO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE ALUGUEL DE CONSULTÓRIO ODONTOLÓGICO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Aluguel de Consultório Odontológico.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Aluguel de Consultório Odontológico, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-aluguel-de-consultorio-odontologico'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-aluguel-de-consultorio-odontologico'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-aluguel-de-consultorio-odontologico'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-aluguel-de-consultorio-odontologico'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Parceria com Blogueira',
    'contrato-de-parceria-com-blogueira',
    (SELECT id FROM contract_categories WHERE slug = 'empresarial_parcerias'),
    29.90,
    'CONTRATO DE CONTRATO DE PARCERIA COM BLOGUEIRA\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PARCERIA COM BLOGUEIRA, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Parceria com Blogueira.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Parceria com Blogueira, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-parceria-com-blogueira'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-parceria-com-blogueira'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-parceria-com-blogueira'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-parceria-com-blogueira'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Prestação de Serviços para Produção de Vídeo Publicitário',
    'contrato-de-prestacao-de-servicos-para-producao-de-video-publicitario',
    (SELECT id FROM contract_categories WHERE slug = 'servicos_profissional'),
    29.90,
    'CONTRATO DE CONTRATO DE PRESTAÇÃO DE SERVIÇOS PARA PRODUÇÃO DE VÍDEO PUBLICITÁRIO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PRESTAÇÃO DE SERVIÇOS PARA PRODUÇÃO DE VÍDEO PUBLICITÁRIO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Prestação de Serviços para Produção de Vídeo Publicitário.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Prestação de Serviços para Produção de Vídeo Publicitário, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-para-producao-de-video-publicitario'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-para-producao-de-video-publicitario'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-para-producao-de-video-publicitario'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-para-producao-de-video-publicitario'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Prestação de Serviços para Confecção e Fabricação',
    'contrato-de-prestacao-de-servicos-para-confeccao-e-fabricacao',
    (SELECT id FROM contract_categories WHERE slug = 'servicos_profissional'),
    29.90,
    'CONTRATO DE CONTRATO DE PRESTAÇÃO DE SERVIÇOS PARA CONFECÇÃO E FABRICAÇÃO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PRESTAÇÃO DE SERVIÇOS PARA CONFECÇÃO E FABRICAÇÃO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Prestação de Serviços para Confecção e Fabricação.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Prestação de Serviços para Confecção e Fabricação, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-para-confeccao-e-fabricacao'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-para-confeccao-e-fabricacao'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-para-confeccao-e-fabricacao'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-para-confeccao-e-fabricacao'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Prestação de Serviços de Corretagem Imobiliária',
    'contrato-de-prestacao-de-servicos-de-corretagem-imobiliaria',
    (SELECT id FROM contract_categories WHERE slug = 'servicos_profissional'),
    29.90,
    'CONTRATO DE CONTRATO DE PRESTAÇÃO DE SERVIÇOS DE CORRETAGEM IMOBILIÁRIA\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PRESTAÇÃO DE SERVIÇOS DE CORRETAGEM IMOBILIÁRIA, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Prestação de Serviços de Corretagem Imobiliária.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Prestação de Serviços de Corretagem Imobiliária, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-de-corretagem-imobiliaria'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-de-corretagem-imobiliaria'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-de-corretagem-imobiliaria'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-de-corretagem-imobiliaria'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Prestação de Serviços Salão de Beleza para Noivas',
    'contrato-de-prestacao-de-servicos-salao-de-beleza-para-noivas',
    (SELECT id FROM contract_categories WHERE slug = 'servicos_profissional'),
    29.90,
    'CONTRATO DE CONTRATO DE PRESTAÇÃO DE SERVIÇOS SALÃO DE BELEZA PARA NOIVAS\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PRESTAÇÃO DE SERVIÇOS SALÃO DE BELEZA PARA NOIVAS, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Prestação de Serviços Salão de Beleza para Noivas.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Prestação de Serviços Salão de Beleza para Noivas, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-salao-de-beleza-para-noivas'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-salao-de-beleza-para-noivas'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-salao-de-beleza-para-noivas'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-salao-de-beleza-para-noivas'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Aluguel de Sala para Consultório Psicológico',
    'contrato-de-aluguel-de-sala-para-consultorio-psicologico',
    (SELECT id FROM contract_categories WHERE slug = 'imobiliario_aluguel'),
    29.90,
    'CONTRATO DE CONTRATO DE ALUGUEL DE SALA PARA CONSULTÓRIO PSICOLÓGICO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE ALUGUEL DE SALA PARA CONSULTÓRIO PSICOLÓGICO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Aluguel de Sala para Consultório Psicológico.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Aluguel de Sala para Consultório Psicológico, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-aluguel-de-sala-para-consultorio-psicologico'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-aluguel-de-sala-para-consultorio-psicologico'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-aluguel-de-sala-para-consultorio-psicologico'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-aluguel-de-sala-para-consultorio-psicologico'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Aluguel de Caminhão',
    'contrato-de-aluguel-de-caminhao',
    (SELECT id FROM contract_categories WHERE slug = 'imobiliario_aluguel'),
    29.90,
    'CONTRATO DE CONTRATO DE ALUGUEL DE CAMINHÃO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE ALUGUEL DE CAMINHÃO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Aluguel de Caminhão.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Aluguel de Caminhão, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-aluguel-de-caminhao'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-aluguel-de-caminhao'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-aluguel-de-caminhao'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-aluguel-de-caminhao'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Aluguel de Caçamba de Entulho',
    'contrato-de-aluguel-de-cacamba-de-entulho',
    (SELECT id FROM contract_categories WHERE slug = 'imobiliario_aluguel'),
    29.90,
    'CONTRATO DE CONTRATO DE ALUGUEL DE CAÇAMBA DE ENTULHO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE ALUGUEL DE CAÇAMBA DE ENTULHO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Aluguel de Caçamba de Entulho.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Aluguel de Caçamba de Entulho, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-aluguel-de-cacamba-de-entulho'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-aluguel-de-cacamba-de-entulho'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-aluguel-de-cacamba-de-entulho'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-aluguel-de-cacamba-de-entulho'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Parceria de Salão e Manicure',
    'contrato-de-parceria-de-salao-e-manicure',
    (SELECT id FROM contract_categories WHERE slug = 'empresarial_parcerias'),
    29.90,
    'CONTRATO DE CONTRATO DE PARCERIA DE SALÃO E MANICURE\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PARCERIA DE SALÃO E MANICURE, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Parceria de Salão e Manicure.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Parceria de Salão e Manicure, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-parceria-de-salao-e-manicure'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-parceria-de-salao-e-manicure'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-parceria-de-salao-e-manicure'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-parceria-de-salao-e-manicure'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Parceria entre Advogados',
    'contrato-de-parceria-entre-advogados',
    (SELECT id FROM contract_categories WHERE slug = 'empresarial_parcerias'),
    29.90,
    'CONTRATO DE CONTRATO DE PARCERIA ENTRE ADVOGADOS\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PARCERIA ENTRE ADVOGADOS, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Parceria entre Advogados.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Parceria entre Advogados, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-parceria-entre-advogados'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-parceria-entre-advogados'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-parceria-entre-advogados'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-parceria-entre-advogados'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Parceria no Instagram',
    'contrato-de-parceria-no-instagram',
    (SELECT id FROM contract_categories WHERE slug = 'empresarial_parcerias'),
    29.90,
    'CONTRATO DE CONTRATO DE PARCERIA NO INSTAGRAM\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PARCERIA NO INSTAGRAM, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Parceria no Instagram.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Parceria no Instagram, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-parceria-no-instagram'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-parceria-no-instagram'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-parceria-no-instagram'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-parceria-no-instagram'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Parceria Agrícola',
    'contrato-de-parceria-agricola',
    (SELECT id FROM contract_categories WHERE slug = 'empresarial_parcerias'),
    29.90,
    'CONTRATO DE CONTRATO DE PARCERIA AGRÍCOLA\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PARCERIA AGRÍCOLA, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Parceria Agrícola.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Parceria Agrícola, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-parceria-agricola'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-parceria-agricola'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-parceria-agricola'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-parceria-agricola'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Parceria',
    'contrato-de-parceria',
    (SELECT id FROM contract_categories WHERE slug = 'empresarial_parcerias'),
    29.90,
    'CONTRATO DE CONTRATO DE PARCERIA\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PARCERIA, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Parceria.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Parceria, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-parceria'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-parceria'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-parceria'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-parceria'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Parceria de Clínica Estética',
    'contrato-de-parceria-de-clinica-estetica',
    (SELECT id FROM contract_categories WHERE slug = 'empresarial_parcerias'),
    29.90,
    'CONTRATO DE CONTRATO DE PARCERIA DE CLÍNICA ESTÉTICA\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PARCERIA DE CLÍNICA ESTÉTICA, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Parceria de Clínica Estética.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Parceria de Clínica Estética, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-parceria-de-clinica-estetica'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-parceria-de-clinica-estetica'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-parceria-de-clinica-estetica'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-parceria-de-clinica-estetica'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Parceria entre Clínica e Médico ou Dentista',
    'contrato-de-parceria-entre-clinica-e-medico-ou-dentista',
    (SELECT id FROM contract_categories WHERE slug = 'servicos_profissional'),
    29.90,
    'CONTRATO DE CONTRATO DE PARCERIA ENTRE CLÍNICA E MÉDICO OU DENTISTA\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PARCERIA ENTRE CLÍNICA E MÉDICO OU DENTISTA, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Parceria entre Clínica e Médico ou Dentista.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Parceria entre Clínica e Médico ou Dentista, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-parceria-entre-clinica-e-medico-ou-dentista'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-parceria-entre-clinica-e-medico-ou-dentista'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-parceria-entre-clinica-e-medico-ou-dentista'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-parceria-entre-clinica-e-medico-ou-dentista'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Locação de Espaço Publicitário em Muro',
    'contrato-de-locacao-de-espaco-publicitario-em-muro',
    (SELECT id FROM contract_categories WHERE slug = 'imobiliario_aluguel'),
    29.90,
    'CONTRATO DE CONTRATO DE LOCAÇÃO DE ESPAÇO PUBLICITÁRIO EM MURO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE LOCAÇÃO DE ESPAÇO PUBLICITÁRIO EM MURO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Locação de Espaço Publicitário em Muro.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Locação de Espaço Publicitário em Muro, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-locacao-de-espaco-publicitario-em-muro'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-locacao-de-espaco-publicitario-em-muro'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-locacao-de-espaco-publicitario-em-muro'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-locacao-de-espaco-publicitario-em-muro'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Aluguel de Espaço para Instalação de Antena',
    'contrato-de-aluguel-de-espaco-para-instalacao-de-antena',
    (SELECT id FROM contract_categories WHERE slug = 'imobiliario_aluguel'),
    29.90,
    'CONTRATO DE CONTRATO DE ALUGUEL DE ESPAÇO PARA INSTALAÇÃO DE ANTENA\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE ALUGUEL DE ESPAÇO PARA INSTALAÇÃO DE ANTENA, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Aluguel de Espaço para Instalação de Antena.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Aluguel de Espaço para Instalação de Antena, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-aluguel-de-espaco-para-instalacao-de-antena'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-aluguel-de-espaco-para-instalacao-de-antena'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-aluguel-de-espaco-para-instalacao-de-antena'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-aluguel-de-espaco-para-instalacao-de-antena'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Aluguel de Estacionamento',
    'contrato-de-aluguel-de-estacionamento',
    (SELECT id FROM contract_categories WHERE slug = 'imobiliario_aluguel'),
    29.90,
    'CONTRATO DE CONTRATO DE ALUGUEL DE ESTACIONAMENTO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE ALUGUEL DE ESTACIONAMENTO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Aluguel de Estacionamento.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Aluguel de Estacionamento, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-aluguel-de-estacionamento'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-aluguel-de-estacionamento'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-aluguel-de-estacionamento'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-aluguel-de-estacionamento'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Aluguel de Espaço Publicitário em Outdoor',
    'contrato-de-aluguel-de-espaco-publicitario-em-outdoor',
    (SELECT id FROM contract_categories WHERE slug = 'imobiliario_aluguel'),
    29.90,
    'CONTRATO DE CONTRATO DE ALUGUEL DE ESPAÇO PUBLICITÁRIO EM OUTDOOR\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE ALUGUEL DE ESPAÇO PUBLICITÁRIO EM OUTDOOR, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Aluguel de Espaço Publicitário em Outdoor.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Aluguel de Espaço Publicitário em Outdoor, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-aluguel-de-espaco-publicitario-em-outdoor'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-aluguel-de-espaco-publicitario-em-outdoor'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-aluguel-de-espaco-publicitario-em-outdoor'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-aluguel-de-espaco-publicitario-em-outdoor'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Prestação de Serviços de Anúncios Website',
    'contrato-de-prestacao-de-servicos-de-anuncios-website',
    (SELECT id FROM contract_categories WHERE slug = 'servicos_profissional'),
    29.90,
    'CONTRATO DE CONTRATO DE PRESTAÇÃO DE SERVIÇOS DE ANÚNCIOS WEBSITE\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PRESTAÇÃO DE SERVIÇOS DE ANÚNCIOS WEBSITE, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Prestação de Serviços de Anúncios Website.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Prestação de Serviços de Anúncios Website, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-de-anuncios-website'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-de-anuncios-website'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-de-anuncios-website'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-de-anuncios-website'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Aluguel de Toalhas de Mesas',
    'contrato-de-aluguel-de-toalhas-de-mesas',
    (SELECT id FROM contract_categories WHERE slug = 'imobiliario_aluguel'),
    29.90,
    'CONTRATO DE CONTRATO DE ALUGUEL DE TOALHAS DE MESAS\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE ALUGUEL DE TOALHAS DE MESAS, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Aluguel de Toalhas de Mesas.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Aluguel de Toalhas de Mesas, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-aluguel-de-toalhas-de-mesas'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-aluguel-de-toalhas-de-mesas'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-aluguel-de-toalhas-de-mesas'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-aluguel-de-toalhas-de-mesas'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Aluguel de Mesas e Cadeiras para Eventos',
    'contrato-de-aluguel-de-mesas-e-cadeiras-para-eventos',
    (SELECT id FROM contract_categories WHERE slug = 'imobiliario_aluguel'),
    29.90,
    'CONTRATO DE CONTRATO DE ALUGUEL DE MESAS E CADEIRAS PARA EVENTOS\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE ALUGUEL DE MESAS E CADEIRAS PARA EVENTOS, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Aluguel de Mesas e Cadeiras para Eventos.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Aluguel de Mesas e Cadeiras para Eventos, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-aluguel-de-mesas-e-cadeiras-para-eventos'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-aluguel-de-mesas-e-cadeiras-para-eventos'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-aluguel-de-mesas-e-cadeiras-para-eventos'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-aluguel-de-mesas-e-cadeiras-para-eventos'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Aluguel de Carrinho de Lanche',
    'contrato-de-aluguel-de-carrinho-de-lanche',
    (SELECT id FROM contract_categories WHERE slug = 'imobiliario_aluguel'),
    29.90,
    'CONTRATO DE CONTRATO DE ALUGUEL DE CARRINHO DE LANCHE\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE ALUGUEL DE CARRINHO DE LANCHE, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Aluguel de Carrinho de Lanche.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Aluguel de Carrinho de Lanche, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-aluguel-de-carrinho-de-lanche'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-aluguel-de-carrinho-de-lanche'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-aluguel-de-carrinho-de-lanche'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-aluguel-de-carrinho-de-lanche'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Aluguel de Kitnet',
    'contrato-de-aluguel-de-kitnet',
    (SELECT id FROM contract_categories WHERE slug = 'imobiliario_aluguel'),
    29.90,
    'CONTRATO DE CONTRATO DE ALUGUEL DE KITNET\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE ALUGUEL DE KITNET, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Aluguel de Kitnet.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Aluguel de Kitnet, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-aluguel-de-kitnet'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-aluguel-de-kitnet'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-aluguel-de-kitnet'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-aluguel-de-kitnet'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Aluguel de Sala de Aula',
    'contrato-de-aluguel-de-sala-de-aula',
    (SELECT id FROM contract_categories WHERE slug = 'imobiliario_aluguel'),
    29.90,
    'CONTRATO DE CONTRATO DE ALUGUEL DE SALA DE AULA\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE ALUGUEL DE SALA DE AULA, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Aluguel de Sala de Aula.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Aluguel de Sala de Aula, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-aluguel-de-sala-de-aula'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-aluguel-de-sala-de-aula'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-aluguel-de-sala-de-aula'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-aluguel-de-sala-de-aula'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Aluguel Espaço para Food Truck',
    'contrato-de-aluguel-espaco-para-food-truck',
    (SELECT id FROM contract_categories WHERE slug = 'imobiliario_aluguel'),
    29.90,
    'CONTRATO DE CONTRATO DE ALUGUEL ESPAÇO PARA FOOD TRUCK\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE ALUGUEL ESPAÇO PARA FOOD TRUCK, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Aluguel Espaço para Food Truck.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Aluguel Espaço para Food Truck, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-aluguel-espaco-para-food-truck'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-aluguel-espaco-para-food-truck'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-aluguel-espaco-para-food-truck'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-aluguel-espaco-para-food-truck'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Prestação de Serviços Digital Influencer',
    'contrato-de-prestacao-de-servicos-digital-influencer',
    (SELECT id FROM contract_categories WHERE slug = 'servicos_profissional'),
    29.90,
    'CONTRATO DE CONTRATO DE PRESTAÇÃO DE SERVIÇOS DIGITAL INFLUENCER\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PRESTAÇÃO DE SERVIÇOS DIGITAL INFLUENCER, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Prestação de Serviços Digital Influencer.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Prestação de Serviços Digital Influencer, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-digital-influencer'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-digital-influencer'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-digital-influencer'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-digital-influencer'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Aluguel de Roupas para Festa',
    'contrato-de-aluguel-de-roupas-para-festa',
    (SELECT id FROM contract_categories WHERE slug = 'imobiliario_aluguel'),
    29.90,
    'CONTRATO DE CONTRATO DE ALUGUEL DE ROUPAS PARA FESTA\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE ALUGUEL DE ROUPAS PARA FESTA, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Aluguel de Roupas para Festa.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Aluguel de Roupas para Festa, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-aluguel-de-roupas-para-festa'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-aluguel-de-roupas-para-festa'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-aluguel-de-roupas-para-festa'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-aluguel-de-roupas-para-festa'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Locação de Lancha',
    'contrato-de-locacao-de-lancha',
    (SELECT id FROM contract_categories WHERE slug = 'imobiliario_aluguel'),
    29.90,
    'CONTRATO DE CONTRATO DE LOCAÇÃO DE LANCHA\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE LOCAÇÃO DE LANCHA, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Locação de Lancha.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Locação de Lancha, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-locacao-de-lancha'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-locacao-de-lancha'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-locacao-de-lancha'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-locacao-de-lancha'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Aluguel de Quarto República',
    'contrato-de-aluguel-de-quarto-republica',
    (SELECT id FROM contract_categories WHERE slug = 'imobiliario_aluguel'),
    29.90,
    'CONTRATO DE CONTRATO DE ALUGUEL DE QUARTO REPÚBLICA\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE ALUGUEL DE QUARTO REPÚBLICA, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Aluguel de Quarto República.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Aluguel de Quarto República, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-aluguel-de-quarto-republica'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-aluguel-de-quarto-republica'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-aluguel-de-quarto-republica'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-aluguel-de-quarto-republica'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Aluguel de Mesa Provençal',
    'contrato-de-aluguel-de-mesa-provencal',
    (SELECT id FROM contract_categories WHERE slug = 'imobiliario_aluguel'),
    29.90,
    'CONTRATO DE CONTRATO DE ALUGUEL DE MESA PROVENÇAL\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE ALUGUEL DE MESA PROVENÇAL, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Aluguel de Mesa Provençal.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Aluguel de Mesa Provençal, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-aluguel-de-mesa-provencal'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-aluguel-de-mesa-provencal'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-aluguel-de-mesa-provencal'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-aluguel-de-mesa-provencal'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Aluguel de Cadeira para Salão de Beleza',
    'contrato-de-aluguel-de-cadeira-para-salao-de-beleza',
    (SELECT id FROM contract_categories WHERE slug = 'imobiliario_aluguel'),
    29.90,
    'CONTRATO DE CONTRATO DE ALUGUEL DE CADEIRA PARA SALÃO DE BELEZA\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE ALUGUEL DE CADEIRA PARA SALÃO DE BELEZA, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Aluguel de Cadeira para Salão de Beleza.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Aluguel de Cadeira para Salão de Beleza, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-aluguel-de-cadeira-para-salao-de-beleza'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-aluguel-de-cadeira-para-salao-de-beleza'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-aluguel-de-cadeira-para-salao-de-beleza'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-aluguel-de-cadeira-para-salao-de-beleza'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Aluguel de Bens Móveis',
    'contrato-de-aluguel-de-bens-moveis',
    (SELECT id FROM contract_categories WHERE slug = 'imobiliario_aluguel'),
    29.90,
    'CONTRATO DE CONTRATO DE ALUGUEL DE BENS MÓVEIS\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE ALUGUEL DE BENS MÓVEIS, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Aluguel de Bens Móveis.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Aluguel de Bens Móveis, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-aluguel-de-bens-moveis'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-aluguel-de-bens-moveis'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-aluguel-de-bens-moveis'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-aluguel-de-bens-moveis'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Aluguel de Imóvel Residencial para Pessoa Jurídica (Igreja Evangélica)',
    'contrato-de-aluguel-de-imovel-residencial-para-pessoa-juridica-igreja-evangelica',
    (SELECT id FROM contract_categories WHERE slug = 'imobiliario_aluguel'),
    29.90,
    'CONTRATO DE CONTRATO DE ALUGUEL DE IMÓVEL RESIDENCIAL PARA PESSOA JURÍDICA (IGREJA EVANGÉLICA)\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE ALUGUEL DE IMÓVEL RESIDENCIAL PARA PESSOA JURÍDICA (IGREJA EVANGÉLICA), mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Aluguel de Imóvel Residencial para Pessoa Jurídica (Igreja Evangélica).',
    'Garanta segurança jurídica com nosso modelo de Contrato de Aluguel de Imóvel Residencial para Pessoa Jurídica (Igreja Evangélica), revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-aluguel-de-imovel-residencial-para-pessoa-juridica-igreja-evangelica'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-aluguel-de-imovel-residencial-para-pessoa-juridica-igreja-evangelica'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-aluguel-de-imovel-residencial-para-pessoa-juridica-igreja-evangelica'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-aluguel-de-imovel-residencial-para-pessoa-juridica-igreja-evangelica'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Prestação de Serviços de Cobrança',
    'contrato-de-prestacao-de-servicos-de-cobranca',
    (SELECT id FROM contract_categories WHERE slug = 'servicos_profissional'),
    29.90,
    'CONTRATO DE CONTRATO DE PRESTAÇÃO DE SERVIÇOS DE COBRANÇA\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PRESTAÇÃO DE SERVIÇOS DE COBRANÇA, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Prestação de Serviços de Cobrança.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Prestação de Serviços de Cobrança, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-de-cobranca'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-de-cobranca'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-de-cobranca'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-de-cobranca'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Aluguel de Imóvel Comercial (Salão para Igreja Evangélica)',
    'contrato-de-aluguel-de-imovel-comercial-salao-para-igreja-evangelica',
    (SELECT id FROM contract_categories WHERE slug = 'imobiliario_aluguel'),
    29.90,
    'CONTRATO DE CONTRATO DE ALUGUEL DE IMÓVEL COMERCIAL (SALÃO PARA IGREJA EVANGÉLICA)\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE ALUGUEL DE IMÓVEL COMERCIAL (SALÃO PARA IGREJA EVANGÉLICA), mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Aluguel de Imóvel Comercial (Salão para Igreja Evangélica).',
    'Garanta segurança jurídica com nosso modelo de Contrato de Aluguel de Imóvel Comercial (Salão para Igreja Evangélica), revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-aluguel-de-imovel-comercial-salao-para-igreja-evangelica'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-aluguel-de-imovel-comercial-salao-para-igreja-evangelica'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-aluguel-de-imovel-comercial-salao-para-igreja-evangelica'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-aluguel-de-imovel-comercial-salao-para-igreja-evangelica'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Comodato de Veículo',
    'contrato-de-comodato-de-veiculo',
    (SELECT id FROM contract_categories WHERE slug = 'veiculos_maquinas'),
    29.90,
    'CONTRATO DE CONTRATO DE COMODATO DE VEÍCULO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE COMODATO DE VEÍCULO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Comodato de Veículo.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Comodato de Veículo, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-comodato-de-veiculo'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-comodato-de-veiculo'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-comodato-de-veiculo'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-comodato-de-veiculo'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Locação de Impressoras',
    'contrato-de-locacao-de-impressoras',
    (SELECT id FROM contract_categories WHERE slug = 'imobiliario_aluguel'),
    29.90,
    'CONTRATO DE CONTRATO DE LOCAÇÃO DE IMPRESSORAS\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE LOCAÇÃO DE IMPRESSORAS, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Locação de Impressoras.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Locação de Impressoras, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-locacao-de-impressoras'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-locacao-de-impressoras'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-locacao-de-impressoras'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-locacao-de-impressoras'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Aluguel Built to Suit',
    'contrato-de-aluguel-built-to-suit',
    (SELECT id FROM contract_categories WHERE slug = 'imobiliario_aluguel'),
    29.90,
    'CONTRATO DE CONTRATO DE ALUGUEL BUILT TO SUIT\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE ALUGUEL BUILT TO SUIT, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Aluguel Built to Suit.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Aluguel Built to Suit, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-aluguel-built-to-suit'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-aluguel-built-to-suit'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-aluguel-built-to-suit'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-aluguel-built-to-suit'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Locação de Shopping',
    'contrato-de-locacao-de-shopping',
    (SELECT id FROM contract_categories WHERE slug = 'imobiliario_aluguel'),
    29.90,
    'CONTRATO DE CONTRATO DE LOCAÇÃO DE SHOPPING\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE LOCAÇÃO DE SHOPPING, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Locação de Shopping.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Locação de Shopping, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-locacao-de-shopping'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-locacao-de-shopping'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-locacao-de-shopping'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-locacao-de-shopping'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Aluguel de Sítio ou Chácara',
    'contrato-de-aluguel-de-sitio-ou-chacara',
    (SELECT id FROM contract_categories WHERE slug = 'imobiliario_aluguel'),
    29.90,
    'CONTRATO DE CONTRATO DE ALUGUEL DE SÍTIO OU CHÁCARA\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE ALUGUEL DE SÍTIO OU CHÁCARA, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Aluguel de Sítio ou Chácara.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Aluguel de Sítio ou Chácara, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-aluguel-de-sitio-ou-chacara'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-aluguel-de-sitio-ou-chacara'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-aluguel-de-sitio-ou-chacara'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-aluguel-de-sitio-ou-chacara'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Declaração de Aluguel',
    'declaracao-de-aluguel',
    (SELECT id FROM contract_categories WHERE slug = 'imobiliario_aluguel'),
    29.90,
    'CONTRATO DE DECLARAÇÃO DE ALUGUEL\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente DECLARAÇÃO DE ALUGUEL, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Declaração de Aluguel.',
    'Garanta segurança jurídica com nosso modelo de Declaração de Aluguel, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'declaracao-de-aluguel'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'declaracao-de-aluguel'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'declaracao-de-aluguel'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'declaracao-de-aluguel'
ON CONFLICT DO NOTHING;
