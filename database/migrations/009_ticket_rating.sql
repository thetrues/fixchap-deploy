-- Client rating for walk-in tickets: a private link (rate_token) is sent by SMS/email when the device is collected. Safe to run again.
ALTER TABLE walkin_ticket ADD COLUMN IF NOT EXISTS rate_token VARCHAR(40) NULL;
ALTER TABLE walkin_ticket ADD COLUMN IF NOT EXISTS rating SMALLINT NULL;
ALTER TABLE walkin_ticket ADD COLUMN IF NOT EXISTS rating_comment TEXT NULL;
ALTER TABLE walkin_ticket ADD COLUMN IF NOT EXISTS rated_at TIMESTAMP NULL;
UPDATE walkin_ticket SET rate_token = replace(gen_random_uuid()::text, '-', '') WHERE rate_token IS NULL;
CREATE UNIQUE INDEX IF NOT EXISTS walkin_ticket_rate_token_uniq ON walkin_ticket (rate_token);
