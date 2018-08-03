BEGIN;
-- This schema will hold administrative things important to the rest of the
-- database.
--
DROP SCHEMA IF EXISTS adm CASCADE;
CREATE SCHEMA adm;
COMMENT ON SCHEMA adm IS 'Core administrative objects all other things depend on.';
COMMIT;
