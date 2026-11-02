-- The handyman the client asked for on the check-in form (the inspector still assigns). Safe to run again.
ALTER TABLE walkin_ticket ADD COLUMN IF NOT EXISTS preferred_handyman_id INT NULL;
