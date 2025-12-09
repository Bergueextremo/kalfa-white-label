-- 1. Fix default credits
ALTER TABLE public.profiles ALTER COLUMN credits SET DEFAULT 0;

-- 2. Add has_seen_onboarding column
ALTER TABLE public.profiles ADD COLUMN IF NOT EXISTS has_seen_onboarding BOOLEAN DEFAULT FALSE;

-- 3. (Optional) Fix existing users with 112 credits if that represents the bug
-- We only reset those with exactly 112, assuming they haven't spent any or bought more.
UPDATE public.profiles SET credits = 0 WHERE credits = 112;
