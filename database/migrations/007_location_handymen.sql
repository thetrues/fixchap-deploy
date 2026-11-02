-- Handymen who work at each Service Center / Repair Clinic, and per clinic session. Safe to run again.
-- Walk-in tickets can only be assigned a handyman from the team where the device was received.
CREATE TABLE IF NOT EXISTS location_handyman (
  id SERIAL PRIMARY KEY, location_id INT NOT NULL, handyman_id INT NOT NULL, created_at TIMESTAMP NULL);
CREATE UNIQUE INDEX IF NOT EXISTS location_handyman_uniq ON location_handyman (location_id, handyman_id);
CREATE TABLE IF NOT EXISTS clinic_session_handyman (
  id SERIAL PRIMARY KEY, session_id INT NOT NULL, handyman_id INT NOT NULL, created_at TIMESTAMP NULL);
CREATE UNIQUE INDEX IF NOT EXISTS clinic_session_handyman_uniq ON clinic_session_handyman (session_id, handyman_id);
