-- The client's answer to the quotation (approve / decline) given in the app. Safe to run again.
ALTER TABLE walkin_ticket ADD COLUMN IF NOT EXISTS quote_response VARCHAR(10) NULL;
ALTER TABLE walkin_ticket ADD COLUMN IF NOT EXISTS quote_response_at TIMESTAMP NULL;
ALTER TABLE walkin_ticket ADD COLUMN IF NOT EXISTS quote_response_note VARCHAR(500) NULL;
