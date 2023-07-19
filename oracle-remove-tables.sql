DECLARE
  v_table_name VARCHAR2(100);
  v_sql_stmt   VARCHAR2(100);
BEGIN
  FOR t IN (SELECT table_name FROM all_tables WHERE table_name LIKE 'TBL_%') LOOP
    v_table_name := t.table_name;
    v_sql_stmt := 'DROP TABLE ' || v_table_name || ' CASCADE CONSTRAINTS';
    EXECUTE IMMEDIATE v_sql_stmt;
    DBMS_OUTPUT.PUT_LINE('Tabela ' || v_table_name || ' excluída com sucesso.');
  END LOOP;
EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Erro ao excluir a tabela ' || v_table_name || ': ' || SQLERRM);
END;
/
