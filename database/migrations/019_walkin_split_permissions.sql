-- 019: split role permissions.
--   "Create tickets and receive devices" -> walkin.create (create tickets) + walkin.receive (receive devices)
--   "Inspect and repair"                 -> walkin.work (repair) + walkin.quote (build quotes)
-- Existing roles keep what they could do before: whoever had one gets both.
UPDATE staff_role SET permissions = permissions || ',walkin.receive'
 WHERE (',' || permissions || ',') LIKE '%,walkin.create,%' AND (',' || permissions || ',') NOT LIKE '%,walkin.receive,%';
UPDATE staff_role SET permissions = permissions || ',walkin.quote'
 WHERE (',' || permissions || ',') LIKE '%,walkin.work,%' AND (',' || permissions || ',') NOT LIKE '%,walkin.quote,%';
