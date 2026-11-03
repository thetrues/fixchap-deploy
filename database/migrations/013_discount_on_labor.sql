-- Promotions can discount labor only (price-list work), not parts (equipment charges). Safe to run again.
ALTER TABLE promotion ADD COLUMN IF NOT EXISTS discount_scope VARCHAR(10) NOT NULL DEFAULT 'TOTAL';
-- Tickets keep the promotion's scope from check-in, and the labor part of their repair cost
ALTER TABLE walkin_ticket ADD COLUMN IF NOT EXISTS discount_scope VARCHAR(10) NULL;
ALTER TABLE walkin_ticket ADD COLUMN IF NOT EXISTS labor_amount NUMERIC(12,2) NULL;
