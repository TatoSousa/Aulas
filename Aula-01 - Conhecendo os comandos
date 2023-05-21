/*
Apresentando os comandos básicos para criação de uma tabela
*/

--Criando uma tabela
CREATE TABLE tbl_curso (
    codigo_curso INTEGER,
    nome_curso   VARCHAR(50)
);

--Exibindo a estrutura da tabela "tbl_curso"
DESCRIBE tbl_curso;

--Executando os inserts na tabela "tbl_curso";
INSERT INTO tbl_curso VALUES (NULL,NULL);
INSERT INTO tbl_curso VALUES (1,'Administração');
INSERT INTO tbl_curso VALUES (2,'Análise e Desenvolvimento de Sistemas');
INSERT INTO tbl_curso VALUES (3,'Computação em nuvem');
INSERT INTO tbl_curso VALUES (3,'Data Science');
INSERT INTO tbl_curso VALUES (4,NULL);

--Consultando os registros da tabela "tbl_curso"
SELECT * FROM tbl_curso;

--Apagando TODOS os registros da tabela "tbl_curso"
DELETE FROM tbl_curso;

--Alterando a estrutura da tabela "tbl_curso"
ALTER TABLE tbl_curso MODIFY codigo_curso NOT NULL;
ALTER TABLE tbl_curso MODIFY nome_curso NOT NULL;

-- Criando uma chave unica na tabela "tbl_curso"
CREATE UNIQUE INDEX idx_curso_codigo ON tbl_curso(codigo_curso);

/*
--Chave Única com o campo definido como NOT NULL, são as mesmas características
de uma chave primária, com isso podemos substituir a criação do indice para o comando abaixo:
*/
ALTER TABLE tbl_curso ADD CONSTRAINT tbl_curso_pk PRIMARY KEY ( codigo_curso );

--Apagando a estrutura da tabela "tbl_curso"
DROP TABLE tbl_curso;
