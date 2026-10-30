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
