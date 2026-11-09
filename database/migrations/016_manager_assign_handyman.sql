-- Managers may assign the handyman on any walk-in ticket (not only on tickets they received). Applied once:
-- if an admin later removes the permission from Manager on Settings → Roles, running this again does not add it back.
CREATE TABLE IF NOT EXISTS app_once (name VARCHAR(100) PRIMARY KEY, done_at TIMESTAMP NULL);
UPDATE staff_role SET permissions = CASE WHEN COALESCE(permissions, '') = '' THEN 'walkin.assign_handyman' ELSE permissions || ',walkin.assign_handyman' END,
  updated_at = NOW()
WHERE name = 'Manager'
  AND position('walkin.assign_handyman' IN COALESCE(permissions, '')) = 0
  AND NOT EXISTS (SELECT 1 FROM app_once WHERE name = '016_manager_assign_handyman');
INSERT INTO app_once (name, done_at) VALUES ('016_manager_assign_handyman', NOW()) ON CONFLICT (name) DO NOTHING;
