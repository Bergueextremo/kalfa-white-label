-- Add user-scoped SELECT policy for pending_activations table
-- This provides defense-in-depth: users can only see their own pending activations

CREATE POLICY "Users can view own pending activations"
  ON public.pending_activations
  FOR SELECT
  TO authenticated
  USING (
    auth.uid() = user_id 
    OR (user_id IS NULL AND email = (auth.jwt()->>'email'))
  );