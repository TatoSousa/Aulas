/*
DROP TABLE origem;
DROP TABLE destino;
*/

CREATE TABLE origem(
   id_produto INTEGER PRIMARY KEY,
   qtde_vendas INTEGER
);

CREATE TABLE destino(
   id_produto INTEGER PRIMARY KEY,
   qtde_vendas INTEGER,
   dt_insert TIMESTAMP DEFAULT current_timestamp,
   dt_update TIMESTAMP
);

INSERT INTO origem(id_produto, qtde_vendas) VALUES (5555, 1000);
INSERT INTO origem(id_produto, qtde_vendas) VALUES (5698, 500);
INSERT INTO origem(id_produto, qtde_vendas) VALUES (999, 205);
INSERT INTO origem(id_produto, qtde_vendas) VALUES (1235, 202);
INSERT INTO origem(id_produto, qtde_vendas) VALUES (7878, 50);

INSERT INTO destino(id_produto, qtde_vendas) VALUES (5555, 500);
INSERT INTO destino(id_produto, qtde_vendas) VALUES (5698, 300);
INSERT INTO destino(id_produto, qtde_vendas) VALUES (999, 200);
INSERT INTO destino(id_produto, qtde_vendas) VALUES (1235, 200);

SELECT * FROM origem;
SELECT * FROM destino;

--ORACLE
MERGE INTO destino target
  USING origem source
     ON (target.id_produto = source.id_produto)
WHEN MATCHED THEN  --Encontrou
     UPDATE SET qtde_vendas = source.qtde_vendas, dt_update = current_timestamp
WHEN NOT MATCHED THEN -- Nao Encontrou
     INSERT (id_produto, qtde_vendas) VALUES (source.id_produto, source.qtde_vendas)

SELECT * FROM destino;
