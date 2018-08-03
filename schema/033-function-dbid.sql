BEGIN;
-- Returns the next unused database-unique id (and will return a different one
-- next time).
--
CREATE OR REPLACE FUNCTION adm.dbid() RETURNS CHAR(16) AS $$
  BEGIN
    RETURN adm.id_from_bigint(nextval('adm.dbuid_seq'))::adm.dbid;
  END
$$ LANGUAGE 'plpgsql' VOLATILE;

COMMENT ON FUNCTION adm.dbid() IS 'Gets the next available database-unique id.';
COMMIT;
