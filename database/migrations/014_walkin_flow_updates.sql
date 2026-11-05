-- Walk-in flow updates. Safe to run again.
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
