BEGIN;
-- Returns the characters a base36 digit can appear as.
--
CREATE OR REPLACE FUNCTION adm.base36_digits() RETURNS CHAR[] AS
$$
  BEGIN
  RETURN ARRAY[
    '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', -- 00 - 09
    'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', -- 10 - 19
    'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', -- 20 - 29
    'U', 'V', 'W', 'X', 'Y', 'Z']; -- 30 - 35
  END
$$ LANGUAGE 'plpgsql' IMMUTABLE;
COMMENT ON FUNCTION adm.base36_digits() IS 'returns the character set for dbids';
COMMIT;
