BEGIN;
-- Sequence for db-unique ids.
--
CREATE SEQUENCE adm.dbuid_seq;
COMMENT ON SEQUENCE adm.dbuid_seq IS 'All db-unique ids are derived from this sequence.';
COMMIT;
