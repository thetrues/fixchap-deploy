-- FixChap PostgreSQL schema.
-- Same tables and columns as the Laravel MySQL database, so existing data can be copied straight across
-- (see mysql-to-postgres.load). Use this file for a fresh database or local development.

CREATE TABLE IF NOT EXISTS status (id INT PRIMARY KEY, status_code VARCHAR(50) NOT NULL);

CREATE TABLE IF NOT EXISTS users (
  id BIGSERIAL PRIMARY KEY, name VARCHAR(255) NOT NULL, email VARCHAR(255) NOT NULL UNIQUE,
  email_verified_at TIMESTAMP NULL, password VARCHAR(255) NOT NULL, role VARCHAR(10) DEFAULT 'user',
  is_admin SMALLINT DEFAULT 0, remember_token VARCHAR(100) NULL, created_at TIMESTAMP NULL, updated_at TIMESTAMP NULL);

CREATE TABLE IF NOT EXISTS "user" (
  id SERIAL PRIMARY KEY, tag VARCHAR(20), status_id INT DEFAULT 1,
  created_at TIMESTAMP NULL, updated_at TIMESTAMP NULL, deleted_at TIMESTAMP NULL);
CREATE INDEX IF NOT EXISTS user_tag_idx ON "user" (tag);

CREATE TABLE IF NOT EXISTS user_desc (
  id SERIAL PRIMARY KEY, user_id INT, mobile VARCHAR(20), firstname VARCHAR(100), middlename VARCHAR(100),
  lastname VARCHAR(100), alternative_mobile VARCHAR(20), email VARCHAR(150), gender VARCHAR(10), profile_photo VARCHAR(255),
  birthdate DATE NULL, password VARCHAR(255), reset_code VARCHAR(50), status_id INT DEFAULT 1,
  created_at TIMESTAMP NULL, updated_at TIMESTAMP NULL, deleted_at TIMESTAMP NULL);
CREATE INDEX IF NOT EXISTS user_desc_user_idx ON user_desc (user_id);
CREATE INDEX IF NOT EXISTS user_desc_mobile_idx ON user_desc (mobile);

CREATE TABLE IF NOT EXISTS address (
  id SERIAL PRIMARY KEY, user_id INT, address_title VARCHAR(100), geo_name VARCHAR(255),
  latitude DOUBLE PRECISION, longitude DOUBLE PRECISION, status_id INT DEFAULT 1,
  created_at TIMESTAMP NULL, updated_at TIMESTAMP NULL, deleted_at TIMESTAMP NULL);
CREATE INDEX IF NOT EXISTS address_user_idx ON address (user_id);

CREATE TABLE IF NOT EXISTS addresses (
  id SERIAL PRIMARY KEY, name VARCHAR(255), latitude DOUBLE PRECISION, longitude DOUBLE PRECISION, created_by INT,
  created_at TIMESTAMP NULL, updated_at TIMESTAMP NULL, deleted_at TIMESTAMP NULL);

CREATE TABLE IF NOT EXISTS service (
  id SERIAL PRIMARY KEY, service_name VARCHAR(150), status_id INT DEFAULT 1, priority INT DEFAULT 1,
  created_at TIMESTAMP NULL, updated_at TIMESTAMP NULL, deleted_at TIMESTAMP NULL);

CREATE TABLE IF NOT EXISTS pricing (
  id SERIAL PRIMARY KEY, description VARCHAR(255), amount NUMERIC(12,2), service_id INT,
  price_type VARCHAR(30), status_id INT DEFAULT 1, priority INT DEFAULT 1,
  created_at TIMESTAMP NULL, updated_at TIMESTAMP NULL, deleted_at TIMESTAMP NULL);
CREATE INDEX IF NOT EXISTS pricing_service_idx ON pricing (service_id);

CREATE TABLE IF NOT EXISTS companies (
  id SERIAL PRIMARY KEY, company_name VARCHAR(150), mobile VARCHAR(20), altenative_mobile VARCHAR(20),
  email VARCHAR(150), address VARCHAR(255), created_at TIMESTAMP NULL, updated_at TIMESTAMP NULL, deleted_at TIMESTAMP NULL);

CREATE TABLE IF NOT EXISTS company_services (
  id SERIAL PRIMARY KEY, company_id INT, service_id INT, created_at TIMESTAMP NULL, updated_at TIMESTAMP NULL);

CREATE TABLE IF NOT EXISTS handyman (
  id SERIAL PRIMARY KEY, tag VARCHAR(20), hanyman_desc_id INT NULL, services TEXT, status_id INT DEFAULT 1,
  created_at TIMESTAMP NULL, updated_at TIMESTAMP NULL, deleted_at TIMESTAMP NULL);

CREATE TABLE IF NOT EXISTS handyman_desc (
  id SERIAL PRIMARY KEY, handyman_id INT, mobile VARCHAR(20), firstname VARCHAR(100), middlename VARCHAR(100),
  lastname VARCHAR(100), alternative_mobile VARCHAR(20), email VARCHAR(150), gender VARCHAR(10), profile_photo VARCHAR(255),
  birthdate DATE NULL, status_id INT DEFAULT 1, latitude DOUBLE PRECISION NULL, longitude DOUBLE PRECISION NULL, address VARCHAR(255),
  created_at TIMESTAMP NULL, updated_at TIMESTAMP NULL, deleted_at TIMESTAMP NULL);
CREATE INDEX IF NOT EXISTS handyman_desc_hid_idx ON handyman_desc (handyman_id);

CREATE TABLE IF NOT EXISTS handyman_service (
  id SERIAL PRIMARY KEY, handyman_id INT, service_id INT, status_id INT DEFAULT 1,
  created_at TIMESTAMP NULL, updated_at TIMESTAMP NULL);
CREATE INDEX IF NOT EXISTS handyman_service_hid_idx ON handyman_service (handyman_id);

CREATE TABLE IF NOT EXISTS handyman_availability (
  id SERIAL PRIMARY KEY, handyman_id INT, status_id INT DEFAULT 1, created_at TIMESTAMP NULL, updated_at TIMESTAMP NULL);

CREATE TABLE IF NOT EXISTS handyman_request_reject (
  id SERIAL PRIMARY KEY, handyman_id INT, request_id INT, created_at TIMESTAMP NULL, updated_at TIMESTAMP NULL);

CREATE TABLE IF NOT EXISTS request (
  id SERIAL PRIMARY KEY, user_id INT, service_id INT, address_id INT, attend_time TIMESTAMP NULL,
  description TEXT, request_type INT DEFAULT 1, company_id INT NULL, status_id INT DEFAULT 1, flag_status_id INT DEFAULT 7,
  created_at TIMESTAMP NULL, updated_at TIMESTAMP NULL, deleted_at TIMESTAMP NULL);
CREATE INDEX IF NOT EXISTS request_user_idx ON request (user_id);
CREATE INDEX IF NOT EXISTS request_flag_idx ON request (flag_status_id);

CREATE TABLE IF NOT EXISTS request_status (
  id SERIAL PRIMARY KEY, request_id INT, status_id INT, created_at TIMESTAMP NULL, updated_at TIMESTAMP NULL);
CREATE INDEX IF NOT EXISTS request_status_rid_idx ON request_status (request_id);

CREATE TABLE IF NOT EXISTS request_handyman (
  id SERIAL PRIMARY KEY, request_id INT, handyman_id INT, status_id INT DEFAULT 1, assigned_at TIMESTAMP NULL,
  assigned_by INT NULL, replacement_reason TEXT NULL, previous_handyman_id VARCHAR(20) NULL,
  created_at TIMESTAMP NULL, updated_at TIMESTAMP NULL);
CREATE INDEX IF NOT EXISTS request_handyman_rid_idx ON request_handyman (request_id);
CREATE INDEX IF NOT EXISTS request_handyman_hid_idx ON request_handyman (handyman_id);

CREATE TABLE IF NOT EXISTS request_cancellation_reason (
  id SERIAL PRIMARY KEY, request_id INT, description TEXT, created_at TIMESTAMP NULL, updated_at TIMESTAMP NULL);

CREATE TABLE IF NOT EXISTS quotation (
  id SERIAL PRIMARY KEY, request_id INT, description TEXT, status_id INT DEFAULT 4, created_by INT NULL,
  created_at TIMESTAMP NULL, updated_at TIMESTAMP NULL);
CREATE INDEX IF NOT EXISTS quotation_rid_idx ON quotation (request_id);

CREATE TABLE IF NOT EXISTS quotation_item (
  id SERIAL PRIMARY KEY, quotation_id INT, price_id INT, quantity INT DEFAULT 1, unit_price NUMERIC(12,2),
  status_id INT DEFAULT 1, created_at TIMESTAMP NULL, updated_at TIMESTAMP NULL);
CREATE INDEX IF NOT EXISTS quotation_item_qid_idx ON quotation_item (quotation_id);

CREATE TABLE IF NOT EXISTS rating_review (
  id SERIAL PRIMARY KEY, request_id INT, handyman_id INT, ratings INT, review TEXT, status_id INT DEFAULT 1,
  created_at TIMESTAMP NULL, updated_at TIMESTAMP NULL);

CREATE TABLE IF NOT EXISTS transactionsms (
  id SERIAL PRIMARY KEY, request_id INT, sms TEXT, handyman_id INT NULL, created_at TIMESTAMP NULL, updated_at TIMESTAMP NULL);

CREATE TABLE IF NOT EXISTS asset (
  id SERIAL PRIMARY KEY, asset_desc VARCHAR(50), file_name VARCHAR(255), request_id INT, status_id INT DEFAULT 1,
  created_at TIMESTAMP NULL, updated_at TIMESTAMP NULL);

CREATE TABLE IF NOT EXISTS "session" (
  id SERIAL PRIMARY KEY, user_id INT NULL, handyman_id INT NULL, session_code VARCHAR(64), fcm_token TEXT,
  status_id INT DEFAULT 1, device_desc TEXT, last_seen TIMESTAMP NULL, created_at TIMESTAMP NULL, updated_at TIMESTAMP NULL);
CREATE INDEX IF NOT EXISTS session_code_idx ON "session" (session_code);

CREATE TABLE IF NOT EXISTS otp (
  id SERIAL PRIMARY KEY, code VARCHAR(10), mobile VARCHAR(20), status_id INT DEFAULT 1,
  created_at TIMESTAMP NULL, updated_at TIMESTAMP NULL);

CREATE TABLE IF NOT EXISTS sms (
  id SERIAL PRIMARY KEY, user_id INT NULL, mobile VARCHAR(20), content TEXT, reference VARCHAR(100), status_id INT,
  created_at TIMESTAMP NULL, updated_at TIMESTAMP NULL);

CREATE TABLE IF NOT EXISTS activities (
  id BIGSERIAL PRIMARY KEY, user_id BIGINT, activity_type VARCHAR(255), request_id INT,
  description TEXT, created_at TIMESTAMP NULL, updated_at TIMESTAMP NULL);

-- Brands and equipment (dashboard: Brands, Equipment). Safe to run more than once.
CREATE TABLE IF NOT EXISTS brand (
  id SERIAL PRIMARY KEY, brand_name VARCHAR(150) NOT NULL, status_id INT DEFAULT 1,
  created_at TIMESTAMP NULL, updated_at TIMESTAMP NULL, deleted_at TIMESTAMP NULL);
CREATE UNIQUE INDEX IF NOT EXISTS brand_name_uniq ON brand (lower(brand_name)) WHERE deleted_at IS NULL;

-- Every piece of equipment belongs to a service (e.g. "Split AC" -> Air Conditioning); the brand is optional.
CREATE TABLE IF NOT EXISTS equipment (
  id SERIAL PRIMARY KEY, equipment_name VARCHAR(150) NOT NULL, service_id INT NOT NULL, brand_id INT NULL,
  status_id INT DEFAULT 1, created_at TIMESTAMP NULL, updated_at TIMESTAMP NULL, deleted_at TIMESTAMP NULL);
CREATE INDEX IF NOT EXISTS equipment_service_idx ON equipment (service_id);
CREATE INDEX IF NOT EXISTS equipment_brand_idx ON equipment (brand_id);

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
  status VARCHAR(20) NOT NULL DEFAULT 'RECEIVED', source VARCHAR(10) NOT NULL DEFAULT 'STAFF', created_by INT NULL,
  created_at TIMESTAMP NULL, updated_at TIMESTAMP NULL, deleted_at TIMESTAMP NULL);
CREATE UNIQUE INDEX IF NOT EXISTS walkin_ticket_no_uniq ON walkin_ticket (ticket_no);
CREATE INDEX IF NOT EXISTS walkin_ticket_location_idx ON walkin_ticket (location_id);
CREATE INDEX IF NOT EXISTS walkin_ticket_phone_idx ON walkin_ticket (client_phone);
CREATE INDEX IF NOT EXISTS walkin_ticket_status_idx ON walkin_ticket (status);
-- Workflow (004): who received the device, the inspector (dashboard user) and the handyman
ALTER TABLE walkin_ticket ADD COLUMN IF NOT EXISTS received_by INT NULL;
ALTER TABLE walkin_ticket ADD COLUMN IF NOT EXISTS received_at TIMESTAMP NULL;
ALTER TABLE walkin_ticket ADD COLUMN IF NOT EXISTS inspector_id INT NULL;
ALTER TABLE walkin_ticket ADD COLUMN IF NOT EXISTS inspector_assigned_at TIMESTAMP NULL;
ALTER TABLE walkin_ticket ADD COLUMN IF NOT EXISTS handyman_id INT NULL;
ALTER TABLE walkin_ticket ADD COLUMN IF NOT EXISTS handyman_assigned_at TIMESTAMP NULL;
CREATE INDEX IF NOT EXISTS walkin_ticket_inspector_idx ON walkin_ticket (inspector_id);
CREATE INDEX IF NOT EXISTS walkin_ticket_handyman_idx ON walkin_ticket (handyman_id);
-- 005: the handyman the client asked for on the check-in form
ALTER TABLE walkin_ticket ADD COLUMN IF NOT EXISTS preferred_handyman_id INT NULL;
-- 006: the client's language for SMS and email ('en' or 'sw')
ALTER TABLE walkin_ticket ADD COLUMN IF NOT EXISTS lang VARCHAR(2) NOT NULL DEFAULT 'en';
-- 007: handymen who work at each location and per clinic session
CREATE TABLE IF NOT EXISTS location_handyman (
  id SERIAL PRIMARY KEY, location_id INT NOT NULL, handyman_id INT NOT NULL, created_at TIMESTAMP NULL);
CREATE UNIQUE INDEX IF NOT EXISTS location_handyman_uniq ON location_handyman (location_id, handyman_id);
CREATE TABLE IF NOT EXISTS clinic_session_handyman (
  id SERIAL PRIMARY KEY, session_id INT NOT NULL, handyman_id INT NOT NULL, created_at TIMESTAMP NULL);
CREATE UNIQUE INDEX IF NOT EXISTS clinic_session_handyman_uniq ON clinic_session_handyman (session_id, handyman_id);
-- 008: job type (1 new, 2 warranty) and the warranty company
ALTER TABLE walkin_ticket ADD COLUMN IF NOT EXISTS job_type SMALLINT NOT NULL DEFAULT 1;
ALTER TABLE walkin_ticket ADD COLUMN IF NOT EXISTS company_id INT NULL;
-- 009: client rating (1-5 stars) through a private link sent when the device is collected
ALTER TABLE walkin_ticket ADD COLUMN IF NOT EXISTS rate_token VARCHAR(40) NULL;
ALTER TABLE walkin_ticket ADD COLUMN IF NOT EXISTS rating SMALLINT NULL;
ALTER TABLE walkin_ticket ADD COLUMN IF NOT EXISTS rating_comment TEXT NULL;
ALTER TABLE walkin_ticket ADD COLUMN IF NOT EXISTS rated_at TIMESTAMP NULL;
CREATE UNIQUE INDEX IF NOT EXISTS walkin_ticket_rate_token_uniq ON walkin_ticket (rate_token);
-- 010: how the job was paid (home requests and walk-in tickets)
ALTER TABLE request ADD COLUMN IF NOT EXISTS payment_method VARCHAR(20) NULL;
ALTER TABLE request ADD COLUMN IF NOT EXISTS payment_ref VARCHAR(100) NULL;
ALTER TABLE request ADD COLUMN IF NOT EXISTS amount_paid NUMERIC(12,2) NULL;
ALTER TABLE request ADD COLUMN IF NOT EXISTS paid_at TIMESTAMP NULL;
ALTER TABLE request ADD COLUMN IF NOT EXISTS paid_by INT NULL;
ALTER TABLE walkin_ticket ADD COLUMN IF NOT EXISTS payment_method VARCHAR(20) NULL;
ALTER TABLE walkin_ticket ADD COLUMN IF NOT EXISTS payment_ref VARCHAR(100) NULL;
ALTER TABLE walkin_ticket ADD COLUMN IF NOT EXISTS amount_paid NUMERIC(12,2) NULL;
ALTER TABLE walkin_ticket ADD COLUMN IF NOT EXISTS paid_at TIMESTAMP NULL;
ALTER TABLE walkin_ticket ADD COLUMN IF NOT EXISTS paid_by INT NULL;
-- 011: payment methods managed on the Settings page
CREATE TABLE IF NOT EXISTS payment_method (
  id SERIAL PRIMARY KEY, code VARCHAR(20) NOT NULL, name VARCHAR(100) NOT NULL, name_sw VARCHAR(100) NULL,
  takes_reference SMALLINT NOT NULL DEFAULT 0, is_free SMALLINT NOT NULL DEFAULT 0,
  active SMALLINT NOT NULL DEFAULT 1, sort_order INT NOT NULL DEFAULT 0,
  created_at TIMESTAMP NULL, updated_at TIMESTAMP NULL);
CREATE UNIQUE INDEX IF NOT EXISTS payment_method_code_uniq ON payment_method (code);
INSERT INTO payment_method (code, name, name_sw, takes_reference, is_free, active, sort_order, created_at, updated_at) VALUES
 ('CASH', 'Cash', 'Taslimu (cash)', 0, 0, 1, 1, NOW(), NOW()),
 ('TIGO_LIPA', 'Tigo Lipa Namba', 'Tigo Lipa Namba', 1, 0, 1, 2, NOW(), NOW()),
 ('VODA_LIPA', 'Voda Lipa Namba', 'Voda Lipa Namba', 1, 0, 1, 3, NOW(), NOW()),
 ('EQUITY_BANK', 'Equity Bank', 'Benki ya Equity', 1, 0, 1, 4, NOW(), NOW()),
 ('FREE', 'Free (no charge)', 'Bure (hakuna malipo)', 0, 1, 1, 5, NOW(), NOW())
ON CONFLICT (code) DO NOTHING;
-- 012: staff roles with permissions
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

-- 013: discount on labor only
ALTER TABLE promotion ADD COLUMN IF NOT EXISTS discount_scope VARCHAR(10) NOT NULL DEFAULT 'TOTAL';
-- Tickets keep the promotion's scope from check-in, and the labor part of their repair cost
ALTER TABLE walkin_ticket ADD COLUMN IF NOT EXISTS discount_scope VARCHAR(10) NULL;
ALTER TABLE walkin_ticket ADD COLUMN IF NOT EXISTS labor_amount NUMERIC(12,2) NULL;

-- 014: walk-in flow updates
-- Payment details sent with "Ready for pickup & payment" (e.g. "Lipa Namba 123456 — FixChap Co. Ltd")
ALTER TABLE payment_method ADD COLUMN IF NOT EXISTS details TEXT NULL;
-- Who prepared the quote, and a short explanation of the problem found (shown to the client)
ALTER TABLE walkin_ticket ADD COLUMN IF NOT EXISTS quoted_by INT NULL;
ALTER TABLE walkin_ticket ADD COLUMN IF NOT EXISTS quoted_at TIMESTAMP NULL;
ALTER TABLE walkin_ticket ADD COLUMN IF NOT EXISTS quote_notes TEXT NULL;
-- Appliance capacity / size (2L, 5L, 1.5HP …), chosen from the service's size options
ALTER TABLE walkin_ticket ADD COLUMN IF NOT EXISTS appliance_size VARCHAR(50) NULL;
ALTER TABLE service ADD COLUMN IF NOT EXISTS size_options TEXT NULL;
-- Cancelled tickets: the assessment fee charged (NULL = no charge)
ALTER TABLE walkin_ticket ADD COLUMN IF NOT EXISTS cancel_fee NUMERIC(12,2) NULL;
-- Warranty companies each service center works with
CREATE TABLE IF NOT EXISTS location_company (
  id SERIAL PRIMARY KEY, location_id INT NOT NULL, company_id INT NOT NULL, created_at TIMESTAMP NULL);
CREATE UNIQUE INDEX IF NOT EXISTS location_company_uniq ON location_company (location_id, company_id);

-- 015: walk-in guided flow
-- (status columns are VARCHAR(20) in the CREATE TABLE statements)
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

-- History: every status change or message sent to the client
CREATE TABLE IF NOT EXISTS walkin_ticket_event (
  id SERIAL PRIMARY KEY, ticket_id INT NOT NULL, status VARCHAR(20) NOT NULL, note TEXT NULL, message TEXT NULL,
  sms_sent SMALLINT DEFAULT 0, email_sent SMALLINT DEFAULT 0, created_by INT NULL, created_at TIMESTAMP NULL, updated_at TIMESTAMP NULL);
CREATE INDEX IF NOT EXISTS walkin_ticket_event_ticket_idx ON walkin_ticket_event (ticket_id);

-- Priced options per equipment (e.g. Split AC -> Gas refill 80,000), usable as quotation lines. Safe to run again.
CREATE TABLE IF NOT EXISTS equipment_option (
  id SERIAL PRIMARY KEY, equipment_id INT NOT NULL, name VARCHAR(150) NOT NULL, amount NUMERIC(12,2) NOT NULL DEFAULT 0,
  priority INT DEFAULT 1, status_id INT DEFAULT 1, created_at TIMESTAMP NULL, updated_at TIMESTAMP NULL, deleted_at TIMESTAMP NULL);
CREATE INDEX IF NOT EXISTS equipment_option_equipment_idx ON equipment_option (equipment_id);

-- Home-request quotation lines can now be an equipment option instead of a price-list item.
-- `description` keeps the line name as quoted, so the apps can show it.
ALTER TABLE quotation_item ADD COLUMN IF NOT EXISTS equipment_option_id INT NULL;
ALTER TABLE quotation_item ADD COLUMN IF NOT EXISTS description VARCHAR(255) NULL;
-- Equipment lines have no price-list item (the MySQL import made price_id required)
ALTER TABLE quotation_item ALTER COLUMN price_id DROP NOT NULL;

-- Itemized quote for walk-in tickets (price-list items and equipment options)
CREATE TABLE IF NOT EXISTS walkin_quote_item (
  id SERIAL PRIMARY KEY, ticket_id INT NOT NULL, price_id INT NULL, equipment_option_id INT NULL,
  description VARCHAR(255) NOT NULL, quantity INT NOT NULL DEFAULT 1, unit_price NUMERIC(12,2) NOT NULL DEFAULT 0,
  created_at TIMESTAMP NULL, updated_at TIMESTAMP NULL);
CREATE INDEX IF NOT EXISTS walkin_quote_item_ticket_idx ON walkin_quote_item (ticket_id);

INSERT INTO status (id, status_code) VALUES
 (1,'ACTIVE'),(2,'DELETED'),(3,'UPDATED'),(4,'PENDING'),(5,'NOT AVAILABLE'),(6,'EXPIRED'),
 (7,'SEARCHING_HANDYMAN'),(8,'HANDYMAN_CONFIRMED'),(9,'QUOTATION_RAISED'),(10,'ON_WORK'),(11,'WORK_COMPLETED'),
 (12,'CANCELLED'),(13,'CLOSED'),(14,'PRE_CANCELLED'),(15,'PAYMENT_CONFIRMED'),(16,'INACTIVE')
ON CONFLICT (id) DO NOTHING;
