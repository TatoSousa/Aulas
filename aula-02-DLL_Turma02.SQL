CREATE TABLE tbl_funcoes_PF1793(
   id_funcao INTEGER PRIMARY KEY,--NOT NULL INDICE UNICO
   --PRIMARY KEY (id_funcao, ....)
   descricao VARCHAR(30) NOT NULL
);
DESCRIBE tbl_funcoes_PF1793; --Descrevendo o Objeto;

INSERT INTO tbl_funcoes_PF1793 (id_funcao, descricao) VALUES (1, 'Gerente');
INSERT INTO tbl_funcoes_PF1793 (id_funcao, descricao) VALUES (2, 'Engenheiro');
INSERT INTO tbl_funcoes_PF1793 (descricao, id_funcao)
   VALUES ('Mecanico', 3);

TRUNCATE TABLE TBL_FUNCOES_PF1793;
SELECT * FROM TBL_FUNCOES_PF1793;

CREATE TABLE tbl_funcionarios_PF1793(
  id_funcionario INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  nome VARCHAR(30) NOT NULL
);
INSERT INTO tbl_funcionarios_PF1793 (nome) VALUES ('Joao');
INSERT INTO tbl_funcionarios_PF1793 (nome) VALUES ('Maria');
INSERT INTO tbl_funcionarios_PF1793 (nome) VALUES ('Mariaasasdsassaadasdasdasdsadasdasdasdasdasdasdasdasdas');
INSERT INTO tbl_funcionarios_PF1793 (nome) VALUES ('Jose');
SELECT * FROM tbl_funcionarios_PF1793;

ALTER TABLE tbl_funcionarios_PF1793 ADD ( endereco VARCHAR(50) );
DESCRIBE  tbl_funcionarios_PF1793;

ALTER TABLE tbl_funcionarios_PF1793
ADD ( numero VARCHAR(30),
      bairro VARCHAR(40),
      complemento VARCHAR(30),
      cidade VARCHAR(30),
      estado VARCHAR(2) DEFAULT 'SP'
      );
SELECT * FROM tbl_funcionarios_PF1793;

ALTER TABLE tbl_funcionarios_PF1793 MODIFY (
    estado VARCHAR(2) NOT NULL
);

ALTER TABLE tbl_funcionarios_PF1793 MODIFY (
    estado DEFAULT 'PR'
);

INSERT INTO tbl_funcionarios_PF1793 (nome)
VALUES ('Zezinho'); --Action:   These objects cannot accept NULL values

SELECT * FROM tbl_funcionarios_PF1793;

--ALTER TABLE tabela ADD COLUMN situacao varchar(10); ---outros bancos

ALTER TABLE tbl_funcionarios_PF1793 MODIFY ( estado VARCHAR(2) NOT NULL);
ALTER TABLE tbl_funcionarios_PF1793 ADD ( situacao INTEGER DEFAULT 1 NOT NULL);
ALTER TABLE tbl_funcionarios_PF1793 ADD ( situacao2 INTEGER DEFAULT 0);

ALTER TABLE tbl_funcionarios_PF1793 MODIFY ( situacao default 0);

ALTER TABLE tbl_funcionarios_PF1793 DROP (situacao2);  --Apagando um coluna
ALTER TABLE tbl_funcionarios_PF1793 DROP (cidade, complemento);

SELECT * FROM tbl_funcionarios_PF1793;

ALTER TABLE tbl_funcionarios_PF1793 ADD ( telefone VARCHAR(15) );
DESCRIBE tbl_funcionarios_PF1793;

ALTER TABLE tbl_funcionarios_PF1793 MODIFY ( telefone VARCHAR(15) NOT NULL );

DESCRIBE tbl_funcionarios_PF1793
SELECT * FROM tbl_funcionarios_PF1793

ALTER TABLE tbl_funcionarios_PF1793 MODIFY ( estado NOT NULL);

ALTER TABLE tbl_funcionarios_PF1793
  ADD ( id_encarregado INTEGER
        REFERENCES tbl_funcionarios_PF1793(id_funcionario));

ALTER TABLE tbl_funcionarios_PF1793
ADD ( id_funcao INTEGER REFERENCES tbl_funcoes_PF1793(id_funcao));
DESCRIBE tbl_funcionarios_PF1793;

CREATE TABLE tbl_telefones_PF1793(
    ID_TELEFONE INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    NUMERO_TELEFONE VARCHAR(20) NOT NULL,
    OBSERVACAO  VARCHAR(30),
    ID_FUNCIONARIO INTEGER NOT NULL REFERENCES tbl_funcionarios_PF1793(id_funcionario)
);
DESCRIBE tbl_telefones_PF1793;



CREATE TABLE grupo_produto ( id_grupo integer primary key,
                             descricao varchar(10));
INSERT INTO grupo_produto VALUES (1, 'Grupo 1');
INSERT INTO grupo_produto VALUES (2, 'Grupo 2');
INSERT INTO grupo_produto VALUES (3, 'Grupo 3');
INSERT INTO grupo_produto VALUES (4, 'Grupo 4');
INSERT INTO grupo_produto VALUES (5, 'Grupo 5');


CREATE TABLE produto (id_produto integer primary key,
                      descricao varchar(10)
                      );
INSERT INTO produto VALUES (1, 'produto 1');
INSERT INTO produto VALUES (2, 'produto 2');
INSERT INTO produto VALUES (3, 'produto 3');
INSERT INTO produto VALUES (4, 'produto 4');


SELECT * FROM produto;       --FRACA
SELECT * FROM grupo_produto; --FORTE


--grupo_produto possui muitos produtos...

ALTER TABLE produto ADD (
   id_grupo INTEGER REFERENCES grupo_produto( id_grupo )
)

INSERT INTO produto (id_produto, descricao, id_grupo)
   VALUES (5, 'produto 4', 1);

SELECT *
   FROM produto
   LEFT  JOIN grupo_produto ON grupo_produto.id_grupo = produto.id_grupo;

RENAME grupo_produto TO grupo_produtos;
RENAME grupo_produto TO grupo_produtos;
