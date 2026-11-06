-- Walk-in guided flow: longer status names, initial inspection details, who collected, services per location. Safe to run again.
ALTER TABLE walkin_ticket ALTER COLUMN status TYPE VARCHAR(20);
ALTER TABLE walkin_ticket_event ALTER COLUMN status TYPE VARCHAR(20);
-- Initial inspection (when the device is received)
ALTER TABLE walkin_ticket ADD COLUMN IF NOT EXISTS model_no VARCHAR(100) NULL;
ALTER TABLE walkin_ticket ADD COLUMN IF NOT EXISTS serial_no VARCHAR(100) NULL;
ALTER TABLE walkin_ticket ADD COLUMN IF NOT EXISTS rated_power VARCHAR(50) NULL;
-- Collection: the owner, or someone else (name and phone)
ALTER TABLE walkin_ticket ADD COLUMN IF NOT EXISTS collected_by_owner SMALLINT NULL;
ALTER TABLE walkin_ticket ADD COLUMN IF NOT EXISTS collector_name VARCHAR(150) NULL;
ALTER TABLE walkin_ticket ADD COLUMN IF NOT EXISTS collector_phone VARCHAR(20) NULL;
ALTER TABLE walkin_ticket ADD COLUMN IF NOT EXISTS collected_at TIMESTAMP NULL;
-- Services each service center / clinic takes (none = all services)
CREATE TABLE IF NOT EXISTS location_service (
  id SERIAL PRIMARY KEY, location_id INT NOT NULL, service_id INT NOT NULL, created_at TIMESTAMP NULL);
CREATE UNIQUE INDEX IF NOT EXISTS location_service_uniq ON location_service (location_id, service_id);
