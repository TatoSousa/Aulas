-- 3 - Diagrama Fisico - Auto-Relacionamento e relacionamento com uma tabela
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
  FOREIGN KEY (id_encarregado) REFERENCES tbl_funcionarios(id_funcionario)
);

CREATE TABLE tbl_telefones(
   id_telefone INTEGER NOT NULL,
   numero_telefone VARCHAR(20) NOT NULL,
   observacao VARCHAR(30),
   id_funcionario INTEGER NOT NULL,
   PRIMARY KEY (id_telefone),
   FOREIGN KEY (id_funcionario) REFERENCES tbl_funcionarios(id_funcionario)
);

INSERT INTO tbl_funcionarios (id_funcionario, nome, endereco, numero, bairro, cidade, estado, telefone) VALUES (1, 'Encarregado', 'Rua Rio de Janeiro','123','Dos estados', 'São Paulo', 'SP', '11555555');
INSERT INTO tbl_funcionarios (id_funcionario, nome, endereco, numero, bairro, cidade, estado, telefone, id_encarregado) VALUES (2, 'Funcionario 1', 'Rua Minas Gerais','562','Dos estados', 'São Paulo', 'SP', '11668555', 1);
INSERT INTO tbl_funcionarios (id_funcionario, nome, endereco, numero, bairro, cidade, estado, telefone, id_encarregado) VALUES (3, 'Funcionario 3', 'Rua Rio de Janeiro','123','Dos estados', 'São Paulo', 'SP', '11555555', 2);
INSERT INTO tbl_funcionarios (id_funcionario, nome, endereco, numero, bairro, cidade, estado, telefone, id_encarregado) VALUES (4, 'Funcionario 4', 'Rua Rio de Janeiro','123','Dos estados', 'São Paulo', 'SP', '11555555', 1);

INSERT INTO tbl_telefones(id_telefone, numero_telefone, observacao, id_funcionario) VALUES (100, '11555555','',1);
INSERT INTO tbl_telefones(id_telefone, numero_telefone, observacao, id_funcionario) VALUES (200, '11668555','',2);
INSERT INTO tbl_telefones(id_telefone, numero_telefone, observacao, id_funcionario) VALUES (300, '11555555','',3);
INSERT INTO tbl_telefones(id_telefone, numero_telefone, observacao, id_funcionario) VALUES (400, '11555555','',4);

--Efetuando uma junção de dados com o USING a partir do id_funcionario
SELECT * FROM tbl_telefones
INNER JOIN tbl_funcionarios USING(id_funcionario);

--Efetuando uma junção de dados com o USING a partir do id_funcionario mudando a tabela principal
SELECT * FROM tbl_funcionarios
INNER JOIN tbl_telefones USING(id_funcionario);

--Selecionando os dados de três tabelas, relacionamento ternário (funcionario, encarregado, telefone)
SELECT * FROM tbl_funcionarios
LEFT JOIN tbl_funcionarios tbl_encarregados
       ON tbl_encarregados.id_funcionario = tbl_funcionarios.id_encarregado
INNER JOIN tbl_telefones ON tbl_telefones.id_funcionario = tbl_funcionarios.id_funcionario;
