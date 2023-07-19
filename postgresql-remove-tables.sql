--Apagando as tabelas existentes que se iniciam com tbl_
DO $$
  DECLARE
    recs RECORD;
  BEGIN
   FOR recs IN (SELECT CONCAT_WS(' ', 'DROP TABLE', CONCAT(schemaname, '.', tablename), 'CASCADE ;') as cmd FROM pg_tables WHERE schemaname = 'public')
   LOOP
      EXECUTE recs.cmd;
   END LOOP;
 END
$$ LANGUAGE plpgsql;
