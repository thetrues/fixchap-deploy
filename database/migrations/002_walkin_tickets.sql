-- Walk-in repairs: Service Centers (HQ and other branches) and Repair Clinics (pop-up sessions opened/closed by admins).
-- Home services stay in the `request` table (mobile app). Safe to run more than once.

-- A place that accepts devices. type: SERVICE_CENTER (always open while active) or REPAIR_CLINIC (only during an open session)
CREATE TABLE IF NOT EXISTS location (
  id SERIAL PRIMARY KEY, name VARCHAR(150) NOT NULL, type VARCHAR(20) NOT NULL,
  slug VARCHAR(80) NOT NULL, address VARCHAR(255) NULL, phone VARCHAR(20) NULL, is_hq SMALLINT DEFAULT 0,
  status_id INT DEFAULT 1, created_at TIMESTAMP NULL, updated_at TIMESTAMP NULL, deleted_at TIMESTAMP NULL);
CREATE UNIQUE INDEX IF NOT EXISTS location_slug_uniq ON location (slug) WHERE deleted_at IS NULL;

-- Discount + message, attached to clinic sessions. discount_type: PERCENT, FIXED or NULL (message only)
CREATE TABLE IF NOT EXISTS promotion (
  id SERIAL PRIMARY KEY, title VARCHAR(150) NOT NULL, description TEXT NULL,
  discount_type VARCHAR(10) NULL, discount_value NUMERIC(12,2) NULL,
  status_id INT DEFAULT 1, created_at TIMESTAMP NULL, updated_at TIMESTAMP NULL, deleted_at TIMESTAMP NULL);

-- One run of a repair clinic. status: SCHEDULED -> OPEN -> CLOSED (tickets are accepted only while OPEN)
CREATE TABLE IF NOT EXISTS clinic_session (
  id SERIAL PRIMARY KEY, location_id INT NOT NULL, title VARCHAR(150) NULL,
  starts_on DATE NULL, ends_on DATE NULL, promotion_id INT NULL,
  status VARCHAR(12) NOT NULL DEFAULT 'SCHEDULED', opened_at TIMESTAMP NULL, closed_at TIMESTAMP NULL,
  opened_by INT NULL, closed_by INT NULL, created_at TIMESTAMP NULL, updated_at TIMESTAMP NULL, deleted_at TIMESTAMP NULL);
CREATE INDEX IF NOT EXISTS clinic_session_location_idx ON clinic_session (location_id);
-- At most one open session per location
CREATE UNIQUE INDEX IF NOT EXISTS clinic_session_one_open ON clinic_session (location_id) WHERE status = 'OPEN' AND deleted_at IS NULL;

-- A device handed in at a location. ticket_no = 'FC' || next value of the request id counter (one FC series)
-- status: RECEIVED, INSPECTING, QUOTED, REPAIRING, READY, COLLECTED, CANCELLED
CREATE TABLE IF NOT EXISTS walkin_ticket (
  id SERIAL PRIMARY KEY, ticket_no VARCHAR(20) NULL, channel VARCHAR(20) NOT NULL,
  location_id INT NOT NULL, clinic_session_id INT NULL,
  client_name VARCHAR(150) NOT NULL, client_phone VARCHAR(20) NOT NULL, client_email VARCHAR(150) NULL, user_id INT NULL,
  service_id INT NOT NULL, equipment_id INT NULL, appliance VARCHAR(150) NOT NULL,
  brand_id INT NULL, brand_name VARCHAR(150) NULL, problem_description TEXT NOT NULL,
  agreement_text TEXT NOT NULL, agreed_at TIMESTAMP NOT NULL,
  promotion_id INT NULL, promo_title VARCHAR(150) NULL, discount_type VARCHAR(10) NULL, discount_value NUMERIC(12,2) NULL,
  quoted_amount NUMERIC(12,2) NULL, final_amount NUMERIC(12,2) NULL,
  status VARCHAR(12) NOT NULL DEFAULT 'RECEIVED', source VARCHAR(10) NOT NULL DEFAULT 'STAFF', created_by INT NULL,
  created_at TIMESTAMP NULL, updated_at TIMESTAMP NULL, deleted_at TIMESTAMP NULL);
CREATE UNIQUE INDEX IF NOT EXISTS walkin_ticket_no_uniq ON walkin_ticket (ticket_no);
CREATE INDEX IF NOT EXISTS walkin_ticket_location_idx ON walkin_ticket (location_id);
CREATE INDEX IF NOT EXISTS walkin_ticket_phone_idx ON walkin_ticket (client_phone);
CREATE INDEX IF NOT EXISTS walkin_ticket_status_idx ON walkin_ticket (status);

-- History: every status change or message sent to the client
CREATE TABLE IF NOT EXISTS walkin_ticket_event (
  id SERIAL PRIMARY KEY, ticket_id INT NOT NULL, status VARCHAR(12) NOT NULL, note TEXT NULL, message TEXT NULL,
  sms_sent SMALLINT DEFAULT 0, email_sent SMALLINT DEFAULT 0, created_by INT NULL, created_at TIMESTAMP NULL, updated_at TIMESTAMP NULL);
CREATE INDEX IF NOT EXISTS walkin_ticket_event_ticket_idx ON walkin_ticket_event (ticket_id);
