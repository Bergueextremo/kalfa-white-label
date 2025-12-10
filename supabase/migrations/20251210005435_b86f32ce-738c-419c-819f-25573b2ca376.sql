-- 1. Create app_role enum for role types
CREATE TYPE public.app_role AS ENUM ('admin', 'moderator', 'user');

-- 2. Create user_roles table
CREATE TABLE public.user_roles (
    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID REFERENCES auth.users(id) ON DELETE CASCADE NOT NULL,
    role app_role NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE DEFAULT now(),
    UNIQUE (user_id, role)
);

-- 3. Enable RLS on user_roles
ALTER TABLE public.user_roles ENABLE ROW LEVEL SECURITY;

-- 4. RLS policies for user_roles - only service role can manage
CREATE POLICY "Service role can manage user_roles"
ON public.user_roles
FOR ALL
TO authenticated
USING (auth.uid() = user_id AND role = 'user');

CREATE POLICY "Service role full access to user_roles"
ON public.user_roles
FOR ALL
USING (auth.role() = 'service_role');

-- 5. Create security definer function to check roles
CREATE OR REPLACE FUNCTION public.has_role(_user_id UUID, _role app_role)
RETURNS BOOLEAN
LANGUAGE sql
STABLE
SECURITY DEFINER
SET search_path = public
AS $$
  SELECT EXISTS (
    SELECT 1
    FROM public.user_roles
    WHERE user_id = _user_id
      AND role = _role
  )
$$;

-- 6. Insert admin role for the main admin user
INSERT INTO public.user_roles (user_id, role)
SELECT id, 'admin'::app_role
FROM auth.users
WHERE email = 'jussistemas@gmail.com'
ON CONFLICT (user_id, role) DO NOTHING;

-- 7. Fix profiles RLS - remove public access policy
DROP POLICY IF EXISTS "Public profiles are viewable by everyone." ON public.profiles;

-- 8. Create proper user-scoped profile policy
CREATE POLICY "Users can view own profile"
ON public.profiles
FOR SELECT
TO authenticated
USING (auth.uid() = id);

-- 9. Remove public storage policies for contracts bucket
DROP POLICY IF EXISTS "Allow public uploads" ON storage.objects;
DROP POLICY IF EXISTS "Allow public select" ON storage.objects;

-- 10. Create authenticated user-scoped storage policies
CREATE POLICY "Authenticated users can upload own contracts"
ON storage.objects
FOR INSERT
TO authenticated
WITH CHECK (
    bucket_id = 'contracts' 
    AND (storage.foldername(name))[1] = auth.uid()::text
);

CREATE POLICY "Users can read own contracts"
ON storage.objects
FOR SELECT
TO authenticated
USING (
    bucket_id = 'contracts' 
    AND (storage.foldername(name))[1] = auth.uid()::text
);

CREATE POLICY "Users can delete own contracts"
ON storage.objects
FOR DELETE
TO authenticated
USING (
    bucket_id = 'contracts' 
    AND (storage.foldername(name))[1] = auth.uid()::text
);

-- 11. Allow service role full access to storage for edge functions
CREATE POLICY "Service role full access to contracts"
ON storage.objects
FOR ALL
USING (auth.role() = 'service_role');