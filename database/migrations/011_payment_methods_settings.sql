-- Payment methods managed on the Settings page (code is saved on paid jobs and never changes). Safe to run again.
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
