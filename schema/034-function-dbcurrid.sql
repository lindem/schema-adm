BEGIN;
-- Returns the last database-unique id from this session.
--
CREATE OR REPLACE FUNCTION adm.dbcurrid() RETURNS CHAR(16) AS $$
  BEGIN
    RETURN adm.id_from_bigint(currval('adm.dbuid_seq'));
  END
$$ LANGUAGE 'plpgsql' VOLATILE;

COMMENT ON FUNCTION adm.dbcurrid IS 'Returns the current maximum id the database is using.';
COMMIT;
