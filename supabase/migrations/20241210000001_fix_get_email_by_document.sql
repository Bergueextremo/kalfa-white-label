-- Fix the get_email_by_document function to search in auth.users metadata
CREATE OR REPLACE FUNCTION public.get_email_by_document(doc_type text, doc_value text)
RETURNS text
LANGUAGE plpgsql
SECURITY DEFINER -- Runs with admin privileges to access auth.users
AS $$
DECLARE
  found_email text;
BEGIN
  IF doc_type = 'cpf' THEN
    SELECT email INTO found_email
    FROM auth.users
    WHERE raw_user_meta_data->>'cpf' = doc_value
    LIMIT 1;
  ELSIF doc_type = 'cnpj' THEN
    SELECT email INTO found_email
    FROM auth.users
    WHERE raw_user_meta_data->>'cnpj' = doc_value
    LIMIT 1;
  END IF;
  
  RETURN found_email;
END;
$$;
