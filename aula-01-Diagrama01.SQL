-- 1 - Diagrama Fisico
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
  PRIMARY KEY (id_funcionario)
);

INSERT INTO tbl_funcionarios (id_funcionario, nome, endereco, numero, bairro, cidade, estado, telefone)
   VALUES (1, 'Funcionario 1', 'Rua Rio de Janeiro','123','Dos estados', 'São Paulo', 'SP', '11555555');

INSERT INTO tbl_funcionarios (id_funcionario, nome, endereco, numero, bairro, cidade, estado, telefone)
   VALUES (2, 'Funcionario 2', 'Rua Rio de Janeiro','123','Dos estados', 'São Paulo', 'SP', '11555555');

INSERT INTO tbl_funcionarios (id_funcionario, nome, endereco, numero, bairro, cidade, estado, telefone)
   VALUES (3, 'Funcionario 3', 'Rua Rio de Janeiro','123','Dos estados', 'São Paulo', 'SP', '11555555');

INSERT INTO tbl_funcionarios (id_funcionario, nome, endereco, numero, bairro, cidade, estado, telefone)
   VALUES (4, 'Funcionario 4', 'Rua Rio de Janeiro','123','Dos estados', 'São Paulo', 'SP', '11555555');

SELECT * FROM tbl_funcionarios;
SELECT id_funcionario, nome, telefone FROM tbl_funcionarios;
