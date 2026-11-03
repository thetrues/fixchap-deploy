-- Job type on walk-in tickets, like home requests: 1 = new job, 2 = warranty job (with the warranty company). Safe to run again.
ALTER TABLE walkin_ticket ADD COLUMN IF NOT EXISTS job_type SMALLINT NOT NULL DEFAULT 1;
ALTER TABLE walkin_ticket ADD COLUMN IF NOT EXISTS company_id INT NULL;
