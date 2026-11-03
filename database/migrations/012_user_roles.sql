-- Staff roles with permissions (Settings → Roles). Admins (users.is_admin = 1) can do everything. Safe to run again.
CREATE TABLE IF NOT EXISTS staff_role (
  id SERIAL PRIMARY KEY, name VARCHAR(100) NOT NULL, description VARCHAR(255) NULL, permissions TEXT NOT NULL DEFAULT '',
  created_at TIMESTAMP NULL, updated_at TIMESTAMP NULL);
CREATE UNIQUE INDEX IF NOT EXISTS staff_role_name_uniq ON staff_role (lower(name));
ALTER TABLE users ADD COLUMN IF NOT EXISTS role_id INT NULL;

INSERT INTO staff_role (name, description, permissions, created_at, updated_at) VALUES
 ('Manager', 'Everything except users, settings, deleting and restoring',
  'dashboard.view,reports.view,activity.view,requests.view,requests.manage,requests.payment,walkin.view,walkin.create,walkin.work,walkin.payment,clinics.run,clients.view,clients.manage,handymen.view,handymen.manage,catalogue.manage,locations.manage', NOW(), NOW()),
 ('Receptionist', 'Front desk: requests, walk-in check-in, receiving devices and payments',
  'requests.view,requests.manage,requests.payment,walkin.view,walkin.create,walkin.payment,clinics.run,clients.view,clients.manage,handymen.view', NOW(), NOW()),
 ('Inspector', 'Technician: inspects walk-in devices, assigns the handyman, quotes and updates status',
  'walkin.view,walkin.work,clients.view,handymen.view', NOW(), NOW()),
 ('Accountant', 'Payments and reports; can view jobs but not change them',
  'dashboard.view,reports.view,requests.view,requests.payment,walkin.view,walkin.payment,clients.view', NOW(), NOW())
ON CONFLICT DO NOTHING;

-- Existing staff who are not admins keep the access they had: Manager
UPDATE users SET role_id = (SELECT id FROM staff_role WHERE name = 'Manager')
WHERE COALESCE(is_admin, 0) = 0 AND role_id IS NULL;
