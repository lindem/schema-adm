BEGIN;
-- Converts an id back into a BIGINT.
-- TODO not implemented
--
CREATE OR REPLACE FUNCTION adm.bigint_from_id(database_id adm.dbid) RETURNS BIGINT AS
$$
  BEGIN
    RAISE EXCEPTION 'bigint_from_id() not implemented';
  END
$$ LANGUAGE 'plpgsql' STABLE;

COMMENT ON FUNCTION adm.bigint_from_id IS 'Converts a dbid into a BIGINT.'; 
COMMIT;
