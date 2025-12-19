-- Batch 3

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Cessão de Direito de Uso Software',
    'contrato-de-cessao-de-direito-de-uso-software',
    (SELECT id FROM contract_categories WHERE slug = 'empresarial_parcerias'),
    29.90,
    'CONTRATO DE CONTRATO DE CESSÃO DE DIREITO DE USO SOFTWARE\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE CESSÃO DE DIREITO DE USO SOFTWARE, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Cessão de Direito de Uso Software.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Cessão de Direito de Uso Software, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-cessao-de-direito-de-uso-software'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-cessao-de-direito-de-uso-software'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-cessao-de-direito-de-uso-software'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-cessao-de-direito-de-uso-software'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Prestação de Serviço de Suporte Técnico de Software',
    'contrato-de-prestacao-de-servico-de-suporte-tecnico-de-software',
    (SELECT id FROM contract_categories WHERE slug = 'servicos_profissional'),
    29.90,
    'CONTRATO DE CONTRATO DE PRESTAÇÃO DE SERVIÇO DE SUPORTE TÉCNICO DE SOFTWARE\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PRESTAÇÃO DE SERVIÇO DE SUPORTE TÉCNICO DE SOFTWARE, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Prestação de Serviço de Suporte Técnico de Software.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Prestação de Serviço de Suporte Técnico de Software, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servico-de-suporte-tecnico-de-software'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servico-de-suporte-tecnico-de-software'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servico-de-suporte-tecnico-de-software'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servico-de-suporte-tecnico-de-software'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Desenvolvimento de Software',
    'contrato-de-desenvolvimento-de-software',
    (SELECT id FROM contract_categories WHERE slug = 'docs_rapidos'),
    29.90,
    'CONTRATO DE CONTRATO DE DESENVOLVIMENTO DE SOFTWARE\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE DESENVOLVIMENTO DE SOFTWARE, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Desenvolvimento de Software.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Desenvolvimento de Software, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-desenvolvimento-de-software'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-desenvolvimento-de-software'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-desenvolvimento-de-software'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-desenvolvimento-de-software'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Licença de Software',
    'contrato-de-licenca-de-software',
    (SELECT id FROM contract_categories WHERE slug = 'docs_rapidos'),
    29.90,
    'CONTRATO DE CONTRATO DE LICENÇA DE SOFTWARE\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE LICENÇA DE SOFTWARE, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Licença de Software.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Licença de Software, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-licenca-de-software'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-licenca-de-software'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-licenca-de-software'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-licenca-de-software'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Prestação de Serviços de Freelancer',
    'contrato-de-prestacao-de-servicos-de-freelancer',
    (SELECT id FROM contract_categories WHERE slug = 'servicos_profissional'),
    29.90,
    'CONTRATO DE CONTRATO DE PRESTAÇÃO DE SERVIÇOS DE FREELANCER\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PRESTAÇÃO DE SERVIÇOS DE FREELANCER, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Prestação de Serviços de Freelancer.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Prestação de Serviços de Freelancer, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-de-freelancer'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-de-freelancer'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-de-freelancer'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-de-freelancer'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Prestação de Serviços de Personal Trainer',
    'contrato-de-prestacao-de-servicos-de-personal-trainer',
    (SELECT id FROM contract_categories WHERE slug = 'servicos_profissional'),
    29.90,
    'CONTRATO DE CONTRATO DE PRESTAÇÃO DE SERVIÇOS DE PERSONAL TRAINER\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PRESTAÇÃO DE SERVIÇOS DE PERSONAL TRAINER, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Prestação de Serviços de Personal Trainer.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Prestação de Serviços de Personal Trainer, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-de-personal-trainer'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-de-personal-trainer'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-de-personal-trainer'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-de-personal-trainer'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Compra e Venda de Aplicativo APPs',
    'contrato-de-compra-e-venda-de-aplicativo-apps',
    (SELECT id FROM contract_categories WHERE slug = 'empresarial_parcerias'),
    29.90,
    'CONTRATO DE CONTRATO DE COMPRA E VENDA DE APLICATIVO APPS\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE COMPRA E VENDA DE APLICATIVO APPS, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Compra e Venda de Aplicativo APPs.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Compra e Venda de Aplicativo APPs, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-compra-e-venda-de-aplicativo-apps'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-compra-e-venda-de-aplicativo-apps'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-compra-e-venda-de-aplicativo-apps'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-compra-e-venda-de-aplicativo-apps'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Estágio',
    'contrato-de-estagio',
    (SELECT id FROM contract_categories WHERE slug = 'trabalhista'),
    29.90,
    'CONTRATO DE CONTRATO DE ESTÁGIO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE ESTÁGIO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Estágio.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Estágio, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-estagio'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-estagio'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-estagio'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-estagio'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Síndico Profissional',
    'contrato-de-sindico-profissional',
    (SELECT id FROM contract_categories WHERE slug = 'docs_rapidos'),
    29.90,
    'CONTRATO DE CONTRATO DE SÍNDICO PROFISSIONAL\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE SÍNDICO PROFISSIONAL, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Síndico Profissional.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Síndico Profissional, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-sindico-profissional'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-sindico-profissional'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-sindico-profissional'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-sindico-profissional'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Convenção de Condomínio',
    'convencao-de-condominio',
    (SELECT id FROM contract_categories WHERE slug = 'imobiliario_aluguel'),
    29.90,
    'CONTRATO DE CONVENÇÃO DE CONDOMÍNIO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONVENÇÃO DE CONDOMÍNIO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Convenção de Condomínio.',
    'Garanta segurança jurídica com nosso modelo de Convenção de Condomínio, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'convencao-de-condominio'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'convencao-de-condominio'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'convencao-de-condominio'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'convencao-de-condominio'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Troca de Bens',
    'contrato-de-troca-de-bens',
    (SELECT id FROM contract_categories WHERE slug = 'docs_rapidos'),
    29.90,
    'CONTRATO DE CONTRATO DE TROCA DE BENS\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE TROCA DE BENS, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Troca de Bens.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Troca de Bens, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-troca-de-bens'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-troca-de-bens'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-troca-de-bens'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-troca-de-bens'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Prestação de Serviços de Atleta (Trabalho Desportivo)',
    'contrato-de-prestacao-de-servicos-de-atleta-trabalho-desportivo',
    (SELECT id FROM contract_categories WHERE slug = 'servicos_profissional'),
    29.90,
    'CONTRATO DE CONTRATO DE PRESTAÇÃO DE SERVIÇOS DE ATLETA (TRABALHO DESPORTIVO)\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PRESTAÇÃO DE SERVIÇOS DE ATLETA (TRABALHO DESPORTIVO), mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Prestação de Serviços de Atleta (Trabalho Desportivo).',
    'Garanta segurança jurídica com nosso modelo de Contrato de Prestação de Serviços de Atleta (Trabalho Desportivo), revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-de-atleta-trabalho-desportivo'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-de-atleta-trabalho-desportivo'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-de-atleta-trabalho-desportivo'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-de-atleta-trabalho-desportivo'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Comissão de Vendas ou Mercantil',
    'contrato-de-comissao-de-vendas-ou-mercantil',
    (SELECT id FROM contract_categories WHERE slug = 'empresarial_parcerias'),
    29.90,
    'CONTRATO DE CONTRATO DE COMISSÃO DE VENDAS OU MERCANTIL\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE COMISSÃO DE VENDAS OU MERCANTIL, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Comissão de Vendas ou Mercantil.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Comissão de Vendas ou Mercantil, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-comissao-de-vendas-ou-mercantil'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-comissao-de-vendas-ou-mercantil'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-comissao-de-vendas-ou-mercantil'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-comissao-de-vendas-ou-mercantil'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Comissão de Formatura',
    'contrato-de-comissao-de-formatura',
    (SELECT id FROM contract_categories WHERE slug = 'empresarial_parcerias'),
    29.90,
    'CONTRATO DE CONTRATO DE COMISSÃO DE FORMATURA\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE COMISSÃO DE FORMATURA, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Comissão de Formatura.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Comissão de Formatura, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-comissao-de-formatura'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-comissao-de-formatura'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-comissao-de-formatura'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-comissao-de-formatura'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Atos Constitutivos de EIRELI',
    'contrato-de-atos-constitutivos-de-eireli',
    (SELECT id FROM contract_categories WHERE slug = 'empresarial_parcerias'),
    29.90,
    'CONTRATO DE CONTRATO DE ATOS CONSTITUTIVOS DE EIRELI\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE ATOS CONSTITUTIVOS DE EIRELI, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Atos Constitutivos de EIRELI.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Atos Constitutivos de EIRELI, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-atos-constitutivos-de-eireli'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-atos-constitutivos-de-eireli'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-atos-constitutivos-de-eireli'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-atos-constitutivos-de-eireli'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Consultoria',
    'contrato-de-consultoria',
    (SELECT id FROM contract_categories WHERE slug = 'servicos_profissional'),
    29.90,
    'CONTRATO DE CONTRATO DE CONSULTORIA\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE CONSULTORIA, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Consultoria.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Consultoria, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-consultoria'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-consultoria'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-consultoria'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-consultoria'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Cessão de Crédito',
    'contrato-de-cessao-de-credito',
    (SELECT id FROM contract_categories WHERE slug = 'empresarial_parcerias'),
    29.90,
    'CONTRATO DE CONTRATO DE CESSÃO DE CRÉDITO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE CESSÃO DE CRÉDITO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Cessão de Crédito.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Cessão de Crédito, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-cessao-de-credito'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-cessao-de-credito'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-cessao-de-credito'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-cessao-de-credito'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Comissão de Corretagem',
    'contrato-de-comissao-de-corretagem',
    (SELECT id FROM contract_categories WHERE slug = 'empresarial_parcerias'),
    29.90,
    'CONTRATO DE CONTRATO DE COMISSÃO DE CORRETAGEM\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE COMISSÃO DE CORRETAGEM, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Comissão de Corretagem.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Comissão de Corretagem, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-comissao-de-corretagem'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-comissao-de-corretagem'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-comissao-de-corretagem'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-comissao-de-corretagem'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Trabalho Horista',
    'contrato-de-trabalho-horista',
    (SELECT id FROM contract_categories WHERE slug = 'trabalhista'),
    29.90,
    'CONTRATO DE CONTRATO DE TRABALHO HORISTA\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE TRABALHO HORISTA, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Trabalho Horista.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Trabalho Horista, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-trabalho-horista'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-trabalho-horista'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-trabalho-horista'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-trabalho-horista'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Troca de Bens',
    'contrato-de-troca-de-bens',
    (SELECT id FROM contract_categories WHERE slug = 'docs_rapidos'),
    29.90,
    'CONTRATO DE CONTRATO DE TROCA DE BENS\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE TROCA DE BENS, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Troca de Bens.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Troca de Bens, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-troca-de-bens'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-troca-de-bens'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-troca-de-bens'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-troca-de-bens'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Carta de Cobrança',
    'carta-de-cobranca',
    (SELECT id FROM contract_categories WHERE slug = 'servicos_profissional'),
    29.90,
    'CONTRATO DE CARTA DE COBRANÇA\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CARTA DE COBRANÇA, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Carta de Cobrança.',
    'Garanta segurança jurídica com nosso modelo de Carta de Cobrança, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'carta-de-cobranca'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'carta-de-cobranca'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'carta-de-cobranca'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'carta-de-cobranca'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Prestação de Serviços para Campanhas Eleitorais',
    'contrato-de-prestacao-de-servicos-para-campanhas-eleitorais',
    (SELECT id FROM contract_categories WHERE slug = 'servicos_profissional'),
    29.90,
    'CONTRATO DE CONTRATO DE PRESTAÇÃO DE SERVIÇOS PARA CAMPANHAS ELEITORAIS\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PRESTAÇÃO DE SERVIÇOS PARA CAMPANHAS ELEITORAIS, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Prestação de Serviços para Campanhas Eleitorais.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Prestação de Serviços para Campanhas Eleitorais, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-para-campanhas-eleitorais'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-para-campanhas-eleitorais'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-para-campanhas-eleitorais'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-para-campanhas-eleitorais'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Doação para Campanha Eleitoral',
    'contrato-de-doacao-para-campanha-eleitoral',
    (SELECT id FROM contract_categories WHERE slug = 'familia_pessoal'),
    29.90,
    'CONTRATO DE CONTRATO DE DOAÇÃO PARA CAMPANHA ELEITORAL\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE DOAÇÃO PARA CAMPANHA ELEITORAL, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Doação para Campanha Eleitoral.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Doação para Campanha Eleitoral, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-doacao-para-campanha-eleitoral'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-doacao-para-campanha-eleitoral'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-doacao-para-campanha-eleitoral'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-doacao-para-campanha-eleitoral'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Locação de Imóvel para Comitê Eleitoral',
    'contrato-de-locacao-de-imovel-para-comite-eleitoral',
    (SELECT id FROM contract_categories WHERE slug = 'imobiliario_aluguel'),
    29.90,
    'CONTRATO DE CONTRATO DE LOCAÇÃO DE IMÓVEL PARA COMITÊ ELEITORAL\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE LOCAÇÃO DE IMÓVEL PARA COMITÊ ELEITORAL, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Locação de Imóvel para Comitê Eleitoral.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Locação de Imóvel para Comitê Eleitoral, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-locacao-de-imovel-para-comite-eleitoral'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-locacao-de-imovel-para-comite-eleitoral'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-locacao-de-imovel-para-comite-eleitoral'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-locacao-de-imovel-para-comite-eleitoral'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Cooperativa',
    'contrato-de-cooperativa',
    (SELECT id FROM contract_categories WHERE slug = 'docs_rapidos'),
    29.90,
    'CONTRATO DE CONTRATO DE COOPERATIVA\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE COOPERATIVA, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Cooperativa.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Cooperativa, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-cooperativa'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-cooperativa'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-cooperativa'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-cooperativa'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Renúncia de Bens',
    'contrato-de-renuncia-de-bens',
    (SELECT id FROM contract_categories WHERE slug = 'docs_rapidos'),
    29.90,
    'CONTRATO DE CONTRATO DE RENÚNCIA DE BENS\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE RENÚNCIA DE BENS, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Renúncia de Bens.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Renúncia de Bens, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-renuncia-de-bens'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-renuncia-de-bens'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-renuncia-de-bens'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-renuncia-de-bens'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Gestão',
    'contrato-de-gestao',
    (SELECT id FROM contract_categories WHERE slug = 'docs_rapidos'),
    29.90,
    'CONTRATO DE CONTRATO DE GESTÃO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE GESTÃO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Gestão.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Gestão, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-gestao'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-gestao'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-gestao'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-gestao'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Aditivo Contratual',
    'aditivo-contratual',
    (SELECT id FROM contract_categories WHERE slug = 'docs_rapidos'),
    29.90,
    'CONTRATO DE ADITIVO CONTRATUAL\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente ADITIVO CONTRATUAL, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Aditivo Contratual.',
    'Garanta segurança jurídica com nosso modelo de Aditivo Contratual, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'aditivo-contratual'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'aditivo-contratual'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'aditivo-contratual'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'aditivo-contratual'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Regimento Interno Condomínio',
    'regimento-interno-condominio',
    (SELECT id FROM contract_categories WHERE slug = 'imobiliario_aluguel'),
    29.90,
    'CONTRATO DE REGIMENTO INTERNO CONDOMÍNIO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente REGIMENTO INTERNO CONDOMÍNIO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Regimento Interno Condomínio.',
    'Garanta segurança jurídica com nosso modelo de Regimento Interno Condomínio, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'regimento-interno-condominio'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'regimento-interno-condominio'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'regimento-interno-condominio'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'regimento-interno-condominio'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Venda em Consignação de Mercadorias',
    'contrato-de-venda-em-consignacao-de-mercadorias',
    (SELECT id FROM contract_categories WHERE slug = 'empresarial_parcerias'),
    29.90,
    'CONTRATO DE CONTRATO DE VENDA EM CONSIGNAÇÃO DE MERCADORIAS\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE VENDA EM CONSIGNAÇÃO DE MERCADORIAS, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Venda em Consignação de Mercadorias.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Venda em Consignação de Mercadorias, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-venda-em-consignacao-de-mercadorias'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-venda-em-consignacao-de-mercadorias'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-venda-em-consignacao-de-mercadorias'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-venda-em-consignacao-de-mercadorias'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Prestação de Serviços de Transporte',
    'contrato-de-prestacao-de-servicos-de-transporte',
    (SELECT id FROM contract_categories WHERE slug = 'servicos_profissional'),
    29.90,
    'CONTRATO DE CONTRATO DE PRESTAÇÃO DE SERVIÇOS DE TRANSPORTE\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PRESTAÇÃO DE SERVIÇOS DE TRANSPORTE, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Prestação de Serviços de Transporte.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Prestação de Serviços de Transporte, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-de-transporte'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-de-transporte'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-de-transporte'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servicos-de-transporte'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Armazenagem de Mercadorias',
    'contrato-de-armazenagem-de-mercadorias',
    (SELECT id FROM contract_categories WHERE slug = 'docs_rapidos'),
    29.90,
    'CONTRATO DE CONTRATO DE ARMAZENAGEM DE MERCADORIAS\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE ARMAZENAGEM DE MERCADORIAS, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Armazenagem de Mercadorias.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Armazenagem de Mercadorias, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-armazenagem-de-mercadorias'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-armazenagem-de-mercadorias'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-armazenagem-de-mercadorias'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-armazenagem-de-mercadorias'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Comissionamento de Intermediação de Negócios',
    'contrato-de-comissionamento-de-intermediacao-de-negocios',
    (SELECT id FROM contract_categories WHERE slug = 'docs_rapidos'),
    29.90,
    'CONTRATO DE CONTRATO DE COMISSIONAMENTO DE INTERMEDIAÇÃO DE NEGÓCIOS\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE COMISSIONAMENTO DE INTERMEDIAÇÃO DE NEGÓCIOS, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Comissionamento de Intermediação de Negócios.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Comissionamento de Intermediação de Negócios, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-comissionamento-de-intermediacao-de-negocios'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-comissionamento-de-intermediacao-de-negocios'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-comissionamento-de-intermediacao-de-negocios'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-comissionamento-de-intermediacao-de-negocios'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Locação de Veículo para Campanha Eleitoral',
    'contrato-de-locacao-de-veiculo-para-campanha-eleitoral',
    (SELECT id FROM contract_categories WHERE slug = 'imobiliario_aluguel'),
    29.90,
    'CONTRATO DE CONTRATO DE LOCAÇÃO DE VEÍCULO PARA CAMPANHA ELEITORAL\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE LOCAÇÃO DE VEÍCULO PARA CAMPANHA ELEITORAL, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Locação de Veículo para Campanha Eleitoral.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Locação de Veículo para Campanha Eleitoral, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-locacao-de-veiculo-para-campanha-eleitoral'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-locacao-de-veiculo-para-campanha-eleitoral'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-locacao-de-veiculo-para-campanha-eleitoral'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-locacao-de-veiculo-para-campanha-eleitoral'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Locação para Terra Rural',
    'contrato-de-locacao-para-terra-rural',
    (SELECT id FROM contract_categories WHERE slug = 'imobiliario_aluguel'),
    29.90,
    'CONTRATO DE CONTRATO DE LOCAÇÃO PARA TERRA RURAL\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE LOCAÇÃO PARA TERRA RURAL, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Locação para Terra Rural.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Locação para Terra Rural, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-locacao-para-terra-rural'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-locacao-para-terra-rural'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-locacao-para-terra-rural'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-locacao-para-terra-rural'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Comodato de Imóvel Rural',
    'contrato-de-comodato-de-imovel-rural',
    (SELECT id FROM contract_categories WHERE slug = 'imobiliario_aluguel'),
    29.90,
    'CONTRATO DE CONTRATO DE COMODATO DE IMÓVEL RURAL\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE COMODATO DE IMÓVEL RURAL, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Comodato de Imóvel Rural.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Comodato de Imóvel Rural, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-comodato-de-imovel-rural'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-comodato-de-imovel-rural'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-comodato-de-imovel-rural'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-comodato-de-imovel-rural'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Arrendamento Rural para Gado e Pecuária',
    'contrato-de-arrendamento-rural-para-gado-e-pecuaria',
    (SELECT id FROM contract_categories WHERE slug = 'empresarial_parcerias'),
    29.90,
    'CONTRATO DE CONTRATO DE ARRENDAMENTO RURAL PARA GADO E PECUÁRIA\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE ARRENDAMENTO RURAL PARA GADO E PECUÁRIA, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Arrendamento Rural para Gado e Pecuária.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Arrendamento Rural para Gado e Pecuária, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-arrendamento-rural-para-gado-e-pecuaria'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-arrendamento-rural-para-gado-e-pecuaria'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-arrendamento-rural-para-gado-e-pecuaria'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-arrendamento-rural-para-gado-e-pecuaria'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Meeiro Rural',
    'contrato-de-meeiro-rural',
    (SELECT id FROM contract_categories WHERE slug = 'agronegocio'),
    29.90,
    'CONTRATO DE CONTRATO DE MEEIRO RURAL\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE MEEIRO RURAL, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Meeiro Rural.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Meeiro Rural, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-meeiro-rural'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-meeiro-rural'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-meeiro-rural'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-meeiro-rural'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Parceria Pecuária de Gado',
    'contrato-de-parceria-pecuaria-de-gado',
    (SELECT id FROM contract_categories WHERE slug = 'empresarial_parcerias'),
    29.90,
    'CONTRATO DE CONTRATO DE PARCERIA PECUÁRIA DE GADO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PARCERIA PECUÁRIA DE GADO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Parceria Pecuária de Gado.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Parceria Pecuária de Gado, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-parceria-pecuaria-de-gado'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-parceria-pecuaria-de-gado'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-parceria-pecuaria-de-gado'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-parceria-pecuaria-de-gado'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Empreitada Rural',
    'contrato-de-empreitada-rural',
    (SELECT id FROM contract_categories WHERE slug = 'agronegocio'),
    29.90,
    'CONTRATO DE CONTRATO DE EMPREITADA RURAL\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE EMPREITADA RURAL, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Empreitada Rural.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Empreitada Rural, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-empreitada-rural'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-empreitada-rural'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-empreitada-rural'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-empreitada-rural'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Pastoreio Rural',
    'contrato-de-pastoreio-rural',
    (SELECT id FROM contract_categories WHERE slug = 'agronegocio'),
    29.90,
    'CONTRATO DE CONTRATO DE PASTOREIO RURAL\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PASTOREIO RURAL, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Pastoreio Rural.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Pastoreio Rural, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-pastoreio-rural'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-pastoreio-rural'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-pastoreio-rural'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-pastoreio-rural'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato Trabalho Diarista Rural',
    'contrato-trabalho-diarista-rural',
    (SELECT id FROM contract_categories WHERE slug = 'servicos_profissional'),
    29.90,
    'CONTRATO DE CONTRATO TRABALHO DIARISTA RURAL\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO TRABALHO DIARISTA RURAL, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato Trabalho Diarista Rural.',
    'Garanta segurança jurídica com nosso modelo de Contrato Trabalho Diarista Rural, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-trabalho-diarista-rural'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-trabalho-diarista-rural'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-trabalho-diarista-rural'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-trabalho-diarista-rural'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Cessão de Exploração',
    'contrato-de-cessao-de-exploracao',
    (SELECT id FROM contract_categories WHERE slug = 'empresarial_parcerias'),
    29.90,
    'CONTRATO DE CONTRATO DE CESSÃO DE EXPLORAÇÃO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE CESSÃO DE EXPLORAÇÃO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Cessão de Exploração.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Cessão de Exploração, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-cessao-de-exploracao'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-cessao-de-exploracao'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-cessao-de-exploracao'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-cessao-de-exploracao'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Compra e Venda de Materiais de Construção',
    'compra-e-venda-de-materiais-de-construcao',
    (SELECT id FROM contract_categories WHERE slug = 'empresarial_parcerias'),
    29.90,
    'CONTRATO DE COMPRA E VENDA DE MATERIAIS DE CONSTRUÇÃO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente COMPRA E VENDA DE MATERIAIS DE CONSTRUÇÃO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Compra e Venda de Materiais de Construção.',
    'Garanta segurança jurídica com nosso modelo de Compra e Venda de Materiais de Construção, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'compra-e-venda-de-materiais-de-construcao'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'compra-e-venda-de-materiais-de-construcao'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'compra-e-venda-de-materiais-de-construcao'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'compra-e-venda-de-materiais-de-construcao'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Prestação de Serviço de Engenharia',
    'contrato-de-prestacao-de-servico-de-engenharia',
    (SELECT id FROM contract_categories WHERE slug = 'servicos_profissional'),
    29.90,
    'CONTRATO DE CONTRATO DE PRESTAÇÃO DE SERVIÇO DE ENGENHARIA\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PRESTAÇÃO DE SERVIÇO DE ENGENHARIA, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Prestação de Serviço de Engenharia.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Prestação de Serviço de Engenharia, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servico-de-engenharia'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servico-de-engenharia'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servico-de-engenharia'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-prestacao-de-servico-de-engenharia'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Trabalho Individual de Experiência Empregada Doméstica',
    'contrato-de-trabalho-individual-de-experiencia-empregada-domestica',
    (SELECT id FROM contract_categories WHERE slug = 'trabalhista'),
    29.90,
    'CONTRATO DE CONTRATO DE TRABALHO INDIVIDUAL DE EXPERIÊNCIA EMPREGADA DOMÉSTICA\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE TRABALHO INDIVIDUAL DE EXPERIÊNCIA EMPREGADA DOMÉSTICA, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Trabalho Individual de Experiência Empregada Doméstica.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Trabalho Individual de Experiência Empregada Doméstica, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-trabalho-individual-de-experiencia-empregada-domestica'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-trabalho-individual-de-experiencia-empregada-domestica'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-trabalho-individual-de-experiencia-empregada-domestica'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-trabalho-individual-de-experiencia-empregada-domestica'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Modelo de Substabelecimento de Procuração',
    'modelo-de-substabelecimento-de-procuracao',
    (SELECT id FROM contract_categories WHERE slug = 'docs_rapidos'),
    29.90,
    'CONTRATO DE MODELO DE SUBSTABELECIMENTO DE PROCURAÇÃO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente MODELO DE SUBSTABELECIMENTO DE PROCURAÇÃO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Modelo de Substabelecimento de Procuração.',
    'Garanta segurança jurídica com nosso modelo de Modelo de Substabelecimento de Procuração, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'modelo-de-substabelecimento-de-procuracao'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'modelo-de-substabelecimento-de-procuracao'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'modelo-de-substabelecimento-de-procuracao'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'modelo-de-substabelecimento-de-procuracao'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Mútuo Financeiro',
    'contrato-de-mutuo-financeiro',
    (SELECT id FROM contract_categories WHERE slug = 'docs_rapidos'),
    29.90,
    'CONTRATO DE CONTRATO DE MÚTUO FINANCEIRO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE MÚTUO FINANCEIRO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Mútuo Financeiro.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Mútuo Financeiro, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-mutuo-financeiro'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-mutuo-financeiro'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-mutuo-financeiro'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-mutuo-financeiro'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de doação de sêmen',
    'contrato-de-doacao-de-semen',
    (SELECT id FROM contract_categories WHERE slug = 'familia_pessoal'),
    29.90,
    'CONTRATO DE CONTRATO DE DOAÇÃO DE SÊMEN\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE DOAÇÃO DE SÊMEN, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de doação de sêmen.',
    'Garanta segurança jurídica com nosso modelo de Contrato de doação de sêmen, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-doacao-de-semen'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-doacao-de-semen'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-doacao-de-semen'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-doacao-de-semen'
ON CONFLICT DO NOTHING;

INSERT INTO contracts (title, slug, category_id, price, template_body, description, full_description)
VALUES (
    'Contrato de Venda em Consignação',
    'contrato-de-venda-em-consignacao',
    (SELECT id FROM contract_categories WHERE slug = 'empresarial_parcerias'),
    29.90,
    'CONTRATO DE CONTRATO DE VENDA EM CONSIGNAÇÃO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE VENDA EM CONSIGNAÇÃO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Venda em Consignação.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Venda em Consignação, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
) ON CONFLICT (slug) DO NOTHING;

INSERT INTO contract_variables (contract_id, name, label, type, required, order_index)
SELECT id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1 FROM contracts WHERE slug = 'contrato-de-venda-em-consignacao'
UNION ALL
SELECT id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2 FROM contracts WHERE slug = 'contrato-de-venda-em-consignacao'
UNION ALL
SELECT id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3 FROM contracts WHERE slug = 'contrato-de-venda-em-consignacao'
UNION ALL
SELECT id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4 FROM contracts WHERE slug = 'contrato-de-venda-em-consignacao'
ON CONFLICT DO NOTHING;
