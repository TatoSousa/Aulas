CREATE TABLE tbl_vendas(
    codigo_produto INTEGER NOT NULL,
    data_venda DATE NOT NULL,
    quantidade_vendida INTEGER NOT NULL,
    valor_total NUMERIC(10,2) NOT NULL,
    valor_custo NUMERIC(10,2) NOT NULL,
    PRIMARY KEY (codigo_produto, data_venda)
);

CREATE TABLE tbl_produtos (
   codigo_produto INTEGER NOT NULL,
   nome_produto VARCHAR(30) NOT NULL,
   PRIMARY KEY(codigo_produto)
);

TRUNCATE TABLE tbl_produtos;
TRUNCATE TABLE tbl_vendas;

DECLARE
  product_max INTEGER := 10;
  product_current INTEGER := 0;
BEGIN
   WHILE product_current <= product_max LOOP
      product_current := product_current + 1;
      INSERT INTO tbl_produtos VALUES (product_current, CONCAT('Product ', product_current));
   END LOOP;
END;
/

--SELECT * FROM tbl_produtos;

DECLARE
   dt_start DATE := SYSDATE - 30;
   dt_end DATE := SYSDATE;

   product_start INTEGER := 1;
   product_end INTEGER := 15;

   dt_current DATE := NULL;
   product_current INTEGER := 1;
BEGIN
   dt_current := dt_start;
   WHILE product_current <= product_end LOOP 
       dt_current := dt_start;
       WHILE dt_current <= dt_end LOOP
          dt_current := dt_current + 1; -- Incrementando a data
          INSERT INTO tbl_vendas (codigo_produto, data_venda, quantidade_vendida, valor_total, valor_custo)
               VALUES (product_current, dt_current,
                       ROUND(DBMS_RANDOM.VALUE(1, 30)),
                       ROUND(DBMS_RANDOM.VALUE(20, 200),2),
                       ROUND(DBMS_RANDOM.VALUE(10, 100),2)
                       );
       END LOOP;
       product_current := product_current + 1;
   END LOOP;
END;
/
