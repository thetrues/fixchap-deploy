-- The client's language for SMS and email: 'en' or 'sw' (Swahili check-in form). Safe to run again.
ALTER TABLE walkin_ticket ADD COLUMN IF NOT EXISTS lang VARCHAR(2) NOT NULL DEFAULT 'en';
