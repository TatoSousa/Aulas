--Comandos salvos conforme foi a execução em sala
CREATE TABLE tbl_funcoes_PF1793(
 id_funcao INTEGER PRIMARY KEY,
 descricao VARCHAR(30) NOT NULL
);
DESCRIBE TBL_FUNCOES_PF1793; --Descrevendo o Objeto;
INSERT INTO tbl_funcoes_PF1793 (id_funcao, descricao) VALUES (1, 'Gerente');
INSERT INTO tbl_funcoes_PF1793 (id_funcao, descricao) VALUES (2, 'Engenheiro');

SELECT * FROM TBL_FUNCOES_PF1793;
TRUNCATE TABLE TBL_FUNCOES_PF1793;

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
INSERT INTO tbl_funcionarios_PF1793 (nome, estado) VALUES ('Zezinho', NULL); --Action:   These objects cannot accept NULL values

ALTER TABLE tbl_funcionarios_PF1793 MODIFY ( estado VARCHAR(2) NOT NULL);
ALTER TABLE tbl_funcionarios_PF1793 ADD ( situacao INTEGER DEFAULT 1 NOT NULL);
ALTER TABLE tbl_funcionarios_PF1793 ADD ( situacao2 INTEGER DEFAULT 0);
ALTER TABLE tbl_funcionarios_PF1793 MODIFY ( situacao default 0);

ALTER TABLE tbl_funcionarios_PF1793 DROP (situacao);  --Apagando um coluna

SELECT * FROM tbl_funcionarios_PF1793;

ALTER TABLE tbl_funcionarios_PF1793 ADD ( id_encarregado INTEGER REFERENCES tbl_funcionarios_PF1793(id_funcionario));
ALTER TABLE tbl_funcionarios_PF1793 ADD ( id_funcao INTEGER REFERENCES tbl_funcoes_PF1793(id_funcao));
DESCRIBE tbl_funcionarios_PF1793;

CREATE TABLE tbl_telefones_PF1793(
    ID_TELEFONE INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    NUMERO_TELEFONE VARCHAR(20) NOT NULL,
    OBSERVACAO  VARCHAR(30),
    ID_FUNCIONARIO INTEGER NOT NULL REFERENCES tbl_funcionarios_PF1793(id_funcionario)
);
DESCRIBE tbl_telefones_PF1793;
