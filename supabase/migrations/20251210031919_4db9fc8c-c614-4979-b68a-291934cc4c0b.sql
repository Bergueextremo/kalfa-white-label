-- Fix function search path mutable issues
-- Update get_email_by_document function with fixed search_path
CREATE OR REPLACE FUNCTION public.get_email_by_document(doc_type text, doc_value text)
 RETURNS text
 LANGUAGE plpgsql
 SECURITY DEFINER
 SET search_path = public
AS $function$
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
$function$;

-- Update decrement_credits function with fixed search_path
CREATE OR REPLACE FUNCTION public.decrement_credits(row_id uuid, amount integer)
 RETURNS void
 LANGUAGE plpgsql
 SECURITY DEFINER
 SET search_path = public
AS $function$
begin
  update public.profiles
  set credits = greatest(credits - amount, 0),
      updated_at = now()
  where id = row_id;
end;
$function$;

-- Update increment_credits function with fixed search_path
CREATE OR REPLACE FUNCTION public.increment_credits(row_id uuid, amount integer)
 RETURNS void
 LANGUAGE plpgsql
 SECURITY DEFINER
 SET search_path = public
AS $function$
begin
  update public.profiles
  set credits = credits + amount,
      updated_at = now()
  where id = row_id;
end;
$function$;

-- Update handle_new_user function with fixed search_path
CREATE OR REPLACE FUNCTION public.handle_new_user()
 RETURNS trigger
 LANGUAGE plpgsql
 SECURITY DEFINER
 SET search_path = public
AS $function$
begin
  insert into public.profiles (id, credits)
  values (new.id, 0);
  return new;
end;
$function$;