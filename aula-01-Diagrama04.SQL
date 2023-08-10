-- 4 - Diagrama Fisico - Auto-Relacionamento, relacionamento com uma tabela, adicionando outra tabela
DROP TABLE tbl_funcoes;
CREATE TABLE tbl_funcoes(
   id_funcao INTEGER NOT NULL,
   descricao VARCHAR(20) NOT NULL,
   PRIMARY KEY (id_funcao)
);
INSERT INTO tbl_funcoes (id_funcao, descricao) VALUES (1, 'Gerente');
INSERT INTO tbl_funcoes (id_funcao, descricao) VALUES (2, 'Operador');
INSERT INTO tbl_funcoes (id_funcao, descricao) VALUES (3, 'Analista');

DROP TABLE tbl_telefones;
DROP TABLE tbl_funcionarios;
CREATE TABLE tbl_funcionarios(
  id_funcionario INTEGER     NOT NULL,
  nome           VARCHAR(30) NOT NULL,
  endereco       VARCHAR(50) NOT NULL,
  numero         VARCHAR(30) NOT NULL,
  bairro         VARCHAR(40) NOT NULL,
  complemento    VARCHAR(2),
  cidade         VARCHAR(30) NOT NULL,
  estado         VARCHAR(2)  NOT NULL,
  telefone       VARCHAR(15) NOT NULL,
  PRIMARY KEY (id_funcionario),
  id_encarregado INTEGER, -- REFERENCES tbl_funcionarios(id_funcionario) ou...
  FOREIGN KEY (id_encarregado) REFERENCES tbl_funcionarios(id_funcionario),
  id_funcao     INTEGER NOT NULL,
  FOREIGN KEY (id_funcao) REFERENCES tbl_funcoes(id_funcao)
  );

INSERT INTO tbl_funcionarios (id_funcionario, nome, endereco, numero, bairro, cidade, estado, telefone, id_funcao) VALUES (1, 'Encarregado', 'Rua Rio de Janeiro','123','Dos estados', 'São Paulo', 'SP', '11555555',1);
INSERT INTO tbl_funcionarios (id_funcionario, nome, endereco, numero, bairro, cidade, estado, telefone, id_funcao, id_encarregado) VALUES (2, 'Funcionario 1', 'Rua Minas Gerais','562','Dos estados', 'São Paulo', 'SP', '11668555', 2, 1);
INSERT INTO tbl_funcionarios (id_funcionario, nome, endereco, numero, bairro, cidade, estado, telefone, id_funcao, id_encarregado) VALUES (3, 'Funcionario 3', 'Rua Rio de Janeiro','123','Dos estados', 'São Paulo', 'SP', '11555555', 2, 2);
INSERT INTO tbl_funcionarios (id_funcionario, nome, endereco, numero, bairro, cidade, estado, telefone, id_funcao, id_encarregado) VALUES (4, 'Funcionario 4', 'Rua Rio de Janeiro','123','Dos estados', 'São Paulo', 'SP', '11555555', 3, 1);

CREATE TABLE tbl_telefones(
   id_telefone INTEGER NOT NULL,
   numero_telefone VARCHAR(20) NOT NULL,
   observacao VARCHAR(30),
   id_funcionario INTEGER NOT NULL,
   PRIMARY KEY (id_telefone),
   FOREIGN KEY (id_funcionario) REFERENCES tbl_funcionarios(id_funcionario)
);

INSERT INTO tbl_telefones (id_telefone, numero_telefone, id_funcionario)
SELECT id_funcionario*100, telefone, id_funcionario FROM tbl_funcionarios;

ALTER TABLE tbl_funcionarios DROP COLUMN telefone;

SELECT * FROM tbl_funcionarios
INNER JOIN tbl_funcoes ON tbl_funcoes.id_funcao = tbl_funcionarios.id_funcao
LEFT JOIN tbl_funcionarios tbl_encarregados
       ON tbl_encarregados.id_funcionario = tbl_funcionarios.id_encarregado
INNER JOIN tbl_telefones ON tbl_telefones.id_funcionario = tbl_funcionarios.id_funcionario;
