-- Add new columns for PF/PJ differentiation
ALTER TABLE public.profiles 
ADD COLUMN IF NOT EXISTS user_type text CHECK (user_type IN ('PF', 'PJ')) DEFAULT 'PF',
ADD COLUMN IF NOT EXISTS cpf text,
ADD COLUMN IF NOT EXISTS cnpj text,
ADD COLUMN IF NOT EXISTS company_name text;

-- Add indexes for faster lookup during login
CREATE INDEX IF NOT EXISTS profiles_cpf_idx ON public.profiles(cpf);
CREATE INDEX IF NOT EXISTS profiles_cnpj_idx ON public.profiles(cnpj);

-- Create a secure function to look up email by document (for login)
CREATE OR REPLACE FUNCTION public.get_email_by_document(doc_type text, doc_value text)
RETURNS text
LANGUAGE plpgsql
SECURITY DEFINER -- Runs with admin privileges to bypass RLS for this specific lookup
AS $$
DECLARE
  found_email text;
BEGIN
  IF doc_type = 'cpf' THEN
    SELECT p.email INTO found_email
    FROM public.profiles p
    WHERE p.cpf = doc_value
    LIMIT 1;
  ELSIF doc_type = 'cnpj' THEN
    SELECT p.email INTO found_email
    FROM public.profiles p
    WHERE p.cnpj = doc_value
    LIMIT 1;
  END IF;
  
  RETURN found_email;
END;
$$;
