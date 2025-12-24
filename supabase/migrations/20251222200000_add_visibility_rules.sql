-- Add visibility_rule column to contract_variables for conditional logic
ALTER TABLE contract_variables ADD COLUMN IF NOT EXISTS visibility_rule jsonb;

-- Example rule structure:
-- {"dependsOn": "estado_civil", "operator": "equals", "value": "casado"}
-- Operators: equals, not_equals, contains, is_empty, is_not_empty

COMMENT ON COLUMN contract_variables.visibility_rule IS 'JSON rule for conditional visibility. Show field when condition is met.';

-- Add group_name if not exists (for grouping fields in forms)
ALTER TABLE contract_variables ADD COLUMN IF NOT EXISTS group_name text;
