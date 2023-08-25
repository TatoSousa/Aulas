/*
-- Conecte no Oracle SQL Developer;
-- Altere o texto FP1793 pelo seu RM .... exemplo RM123456
-- Execute a criação de todas as tabelas
-- Crie os códigos solicitados ao final do script
*/

CREATE TABLE tbl_aeronave_FP1793 (
    matricula_aeronave VARCHAR(20) NOT NULL,
    modelo VARCHAR(100) NOT NULL,
    capacidade INTEGER NOT NULL,
    ano_fabricacao INTEGER NOT NULL,
    companhia_aerea_proprietaria VARCHAR(100) NOT NULL
);
INSERT INTO tbl_aeronave_FP1793 (matricula_aeronave,
                                 modelo,
                                 capacidade,
                                 ano_fabricacao,
                                 companhia_aerea_proprietaria)
            VALUES ('AB123','Boeing',150,100,'GOL');
TRUNCATE TABLE tbl_aeronave_FP1793;  tbl_aeronave_FP1793; -- apagando todos os registros TRUNCATE - DDL                              

ALTER TABLE tbl_aeronave_FP1793 MODIFY matricula_aeronave PRIMARY KEY;
ALTER TABLE tbl_aeronave_FP1793 ADD registro_aeronave INTEGER UNIQUE;
ALTER TABLE tbl_aeronave_FP1793 ADD doc2 INTEGER NOT NULL; ---ERRO

/*
ALTER TABLE tbl_aeronave_FP1793 ADD doc2 INTEGER;
UPDATE NOS REGISTROS PARA NAO TER NENHUM NOT NULL
ALTER TABLE tbl_aeronave_FP1793 MODIFY doc2 INTEGER NOT NULL;

*/

SELECT * FROM tbl_aeronave_FP1793; -- o novo campo está NULO
INSERT INTO tbl_aeronave_FP1793 (matricula_aeronave,
                                 modelo,
                                 capacidade,
                                 ano_fabricacao,
                                 companhia_aerea_proprietaria, registro_aeronave)
            VALUES ('BB1516','Boeing',150,100,'GOL', 123);
SELECT * FROM tbl_aeronave_FP1793;

PRIMARY KEY <> UNIQUE ----- NOT NULL
PRIMARY KEY é CHAVE UNICA OBRIGATÓRIA

--Chave primária com dois Campos

CREATE TABLE dois_campos (
    campo1 INTEGER NOT NULL,
    campo2 INTEGER NOT NULL,
    PRIMARY KEY (campo1, campo2)
);
INSERT INTO dois_campos VALUES ( 0, 1);
/*
ALTER TABLE tbl_voo_passageiro_RMxxxx MODIFY id PRIMARY KEY;
ALTER TABLE tbl_voo_passageiro_RMxxxx ADD ( PRIMARY KEY (id) );
ALTER TABLE nota_fiscal_item ADD ( PRIMARY KEY (id, id_item) ); --Dois campos na chave primária
ALTER TABLE tbl_voo_passageiro_RMxxxx MODIFY id CONSTRAINT PK_COD_CLIENTE PRIMARY KEY
*/

CREATE TABLE tbl_carga_FP1793 (
   identificacao_carga INTEGER GENERATED ALWAYS AS IDENTITY NOT NULL,
   descricao VARCHAR(200) NOT NULL,
   peso NUMBER(10,3) NOT NULL,
   volume NUMBER(10,3) NOT NULL
);

CREATE TABLE tbl_tripulante_FP1793 (
   numero_tripulante INTEGER GENERATED ALWAYS AS IDENTITY NOT NULL,
   nome VARCHAR(100) NOT NULL,
   documento_identificacao VARCHAR(20) NOT NULL,
   funcao VARCHAR(50) NOT NULL
);

CREATE TABLE tbl_passageiro_FP1793 (
   numero_passageiro INTEGER GENERATED ALWAYS AS IDENTITY NOT NULL,
   nome VARCHAR(100) NOT NULL,
   documento_identificacao VARCHAR(20) NOT NULL,
   data_nascimento DATE NOT NULL
);

CREATE TABLE tbl_voo_FP1793 (
   nr_voo INTEGER GENERATED ALWAYS AS IDENTITY NOT NULL,
   origem VARCHAR(100) NOT NULL,
   destino VARCHAR(100) NOT NULL,
   data_partida DATE NOT NULL,
   data_chegada DATE NOT NULL,
   matricula_aeronave VARCHAR(20) NOT NULL
);

CREATE TABLE tbl_voo_carga_FP1793 (
   id INTEGER GENERATED ALWAYS AS IDENTITY NOT NULL,
   nr_voo INTEGER NOT NULL,
   identificacao_carga INTEGER NOT NULL
);

CREATE TABLE tbl_voo_tripulante_FP1793 (
   nr_voo INTEGER NOT NULL,
   numero_tripulante INTEGER NOT NULL,
   id INTEGER GENERATED ALWAYS AS IDENTITY NOT NULL
);

CREATE TABLE tbl_voo_passageiro_FP1793 (
   nr_voo INTEGER NOT NULL,
   numero_passageiro INTEGER NOT NULL,
   id INTEGER GENERATED ALWAYS AS IDENTITY NOT NULL
);

--ALTER TABLE tbl_voo_RMxxxx  ADD CONSTRAINT voo_pk PRIMARY KEY (matricula_aeronave);

ALTER TABLE tbl_voo_FP1793
  ADD CONSTRAINT fk_aeronave_voo
  FOREIGN KEY(matricula_aeronave)
    REFERENCES tbl_aeronave_FP1793(matricula_aeronave);

DESCRIBE tbl_aeronave_FP1793;

SELECT * FROM tbl_aeronave_FP1793;
/*
= : ano = 2023
< : ano < 2023
> : ano > 2023
<=: ano <= 2023
>=: ano >= 2023
IN (1,2,3)
IN ('ATIVO','INATIVO')
BETWEEN 0 AND 100
*/

ALTER TABLE tbl_aeronave_FP1793 ADD CONSTRAINT ck_aeronave_ano CHECK(ano_fabricacao > 2000);


ALTER TABLE tbl_voo_FP1793
  ADD CONSTRAINT ck_voo_datas CHECK(data_chegada >= data_partida);

----ADICIONANDO CAMPO NOVO
ALTER TABLE tbl_voo_FP1793 ADD data_registro date default sysdate;

SELECT * FROM tbl_voo_FP1793
INSERT INTO tbl_voo_FP1793 (origem, destino, data_partida, data_chegada, matricula_aeronave)
  VALUES ('SP',
          'RJ',
          TO_DATE( '2023-08-22', 'YYYY-MM-DD'),
          TO_DATE( '2023-08-21', 'YYYY-MM-DD'), 'AB123');


SELECT TO_DATE( '2023-08-22', 'YYYY-MM-DD') FROM DUAL
/*
--referencia a data atual do servidor...
current_date
currdate
*/
SELECT * FROM tbl_voo_FP1793


/* Qualquer comando de manipulação de dados utilizem o WHERE*/

UPDATE tbl_aeronave_FP1793
SET ano_fabricacao = 2001, campo2='', campo=''
WHERE condicao;
