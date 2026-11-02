-- Walk-in workflow: online check-ins wait for the device (status PENDING), then staff record who received it,
-- assign an inspector (dashboard user) and a handyman. Safe to run again.
ALTER TABLE walkin_ticket ADD COLUMN IF NOT EXISTS received_by INT NULL;
ALTER TABLE walkin_ticket ADD COLUMN IF NOT EXISTS received_at TIMESTAMP NULL;
ALTER TABLE walkin_ticket ADD COLUMN IF NOT EXISTS inspector_id INT NULL;
ALTER TABLE walkin_ticket ADD COLUMN IF NOT EXISTS inspector_assigned_at TIMESTAMP NULL;
ALTER TABLE walkin_ticket ADD COLUMN IF NOT EXISTS handyman_id INT NULL;
ALTER TABLE walkin_ticket ADD COLUMN IF NOT EXISTS handyman_assigned_at TIMESTAMP NULL;
CREATE INDEX IF NOT EXISTS walkin_ticket_inspector_idx ON walkin_ticket (inspector_id);
CREATE INDEX IF NOT EXISTS walkin_ticket_handyman_idx ON walkin_ticket (handyman_id);

-- Tickets made before this change were received when they were created
UPDATE walkin_ticket SET received_at = created_at, received_by = created_by
WHERE received_at IS NULL AND status <> 'PENDING';
