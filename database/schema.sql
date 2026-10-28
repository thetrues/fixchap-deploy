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

INSERT INTO status (id, status_code) VALUES
 (1,'ACTIVE'),(2,'DELETED'),(3,'UPDATED'),(4,'PENDING'),(5,'NOT AVAILABLE'),(6,'EXPIRED'),
 (7,'SEARCHING_HANDYMAN'),(8,'HANDYMAN_CONFIRMED'),(9,'QUOTATION_RAISED'),(10,'ON_WORK'),(11,'WORK_COMPLETED'),
 (12,'CANCELLED'),(13,'CLOSED'),(14,'PRE_CANCELLED'),(15,'PAYMENT_CONFIRMED'),(16,'INACTIVE')
ON CONFLICT (id) DO NOTHING;
