DO $$
DECLARE
  cat_id uuid;
  new_contract_id uuid;
BEGIN

  -- Create temp table for categories if needed or just select inside loops

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'imobiliario_aluguel';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Aluguel de Imóvel Residencial',
    'contrato-de-aluguel-de-imovel-residencial',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE ALUGUEL DE IMÓVEL RESIDENCIAL\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE ALUGUEL DE IMÓVEL RESIDENCIAL, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Aluguel de Imóvel Residencial.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Aluguel de Imóvel Residencial, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'familia_pessoal';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de União Estável',
    'contrato-de-uniao-estavel',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE UNIÃO ESTÁVEL\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE UNIÃO ESTÁVEL, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de União Estável.',
    'Garanta segurança jurídica com nosso modelo de Contrato de União Estável, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'familia_pessoal';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Declaração de União Estável',
    'declaracao-de-uniao-estavel',
    cat_id,
    29.90,
    'CONTRATO DE DECLARAÇÃO DE UNIÃO ESTÁVEL\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente DECLARAÇÃO DE UNIÃO ESTÁVEL, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Declaração de União Estável.',
    'Garanta segurança jurídica com nosso modelo de Declaração de União Estável, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'imobiliario_aluguel';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Aluguel de Apartamento',
    'contrato-de-aluguel-de-apartamento',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE ALUGUEL DE APARTAMENTO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE ALUGUEL DE APARTAMENTO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Aluguel de Apartamento.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Aluguel de Apartamento, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'imobiliario_aluguel';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Aluguel de Casa',
    'contrato-de-aluguel-de-casa',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE ALUGUEL DE CASA\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE ALUGUEL DE CASA, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Aluguel de Casa.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Aluguel de Casa, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'imobiliario_aluguel';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Aluguel de Imóvel Comercial',
    'contrato-de-aluguel-de-imovel-comercial',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE ALUGUEL DE IMÓVEL COMERCIAL\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE ALUGUEL DE IMÓVEL COMERCIAL, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Aluguel de Imóvel Comercial.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Aluguel de Imóvel Comercial, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'imobiliario_aluguel';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Aluguel de Sala Comercial',
    'contrato-de-aluguel-de-sala-comercial',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE ALUGUEL DE SALA COMERCIAL\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE ALUGUEL DE SALA COMERCIAL, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Aluguel de Sala Comercial.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Aluguel de Sala Comercial, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'imobiliario_aluguel';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Locação por Temporada',
    'contrato-de-locacao-por-temporada',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE LOCAÇÃO POR TEMPORADA\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE LOCAÇÃO POR TEMPORADA, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Locação por Temporada.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Locação por Temporada, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'imobiliario_aluguel';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Locação de Veículo',
    'contrato-de-locacao-de-veiculo',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE LOCAÇÃO DE VEÍCULO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE LOCAÇÃO DE VEÍCULO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Locação de Veículo.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Locação de Veículo, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'veiculos_maquinas';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Compra e Venda de Veículo',
    'contrato-de-compra-e-venda-de-veiculo',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE COMPRA E VENDA DE VEÍCULO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE COMPRA E VENDA DE VEÍCULO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Compra e Venda de Veículo.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Compra e Venda de Veículo, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'empresarial_parcerias';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Promessa de Compra e Venda',
    'contrato-de-promessa-de-compra-e-venda',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE PROMESSA DE COMPRA E VENDA\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PROMESSA DE COMPRA E VENDA, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Promessa de Compra e Venda.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Promessa de Compra e Venda, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'empresarial_parcerias';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Compra e Venda',
    'contrato-de-compra-e-venda',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE COMPRA E VENDA\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE COMPRA E VENDA, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Compra e Venda.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Compra e Venda, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'imobiliario_aluguel';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Compra e Venda de Imóvel',
    'contrato-de-compra-e-venda-de-imovel',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE COMPRA E VENDA DE IMÓVEL\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE COMPRA E VENDA DE IMÓVEL, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Compra e Venda de Imóvel.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Compra e Venda de Imóvel, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'imobiliario_aluguel';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Compra e Venda de Terreno',
    'contrato-de-compra-e-venda-de-terreno',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE COMPRA E VENDA DE TERRENO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE COMPRA E VENDA DE TERRENO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Compra e Venda de Terreno.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Compra e Venda de Terreno, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'imobiliario_aluguel';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Gaveta de Compra e Venda de Imóvel',
    'contrato-de-gaveta-de-compra-e-venda-de-imovel',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE GAVETA DE COMPRA E VENDA DE IMÓVEL\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE GAVETA DE COMPRA E VENDA DE IMÓVEL, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Gaveta de Compra e Venda de Imóvel.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Gaveta de Compra e Venda de Imóvel, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'veiculos_maquinas';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Compra e Venda de Equipamentos',
    'contrato-de-compra-e-venda-de-equipamentos',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE COMPRA E VENDA DE EQUIPAMENTOS\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE COMPRA E VENDA DE EQUIPAMENTOS, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Compra e Venda de Equipamentos.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Compra e Venda de Equipamentos, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'imobiliario_aluguel';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Aluguel',
    'contrato-de-aluguel',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE ALUGUEL\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE ALUGUEL, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Aluguel.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Aluguel, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'imobiliario_aluguel';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Sublocação de Imóvel Comercial',
    'contrato-de-sublocacao-de-imovel-comercial',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE SUBLOCAÇÃO DE IMÓVEL COMERCIAL\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE SUBLOCAÇÃO DE IMÓVEL COMERCIAL, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Sublocação de Imóvel Comercial.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Sublocação de Imóvel Comercial, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'docs_rapidos';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Procuração por Instrumento Particular ou Público',
    'procuracao-por-instrumento-particular-ou-publico',
    cat_id,
    29.90,
    'CONTRATO DE PROCURAÇÃO POR INSTRUMENTO PARTICULAR OU PÚBLICO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente PROCURAÇÃO POR INSTRUMENTO PARTICULAR OU PÚBLICO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Procuração por Instrumento Particular ou Público.',
    'Garanta segurança jurídica com nosso modelo de Procuração por Instrumento Particular ou Público, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'empresarial_parcerias';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Compra e Venda de Empresa/ Ponto Comercial/ Trespasse',
    'contrato-de-compra-e-venda-de-empresa-ponto-comercial-trespasse',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE COMPRA E VENDA DE EMPRESA/ PONTO COMERCIAL/ TRESPASSE\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE COMPRA E VENDA DE EMPRESA/ PONTO COMERCIAL/ TRESPASSE, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Compra e Venda de Empresa/ Ponto Comercial/ Trespasse.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Compra e Venda de Empresa/ Ponto Comercial/ Trespasse, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'imobiliario_aluguel';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Locação de Equipamentos e Máquinas',
    'contrato-de-locacao-de-equipamentos-e-maquinas',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE LOCAÇÃO DE EQUIPAMENTOS E MÁQUINAS\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE LOCAÇÃO DE EQUIPAMENTOS E MÁQUINAS, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Locação de Equipamentos e Máquinas.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Locação de Equipamentos e Máquinas, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'empresarial_parcerias';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato Social',
    'contrato-social',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO SOCIAL\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO SOCIAL, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato Social.',
    'Garanta segurança jurídica com nosso modelo de Contrato Social, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'docs_rapidos';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Empréstimo de Dinheiro',
    'contrato-de-emprestimo-de-dinheiro',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE EMPRÉSTIMO DE DINHEIRO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE EMPRÉSTIMO DE DINHEIRO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Empréstimo de Dinheiro.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Empréstimo de Dinheiro, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'servicos_profissional';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Prestação de Serviços',
    'contrato-de-prestacao-de-servicos',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE PRESTAÇÃO DE SERVIÇOS\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PRESTAÇÃO DE SERVIÇOS, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Prestação de Serviços.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Prestação de Serviços, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'trabalhista';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Trabalho',
    'contrato-de-trabalho',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE TRABALHO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE TRABALHO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Trabalho.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Trabalho, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'familia_pessoal';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Doação',
    'contrato-de-doacao',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE DOAÇÃO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE DOAÇÃO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Doação.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Doação, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'empresarial_parcerias';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Parceria Empresarial',
    'contrato-de-parceria-empresarial',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE PARCERIA EMPRESARIAL\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PARCERIA EMPRESARIAL, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Parceria Empresarial.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Parceria Empresarial, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'empresarial_parcerias';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Cessão de Direitos Hereditários',
    'contrato-de-cessao-de-direitos-hereditarios',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE CESSÃO DE DIREITOS HEREDITÁRIOS\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE CESSÃO DE DIREITOS HEREDITÁRIOS, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Cessão de Direitos Hereditários.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Cessão de Direitos Hereditários, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'docs_rapidos';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Notificação Extrajudicial no Cartório',
    'notificacao-extrajudicial-no-cartorio',
    cat_id,
    29.90,
    'CONTRATO DE NOTIFICAÇÃO EXTRAJUDICIAL NO CARTÓRIO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente NOTIFICAÇÃO EXTRAJUDICIAL NO CARTÓRIO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Notificação Extrajudicial no Cartório.',
    'Garanta segurança jurídica com nosso modelo de Notificação Extrajudicial no Cartório, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'imobiliario_aluguel';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Notificação Extrajudicial por Desocupação de Imóvel',
    'notificacao-extrajudicial-por-desocupacao-de-imovel',
    cat_id,
    29.90,
    'CONTRATO DE NOTIFICAÇÃO EXTRAJUDICIAL POR DESOCUPAÇÃO DE IMÓVEL\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente NOTIFICAÇÃO EXTRAJUDICIAL POR DESOCUPAÇÃO DE IMÓVEL, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Notificação Extrajudicial por Desocupação de Imóvel.',
    'Garanta segurança jurídica com nosso modelo de Notificação Extrajudicial por Desocupação de Imóvel, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'imobiliario_aluguel';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Notificação Extrajudicial de Cobrança de Aluguel',
    'notificacao-extrajudicial-de-cobranca-de-aluguel',
    cat_id,
    29.90,
    'CONTRATO DE NOTIFICAÇÃO EXTRAJUDICIAL DE COBRANÇA DE ALUGUEL\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente NOTIFICAÇÃO EXTRAJUDICIAL DE COBRANÇA DE ALUGUEL, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Notificação Extrajudicial de Cobrança de Aluguel.',
    'Garanta segurança jurídica com nosso modelo de Notificação Extrajudicial de Cobrança de Aluguel, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'empresarial_parcerias';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Arrendamento Rural',
    'contrato-de-arrendamento-rural',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE ARRENDAMENTO RURAL\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE ARRENDAMENTO RURAL, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Arrendamento Rural.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Arrendamento Rural, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'empresarial_parcerias';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Arrendamento',
    'contrato-de-arrendamento',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE ARRENDAMENTO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE ARRENDAMENTO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Arrendamento.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Arrendamento, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'familia_pessoal';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Testamento',
    'testamento',
    cat_id,
    29.90,
    'CONTRATO DE TESTAMENTO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente TESTAMENTO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Testamento.',
    'Garanta segurança jurídica com nosso modelo de Testamento, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'imobiliario_aluguel';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Sublocação de Imóvel Residencial',
    'contrato-de-sublocacao-de-imovel-residencial',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE SUBLOCAÇÃO DE IMÓVEL RESIDENCIAL\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE SUBLOCAÇÃO DE IMÓVEL RESIDENCIAL, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Sublocação de Imóvel Residencial.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Sublocação de Imóvel Residencial, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'imobiliario_aluguel';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Aluguel de Vaga de Garagem',
    'contrato-de-aluguel-de-vaga-de-garagem',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE ALUGUEL DE VAGA DE GARAGEM\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE ALUGUEL DE VAGA DE GARAGEM, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Aluguel de Vaga de Garagem.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Aluguel de Vaga de Garagem, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'imobiliario_aluguel';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Aluguel/Locação de Espaço para Festas e Eventos',
    'contrato-de-aluguel-locacao-de-espaco-para-festas-e-eventos',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE ALUGUEL/LOCAÇÃO DE ESPAÇO PARA FESTAS E EVENTOS\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE ALUGUEL/LOCAÇÃO DE ESPAÇO PARA FESTAS E EVENTOS, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Aluguel/Locação de Espaço para Festas e Eventos.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Aluguel/Locação de Espaço para Festas e Eventos, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'servicos_profissional';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Prestação de Serviço Autônomo',
    'contrato-de-prestacao-de-servico-autonomo',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE PRESTAÇÃO DE SERVIÇO AUTÔNOMO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PRESTAÇÃO DE SERVIÇO AUTÔNOMO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Prestação de Serviço Autônomo.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Prestação de Serviço Autônomo, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'servicos_profissional';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Prestação de Serviços Advocatícios',
    'contrato-de-prestacao-de-servicos-advocaticios',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE PRESTAÇÃO DE SERVIÇOS ADVOCATÍCIOS\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PRESTAÇÃO DE SERVIÇOS ADVOCATÍCIOS, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Prestação de Serviços Advocatícios.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Prestação de Serviços Advocatícios, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'servicos_profissional';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Prestação de Serviços de Pessoa Física',
    'contrato-de-prestacao-de-servicos-de-pessoa-fisica',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE PRESTAÇÃO DE SERVIÇOS DE PESSOA FÍSICA\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PRESTAÇÃO DE SERVIÇOS DE PESSOA FÍSICA, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Prestação de Serviços de Pessoa Física.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Prestação de Serviços de Pessoa Física, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'servicos_profissional';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Prestação de Serviço de Construção Civil',
    'contrato-de-prestacao-de-servico-de-construcao-civil',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE PRESTAÇÃO DE SERVIÇO DE CONSTRUÇÃO CIVIL\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PRESTAÇÃO DE SERVIÇO DE CONSTRUÇÃO CIVIL, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Prestação de Serviço de Construção Civil.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Prestação de Serviço de Construção Civil, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'servicos_profissional';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Prestação de Serviços de Pessoa Jurídica',
    'contrato-de-prestacao-de-servicos-de-pessoa-juridica',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE PRESTAÇÃO DE SERVIÇOS DE PESSOA JURÍDICA\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PRESTAÇÃO DE SERVIÇOS DE PESSOA JURÍDICA, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Prestação de Serviços de Pessoa Jurídica.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Prestação de Serviços de Pessoa Jurídica, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'servicos_profissional';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Prestação de Serviços Contábeis',
    'contrato-de-prestacao-de-servicos-contabeis',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE PRESTAÇÃO DE SERVIÇOS CONTÁBEIS\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PRESTAÇÃO DE SERVIÇOS CONTÁBEIS, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Prestação de Serviços Contábeis.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Prestação de Serviços Contábeis, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'trabalhista';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Declaração de Trabalho',
    'declaracao-de-trabalho',
    cat_id,
    29.90,
    'CONTRATO DE DECLARAÇÃO DE TRABALHO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente DECLARAÇÃO DE TRABALHO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Declaração de Trabalho.',
    'Garanta segurança jurídica com nosso modelo de Declaração de Trabalho, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'trabalhista';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Trabalho por prazo determinado',
    'contrato-de-trabalho-por-prazo-determinado',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE TRABALHO POR PRAZO DETERMINADO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE TRABALHO POR PRAZO DETERMINADO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Trabalho por prazo determinado.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Trabalho por prazo determinado, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'trabalhista';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Trabalho Temporário',
    'contrato-de-trabalho-temporario',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE TRABALHO TEMPORÁRIO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE TRABALHO TEMPORÁRIO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Trabalho Temporário.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Trabalho Temporário, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'trabalhista';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Jovem Aprendiz',
    'contrato-de-jovem-aprendiz',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE JOVEM APRENDIZ\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE JOVEM APRENDIZ, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Jovem Aprendiz.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Jovem Aprendiz, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'trabalhista';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Experiência de Trabalho',
    'contrato-de-experiencia-de-trabalho',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE EXPERIÊNCIA DE TRABALHO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE EXPERIÊNCIA DE TRABALHO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Experiência de Trabalho.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Experiência de Trabalho, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'docs_rapidos';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'C­­ontrato de Comodato',
    'c-ontrato-de-comodato',
    cat_id,
    29.90,
    'CONTRATO DE C­­ONTRATO DE COMODATO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente C­­ONTRATO DE COMODATO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de C­­ontrato de Comodato.',
    'Garanta segurança jurídica com nosso modelo de C­­ontrato de Comodato, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'empresarial_parcerias';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Arrendamento Comercial/Mercantil/Empresa/Ponto Comercial',
    'contrato-de-arrendamento-comercial-mercantil-empresa-ponto-comercial',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE ARRENDAMENTO COMERCIAL/MERCANTIL/EMPRESA/PONTO COMERCIAL\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE ARRENDAMENTO COMERCIAL/MERCANTIL/EMPRESA/PONTO COMERCIAL, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Arrendamento Comercial/Mercantil/Empresa/Ponto Comercial.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Arrendamento Comercial/Mercantil/Empresa/Ponto Comercial, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'servicos_profissional';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Prestação de Serviço de Manutenção',
    'contrato-de-prestacao-de-servico-de-manutencao',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE PRESTAÇÃO DE SERVIÇO DE MANUTENÇÃO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PRESTAÇÃO DE SERVIÇO DE MANUTENÇÃO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Prestação de Serviço de Manutenção.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Prestação de Serviço de Manutenção, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'imobiliario_aluguel';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Notificação Extrajudicial por condomínio em atraso',
    'notificacao-extrajudicial-por-condominio-em-atraso',
    cat_id,
    29.90,
    'CONTRATO DE NOTIFICAÇÃO EXTRAJUDICIAL POR CONDOMÍNIO EM ATRASO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente NOTIFICAÇÃO EXTRAJUDICIAL POR CONDOMÍNIO EM ATRASO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Notificação Extrajudicial por condomínio em atraso.',
    'Garanta segurança jurídica com nosso modelo de Notificação Extrajudicial por condomínio em atraso, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'servicos_profissional';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Prestação de Serviço de Pedreiro',
    'contrato-de-prestacao-de-servico-de-pedreiro',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE PRESTAÇÃO DE SERVIÇO DE PEDREIRO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PRESTAÇÃO DE SERVIÇO DE PEDREIRO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Prestação de Serviço de Pedreiro.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Prestação de Serviço de Pedreiro, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'servicos_profissional';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Prestação de Serviços Educacionais',
    'contrato-de-prestacao-de-servicos-educacionais',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE PRESTAÇÃO DE SERVIÇOS EDUCACIONAIS\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PRESTAÇÃO DE SERVIÇOS EDUCACIONAIS, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Prestação de Serviços Educacionais.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Prestação de Serviços Educacionais, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'servicos_profissional';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Prestação de Serviços de Mão de Obra',
    'contrato-de-prestacao-de-servicos-de-mao-de-obra',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE PRESTAÇÃO DE SERVIÇOS DE MÃO DE OBRA\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PRESTAÇÃO DE SERVIÇOS DE MÃO DE OBRA, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Prestação de Serviços de Mão de Obra.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Prestação de Serviços de Mão de Obra, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'docs_rapidos';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Permuta',
    'contrato-de-permuta',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE PERMUTA\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PERMUTA, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Permuta.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Permuta, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'docs_rapidos';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Modelo de Revogação de Procuração',
    'modelo-de-revogacao-de-procuracao',
    cat_id,
    29.90,
    'CONTRATO DE MODELO DE REVOGAÇÃO DE PROCURAÇÃO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente MODELO DE REVOGAÇÃO DE PROCURAÇÃO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Modelo de Revogação de Procuração.',
    'Garanta segurança jurídica com nosso modelo de Modelo de Revogação de Procuração, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'docs_rapidos';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Declaração de Residência',
    'declaracao-de-residencia',
    cat_id,
    29.90,
    'CONTRATO DE DECLARAÇÃO DE RESIDÊNCIA\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente DECLARAÇÃO DE RESIDÊNCIA, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Declaração de Residência.',
    'Garanta segurança jurídica com nosso modelo de Declaração de Residência, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'docs_rapidos';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Empreitada',
    'contrato-de-empreitada',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE EMPREITADA\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE EMPREITADA, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Empreitada.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Empreitada, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'familia_pessoal';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Autorização de Viagem Nacional/Internacional para Menor (criança ou adolescente)',
    'autorizacao-de-viagem-nacional-internacional-para-menor-crianca-ou-adolescente',
    cat_id,
    29.90,
    'CONTRATO DE AUTORIZAÇÃO DE VIAGEM NACIONAL/INTERNACIONAL PARA MENOR (CRIANÇA OU ADOLESCENTE)\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente AUTORIZAÇÃO DE VIAGEM NACIONAL/INTERNACIONAL PARA MENOR (CRIANÇA OU ADOLESCENTE), mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Autorização de Viagem Nacional/Internacional para Menor (criança ou adolescente).',
    'Garanta segurança jurídica com nosso modelo de Autorização de Viagem Nacional/Internacional para Menor (criança ou adolescente), revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'docs_rapidos';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Recurso contra Multa de Transito',
    'recurso-contra-multa-de-transito',
    cat_id,
    29.90,
    'CONTRATO DE RECURSO CONTRA MULTA DE TRANSITO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente RECURSO CONTRA MULTA DE TRANSITO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Recurso contra Multa de Transito.',
    'Garanta segurança jurídica com nosso modelo de Recurso contra Multa de Transito, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'empresarial_parcerias';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Termo de Confissão de Dívida',
    'termo-de-confissao-de-divida',
    cat_id,
    29.90,
    'CONTRATO DE TERMO DE CONFISSÃO DE DÍVIDA\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente TERMO DE CONFISSÃO DE DÍVIDA, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Termo de Confissão de Dívida.',
    'Garanta segurança jurídica com nosso modelo de Termo de Confissão de Dívida, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'empresarial_parcerias';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Termo de Confidencialidade',
    'termo-de-confidencialidade',
    cat_id,
    29.90,
    'CONTRATO DE TERMO DE CONFIDENCIALIDADE\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente TERMO DE CONFIDENCIALIDADE, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Termo de Confidencialidade.',
    'Garanta segurança jurídica com nosso modelo de Termo de Confidencialidade, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'empresarial_parcerias';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Franquia',
    'contrato-de-franquia',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE FRANQUIA\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE FRANQUIA, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Franquia.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Franquia, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'empresarial_parcerias';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Termo de Cessão de Direitos para Uso de Imagem',
    'termo-de-cessao-de-direitos-para-uso-de-imagem',
    cat_id,
    29.90,
    'CONTRATO DE TERMO DE CESSÃO DE DIREITOS PARA USO DE IMAGEM\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente TERMO DE CESSÃO DE DIREITOS PARA USO DE IMAGEM, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Termo de Cessão de Direitos para Uso de Imagem.',
    'Garanta segurança jurídica com nosso modelo de Termo de Cessão de Direitos para Uso de Imagem, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'empresarial_parcerias';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Cessão de Direitos Autorais',
    'contrato-de-cessao-de-direitos-autorais',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE CESSÃO DE DIREITOS AUTORAIS\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE CESSÃO DE DIREITOS AUTORAIS, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Cessão de Direitos Autorais.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Cessão de Direitos Autorais, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'trabalhista';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Trabalho Intermitente',
    'contrato-de-trabalho-intermitente',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE TRABALHO INTERMITENTE\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE TRABALHO INTERMITENTE, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Trabalho Intermitente.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Trabalho Intermitente, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'familia_pessoal';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Pacto Antenupcial',
    'contrato-de-pacto-antenupcial',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE PACTO ANTENUPCIAL\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PACTO ANTENUPCIAL, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Pacto Antenupcial.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Pacto Antenupcial, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'docs_rapidos';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Carta de Referência Profissional',
    'carta-de-referencia-profissional',
    cat_id,
    29.90,
    'CONTRATO DE CARTA DE REFERÊNCIA PROFISSIONAL\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CARTA DE REFERÊNCIA PROFISSIONAL, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Carta de Referência Profissional.',
    'Garanta segurança jurídica com nosso modelo de Carta de Referência Profissional, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'docs_rapidos';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Nota Promissória',
    'nota-promissoria',
    cat_id,
    29.90,
    'CONTRATO DE NOTA PROMISSÓRIA\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente NOTA PROMISSÓRIA, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Nota Promissória.',
    'Garanta segurança jurídica com nosso modelo de Nota Promissória, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'docs_rapidos';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Declaração de Bens e Valores',
    'declaracao-de-bens-e-valores',
    cat_id,
    29.90,
    'CONTRATO DE DECLARAÇÃO DE BENS E VALORES\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente DECLARAÇÃO DE BENS E VALORES, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Declaração de Bens e Valores.',
    'Garanta segurança jurídica com nosso modelo de Declaração de Bens e Valores, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'docs_rapidos';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Declaração de Rendimentos',
    'declaracao-de-rendimentos',
    cat_id,
    29.90,
    'CONTRATO DE DECLARAÇÃO DE RENDIMENTOS\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente DECLARAÇÃO DE RENDIMENTOS, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Declaração de Rendimentos.',
    'Garanta segurança jurídica com nosso modelo de Declaração de Rendimentos, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'docs_rapidos';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Atestado de Comparecimento',
    'atestado-de-comparecimento',
    cat_id,
    29.90,
    'CONTRATO DE ATESTADO DE COMPARECIMENTO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente ATESTADO DE COMPARECIMENTO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Atestado de Comparecimento.',
    'Garanta segurança jurídica com nosso modelo de Atestado de Comparecimento, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'empresarial_parcerias';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Estatuto Social de Associação',
    'estatuto-social-de-associacao',
    cat_id,
    29.90,
    'CONTRATO DE ESTATUTO SOCIAL DE ASSOCIAÇÃO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente ESTATUTO SOCIAL DE ASSOCIAÇÃO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Estatuto Social de Associação.',
    'Garanta segurança jurídica com nosso modelo de Estatuto Social de Associação, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'veiculos_maquinas';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Laudo de Vistoria de Veículo',
    'laudo-de-vistoria-de-veiculo',
    cat_id,
    29.90,
    'CONTRATO DE LAUDO DE VISTORIA DE VEÍCULO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente LAUDO DE VISTORIA DE VEÍCULO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Laudo de Vistoria de Veículo.',
    'Garanta segurança jurídica com nosso modelo de Laudo de Vistoria de Veículo, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'empresarial_parcerias';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Parceria Rural',
    'contrato-de-parceria-rural',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE PARCERIA RURAL\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PARCERIA RURAL, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Parceria Rural.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Parceria Rural, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'trabalhista';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Teletrabalho - Home Office',
    'contrato-de-teletrabalho-home-office',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE TELETRABALHO - HOME OFFICE\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE TELETRABALHO - HOME OFFICE, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Teletrabalho - Home Office.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Teletrabalho - Home Office, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'servicos_profissional';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Prestação de Serviço Babysitter',
    'contrato-de-prestacao-de-servico-babysitter',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE PRESTAÇÃO DE SERVIÇO BABYSITTER\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PRESTAÇÃO DE SERVIÇO BABYSITTER, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Prestação de Serviço Babysitter.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Prestação de Serviço Babysitter, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'docs_rapidos';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Declaração de Dependentes',
    'declaracao-de-dependentes',
    cat_id,
    29.90,
    'CONTRATO DE DECLARAÇÃO DE DEPENDENTES\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente DECLARAÇÃO DE DEPENDENTES, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Declaração de Dependentes.',
    'Garanta segurança jurídica com nosso modelo de Declaração de Dependentes, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'docs_rapidos';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Declaração de Inexistência de Bens a Inventariar ou Arrolar',
    'declaracao-de-inexistencia-de-bens-a-inventariar-ou-arrolar',
    cat_id,
    29.90,
    'CONTRATO DE DECLARAÇÃO DE INEXISTÊNCIA DE BENS A INVENTARIAR OU ARROLAR\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente DECLARAÇÃO DE INEXISTÊNCIA DE BENS A INVENTARIAR OU ARROLAR, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Declaração de Inexistência de Bens a Inventariar ou Arrolar.',
    'Garanta segurança jurídica com nosso modelo de Declaração de Inexistência de Bens a Inventariar ou Arrolar, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'imobiliario_aluguel';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Laudo de Vistoria de Imóvel',
    'laudo-de-vistoria-de-imovel',
    cat_id,
    29.90,
    'CONTRATO DE LAUDO DE VISTORIA DE IMÓVEL\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente LAUDO DE VISTORIA DE IMÓVEL, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Laudo de Vistoria de Imóvel.',
    'Garanta segurança jurídica com nosso modelo de Laudo de Vistoria de Imóvel, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'trabalhista';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Termo de Acordo para Extinção do Contrato de Trabalho',
    'termo-de-acordo-para-extincao-do-contrato-de-trabalho',
    cat_id,
    29.90,
    'CONTRATO DE TERMO DE ACORDO PARA EXTINÇÃO DO CONTRATO DE TRABALHO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente TERMO DE ACORDO PARA EXTINÇÃO DO CONTRATO DE TRABALHO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Termo de Acordo para Extinção do Contrato de Trabalho.',
    'Garanta segurança jurídica com nosso modelo de Termo de Acordo para Extinção do Contrato de Trabalho, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'veiculos_maquinas';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Arrendamento de Veículos',
    'contrato-de-arrendamento-de-veiculos',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE ARRENDAMENTO DE VEÍCULOS\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE ARRENDAMENTO DE VEÍCULOS, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Arrendamento de Veículos.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Arrendamento de Veículos, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'empresarial_parcerias';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Carta de Recomendação para Fins não Profissionais',
    'carta-de-recomendacao-para-fins-nao-profissionais',
    cat_id,
    29.90,
    'CONTRATO DE CARTA DE RECOMENDAÇÃO PARA FINS NÃO PROFISSIONAIS\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CARTA DE RECOMENDAÇÃO PARA FINS NÃO PROFISSIONAIS, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Carta de Recomendação para Fins não Profissionais.',
    'Garanta segurança jurídica com nosso modelo de Carta de Recomendação para Fins não Profissionais, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'familia_pessoal';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Declaração de Dissolução de União Estável',
    'declaracao-de-dissolucao-de-uniao-estavel',
    cat_id,
    29.90,
    'CONTRATO DE DECLARAÇÃO DE DISSOLUÇÃO DE UNIÃO ESTÁVEL\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente DECLARAÇÃO DE DISSOLUÇÃO DE UNIÃO ESTÁVEL, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Declaração de Dissolução de União Estável.',
    'Garanta segurança jurídica com nosso modelo de Declaração de Dissolução de União Estável, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'docs_rapidos';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contranotificação Extrajudicial',
    'contranotificacao-extrajudicial',
    cat_id,
    29.90,
    'CONTRATO DE CONTRANOTIFICAÇÃO EXTRAJUDICIAL\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRANOTIFICAÇÃO EXTRAJUDICIAL, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contranotificação Extrajudicial.',
    'Garanta segurança jurídica com nosso modelo de Contranotificação Extrajudicial, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'servicos_profissional';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Prestação de Serviço Diarista',
    'contrato-de-prestacao-de-servico-diarista',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE PRESTAÇÃO DE SERVIÇO DIARISTA\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PRESTAÇÃO DE SERVIÇO DIARISTA, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Prestação de Serviço Diarista.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Prestação de Serviço Diarista, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'veiculos_maquinas';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Compra e Venda de Máquinas',
    'contrato-de-compra-e-venda-de-maquinas',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE COMPRA E VENDA DE MÁQUINAS\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE COMPRA E VENDA DE MÁQUINAS, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Compra e Venda de Máquinas.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Compra e Venda de Máquinas, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'empresarial_parcerias';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Cessão de Carteira de Clientes',
    'contrato-de-cessao-de-carteira-de-clientes',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE CESSÃO DE CARTEIRA DE CLIENTES\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE CESSÃO DE CARTEIRA DE CLIENTES, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Cessão de Carteira de Clientes.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Cessão de Carteira de Clientes, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'veiculos_maquinas';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Compra e Venda de Embarcação',
    'contrato-de-compra-e-venda-de-embarcacao',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE COMPRA E VENDA DE EMBARCAÇÃO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE COMPRA E VENDA DE EMBARCAÇÃO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Compra e Venda de Embarcação.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Compra e Venda de Embarcação, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'trabalhista';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Trabalho Rural',
    'contrato-de-trabalho-rural',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE TRABALHO RURAL\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE TRABALHO RURAL, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Trabalho Rural.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Trabalho Rural, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'servicos_profissional';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Prestação de Serviço de Marketing Digital',
    'contrato-de-prestacao-de-servico-de-marketing-digital',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE PRESTAÇÃO DE SERVIÇO DE MARKETING DIGITAL\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PRESTAÇÃO DE SERVIÇO DE MARKETING DIGITAL, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Prestação de Serviço de Marketing Digital.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Prestação de Serviço de Marketing Digital, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'empresarial_parcerias';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Parceria de Corretagem',
    'contrato-de-parceria-de-corretagem',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE PARCERIA DE CORRETAGEM\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PARCERIA DE CORRETAGEM, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Parceria de Corretagem.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Parceria de Corretagem, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'familia_pessoal';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Namoro',
    'contrato-de-namoro',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE NAMORO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE NAMORO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Namoro.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Namoro, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'imobiliario_aluguel';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato Sublocação de Espaço para Manicure',
    'contrato-sublocacao-de-espaco-para-manicure',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO SUBLOCAÇÃO DE ESPAÇO PARA MANICURE\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO SUBLOCAÇÃO DE ESPAÇO PARA MANICURE, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato Sublocação de Espaço para Manicure.',
    'Garanta segurança jurídica com nosso modelo de Contrato Sublocação de Espaço para Manicure, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'empresarial_parcerias';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Licenciamento e Cessão de Propriedade Intelectual',
    'contrato-de-licenciamento-e-cessao-de-propriedade-intelectual',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE LICENCIAMENTO E CESSÃO DE PROPRIEDADE INTELECTUAL\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE LICENCIAMENTO E CESSÃO DE PROPRIEDADE INTELECTUAL, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Licenciamento e Cessão de Propriedade Intelectual.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Licenciamento e Cessão de Propriedade Intelectual, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'empresarial_parcerias';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Representante Comercial',
    'contrato-de-representante-comercial',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE REPRESENTANTE COMERCIAL\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE REPRESENTANTE COMERCIAL, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Representante Comercial.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Representante Comercial, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'servicos_profissional';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Prestação de Serviço de Cuidador de Idoso ou Enfermeiro Particular (Home Care)',
    'contrato-de-prestacao-de-servico-de-cuidador-de-idoso-ou-enfermeiro-particular-home-care',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE PRESTAÇÃO DE SERVIÇO DE CUIDADOR DE IDOSO OU ENFERMEIRO PARTICULAR (HOME CARE)\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PRESTAÇÃO DE SERVIÇO DE CUIDADOR DE IDOSO OU ENFERMEIRO PARTICULAR (HOME CARE), mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Prestação de Serviço de Cuidador de Idoso ou Enfermeiro Particular (Home Care).',
    'Garanta segurança jurídica com nosso modelo de Contrato de Prestação de Serviço de Cuidador de Idoso ou Enfermeiro Particular (Home Care), revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'servicos_profissional';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Prestação de Serviços de Transporte Escolar',
    'contrato-de-prestacao-de-servicos-de-transporte-escolar',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE PRESTAÇÃO DE SERVIÇOS DE TRANSPORTE ESCOLAR\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PRESTAÇÃO DE SERVIÇOS DE TRANSPORTE ESCOLAR, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Prestação de Serviços de Transporte Escolar.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Prestação de Serviços de Transporte Escolar, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'docs_rapidos';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato ou Termo de Adesão',
    'contrato-ou-termo-de-adesao',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO OU TERMO DE ADESÃO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO OU TERMO DE ADESÃO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato ou Termo de Adesão.',
    'Garanta segurança jurídica com nosso modelo de Contrato ou Termo de Adesão, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'empresarial_parcerias';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Cessão de Direito de Uso Software',
    'contrato-de-cessao-de-direito-de-uso-software',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE CESSÃO DE DIREITO DE USO SOFTWARE\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE CESSÃO DE DIREITO DE USO SOFTWARE, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Cessão de Direito de Uso Software.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Cessão de Direito de Uso Software, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'servicos_profissional';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Prestação de Serviço de Suporte Técnico de Software',
    'contrato-de-prestacao-de-servico-de-suporte-tecnico-de-software',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE PRESTAÇÃO DE SERVIÇO DE SUPORTE TÉCNICO DE SOFTWARE\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PRESTAÇÃO DE SERVIÇO DE SUPORTE TÉCNICO DE SOFTWARE, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Prestação de Serviço de Suporte Técnico de Software.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Prestação de Serviço de Suporte Técnico de Software, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'docs_rapidos';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Desenvolvimento de Software',
    'contrato-de-desenvolvimento-de-software',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE DESENVOLVIMENTO DE SOFTWARE\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE DESENVOLVIMENTO DE SOFTWARE, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Desenvolvimento de Software.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Desenvolvimento de Software, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'docs_rapidos';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Licença de Software',
    'contrato-de-licenca-de-software',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE LICENÇA DE SOFTWARE\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE LICENÇA DE SOFTWARE, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Licença de Software.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Licença de Software, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'servicos_profissional';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Prestação de Serviços de Freelancer',
    'contrato-de-prestacao-de-servicos-de-freelancer',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE PRESTAÇÃO DE SERVIÇOS DE FREELANCER\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PRESTAÇÃO DE SERVIÇOS DE FREELANCER, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Prestação de Serviços de Freelancer.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Prestação de Serviços de Freelancer, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'servicos_profissional';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Prestação de Serviços de Personal Trainer',
    'contrato-de-prestacao-de-servicos-de-personal-trainer',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE PRESTAÇÃO DE SERVIÇOS DE PERSONAL TRAINER\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PRESTAÇÃO DE SERVIÇOS DE PERSONAL TRAINER, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Prestação de Serviços de Personal Trainer.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Prestação de Serviços de Personal Trainer, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'empresarial_parcerias';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Compra e Venda de Aplicativo APPs',
    'contrato-de-compra-e-venda-de-aplicativo-apps',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE COMPRA E VENDA DE APLICATIVO APPS\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE COMPRA E VENDA DE APLICATIVO APPS, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Compra e Venda de Aplicativo APPs.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Compra e Venda de Aplicativo APPs, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'trabalhista';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Estágio',
    'contrato-de-estagio',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE ESTÁGIO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE ESTÁGIO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Estágio.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Estágio, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'docs_rapidos';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Síndico Profissional',
    'contrato-de-sindico-profissional',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE SÍNDICO PROFISSIONAL\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE SÍNDICO PROFISSIONAL, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Síndico Profissional.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Síndico Profissional, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'imobiliario_aluguel';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Convenção de Condomínio',
    'convencao-de-condominio',
    cat_id,
    29.90,
    'CONTRATO DE CONVENÇÃO DE CONDOMÍNIO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONVENÇÃO DE CONDOMÍNIO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Convenção de Condomínio.',
    'Garanta segurança jurídica com nosso modelo de Convenção de Condomínio, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'docs_rapidos';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Troca de Bens',
    'contrato-de-troca-de-bens',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE TROCA DE BENS\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE TROCA DE BENS, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Troca de Bens.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Troca de Bens, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'servicos_profissional';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Prestação de Serviços de Atleta (Trabalho Desportivo)',
    'contrato-de-prestacao-de-servicos-de-atleta-trabalho-desportivo',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE PRESTAÇÃO DE SERVIÇOS DE ATLETA (TRABALHO DESPORTIVO)\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PRESTAÇÃO DE SERVIÇOS DE ATLETA (TRABALHO DESPORTIVO), mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Prestação de Serviços de Atleta (Trabalho Desportivo).',
    'Garanta segurança jurídica com nosso modelo de Contrato de Prestação de Serviços de Atleta (Trabalho Desportivo), revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'empresarial_parcerias';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Comissão de Vendas ou Mercantil',
    'contrato-de-comissao-de-vendas-ou-mercantil',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE COMISSÃO DE VENDAS OU MERCANTIL\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE COMISSÃO DE VENDAS OU MERCANTIL, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Comissão de Vendas ou Mercantil.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Comissão de Vendas ou Mercantil, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'empresarial_parcerias';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Comissão de Formatura',
    'contrato-de-comissao-de-formatura',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE COMISSÃO DE FORMATURA\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE COMISSÃO DE FORMATURA, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Comissão de Formatura.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Comissão de Formatura, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'empresarial_parcerias';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Atos Constitutivos de EIRELI',
    'contrato-de-atos-constitutivos-de-eireli',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE ATOS CONSTITUTIVOS DE EIRELI\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE ATOS CONSTITUTIVOS DE EIRELI, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Atos Constitutivos de EIRELI.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Atos Constitutivos de EIRELI, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'servicos_profissional';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Consultoria',
    'contrato-de-consultoria',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE CONSULTORIA\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE CONSULTORIA, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Consultoria.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Consultoria, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'empresarial_parcerias';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Cessão de Crédito',
    'contrato-de-cessao-de-credito',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE CESSÃO DE CRÉDITO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE CESSÃO DE CRÉDITO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Cessão de Crédito.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Cessão de Crédito, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'empresarial_parcerias';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Comissão de Corretagem',
    'contrato-de-comissao-de-corretagem',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE COMISSÃO DE CORRETAGEM\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE COMISSÃO DE CORRETAGEM, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Comissão de Corretagem.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Comissão de Corretagem, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'trabalhista';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Trabalho Horista',
    'contrato-de-trabalho-horista',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE TRABALHO HORISTA\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE TRABALHO HORISTA, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Trabalho Horista.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Trabalho Horista, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'docs_rapidos';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Troca de Bens',
    'contrato-de-troca-de-bens',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE TROCA DE BENS\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE TROCA DE BENS, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Troca de Bens.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Troca de Bens, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'servicos_profissional';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Carta de Cobrança',
    'carta-de-cobranca',
    cat_id,
    29.90,
    'CONTRATO DE CARTA DE COBRANÇA\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CARTA DE COBRANÇA, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Carta de Cobrança.',
    'Garanta segurança jurídica com nosso modelo de Carta de Cobrança, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'servicos_profissional';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Prestação de Serviços para Campanhas Eleitorais',
    'contrato-de-prestacao-de-servicos-para-campanhas-eleitorais',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE PRESTAÇÃO DE SERVIÇOS PARA CAMPANHAS ELEITORAIS\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PRESTAÇÃO DE SERVIÇOS PARA CAMPANHAS ELEITORAIS, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Prestação de Serviços para Campanhas Eleitorais.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Prestação de Serviços para Campanhas Eleitorais, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'familia_pessoal';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Doação para Campanha Eleitoral',
    'contrato-de-doacao-para-campanha-eleitoral',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE DOAÇÃO PARA CAMPANHA ELEITORAL\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE DOAÇÃO PARA CAMPANHA ELEITORAL, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Doação para Campanha Eleitoral.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Doação para Campanha Eleitoral, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'imobiliario_aluguel';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Locação de Imóvel para Comitê Eleitoral',
    'contrato-de-locacao-de-imovel-para-comite-eleitoral',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE LOCAÇÃO DE IMÓVEL PARA COMITÊ ELEITORAL\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE LOCAÇÃO DE IMÓVEL PARA COMITÊ ELEITORAL, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Locação de Imóvel para Comitê Eleitoral.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Locação de Imóvel para Comitê Eleitoral, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'docs_rapidos';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Cooperativa',
    'contrato-de-cooperativa',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE COOPERATIVA\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE COOPERATIVA, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Cooperativa.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Cooperativa, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'docs_rapidos';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Renúncia de Bens',
    'contrato-de-renuncia-de-bens',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE RENÚNCIA DE BENS\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE RENÚNCIA DE BENS, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Renúncia de Bens.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Renúncia de Bens, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'docs_rapidos';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Gestão',
    'contrato-de-gestao',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE GESTÃO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE GESTÃO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Gestão.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Gestão, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'docs_rapidos';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Aditivo Contratual',
    'aditivo-contratual',
    cat_id,
    29.90,
    'CONTRATO DE ADITIVO CONTRATUAL\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente ADITIVO CONTRATUAL, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Aditivo Contratual.',
    'Garanta segurança jurídica com nosso modelo de Aditivo Contratual, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'imobiliario_aluguel';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Regimento Interno Condomínio',
    'regimento-interno-condominio',
    cat_id,
    29.90,
    'CONTRATO DE REGIMENTO INTERNO CONDOMÍNIO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente REGIMENTO INTERNO CONDOMÍNIO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Regimento Interno Condomínio.',
    'Garanta segurança jurídica com nosso modelo de Regimento Interno Condomínio, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'empresarial_parcerias';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Venda em Consignação de Mercadorias',
    'contrato-de-venda-em-consignacao-de-mercadorias',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE VENDA EM CONSIGNAÇÃO DE MERCADORIAS\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE VENDA EM CONSIGNAÇÃO DE MERCADORIAS, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Venda em Consignação de Mercadorias.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Venda em Consignação de Mercadorias, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'servicos_profissional';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Prestação de Serviços de Transporte',
    'contrato-de-prestacao-de-servicos-de-transporte',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE PRESTAÇÃO DE SERVIÇOS DE TRANSPORTE\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PRESTAÇÃO DE SERVIÇOS DE TRANSPORTE, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Prestação de Serviços de Transporte.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Prestação de Serviços de Transporte, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'docs_rapidos';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Armazenagem de Mercadorias',
    'contrato-de-armazenagem-de-mercadorias',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE ARMAZENAGEM DE MERCADORIAS\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE ARMAZENAGEM DE MERCADORIAS, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Armazenagem de Mercadorias.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Armazenagem de Mercadorias, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'docs_rapidos';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Comissionamento de Intermediação de Negócios',
    'contrato-de-comissionamento-de-intermediacao-de-negocios',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE COMISSIONAMENTO DE INTERMEDIAÇÃO DE NEGÓCIOS\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE COMISSIONAMENTO DE INTERMEDIAÇÃO DE NEGÓCIOS, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Comissionamento de Intermediação de Negócios.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Comissionamento de Intermediação de Negócios, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'imobiliario_aluguel';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Locação de Veículo para Campanha Eleitoral',
    'contrato-de-locacao-de-veiculo-para-campanha-eleitoral',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE LOCAÇÃO DE VEÍCULO PARA CAMPANHA ELEITORAL\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE LOCAÇÃO DE VEÍCULO PARA CAMPANHA ELEITORAL, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Locação de Veículo para Campanha Eleitoral.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Locação de Veículo para Campanha Eleitoral, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'imobiliario_aluguel';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Locação para Terra Rural',
    'contrato-de-locacao-para-terra-rural',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE LOCAÇÃO PARA TERRA RURAL\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE LOCAÇÃO PARA TERRA RURAL, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Locação para Terra Rural.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Locação para Terra Rural, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'imobiliario_aluguel';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Comodato de Imóvel Rural',
    'contrato-de-comodato-de-imovel-rural',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE COMODATO DE IMÓVEL RURAL\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE COMODATO DE IMÓVEL RURAL, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Comodato de Imóvel Rural.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Comodato de Imóvel Rural, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'empresarial_parcerias';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Arrendamento Rural para Gado e Pecuária',
    'contrato-de-arrendamento-rural-para-gado-e-pecuaria',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE ARRENDAMENTO RURAL PARA GADO E PECUÁRIA\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE ARRENDAMENTO RURAL PARA GADO E PECUÁRIA, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Arrendamento Rural para Gado e Pecuária.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Arrendamento Rural para Gado e Pecuária, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'agronegocio';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Meeiro Rural',
    'contrato-de-meeiro-rural',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE MEEIRO RURAL\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE MEEIRO RURAL, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Meeiro Rural.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Meeiro Rural, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'empresarial_parcerias';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Parceria Pecuária de Gado',
    'contrato-de-parceria-pecuaria-de-gado',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE PARCERIA PECUÁRIA DE GADO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PARCERIA PECUÁRIA DE GADO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Parceria Pecuária de Gado.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Parceria Pecuária de Gado, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'agronegocio';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Empreitada Rural',
    'contrato-de-empreitada-rural',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE EMPREITADA RURAL\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE EMPREITADA RURAL, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Empreitada Rural.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Empreitada Rural, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'agronegocio';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Pastoreio Rural',
    'contrato-de-pastoreio-rural',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE PASTOREIO RURAL\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PASTOREIO RURAL, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Pastoreio Rural.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Pastoreio Rural, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'servicos_profissional';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato Trabalho Diarista Rural',
    'contrato-trabalho-diarista-rural',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO TRABALHO DIARISTA RURAL\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO TRABALHO DIARISTA RURAL, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato Trabalho Diarista Rural.',
    'Garanta segurança jurídica com nosso modelo de Contrato Trabalho Diarista Rural, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'empresarial_parcerias';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Cessão de Exploração',
    'contrato-de-cessao-de-exploracao',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE CESSÃO DE EXPLORAÇÃO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE CESSÃO DE EXPLORAÇÃO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Cessão de Exploração.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Cessão de Exploração, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'empresarial_parcerias';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Compra e Venda de Materiais de Construção',
    'compra-e-venda-de-materiais-de-construcao',
    cat_id,
    29.90,
    'CONTRATO DE COMPRA E VENDA DE MATERIAIS DE CONSTRUÇÃO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente COMPRA E VENDA DE MATERIAIS DE CONSTRUÇÃO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Compra e Venda de Materiais de Construção.',
    'Garanta segurança jurídica com nosso modelo de Compra e Venda de Materiais de Construção, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'servicos_profissional';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Prestação de Serviço de Engenharia',
    'contrato-de-prestacao-de-servico-de-engenharia',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE PRESTAÇÃO DE SERVIÇO DE ENGENHARIA\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PRESTAÇÃO DE SERVIÇO DE ENGENHARIA, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Prestação de Serviço de Engenharia.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Prestação de Serviço de Engenharia, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'trabalhista';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Trabalho Individual de Experiência Empregada Doméstica',
    'contrato-de-trabalho-individual-de-experiencia-empregada-domestica',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE TRABALHO INDIVIDUAL DE EXPERIÊNCIA EMPREGADA DOMÉSTICA\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE TRABALHO INDIVIDUAL DE EXPERIÊNCIA EMPREGADA DOMÉSTICA, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Trabalho Individual de Experiência Empregada Doméstica.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Trabalho Individual de Experiência Empregada Doméstica, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'docs_rapidos';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Modelo de Substabelecimento de Procuração',
    'modelo-de-substabelecimento-de-procuracao',
    cat_id,
    29.90,
    'CONTRATO DE MODELO DE SUBSTABELECIMENTO DE PROCURAÇÃO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente MODELO DE SUBSTABELECIMENTO DE PROCURAÇÃO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Modelo de Substabelecimento de Procuração.',
    'Garanta segurança jurídica com nosso modelo de Modelo de Substabelecimento de Procuração, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'docs_rapidos';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Mútuo Financeiro',
    'contrato-de-mutuo-financeiro',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE MÚTUO FINANCEIRO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE MÚTUO FINANCEIRO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Mútuo Financeiro.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Mútuo Financeiro, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'familia_pessoal';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de doação de sêmen',
    'contrato-de-doacao-de-semen',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE DOAÇÃO DE SÊMEN\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE DOAÇÃO DE SÊMEN, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de doação de sêmen.',
    'Garanta segurança jurídica com nosso modelo de Contrato de doação de sêmen, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'empresarial_parcerias';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Venda em Consignação',
    'contrato-de-venda-em-consignacao',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE VENDA EM CONSIGNAÇÃO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE VENDA EM CONSIGNAÇÃO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Venda em Consignação.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Venda em Consignação, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'empresarial_parcerias';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Agenciamento',
    'contrato-de-agenciamento',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE AGENCIAMENTO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE AGENCIAMENTO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Agenciamento.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Agenciamento, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'empresarial_parcerias';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Patrocínio Simples',
    'contrato-de-patrocinio-simples',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE PATROCÍNIO SIMPLES\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PATROCÍNIO SIMPLES, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Patrocínio Simples.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Patrocínio Simples, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'trabalhista';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Trabalho Cargo de Confiança',
    'contrato-de-trabalho-cargo-de-confianca',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE TRABALHO CARGO DE CONFIANÇA\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE TRABALHO CARGO DE CONFIANÇA, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Trabalho Cargo de Confiança.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Trabalho Cargo de Confiança, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'empresarial_parcerias';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Parceria de Trabalho',
    'contrato-de-parceria-de-trabalho',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE PARCERIA DE TRABALHO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PARCERIA DE TRABALHO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Parceria de Trabalho.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Parceria de Trabalho, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'trabalhista';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Trabalho Voluntário',
    'contrato-de-trabalho-voluntario',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE TRABALHO VOLUNTÁRIO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE TRABALHO VOLUNTÁRIO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Trabalho Voluntário.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Trabalho Voluntário, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'servicos_profissional';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Prestação de Serviços de Formatura',
    'contrato-de-prestacao-de-servicos-de-formatura',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE PRESTAÇÃO DE SERVIÇOS DE FORMATURA\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PRESTAÇÃO DE SERVIÇOS DE FORMATURA, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Prestação de Serviços de Formatura.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Prestação de Serviços de Formatura, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'empresarial_parcerias';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Convênio Empresarial',
    'contrato-de-convenio-empresarial',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE CONVÊNIO EMPRESARIAL\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE CONVÊNIO EMPRESARIAL, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Convênio Empresarial.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Convênio Empresarial, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'empresarial_parcerias';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato Joint Venture',
    'contrato-joint-venture',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO JOINT VENTURE\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO JOINT VENTURE, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato Joint Venture.',
    'Garanta segurança jurídica com nosso modelo de Contrato Joint Venture, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'veiculos_maquinas';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de transferência de dívidas de veículos',
    'contrato-de-transferencia-de-dividas-de-veiculos',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE TRANSFERÊNCIA DE DÍVIDAS DE VEÍCULOS\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE TRANSFERÊNCIA DE DÍVIDAS DE VEÍCULOS, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de transferência de dívidas de veículos.',
    'Garanta segurança jurídica com nosso modelo de Contrato de transferência de dívidas de veículos, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'familia_pessoal';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Inventário Negativo',
    'inventario-negativo',
    cat_id,
    29.90,
    'CONTRATO DE INVENTÁRIO NEGATIVO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente INVENTÁRIO NEGATIVO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Inventário Negativo.',
    'Garanta segurança jurídica com nosso modelo de Inventário Negativo, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'docs_rapidos';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Termo de Responsabilidade',
    'termo-de-responsabilidade',
    cat_id,
    29.90,
    'CONTRATO DE TERMO DE RESPONSABILIDADE\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente TERMO DE RESPONSABILIDADE, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Termo de Responsabilidade.',
    'Garanta segurança jurídica com nosso modelo de Termo de Responsabilidade, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'trabalhista';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Termo de Compromisso de Estágio',
    'termo-de-compromisso-de-estagio',
    cat_id,
    29.90,
    'CONTRATO DE TERMO DE COMPROMISSO DE ESTÁGIO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente TERMO DE COMPROMISSO DE ESTÁGIO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Termo de Compromisso de Estágio.',
    'Garanta segurança jurídica com nosso modelo de Termo de Compromisso de Estágio, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'docs_rapidos';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Termo de Quitação',
    'termo-de-quitacao',
    cat_id,
    29.90,
    'CONTRATO DE TERMO DE QUITAÇÃO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente TERMO DE QUITAÇÃO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Termo de Quitação.',
    'Garanta segurança jurídica com nosso modelo de Termo de Quitação, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'docs_rapidos';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Termo de Acordo',
    'termo-de-acordo',
    cat_id,
    29.90,
    'CONTRATO DE TERMO DE ACORDO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente TERMO DE ACORDO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Termo de Acordo.',
    'Garanta segurança jurídica com nosso modelo de Termo de Acordo, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'docs_rapidos';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Termo de Entrega',
    'termo-de-entrega',
    cat_id,
    29.90,
    'CONTRATO DE TERMO DE ENTREGA\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente TERMO DE ENTREGA, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Termo de Entrega.',
    'Garanta segurança jurídica com nosso modelo de Termo de Entrega, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'docs_rapidos';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Termo de Consentimento',
    'termo-de-consentimento',
    cat_id,
    29.90,
    'CONTRATO DE TERMO DE CONSENTIMENTO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente TERMO DE CONSENTIMENTO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Termo de Consentimento.',
    'Garanta segurança jurídica com nosso modelo de Termo de Consentimento, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'servicos_profissional';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Manutenção Industrial',
    'contrato-de-manutencao-industrial',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE MANUTENÇÃO INDUSTRIAL\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE MANUTENÇÃO INDUSTRIAL, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Manutenção Industrial.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Manutenção Industrial, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'veiculos_maquinas';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Comodato de Equipamento',
    'contrato-de-comodato-de-equipamento',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE COMODATO DE EQUIPAMENTO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE COMODATO DE EQUIPAMENTO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Comodato de Equipamento.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Comodato de Equipamento, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'empresarial_parcerias';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Arrendamento Industrial',
    'contrato-de-arrendamento-industrial',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE ARRENDAMENTO INDUSTRIAL\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE ARRENDAMENTO INDUSTRIAL, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Arrendamento Industrial.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Arrendamento Industrial, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'servicos_profissional';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Prestação de Serviços de Montagem Industrial',
    'contrato-de-prestacao-de-servicos-de-montagem-industrial',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE PRESTAÇÃO DE SERVIÇOS DE MONTAGEM INDUSTRIAL\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PRESTAÇÃO DE SERVIÇOS DE MONTAGEM INDUSTRIAL, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Prestação de Serviços de Montagem Industrial.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Prestação de Serviços de Montagem Industrial, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'imobiliario_aluguel';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Locação/Aluguel de Galpão Industrial',
    'contrato-de-locacao-aluguel-de-galpao-industrial',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE LOCAÇÃO/ALUGUEL DE GALPÃO INDUSTRIAL\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE LOCAÇÃO/ALUGUEL DE GALPÃO INDUSTRIAL, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Locação/Aluguel de Galpão Industrial.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Locação/Aluguel de Galpão Industrial, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'servicos_profissional';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Prestação de Serviços de AutoEscola',
    'contrato-de-prestacao-de-servicos-de-autoescola',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE PRESTAÇÃO DE SERVIÇOS DE AUTOESCOLA\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PRESTAÇÃO DE SERVIÇOS DE AUTOESCOLA, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Prestação de Serviços de AutoEscola.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Prestação de Serviços de AutoEscola, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'docs_rapidos';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Sigilo Industrial',
    'contrato-de-sigilo-industrial',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE SIGILO INDUSTRIAL\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE SIGILO INDUSTRIAL, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Sigilo Industrial.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Sigilo Industrial, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'imobiliario_aluguel';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Locação/Aluguel de Máquinas Industriais',
    'contrato-de-locacao-aluguel-de-maquinas-industriais',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE LOCAÇÃO/ALUGUEL DE MÁQUINAS INDUSTRIAIS\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE LOCAÇÃO/ALUGUEL DE MÁQUINAS INDUSTRIAIS, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Locação/Aluguel de Máquinas Industriais.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Locação/Aluguel de Máquinas Industriais, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'servicos_profissional';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Prestação de Serviços Escolares',
    'contrato-de-prestacao-de-servicos-escolares',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE PRESTAÇÃO DE SERVIÇOS ESCOLARES\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PRESTAÇÃO DE SERVIÇOS ESCOLARES, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Prestação de Serviços Escolares.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Prestação de Serviços Escolares, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'empresarial_parcerias';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Arrendamento Rural Para Plantio de Soja',
    'contrato-de-arrendamento-rural-para-plantio-de-soja',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE ARRENDAMENTO RURAL PARA PLANTIO DE SOJA\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE ARRENDAMENTO RURAL PARA PLANTIO DE SOJA, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Arrendamento Rural Para Plantio de Soja.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Arrendamento Rural Para Plantio de Soja, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'trabalhista';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Trabalho por prazo Indeterminado',
    'contrato-de-trabalho-por-prazo-indeterminado',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE TRABALHO POR PRAZO INDETERMINADO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE TRABALHO POR PRAZO INDETERMINADO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Trabalho por prazo Indeterminado.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Trabalho por prazo Indeterminado, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'servicos_profissional';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Prestação de Serviços de Reforço Escolar ou Monitoria',
    'contrato-de-prestacao-de-servicos-de-reforco-escolar-ou-monitoria',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE PRESTAÇÃO DE SERVIÇOS DE REFORÇO ESCOLAR OU MONITORIA\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PRESTAÇÃO DE SERVIÇOS DE REFORÇO ESCOLAR OU MONITORIA, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Prestação de Serviços de Reforço Escolar ou Monitoria.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Prestação de Serviços de Reforço Escolar ou Monitoria, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'docs_rapidos';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Comodato de Impressora',
    'contrato-de-comodato-de-impressora',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE COMODATO DE IMPRESSORA\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE COMODATO DE IMPRESSORA, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Comodato de Impressora.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Comodato de Impressora, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'servicos_profissional';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Prestação de Serviços de Bombeiro Civil',
    'contrato-de-prestacao-de-servicos-de-bombeiro-civil',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE PRESTAÇÃO DE SERVIÇOS DE BOMBEIRO CIVIL\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PRESTAÇÃO DE SERVIÇOS DE BOMBEIRO CIVIL, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Prestação de Serviços de Bombeiro Civil.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Prestação de Serviços de Bombeiro Civil, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'servicos_profissional';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Prestação de Serviços de Gestor de Tráfego',
    'contrato-de-prestacao-de-servicos-de-gestor-de-trafego',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE PRESTAÇÃO DE SERVIÇOS DE GESTOR DE TRÁFEGO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PRESTAÇÃO DE SERVIÇOS DE GESTOR DE TRÁFEGO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Prestação de Serviços de Gestor de Tráfego.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Prestação de Serviços de Gestor de Tráfego, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'veiculos_maquinas';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Compra e Venda de Caminhão',
    'contrato-de-compra-e-venda-de-caminhao',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE COMPRA E VENDA DE CAMINHÃO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE COMPRA E VENDA DE CAMINHÃO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Compra e Venda de Caminhão.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Compra e Venda de Caminhão, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'empresarial_parcerias';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Compra e Venda de Academia de Ginástica e Musculação',
    'contrato-de-compra-e-venda-de-academia-de-ginastica-e-musculacao',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE COMPRA E VENDA DE ACADEMIA DE GINÁSTICA E MUSCULAÇÃO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE COMPRA E VENDA DE ACADEMIA DE GINÁSTICA E MUSCULAÇÃO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Compra e Venda de Academia de Ginástica e Musculação.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Compra e Venda de Academia de Ginástica e Musculação, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'empresarial_parcerias';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Compra e Venda de Roupas',
    'contrato-de-compra-e-venda-de-roupas',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE COMPRA E VENDA DE ROUPAS\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE COMPRA E VENDA DE ROUPAS, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Compra e Venda de Roupas.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Compra e Venda de Roupas, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'empresarial_parcerias';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Compra e Venda de Trailer de Lanches',
    'contrato-de-compra-e-venda-de-trailer-de-lanches',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE COMPRA E VENDA DE TRAILER DE LANCHES\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE COMPRA E VENDA DE TRAILER DE LANCHES, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Compra e Venda de Trailer de Lanches.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Compra e Venda de Trailer de Lanches, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'imobiliario_aluguel';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Prestação de Serviços de Decoração de Casamento',
    'contrato-de-prestacao-de-servicos-de-decoracao-de-casamento',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE PRESTAÇÃO DE SERVIÇOS DE DECORAÇÃO DE CASAMENTO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PRESTAÇÃO DE SERVIÇOS DE DECORAÇÃO DE CASAMENTO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Prestação de Serviços de Decoração de Casamento.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Prestação de Serviços de Decoração de Casamento, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'servicos_profissional';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Prestação de Serviços Buffet',
    'contrato-de-prestacao-de-servicos-buffet',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE PRESTAÇÃO DE SERVIÇOS BUFFET\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PRESTAÇÃO DE SERVIÇOS BUFFET, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Prestação de Serviços Buffet.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Prestação de Serviços Buffet, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'imobiliario_aluguel';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Compra e Venda de Imóvel Inventariado',
    'contrato-de-compra-e-venda-de-imovel-inventariado',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE COMPRA E VENDA DE IMÓVEL INVENTARIADO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE COMPRA E VENDA DE IMÓVEL INVENTARIADO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Compra e Venda de Imóvel Inventariado.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Compra e Venda de Imóvel Inventariado, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'imobiliario_aluguel';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Compra e Venda de Imóvel de Herdeiros',
    'contrato-de-compra-e-venda-de-imovel-de-herdeiros',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE COMPRA E VENDA DE IMÓVEL DE HERDEIROS\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE COMPRA E VENDA DE IMÓVEL DE HERDEIROS, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Compra e Venda de Imóvel de Herdeiros.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Compra e Venda de Imóvel de Herdeiros, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'veiculos_maquinas';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Compra e Venda de Lancha',
    'contrato-de-compra-e-venda-de-lancha',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE COMPRA E VENDA DE LANCHA\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE COMPRA E VENDA DE LANCHA, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Compra e Venda de Lancha.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Compra e Venda de Lancha, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'servicos_profissional';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Prestação de Serviços de Decoração para Eventos',
    'contrato-de-prestacao-de-servicos-de-decoracao-para-eventos',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE PRESTAÇÃO DE SERVIÇOS DE DECORAÇÃO PARA EVENTOS\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PRESTAÇÃO DE SERVIÇOS DE DECORAÇÃO PARA EVENTOS, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Prestação de Serviços de Decoração para Eventos.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Prestação de Serviços de Decoração para Eventos, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'servicos_profissional';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Prestação de Serviços para Atendimento Psicológico',
    'contrato-de-prestacao-de-servicos-para-atendimento-psicologico',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE PRESTAÇÃO DE SERVIÇOS PARA ATENDIMENTO PSICOLÓGICO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PRESTAÇÃO DE SERVIÇOS PARA ATENDIMENTO PSICOLÓGICO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Prestação de Serviços para Atendimento Psicológico.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Prestação de Serviços para Atendimento Psicológico, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'servicos_profissional';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Prestação de Serviços de Beleza ou Salão de Beleza',
    'contrato-de-prestacao-de-servicos-de-beleza-ou-salao-de-beleza',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE PRESTAÇÃO DE SERVIÇOS DE BELEZA OU SALÃO DE BELEZA\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PRESTAÇÃO DE SERVIÇOS DE BELEZA OU SALÃO DE BELEZA, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Prestação de Serviços de Beleza ou Salão de Beleza.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Prestação de Serviços de Beleza ou Salão de Beleza, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'servicos_profissional';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Prestação de Serviços Academia e Professor',
    'contrato-de-prestacao-de-servicos-academia-e-professor',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE PRESTAÇÃO DE SERVIÇOS ACADEMIA E PROFESSOR\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PRESTAÇÃO DE SERVIÇOS ACADEMIA E PROFESSOR, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Prestação de Serviços Academia e Professor.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Prestação de Serviços Academia e Professor, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'servicos_profissional';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Prestação de Serviço de Curso',
    'contrato-de-prestacao-de-servico-de-curso',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE PRESTAÇÃO DE SERVIÇO DE CURSO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PRESTAÇÃO DE SERVIÇO DE CURSO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Prestação de Serviço de Curso.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Prestação de Serviço de Curso, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'empresarial_parcerias';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Compra e Venda de Animais',
    'contrato-de-compra-e-venda-de-animais',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE COMPRA E VENDA DE ANIMAIS\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE COMPRA E VENDA DE ANIMAIS, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Compra e Venda de Animais.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Compra e Venda de Animais, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'imobiliario_aluguel';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Compra e Venda de Imóvel Rural',
    'contrato-de-compra-e-venda-de-imovel-rural',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE COMPRA E VENDA DE IMÓVEL RURAL\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE COMPRA E VENDA DE IMÓVEL RURAL, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Compra e Venda de Imóvel Rural.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Compra e Venda de Imóvel Rural, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'servicos_profissional';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Prestação de Serviço de Estacionamento Rotativo',
    'contrato-de-prestacao-de-servico-de-estacionamento-rotativo',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE PRESTAÇÃO DE SERVIÇO DE ESTACIONAMENTO ROTATIVO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PRESTAÇÃO DE SERVIÇO DE ESTACIONAMENTO ROTATIVO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Prestação de Serviço de Estacionamento Rotativo.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Prestação de Serviço de Estacionamento Rotativo, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'imobiliario_aluguel';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Aluguel de Brinquedos para Festa Infantil',
    'contrato-de-aluguel-de-brinquedos-para-festa-infantil',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE ALUGUEL DE BRINQUEDOS PARA FESTA INFANTIL\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE ALUGUEL DE BRINQUEDOS PARA FESTA INFANTIL, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Aluguel de Brinquedos para Festa Infantil.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Aluguel de Brinquedos para Festa Infantil, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'servicos_profissional';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Prestação de Serviços de Zelador de Igreja',
    'contrato-de-prestacao-de-servicos-de-zelador-de-igreja',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE PRESTAÇÃO DE SERVIÇOS DE ZELADOR DE IGREJA\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PRESTAÇÃO DE SERVIÇOS DE ZELADOR DE IGREJA, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Prestação de Serviços de Zelador de Igreja.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Prestação de Serviços de Zelador de Igreja, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'servicos_profissional';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Prestação de Serviços de Programação',
    'contrato-de-prestacao-de-servicos-de-programacao',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE PRESTAÇÃO DE SERVIÇOS DE PROGRAMAÇÃO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PRESTAÇÃO DE SERVIÇOS DE PROGRAMAÇÃO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Prestação de Serviços de Programação.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Prestação de Serviços de Programação, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'servicos_profissional';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Prestação de Serviço Pacote Mensal para Manicure',
    'contrato-de-prestacao-de-servico-pacote-mensal-para-manicure',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE PRESTAÇÃO DE SERVIÇO PACOTE MENSAL PARA MANICURE\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PRESTAÇÃO DE SERVIÇO PACOTE MENSAL PARA MANICURE, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Prestação de Serviço Pacote Mensal para Manicure.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Prestação de Serviço Pacote Mensal para Manicure, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'servicos_profissional';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Prestação de Serviços de Microempreendedor Individual (MEI)',
    'contrato-de-prestacao-de-servicos-de-microempreendedor-individual-mei',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE PRESTAÇÃO DE SERVIÇOS DE MICROEMPREENDEDOR INDIVIDUAL (MEI)\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PRESTAÇÃO DE SERVIÇOS DE MICROEMPREENDEDOR INDIVIDUAL (MEI), mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Prestação de Serviços de Microempreendedor Individual (MEI).',
    'Garanta segurança jurídica com nosso modelo de Contrato de Prestação de Serviços de Microempreendedor Individual (MEI), revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'servicos_profissional';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Prestação de Serviços Food Truck',
    'contrato-de-prestacao-de-servicos-food-truck',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE PRESTAÇÃO DE SERVIÇOS FOOD TRUCK\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PRESTAÇÃO DE SERVIÇOS FOOD TRUCK, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Prestação de Serviços Food Truck.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Prestação de Serviços Food Truck, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'imobiliario_aluguel';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Aluguel de Quarto por Temporada',
    'contrato-de-aluguel-de-quarto-por-temporada',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE ALUGUEL DE QUARTO POR TEMPORADA\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE ALUGUEL DE QUARTO POR TEMPORADA, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Aluguel de Quarto por Temporada.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Aluguel de Quarto por Temporada, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'servicos_profissional';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Prestação de Serviços de Segurança',
    'contrato-de-prestacao-de-servicos-de-seguranca',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE PRESTAÇÃO DE SERVIÇOS DE SEGURANÇA\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PRESTAÇÃO DE SERVIÇOS DE SEGURANÇA, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Prestação de Serviços de Segurança.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Prestação de Serviços de Segurança, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'servicos_profissional';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Prestação de Serviços Publicitários',
    'contrato-de-prestacao-de-servicos-publicitarios',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE PRESTAÇÃO DE SERVIÇOS PUBLICITÁRIOS\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PRESTAÇÃO DE SERVIÇOS PUBLICITÁRIOS, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Prestação de Serviços Publicitários.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Prestação de Serviços Publicitários, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'imobiliario_aluguel';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Aluguel de Consultório Odontológico',
    'contrato-de-aluguel-de-consultorio-odontologico',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE ALUGUEL DE CONSULTÓRIO ODONTOLÓGICO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE ALUGUEL DE CONSULTÓRIO ODONTOLÓGICO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Aluguel de Consultório Odontológico.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Aluguel de Consultório Odontológico, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'empresarial_parcerias';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Parceria com Blogueira',
    'contrato-de-parceria-com-blogueira',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE PARCERIA COM BLOGUEIRA\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PARCERIA COM BLOGUEIRA, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Parceria com Blogueira.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Parceria com Blogueira, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'servicos_profissional';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Prestação de Serviços para Produção de Vídeo Publicitário',
    'contrato-de-prestacao-de-servicos-para-producao-de-video-publicitario',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE PRESTAÇÃO DE SERVIÇOS PARA PRODUÇÃO DE VÍDEO PUBLICITÁRIO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PRESTAÇÃO DE SERVIÇOS PARA PRODUÇÃO DE VÍDEO PUBLICITÁRIO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Prestação de Serviços para Produção de Vídeo Publicitário.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Prestação de Serviços para Produção de Vídeo Publicitário, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'servicos_profissional';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Prestação de Serviços para Confecção e Fabricação',
    'contrato-de-prestacao-de-servicos-para-confeccao-e-fabricacao',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE PRESTAÇÃO DE SERVIÇOS PARA CONFECÇÃO E FABRICAÇÃO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PRESTAÇÃO DE SERVIÇOS PARA CONFECÇÃO E FABRICAÇÃO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Prestação de Serviços para Confecção e Fabricação.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Prestação de Serviços para Confecção e Fabricação, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'servicos_profissional';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Prestação de Serviços de Corretagem Imobiliária',
    'contrato-de-prestacao-de-servicos-de-corretagem-imobiliaria',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE PRESTAÇÃO DE SERVIÇOS DE CORRETAGEM IMOBILIÁRIA\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PRESTAÇÃO DE SERVIÇOS DE CORRETAGEM IMOBILIÁRIA, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Prestação de Serviços de Corretagem Imobiliária.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Prestação de Serviços de Corretagem Imobiliária, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'servicos_profissional';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Prestação de Serviços Salão de Beleza para Noivas',
    'contrato-de-prestacao-de-servicos-salao-de-beleza-para-noivas',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE PRESTAÇÃO DE SERVIÇOS SALÃO DE BELEZA PARA NOIVAS\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PRESTAÇÃO DE SERVIÇOS SALÃO DE BELEZA PARA NOIVAS, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Prestação de Serviços Salão de Beleza para Noivas.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Prestação de Serviços Salão de Beleza para Noivas, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'imobiliario_aluguel';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Aluguel de Sala para Consultório Psicológico',
    'contrato-de-aluguel-de-sala-para-consultorio-psicologico',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE ALUGUEL DE SALA PARA CONSULTÓRIO PSICOLÓGICO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE ALUGUEL DE SALA PARA CONSULTÓRIO PSICOLÓGICO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Aluguel de Sala para Consultório Psicológico.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Aluguel de Sala para Consultório Psicológico, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'imobiliario_aluguel';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Aluguel de Caminhão',
    'contrato-de-aluguel-de-caminhao',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE ALUGUEL DE CAMINHÃO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE ALUGUEL DE CAMINHÃO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Aluguel de Caminhão.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Aluguel de Caminhão, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'imobiliario_aluguel';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Aluguel de Caçamba de Entulho',
    'contrato-de-aluguel-de-cacamba-de-entulho',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE ALUGUEL DE CAÇAMBA DE ENTULHO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE ALUGUEL DE CAÇAMBA DE ENTULHO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Aluguel de Caçamba de Entulho.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Aluguel de Caçamba de Entulho, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'empresarial_parcerias';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Parceria de Salão e Manicure',
    'contrato-de-parceria-de-salao-e-manicure',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE PARCERIA DE SALÃO E MANICURE\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PARCERIA DE SALÃO E MANICURE, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Parceria de Salão e Manicure.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Parceria de Salão e Manicure, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'empresarial_parcerias';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Parceria entre Advogados',
    'contrato-de-parceria-entre-advogados',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE PARCERIA ENTRE ADVOGADOS\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PARCERIA ENTRE ADVOGADOS, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Parceria entre Advogados.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Parceria entre Advogados, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'empresarial_parcerias';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Parceria no Instagram',
    'contrato-de-parceria-no-instagram',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE PARCERIA NO INSTAGRAM\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PARCERIA NO INSTAGRAM, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Parceria no Instagram.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Parceria no Instagram, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'empresarial_parcerias';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Parceria Agrícola',
    'contrato-de-parceria-agricola',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE PARCERIA AGRÍCOLA\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PARCERIA AGRÍCOLA, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Parceria Agrícola.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Parceria Agrícola, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'empresarial_parcerias';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Parceria',
    'contrato-de-parceria',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE PARCERIA\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PARCERIA, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Parceria.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Parceria, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'empresarial_parcerias';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Parceria de Clínica Estética',
    'contrato-de-parceria-de-clinica-estetica',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE PARCERIA DE CLÍNICA ESTÉTICA\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PARCERIA DE CLÍNICA ESTÉTICA, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Parceria de Clínica Estética.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Parceria de Clínica Estética, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'servicos_profissional';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Parceria entre Clínica e Médico ou Dentista',
    'contrato-de-parceria-entre-clinica-e-medico-ou-dentista',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE PARCERIA ENTRE CLÍNICA E MÉDICO OU DENTISTA\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PARCERIA ENTRE CLÍNICA E MÉDICO OU DENTISTA, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Parceria entre Clínica e Médico ou Dentista.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Parceria entre Clínica e Médico ou Dentista, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'imobiliario_aluguel';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Locação de Espaço Publicitário em Muro',
    'contrato-de-locacao-de-espaco-publicitario-em-muro',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE LOCAÇÃO DE ESPAÇO PUBLICITÁRIO EM MURO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE LOCAÇÃO DE ESPAÇO PUBLICITÁRIO EM MURO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Locação de Espaço Publicitário em Muro.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Locação de Espaço Publicitário em Muro, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'imobiliario_aluguel';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Aluguel de Espaço para Instalação de Antena',
    'contrato-de-aluguel-de-espaco-para-instalacao-de-antena',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE ALUGUEL DE ESPAÇO PARA INSTALAÇÃO DE ANTENA\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE ALUGUEL DE ESPAÇO PARA INSTALAÇÃO DE ANTENA, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Aluguel de Espaço para Instalação de Antena.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Aluguel de Espaço para Instalação de Antena, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'imobiliario_aluguel';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Aluguel de Estacionamento',
    'contrato-de-aluguel-de-estacionamento',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE ALUGUEL DE ESTACIONAMENTO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE ALUGUEL DE ESTACIONAMENTO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Aluguel de Estacionamento.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Aluguel de Estacionamento, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'imobiliario_aluguel';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Aluguel de Espaço Publicitário em Outdoor',
    'contrato-de-aluguel-de-espaco-publicitario-em-outdoor',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE ALUGUEL DE ESPAÇO PUBLICITÁRIO EM OUTDOOR\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE ALUGUEL DE ESPAÇO PUBLICITÁRIO EM OUTDOOR, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Aluguel de Espaço Publicitário em Outdoor.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Aluguel de Espaço Publicitário em Outdoor, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'servicos_profissional';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Prestação de Serviços de Anúncios Website',
    'contrato-de-prestacao-de-servicos-de-anuncios-website',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE PRESTAÇÃO DE SERVIÇOS DE ANÚNCIOS WEBSITE\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PRESTAÇÃO DE SERVIÇOS DE ANÚNCIOS WEBSITE, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Prestação de Serviços de Anúncios Website.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Prestação de Serviços de Anúncios Website, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'imobiliario_aluguel';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Aluguel de Toalhas de Mesas',
    'contrato-de-aluguel-de-toalhas-de-mesas',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE ALUGUEL DE TOALHAS DE MESAS\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE ALUGUEL DE TOALHAS DE MESAS, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Aluguel de Toalhas de Mesas.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Aluguel de Toalhas de Mesas, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'imobiliario_aluguel';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Aluguel de Mesas e Cadeiras para Eventos',
    'contrato-de-aluguel-de-mesas-e-cadeiras-para-eventos',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE ALUGUEL DE MESAS E CADEIRAS PARA EVENTOS\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE ALUGUEL DE MESAS E CADEIRAS PARA EVENTOS, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Aluguel de Mesas e Cadeiras para Eventos.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Aluguel de Mesas e Cadeiras para Eventos, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'imobiliario_aluguel';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Aluguel de Carrinho de Lanche',
    'contrato-de-aluguel-de-carrinho-de-lanche',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE ALUGUEL DE CARRINHO DE LANCHE\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE ALUGUEL DE CARRINHO DE LANCHE, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Aluguel de Carrinho de Lanche.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Aluguel de Carrinho de Lanche, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'imobiliario_aluguel';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Aluguel de Kitnet',
    'contrato-de-aluguel-de-kitnet',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE ALUGUEL DE KITNET\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE ALUGUEL DE KITNET, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Aluguel de Kitnet.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Aluguel de Kitnet, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'imobiliario_aluguel';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Aluguel de Sala de Aula',
    'contrato-de-aluguel-de-sala-de-aula',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE ALUGUEL DE SALA DE AULA\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE ALUGUEL DE SALA DE AULA, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Aluguel de Sala de Aula.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Aluguel de Sala de Aula, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'imobiliario_aluguel';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Aluguel Espaço para Food Truck',
    'contrato-de-aluguel-espaco-para-food-truck',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE ALUGUEL ESPAÇO PARA FOOD TRUCK\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE ALUGUEL ESPAÇO PARA FOOD TRUCK, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Aluguel Espaço para Food Truck.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Aluguel Espaço para Food Truck, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'servicos_profissional';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Prestação de Serviços Digital Influencer',
    'contrato-de-prestacao-de-servicos-digital-influencer',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE PRESTAÇÃO DE SERVIÇOS DIGITAL INFLUENCER\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PRESTAÇÃO DE SERVIÇOS DIGITAL INFLUENCER, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Prestação de Serviços Digital Influencer.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Prestação de Serviços Digital Influencer, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'imobiliario_aluguel';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Aluguel de Roupas para Festa',
    'contrato-de-aluguel-de-roupas-para-festa',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE ALUGUEL DE ROUPAS PARA FESTA\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE ALUGUEL DE ROUPAS PARA FESTA, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Aluguel de Roupas para Festa.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Aluguel de Roupas para Festa, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'imobiliario_aluguel';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Locação de Lancha',
    'contrato-de-locacao-de-lancha',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE LOCAÇÃO DE LANCHA\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE LOCAÇÃO DE LANCHA, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Locação de Lancha.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Locação de Lancha, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'imobiliario_aluguel';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Aluguel de Quarto República',
    'contrato-de-aluguel-de-quarto-republica',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE ALUGUEL DE QUARTO REPÚBLICA\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE ALUGUEL DE QUARTO REPÚBLICA, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Aluguel de Quarto República.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Aluguel de Quarto República, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'imobiliario_aluguel';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Aluguel de Mesa Provençal',
    'contrato-de-aluguel-de-mesa-provencal',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE ALUGUEL DE MESA PROVENÇAL\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE ALUGUEL DE MESA PROVENÇAL, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Aluguel de Mesa Provençal.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Aluguel de Mesa Provençal, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'imobiliario_aluguel';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Aluguel de Cadeira para Salão de Beleza',
    'contrato-de-aluguel-de-cadeira-para-salao-de-beleza',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE ALUGUEL DE CADEIRA PARA SALÃO DE BELEZA\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE ALUGUEL DE CADEIRA PARA SALÃO DE BELEZA, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Aluguel de Cadeira para Salão de Beleza.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Aluguel de Cadeira para Salão de Beleza, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'imobiliario_aluguel';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Aluguel de Bens Móveis',
    'contrato-de-aluguel-de-bens-moveis',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE ALUGUEL DE BENS MÓVEIS\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE ALUGUEL DE BENS MÓVEIS, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Aluguel de Bens Móveis.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Aluguel de Bens Móveis, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'imobiliario_aluguel';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Aluguel de Imóvel Residencial para Pessoa Jurídica (Igreja Evangélica)',
    'contrato-de-aluguel-de-imovel-residencial-para-pessoa-juridica-igreja-evangelica',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE ALUGUEL DE IMÓVEL RESIDENCIAL PARA PESSOA JURÍDICA (IGREJA EVANGÉLICA)\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE ALUGUEL DE IMÓVEL RESIDENCIAL PARA PESSOA JURÍDICA (IGREJA EVANGÉLICA), mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Aluguel de Imóvel Residencial para Pessoa Jurídica (Igreja Evangélica).',
    'Garanta segurança jurídica com nosso modelo de Contrato de Aluguel de Imóvel Residencial para Pessoa Jurídica (Igreja Evangélica), revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'servicos_profissional';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Prestação de Serviços de Cobrança',
    'contrato-de-prestacao-de-servicos-de-cobranca',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE PRESTAÇÃO DE SERVIÇOS DE COBRANÇA\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PRESTAÇÃO DE SERVIÇOS DE COBRANÇA, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Prestação de Serviços de Cobrança.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Prestação de Serviços de Cobrança, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'imobiliario_aluguel';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Aluguel de Imóvel Comercial (Salão para Igreja Evangélica)',
    'contrato-de-aluguel-de-imovel-comercial-salao-para-igreja-evangelica',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE ALUGUEL DE IMÓVEL COMERCIAL (SALÃO PARA IGREJA EVANGÉLICA)\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE ALUGUEL DE IMÓVEL COMERCIAL (SALÃO PARA IGREJA EVANGÉLICA), mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Aluguel de Imóvel Comercial (Salão para Igreja Evangélica).',
    'Garanta segurança jurídica com nosso modelo de Contrato de Aluguel de Imóvel Comercial (Salão para Igreja Evangélica), revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'veiculos_maquinas';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Comodato de Veículo',
    'contrato-de-comodato-de-veiculo',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE COMODATO DE VEÍCULO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE COMODATO DE VEÍCULO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Comodato de Veículo.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Comodato de Veículo, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'imobiliario_aluguel';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Locação de Impressoras',
    'contrato-de-locacao-de-impressoras',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE LOCAÇÃO DE IMPRESSORAS\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE LOCAÇÃO DE IMPRESSORAS, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Locação de Impressoras.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Locação de Impressoras, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'imobiliario_aluguel';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Aluguel Built to Suit',
    'contrato-de-aluguel-built-to-suit',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE ALUGUEL BUILT TO SUIT\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE ALUGUEL BUILT TO SUIT, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Aluguel Built to Suit.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Aluguel Built to Suit, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'imobiliario_aluguel';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Locação de Shopping',
    'contrato-de-locacao-de-shopping',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE LOCAÇÃO DE SHOPPING\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE LOCAÇÃO DE SHOPPING, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Locação de Shopping.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Locação de Shopping, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'imobiliario_aluguel';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Aluguel de Sítio ou Chácara',
    'contrato-de-aluguel-de-sitio-ou-chacara',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE ALUGUEL DE SÍTIO OU CHÁCARA\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE ALUGUEL DE SÍTIO OU CHÁCARA, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Aluguel de Sítio ou Chácara.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Aluguel de Sítio ou Chácara, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'imobiliario_aluguel';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Declaração de Aluguel',
    'declaracao-de-aluguel',
    cat_id,
    29.90,
    'CONTRATO DE DECLARAÇÃO DE ALUGUEL\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente DECLARAÇÃO DE ALUGUEL, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Declaração de Aluguel.',
    'Garanta segurança jurídica com nosso modelo de Declaração de Aluguel, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'docs_rapidos';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Declaração de Autônomo',
    'declaracao-de-autonomo',
    cat_id,
    29.90,
    'CONTRATO DE DECLARAÇÃO DE AUTÔNOMO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente DECLARAÇÃO DE AUTÔNOMO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Declaração de Autônomo.',
    'Garanta segurança jurídica com nosso modelo de Declaração de Autônomo, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'imobiliario_aluguel';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Comodato de Imóvel Residencial',
    'contrato-de-comodato-de-imovel-residencial',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE COMODATO DE IMÓVEL RESIDENCIAL\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE COMODATO DE IMÓVEL RESIDENCIAL, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Comodato de Imóvel Residencial.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Comodato de Imóvel Residencial, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'docs_rapidos';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Comodato de Antena de Internet',
    'contrato-de-comodato-de-antena-de-internet',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE COMODATO DE ANTENA DE INTERNET\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE COMODATO DE ANTENA DE INTERNET, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Comodato de Antena de Internet.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Comodato de Antena de Internet, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'imobiliario_aluguel';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Comodato para Caseiro que Mora no Sítio ou Chácara',
    'contrato-de-comodato-para-caseiro-que-mora-no-sitio-ou-chacara',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE COMODATO PARA CASEIRO QUE MORA NO SÍTIO OU CHÁCARA\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE COMODATO PARA CASEIRO QUE MORA NO SÍTIO OU CHÁCARA, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Comodato para Caseiro que Mora no Sítio ou Chácara.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Comodato para Caseiro que Mora no Sítio ou Chácara, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'servicos_profissional';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Declaração de Prestação de Serviços',
    'declaracao-de-prestacao-de-servicos',
    cat_id,
    29.90,
    'CONTRATO DE DECLARAÇÃO DE PRESTAÇÃO DE SERVIÇOS\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente DECLARAÇÃO DE PRESTAÇÃO DE SERVIÇOS, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Declaração de Prestação de Serviços.',
    'Garanta segurança jurídica com nosso modelo de Declaração de Prestação de Serviços, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'empresarial_parcerias';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Declaração de Compra e Venda',
    'declaracao-de-compra-e-venda',
    cat_id,
    29.90,
    'CONTRATO DE DECLARAÇÃO DE COMPRA E VENDA\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente DECLARAÇÃO DE COMPRA E VENDA, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Declaração de Compra e Venda.',
    'Garanta segurança jurídica com nosso modelo de Declaração de Compra e Venda, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'docs_rapidos';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Declaração de Pagamento',
    'declaracao-de-pagamento',
    cat_id,
    29.90,
    'CONTRATO DE DECLARAÇÃO DE PAGAMENTO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente DECLARAÇÃO DE PAGAMENTO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Declaração de Pagamento.',
    'Garanta segurança jurídica com nosso modelo de Declaração de Pagamento, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'docs_rapidos';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Declaração de Conteúdo Correios',
    'declaracao-de-conteudo-correios',
    cat_id,
    29.90,
    'CONTRATO DE DECLARAÇÃO DE CONTEÚDO CORREIOS\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente DECLARAÇÃO DE CONTEÚDO CORREIOS, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Declaração de Conteúdo Correios.',
    'Garanta segurança jurídica com nosso modelo de Declaração de Conteúdo Correios, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'imobiliario_aluguel';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Locação de Equipamento de Geração de Energia',
    'contrato-de-locacao-de-equipamento-de-geracao-de-energia',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE LOCAÇÃO DE EQUIPAMENTO DE GERAÇÃO DE ENERGIA\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE LOCAÇÃO DE EQUIPAMENTO DE GERAÇÃO DE ENERGIA, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Locação de Equipamento de Geração de Energia.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Locação de Equipamento de Geração de Energia, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'servicos_profissional';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Consultoria de Marketing',
    'contrato-de-consultoria-de-marketing',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE CONSULTORIA DE MARKETING\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE CONSULTORIA DE MARKETING, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Consultoria de Marketing.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Consultoria de Marketing, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'servicos_profissional';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Consultoria de Imagem e Estilo',
    'contrato-de-consultoria-de-imagem-e-estilo',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE CONSULTORIA DE IMAGEM E ESTILO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE CONSULTORIA DE IMAGEM E ESTILO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Consultoria de Imagem e Estilo.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Consultoria de Imagem e Estilo, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'servicos_profissional';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Consultoria de Software',
    'contrato-de-consultoria-de-software',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE CONSULTORIA DE SOFTWARE\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE CONSULTORIA DE SOFTWARE, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Consultoria de Software.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Consultoria de Software, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'docs_rapidos';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Declaração de Estado Civil',
    'declaracao-de-estado-civil',
    cat_id,
    29.90,
    'CONTRATO DE DECLARAÇÃO DE ESTADO CIVIL\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente DECLARAÇÃO DE ESTADO CIVIL, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Declaração de Estado Civil.',
    'Garanta segurança jurídica com nosso modelo de Declaração de Estado Civil, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'empresarial_parcerias';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Compra e Venda de Quotas de Sociedade',
    'contrato-de-compra-e-venda-de-quotas-de-sociedade',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE COMPRA E VENDA DE QUOTAS DE SOCIEDADE\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE COMPRA E VENDA DE QUOTAS DE SOCIEDADE, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Compra e Venda de Quotas de Sociedade.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Compra e Venda de Quotas de Sociedade, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'familia_pessoal';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de União Estável',
    'contrato-de-uniao-estavel',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE UNIÃO ESTÁVEL\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE UNIÃO ESTÁVEL, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de União Estável.',
    'Garanta segurança jurídica com nosso modelo de Contrato de União Estável, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'empresarial_parcerias';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Compra e Venda Internacional',
    'contrato-de-compra-e-venda-internacional',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE COMPRA E VENDA INTERNACIONAL\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE COMPRA E VENDA INTERNACIONAL, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Compra e Venda Internacional.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Compra e Venda Internacional, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'imobiliario_aluguel';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Aluguel de Veículo para Uber',
    'contrato-de-aluguel-de-veiculo-para-uber',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE ALUGUEL DE VEÍCULO PARA UBER\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE ALUGUEL DE VEÍCULO PARA UBER, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Aluguel de Veículo para Uber.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Aluguel de Veículo para Uber, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'imobiliario_aluguel';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Locação/Aluguel de Terreno',
    'contrato-de-locacao-aluguel-de-terreno',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE LOCAÇÃO/ALUGUEL DE TERRENO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE LOCAÇÃO/ALUGUEL DE TERRENO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Locação/Aluguel de Terreno.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Locação/Aluguel de Terreno, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'empresarial_parcerias';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Compra e Venda de Bens Móveis',
    'contrato-de-compra-e-venda-de-bens-moveis',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE COMPRA E VENDA DE BENS MÓVEIS\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE COMPRA E VENDA DE BENS MÓVEIS, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Compra e Venda de Bens Móveis.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Compra e Venda de Bens Móveis, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'docs_rapidos';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Declaração de Hipossuficiência',
    'declaracao-de-hipossuficiencia',
    cat_id,
    29.90,
    'CONTRATO DE DECLARAÇÃO DE HIPOSSUFICIÊNCIA\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente DECLARAÇÃO DE HIPOSSUFICIÊNCIA, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Declaração de Hipossuficiência.',
    'Garanta segurança jurídica com nosso modelo de Declaração de Hipossuficiência, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'docs_rapidos';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Mútuo',
    'contrato-de-mutuo',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE MÚTUO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE MÚTUO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Mútuo.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Mútuo, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'empresarial_parcerias';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Cessão de Quotas Sociais',
    'contrato-de-cessao-de-quotas-sociais',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE CESSÃO DE QUOTAS SOCIAIS\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE CESSÃO DE QUOTAS SOCIAIS, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Cessão de Quotas Sociais.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Cessão de Quotas Sociais, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'empresarial_parcerias';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Cessão',
    'contrato-de-cessao',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE CESSÃO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE CESSÃO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Cessão.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Cessão, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'docs_rapidos';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Declaração',
    'declaracao',
    cat_id,
    29.90,
    'CONTRATO DE DECLARAÇÃO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente DECLARAÇÃO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Declaração.',
    'Garanta segurança jurídica com nosso modelo de Declaração, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'veiculos_maquinas';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Compra e Venda de Moto',
    'contrato-de-compra-e-venda-de-moto',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE COMPRA E VENDA DE MOTO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE COMPRA E VENDA DE MOTO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Compra e Venda de Moto.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Compra e Venda de Moto, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'servicos_profissional';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Prestação de Serviços Musicais',
    'contrato-de-prestacao-de-servicos-musicais',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE PRESTAÇÃO DE SERVIÇOS MUSICAIS\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PRESTAÇÃO DE SERVIÇOS MUSICAIS, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Prestação de Serviços Musicais.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Prestação de Serviços Musicais, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'servicos_profissional';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Prestação de Serviços de Segurança do Trabalho',
    'contrato-de-prestacao-de-servicos-de-seguranca-do-trabalho',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE PRESTAÇÃO DE SERVIÇOS DE SEGURANÇA DO TRABALHO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PRESTAÇÃO DE SERVIÇOS DE SEGURANÇA DO TRABALHO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Prestação de Serviços de Segurança do Trabalho.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Prestação de Serviços de Segurança do Trabalho, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'empresarial_parcerias';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Compra e Venda de Arma',
    'contrato-de-compra-e-venda-de-arma',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE COMPRA E VENDA DE ARMA\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE COMPRA E VENDA DE ARMA, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Compra e Venda de Arma.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Compra e Venda de Arma, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'servicos_profissional';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Prestação de Serviços Instalação',
    'contrato-de-prestacao-de-servicos-instalacao',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE PRESTAÇÃO DE SERVIÇOS INSTALAÇÃO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PRESTAÇÃO DE SERVIÇOS INSTALAÇÃO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Prestação de Serviços Instalação.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Prestação de Serviços Instalação, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'servicos_profissional';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Prestação de Serviços Consultoria',
    'contrato-de-prestacao-de-servicos-consultoria',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE PRESTAÇÃO DE SERVIÇOS CONSULTORIA\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PRESTAÇÃO DE SERVIÇOS CONSULTORIA, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Prestação de Serviços Consultoria.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Prestação de Serviços Consultoria, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'servicos_profissional';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Prestação de Serviços de Arquitetura',
    'contrato-de-prestacao-de-servicos-de-arquitetura',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE PRESTAÇÃO DE SERVIÇOS DE ARQUITETURA\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PRESTAÇÃO DE SERVIÇOS DE ARQUITETURA, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Prestação de Serviços de Arquitetura.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Prestação de Serviços de Arquitetura, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'servicos_profissional';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Prestação de Serviços Design Gráfico',
    'contrato-de-prestacao-de-servicos-design-grafico',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE PRESTAÇÃO DE SERVIÇOS DESIGN GRÁFICO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PRESTAÇÃO DE SERVIÇOS DESIGN GRÁFICO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Prestação de Serviços Design Gráfico.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Prestação de Serviços Design Gráfico, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'servicos_profissional';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Prestação de Serviços de Informática',
    'contrato-de-prestacao-de-servicos-de-informatica',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE PRESTAÇÃO DE SERVIÇOS DE INFORMÁTICA\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PRESTAÇÃO DE SERVIÇOS DE INFORMÁTICA, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Prestação de Serviços de Informática.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Prestação de Serviços de Informática, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'servicos_profissional';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Prestação de Serviços de Limpeza',
    'contrato-de-prestacao-de-servicos-de-limpeza',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE PRESTAÇÃO DE SERVIÇOS DE LIMPEZA\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PRESTAÇÃO DE SERVIÇOS DE LIMPEZA, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Prestação de Serviços de Limpeza.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Prestação de Serviços de Limpeza, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'servicos_profissional';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Prestação de Serviços de Marcenaria',
    'contrato-de-prestacao-de-servicos-de-marcenaria',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE PRESTAÇÃO DE SERVIÇOS DE MARCENARIA\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PRESTAÇÃO DE SERVIÇOS DE MARCENARIA, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Prestação de Serviços de Marcenaria.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Prestação de Serviços de Marcenaria, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'servicos_profissional';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Prestação de Serviços Corretagem de Seguros',
    'contrato-de-prestacao-de-servicos-corretagem-de-seguros',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE PRESTAÇÃO DE SERVIÇOS CORRETAGEM DE SEGUROS\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PRESTAÇÃO DE SERVIÇOS CORRETAGEM DE SEGUROS, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Prestação de Serviços Corretagem de Seguros.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Prestação de Serviços Corretagem de Seguros, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'servicos_profissional';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Prestação de Serviço Médico',
    'contrato-de-prestacao-de-servico-medico',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE PRESTAÇÃO DE SERVIÇO MÉDICO\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PRESTAÇÃO DE SERVIÇO MÉDICO, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Prestação de Serviço Médico.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Prestação de Serviço Médico, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'servicos_profissional';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Prestação de Serviço de Pintura',
    'contrato-de-prestacao-de-servico-de-pintura',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE PRESTAÇÃO DE SERVIÇO DE PINTURA\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PRESTAÇÃO DE SERVIÇO DE PINTURA, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Prestação de Serviço de Pintura.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Prestação de Serviço de Pintura, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'servicos_profissional';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Prestação de Serviços de Fotografia e/ou Filmagem',
    'contrato-de-prestacao-de-servicos-de-fotografia-e-ou-filmagem',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE PRESTAÇÃO DE SERVIÇOS DE FOTOGRAFIA E/OU FILMAGEM\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE PRESTAÇÃO DE SERVIÇOS DE FOTOGRAFIA E/OU FILMAGEM, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Prestação de Serviços de Fotografia e/ou Filmagem.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Prestação de Serviços de Fotografia e/ou Filmagem, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'empresarial_parcerias';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Subarrendamento Rural',
    'contrato-de-subarrendamento-rural',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE SUBARRENDAMENTO RURAL\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE SUBARRENDAMENTO RURAL, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Subarrendamento Rural.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Subarrendamento Rural, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'empresarial_parcerias';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Arrendamento Rural de Pastagem',
    'contrato-de-arrendamento-rural-de-pastagem',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE ARRENDAMENTO RURAL DE PASTAGEM\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE ARRENDAMENTO RURAL DE PASTAGEM, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Arrendamento Rural de Pastagem.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Arrendamento Rural de Pastagem, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

  SELECT id INTO cat_id FROM contract_categories WHERE slug = 'imobiliario_aluguel';
  
  INSERT INTO contracts (id, title, slug, category_id, price, template_body, description, full_description)
  VALUES (
    gen_random_uuid(),
    'Contrato de Cessão de Uso/Posse de Imóvel',
    'contrato-de-cessao-de-uso-posse-de-imovel',
    cat_id,
    29.90,
    'CONTRATO DE CONTRATO DE CESSÃO DE USO/POSSE DE IMÓVEL\n\nPelo presente instrumento particular, de um lado {{nome_parte_1}}, inscrito no CPF/CNPJ {{doc_parte_1}}, e de outro lado {{nome_parte_2}}, inscrito no CPF/CNPJ {{doc_parte_2}}, resolvem celebrar o presente CONTRATO DE CESSÃO DE USO/POSSE DE IMÓVEL, mediante as cláusulas e condições abaixo:\n\nCLÁUSULA PRIMEIRA - DO OBJETO...\n',
    'Modelo completo e atualizado de Contrato de Cessão de Uso/Posse de Imóvel.',
    'Garanta segurança jurídica com nosso modelo de Contrato de Cessão de Uso/Posse de Imóvel, revisado por especialistas e pronto para preenchimento. Inclui cláusulas essenciais e adaptação para diversos cenários.'
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO new_contract_id;

  IF new_contract_id IS NOT NULL THEN
      INSERT INTO contract_variables (contract_id, name, label, type, required, order_index) VALUES
      (new_contract_id, 'nome_parte_1', 'Nome da Parte 1', 'text', true, 1),
      (new_contract_id, 'doc_parte_1', 'CPF/CNPJ Parte 1', 'text', true, 2),
      (new_contract_id, 'nome_parte_2', 'Nome da Parte 2', 'text', true, 3),
      (new_contract_id, 'doc_parte_2', 'CPF/CNPJ Parte 2', 'text', true, 4);
  END IF;

END $$;
