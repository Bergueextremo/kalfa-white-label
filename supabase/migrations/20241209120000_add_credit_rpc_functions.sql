-- Create RPC function to increment credits
create or replace function public.increment_credits(row_id uuid, amount integer)
returns void as $$
begin
  update public.profiles
  set credits = credits + amount,
      updated_at = now()
  where id = row_id;
end;
$$ language plpgsql security definer;

-- Create RPC function to decrement credits
create or replace function public.decrement_credits(row_id uuid, amount integer)
returns void as $$
begin
  update public.profiles
  set credits = greatest(credits - amount, 0),
      updated_at = now()
  where id = row_id;
end;
$$ language plpgsql security definer;
