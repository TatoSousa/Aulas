-- 2 - Diagrama Fisico - Auto-Relacionamento
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

SELECT * FROM tbl_funcionarios;
SELECT id_funcionario, nome, telefone FROM tbl_funcionarios;

INSERT INTO tbl_funcionarios (id_funcionario, nome, endereco, numero, bairro, cidade, estado, telefone) VALUES (1, 'Encarregado', 'Rua Rio de Janeiro','123','Dos estados', 'São Paulo', 'SP', '11555555');
INSERT INTO tbl_funcionarios (id_funcionario, nome, endereco, numero, bairro, cidade, estado, telefone, id_encarregado) VALUES (2, 'Funcionario 1', 'Rua Minas Gerais','562','Dos estados', 'São Paulo', 'SP', '11668555', 1);
INSERT INTO tbl_funcionarios (id_funcionario, nome, endereco, numero, bairro, cidade, estado, telefone, id_encarregado) VALUES (3, 'Funcionario 3', 'Rua Rio de Janeiro','123','Dos estados', 'São Paulo', 'SP', '11555555', 2);
INSERT INTO tbl_funcionarios (id_funcionario, nome, endereco, numero, bairro, cidade, estado, telefone, id_encarregado) VALUES (4, 'Funcionario 4', 'Rua Rio de Janeiro','123','Dos estados', 'São Paulo', 'SP', '11555555', 1);

/* Selecionando todos os campos com uma junção LEFT e gerando um plano carteziano*/
SELECT * FROM tbl_funcionarios
LEFT JOIN tbl_funcionarios tbl_encarregados
       ON tbl_encarregados.id_funcionario = tbl_funcionarios.id_encarregado;

---- Com campos especificos
   SELECT tbl_funcionarios.id_funcionario,
          tbl_funcionarios.nome,
          tbl_encarregados.nome AS encarregado
     FROM tbl_funcionarios
LEFT JOIN tbl_funcionarios tbl_encarregados
       ON tbl_encarregados.id_funcionario = tbl_funcionarios.id_encarregado;
