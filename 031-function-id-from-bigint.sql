BEGIN;
-- Converts a BIGINT into a dbid (that is a base-36-representation of the 
-- bigint that is exactly 13 CHAR wide with a prefix of 'id-').
--
CREATE OR REPLACE FUNCTION adm.id_from_bigint(num BIGINT) RETURNS adm.dbid AS
$$
DECLARE
  digits CHAR[] := adm.base36_digits(); 
  result       TEXT := '';
  intermediate INTEGER;
  charcode     INTEGER;
BEGIN
  IF num < 0
  THEN
    RETURN NULL;
  END IF;

  WHILE num > 0 LOOP
    intermediate := num % 36;
    -- WARNING: postgres arrays are 1-based, not 0-based.
    result := digits[intermediate + 1] || result;
    num := floor(num / 36);
  END LOOP;

  -- left-pad to size. cast to dbid, as lpad returns string.
  RETURN ('id-' || lpad(result, 13, '0'))::adm.dbid;
END
$$ LANGUAGE 'plpgsql' STABLE;
COMMIT;
