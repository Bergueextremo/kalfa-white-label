-- Create pending_activations table for payment-before-signup flow
CREATE TABLE IF NOT EXISTS pending_activations (
  id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  email TEXT NOT NULL,
  plan_id TEXT NOT NULL,
  credits INTEGER NOT NULL,
  amount DECIMAL(10,2) NOT NULL,
  appmax_order_id TEXT NOT NULL,
  payment_status TEXT DEFAULT 'pending',
  created_at TIMESTAMPTZ DEFAULT NOW(),
  expires_at TIMESTAMPTZ DEFAULT NOW() + INTERVAL '48 hours',
  activated BOOLEAN DEFAULT FALSE,
  activated_at TIMESTAMPTZ,
  user_id UUID REFERENCES auth.users(id),
  
  CONSTRAINT unique_email_order UNIQUE(email, appmax_order_id)
);

-- Index para busca rápida por email
CREATE INDEX idx_pending_activations_email ON pending_activations(email) WHERE activated = FALSE;

-- Index para limpeza de expirados
CREATE INDEX idx_pending_activations_expires ON pending_activations(expires_at) WHERE activated = FALSE;

-- RLS Policies
ALTER TABLE pending_activations ENABLE ROW LEVEL SECURITY;

-- Service role pode fazer tudo
CREATE POLICY "Service role full access" ON pending_activations
  FOR ALL USING (auth.role() = 'service_role');

-- Comentários para documentação
COMMENT ON TABLE pending_activations IS 'Armazena ativações pendentes de usuários que pagaram mas ainda não criaram conta';
COMMENT ON COLUMN pending_activations.email IS 'Email do cliente que realizou o pagamento';
COMMENT ON COLUMN pending_activations.plan_id IS 'ID do plano comprado (start, essencial, enterprise)';
COMMENT ON COLUMN pending_activations.credits IS 'Quantidade de créditos a serem liberados';
COMMENT ON COLUMN pending_activations.amount IS 'Valor pago pelo plano';
COMMENT ON COLUMN pending_activations.appmax_order_id IS 'ID do pedido na Appmax';
COMMENT ON COLUMN pending_activations.expires_at IS 'Data de expiração da ativação (48 horas após criação)';
COMMENT ON COLUMN pending_activations.activated IS 'Flag indicando se a ativação já foi processada';
COMMENT ON COLUMN pending_activations.user_id IS 'ID do usuário criado após ativação';
