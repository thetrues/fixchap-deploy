-- Quality assurance (device check) before payment, done by the ticket's inspector. Safe to run again.
ALTER TABLE walkin_ticket ADD COLUMN IF NOT EXISTS qa_by INT NULL;
ALTER TABLE walkin_ticket ADD COLUMN IF NOT EXISTS qa_at TIMESTAMP NULL;
ALTER TABLE walkin_ticket ADD COLUMN IF NOT EXISTS qa_notes TEXT NULL;
-- Managers may change the inspector (when the receiver is away). Applied once, like 016.
CREATE TABLE IF NOT EXISTS app_once (name VARCHAR(100) PRIMARY KEY, done_at TIMESTAMP NULL);
UPDATE staff_role SET permissions = CASE WHEN COALESCE(permissions, '') = '' THEN 'walkin.assign_receiver' ELSE permissions || ',walkin.assign_receiver' END,
  updated_at = NOW()
WHERE name = 'Manager'
  AND position('walkin.assign_receiver' IN COALESCE(permissions, '')) = 0
  AND NOT EXISTS (SELECT 1 FROM app_once WHERE name = '017_manager_change_inspector');
INSERT INTO app_once (name, done_at) VALUES ('017_manager_change_inspector', NOW()) ON CONFLICT (name) DO NOTHING;
