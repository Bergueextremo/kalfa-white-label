-- Create credit_purchases table for tracking credit purchases
CREATE TABLE IF NOT EXISTS public.credit_purchases (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
    appmax_order_id TEXT NOT NULL,
    credits INTEGER NOT NULL,
    amount DECIMAL(10, 2) NOT NULL,
    plan_name TEXT NOT NULL,
    payment_method TEXT NOT NULL CHECK (payment_method IN ('pix', 'credit_card')),
    payment_status TEXT NOT NULL DEFAULT 'pending' CHECK (payment_status IN ('pending', 'approved', 'rejected', 'failed')),
    payment_metadata JSONB,
    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

-- Create index for faster lookups
CREATE INDEX IF NOT EXISTS idx_credit_purchases_user_id ON public.credit_purchases(user_id);
CREATE INDEX IF NOT EXISTS idx_credit_purchases_appmax_order_id ON public.credit_purchases(appmax_order_id);
CREATE INDEX IF NOT EXISTS idx_credit_purchases_payment_status ON public.credit_purchases(payment_status);

-- Enable RLS
ALTER TABLE public.credit_purchases ENABLE ROW LEVEL SECURITY;

-- Create RLS policies
CREATE POLICY "Users can view their own credit purchases"
    ON public.credit_purchases
    FOR SELECT
    USING (auth.uid() = user_id);

CREATE POLICY "Users can insert their own credit purchases"
    ON public.credit_purchases
    FOR INSERT
    WITH CHECK (auth.uid() = user_id);

-- Service role can do anything (for Edge Functions)
CREATE POLICY "Service role has full access to credit purchases"
    ON public.credit_purchases
    FOR ALL
    USING (auth.jwt()->>'role' = 'service_role');
