-- 1. Categories Table
create table if not exists contract_categories (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  slug text not null unique,
  icon text, -- Icon name (e.g., 'home', 'briefcase')
  description text,
  parent_id uuid references contract_categories(id),
  created_at timestamptz default now()
);

-- 2. Contracts (Templates) Table
create table if not exists contracts (
  id uuid primary key default gen_random_uuid(),
  title text not null,
  slug text not null unique,
  description text, -- Short description for the card
  full_description text, -- Long copy for the product page
  category_id uuid references contract_categories(id) not null,
  price numeric default 0,
  template_body text, -- The actual contract text with {{variables}}
  is_active boolean default true,
  created_at timestamptz default now()
);

-- 3. Contract Variables (For the Wizard)
create table if not exists contract_variables (
  id uuid primary key default gen_random_uuid(),
  contract_id uuid references contracts(id) not null,
  name text not null, -- The variable name in template (e.g. 'nome_locador')
  label text not null, -- User facing label (e.g. 'Nome do Locador')
  type text not null default 'text', -- 'text', 'date', 'number', 'select', 'currency'
  options jsonb, -- For select inputs: ['Option A', 'Option B']
  required boolean default true,
  order_index integer default 0,
  created_at timestamptz default now()
);

-- RLS Policies
alter table contract_categories enable row level security;
drop policy if exists "Allow public read access on categories" on contract_categories;
create policy "Allow public read access on categories" on contract_categories for select using (true);

alter table contracts enable row level security;
drop policy if exists "Allow public read access on contracts" on contracts;
create policy "Allow public read access on contracts" on contracts for select using (true);

alter table contract_variables enable row level security;
drop policy if exists "Allow public read access on variables" on contract_variables;
create policy "Allow public read access on variables" on contract_variables for select using (true);
