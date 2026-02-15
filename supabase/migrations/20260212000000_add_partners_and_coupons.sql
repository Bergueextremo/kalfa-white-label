-- Create partners table
CREATE TABLE IF NOT EXISTS public.partners (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    name TEXT NOT NULL,
    code TEXT NOT NULL UNIQUE,
    commission_rate NUMERIC DEFAULT 0,
    created_at TIMESTAMPTZ DEFAULT now()
);

-- Add coupon/partner info to auditorias_contratos
ALTER TABLE public.auditorias_contratos 
ADD COLUMN IF NOT EXISTS partner_id UUID REFERENCES public.partners(id),
ADD COLUMN IF NOT EXISTS coupon_code TEXT;

-- Add coupon/partner info to credit_purchases
ALTER TABLE public.credit_purchases 
ADD COLUMN IF NOT EXISTS partner_id UUID REFERENCES public.partners(id),
ADD COLUMN IF NOT EXISTS coupon_code TEXT;

-- Enable RLS on partners
ALTER TABLE public.partners ENABLE ROW LEVEL SECURITY;

-- Allow admins to do everything on partners
CREATE POLICY "Admins can manage partners" 
ON public.partners 
FOR ALL 
TO authenticated 
USING (public.has_role(auth.uid(), 'admin'));

-- Allow public/users to read partners (so they can validate coupons)
CREATE POLICY "Anyone can read partners" 
ON public.partners 
FOR SELECT 
TO authenticated, anon
USING (true);

-- Survival check for contract_purchases if it exists
DO $$ 
BEGIN 
  IF EXISTS (SELECT FROM pg_tables WHERE schemaname = 'public' AND tablename = 'contract_purchases') THEN
    ALTER TABLE public.contract_purchases ADD COLUMN IF NOT EXISTS partner_id UUID REFERENCES public.partners(id);
    ALTER TABLE public.contract_purchases ADD COLUMN IF NOT EXISTS coupon_code TEXT;
  END IF;
END $$;

-- Admin storage access
DO $$ 
BEGIN 
  INSERT INTO storage.policies (name, bucket_id, definition, action)
  VALUES ('Admins can read all contracts', 'contracts', '(public.has_role(auth.uid(), ''admin''))', 'SELECT')
  ON CONFLICT DO NOTHING;
EXCEPTION
  WHEN undefined_table THEN
    -- Fallback if storage.policies is not directly accessible this way in some environments
    NULL;
END $$;
