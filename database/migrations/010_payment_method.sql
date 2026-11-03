-- How a job was paid (cash, Tigo Lipa, Voda Lipa, Equity Bank, or free), recorded by staff when confirming payment. Safe to run again.
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
