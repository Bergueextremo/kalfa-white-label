-- Enable RLS
ALTER TABLE public.auditorias_contratos ENABLE ROW LEVEL SECURITY;

-- Policy: Admins can do everything
CREATE POLICY "Admins can manage all audits" 
ON public.auditorias_contratos 
FOR ALL 
TO authenticated 
USING (public.has_role(auth.uid(), 'admin'));

-- Policy: Users can select their own audits
CREATE POLICY "Users can view own audits" 
ON public.auditorias_contratos 
FOR SELECT 
TO authenticated 
USING (auth.uid() = user_id);

-- Policy: Users can insert their own audits
CREATE POLICY "Users can insert own audits" 
ON public.auditorias_contratos 
FOR INSERT 
TO authenticated 
WITH CHECK (auth.uid() = user_id);

-- Policy: Users can update their own audits
CREATE POLICY "Users can update own audits" 
ON public.auditorias_contratos 
FOR UPDATE 
TO authenticated 
USING (auth.uid() = user_id);
