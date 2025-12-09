-- Alter credit_purchases table to allow null user_id for new user purchases
-- This is needed for the payment-before-signup flow where users pay before creating an account

ALTER TABLE public.credit_purchases 
  ALTER COLUMN user_id DROP NOT NULL;

-- Update RLS policies to handle null user_id
DROP POLICY IF EXISTS "Users can view their own credit purchases" ON public.credit_purchases;
DROP POLICY IF EXISTS "Users can insert their own credit purchases" ON public.credit_purchases;

-- New policy: Users can view their own purchases
CREATE POLICY "Users can view their own credit purchases"
    ON public.credit_purchases
    FOR SELECT
    USING (auth.uid() = user_id);

-- New policy: Service role can insert (for new users with null user_id)
DROP POLICY IF EXISTS "Service role can insert credit purchases" ON public.credit_purchases;
CREATE POLICY "Service role can insert credit purchases"
    ON public.credit_purchases
    FOR INSERT
    WITH CHECK (auth.jwt()->>'role' = 'service_role' OR auth.uid() = user_id);

-- Comment for documentation
COMMENT ON COLUMN public.credit_purchases.user_id IS 'User ID - can be null for purchases made before account creation (payment-before-signup flow)';
