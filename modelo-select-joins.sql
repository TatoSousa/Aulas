/*
DROP TABLE clientes;
DROP TABLE telefones;
*/

--Criando as tabelas
CREATE TABLE clientes (ID_CLIENTE integer PRIMARY KEY, NOME VARCHAR(10) NOT NULL);
CREATE TABLE telefones (ID_CLIENTE integer PRIMARY KEY, NR_TELEFONE VARCHAR(10) NOT NULL);

--Persistindo os registros necessários para análise
INSERT INTO clientes VALUES (1,'Flavia');
INSERT INTO clientes VALUES (2,'Maria');
INSERT INTO clientes VALUES (3,'Paula');
INSERT INTO clientes VALUES (4,'Daniela');
INSERT INTO clientes VALUES (5,'Fabiana');

INSERT INTO telefones VALUES (1,'1199558899');
INSERT INTO telefones VALUES (2,'1199566699');
INSERT INTO telefones VALUES (4,'1199587799');
INSERT INTO telefones VALUES (3,'1199885566');


--INNER JOIN
SELECT c.id_cliente, 
       c.nome,
       t.nr_telefone
  FROM clientes c
INNER JOIN telefones t ON t.id_cliente = c.id_cliente;

--LEFT JOIN
   SELECT c.id_cliente, 
          c.nome,
          t.nr_telefone
     FROM clientes c
LEFT JOIN telefones t
       ON t.id_cliente = c.id_cliente;

--RIGHT JOIN
   SELECT c.id_cliente, 
          c.nome,
          t.nr_telefone
     FROM clientes c
RIGHT JOIN telefones t
       ON t.id_cliente = c.id_cliente;
       
--CROSS JOIN
   SELECT c.id_cliente, 
          c.nome,
          t.nr_telefone
     FROM clientes c
CROSS JOIN telefones t
ORDER BY c.nome, t.nr_telefone;

--FULL JOIN
INSERT INTO telefones VALUES (6,'1198989898');
   SELECT c.id_cliente, 
          c.nome,
          t.nr_telefone
     FROM clientes c
FULL JOIN telefones t
       ON t.id_cliente = c.id_cliente
ORDER BY c.nome, t.nr_telefone;
