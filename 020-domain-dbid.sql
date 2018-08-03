BEGIN;
-- 'dbid' is short for 'database id'. In Coeus, every row in every table will 
-- have a database-unique primary key, unless the thing being indexed has a 
-- suitable natural key. 
-- 
-- These ids are being generated by a single, database-wide sequence.
-- There is a function pulling ids from that sequence and converting them to
-- the desired format, which is CHAR(16) containing the id in base36 (that is 
-- represented using 0-9 and A-Z).

-- The biggest postgresql BIGINT number, in base36, will only be 13 CHARACTERS
-- long. We still declare 16, giving a prefix 'id-'.
--
CREATE DOMAIN adm.dbid AS CHAR(16) NOT NULL CHECK (VALUE ~ '^id-[A-Z0-9]{13}$');
COMMENT ON DOMAIN adm.dbid IS 'Data type for database-unique ids.';
COMMIT;