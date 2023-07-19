CREATE TABLE tbl_funcionario(
    codigo_funcionario integer GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	nome varchar(50) NOT NULL,
	rua  VARCHAR(100) NOT NULL,
	numero INTEGER,
	complemento VARCHAR(50),
	bairro VARCHAR(50) NOT NULL,
	cidade VARCHAR(50) NOT NULL,
	estado CHAR(2) NOT NULL,
	codigo_gestor integer REFERENCES tbl_funcionario(codigo_funcionario)
);

INSERT INTO tbl_funcionario (nome, rua, numero, complemento, bairro, cidade, estado, codigo_gestor) VALUES ('Funcionario 1', 'Avenida Paulista',55,NULL,'Paulista','São Paulo', 'SP', NULL);
INSERT INTO tbl_funcionario (nome, rua, numero, complemento, bairro, cidade, estado, codigo_gestor) VALUES ('Funcionario 2', 'Avenida Paulista',55,NULL,'Paulista','São Paulo', 'SP', NULL);
INSERT INTO tbl_funcionario (nome, rua, numero, complemento, bairro, cidade, estado, codigo_gestor) VALUES ('Funcionario 3', 'Avenida Paulista',55,NULL,'Paulista','São Paulo', 'SP', NULL);
INSERT INTO tbl_funcionario (nome, rua, numero, complemento, bairro, cidade, estado, codigo_gestor) VALUES ('Funcionario 4', 'Avenida Paulista',55,NULL,'Paulista','São Paulo', 'SP', NULL);
INSERT INTO tbl_funcionario (nome, rua, numero, complemento, bairro, cidade, estado, codigo_gestor) VALUES ('Funcionario 5', 'Avenida Paulista',55,NULL,'Paulista','São Paulo', 'SP', NULL);
INSERT INTO tbl_funcionario (nome, rua, numero, complemento, bairro, cidade, estado, codigo_gestor) VALUES ('Funcionario 6', 'Avenida Paulista',55,NULL,'Paulista','São Paulo', 'SP', NULL);
INSERT INTO tbl_funcionario (nome, rua, numero, complemento, bairro, cidade, estado, codigo_gestor) VALUES ('Funcionario 7', 'Avenida Paulista',55,NULL,'Paulista','São Paulo', 'SP', NULL);
INSERT INTO tbl_funcionario (nome, rua, numero, complemento, bairro, cidade, estado, codigo_gestor) VALUES ('Professor 8', 'Avenida Paulista',55,NULL,'Paulista','São Paulo', 'SP', NULL);
INSERT INTO tbl_funcionario (nome, rua, numero, complemento, bairro, cidade, estado, codigo_gestor) VALUES ('Professor 9', 'Avenida Paulista',55,NULL,'Paulista','São Paulo', 'SP', NULL);
INSERT INTO tbl_funcionario (nome, rua, numero, complemento, bairro, cidade, estado, codigo_gestor) VALUES ('Professor 10', 'Avenida Paulista',55,NULL,'Paulista','São Paulo', 'SP', NULL);
INSERT INTO tbl_funcionario (nome, rua, numero, complemento, bairro, cidade, estado, codigo_gestor) VALUES ('Professor 11', 'Avenida Paulista',55,NULL,'Paulista','São Paulo', 'SP', NULL);
INSERT INTO tbl_funcionario (nome, rua, numero, complemento, bairro, cidade, estado, codigo_gestor) VALUES ('Professor 12', 'Avenida Paulista',55,NULL,'Paulista','São Paulo', 'SP', NULL);
INSERT INTO tbl_funcionario (nome, rua, numero, complemento, bairro, cidade, estado, codigo_gestor) VALUES ('Gestor 13', 'Avenida Paulista',55,NULL,'Paulista','São Paulo', 'SP', NULL);
INSERT INTO tbl_funcionario (nome, rua, numero, complemento, bairro, cidade, estado, codigo_gestor) VALUES ('Gestor 14', 'Avenida Paulista',55,NULL,'Paulista','São Paulo', 'SP', NULL);
INSERT INTO tbl_funcionario (nome, rua, numero, complemento, bairro, cidade, estado, codigo_gestor) VALUES ('Gestor 15', 'Avenida Paulista',55,NULL,'Paulista','São Paulo', 'SP', NULL);
INSERT INTO tbl_funcionario (nome, rua, numero, complemento, bairro, cidade, estado, codigo_gestor) VALUES ('Professor 16', 'Avenida Paulista',55,NULL,'Paulista','São Paulo', 'SP', NULL);
INSERT INTO tbl_funcionario (nome, rua, numero, complemento, bairro, cidade, estado, codigo_gestor) VALUES ('Professor 17', 'Avenida Paulista',55,NULL,'Paulista','São Paulo', 'SP', NULL);
INSERT INTO tbl_funcionario (nome, rua, numero, complemento, bairro, cidade, estado, codigo_gestor) VALUES ('Secretaria 18', 'Avenida Paulista',55,NULL,'Paulista','São Paulo', 'SP', NULL);
INSERT INTO tbl_funcionario (nome, rua, numero, complemento, bairro, cidade, estado, codigo_gestor) VALUES ('Secretaria 19', 'Avenida Paulista',55,NULL,'Paulista','São Paulo', 'SP', NULL);
INSERT INTO tbl_funcionario (nome, rua, numero, complemento, bairro, cidade, estado, codigo_gestor) VALUES ('Diretor 20', 'Avenida Paulista',55,NULL,'Paulista','São Paulo', 'SP', NULL);

UPDATE tbl_funcionario SET codigo_gestor = 13 WHERE nome LIKE 'Professor%';
UPDATE tbl_funcionario SET codigo_gestor = 14 WHERE nome LIKE 'Secret%';
UPDATE tbl_funcionario SET codigo_gestor = 15 WHERE nome LIKE 'Func%';
UPDATE tbl_funcionario SET codigo_gestor = 20 WHERE nome LIKE 'Gestor%';

--SELECT * FROM tbl_funcionario;

CREATE TABLE tbl_secretaria (
    codigo_funcionario INTEGER PRIMARY KEY REFERENCES tbl_funcionario (codigo_funcionario),
	bilingue varchar(4) DEFAULT 'Não',
	CHECK( bilingue IN ('Sim', 'Não'))
);
INSERT INTO tbl_secretaria(codigo_funcionario) SELECT codigo_funcionario FROM tbl_funcionario WHERE nome LIKE 'Secret%';

CREATE TABLE tbl_professor(
    codigo_funcionario INTEGER PRIMARY KEY REFERENCES tbl_funcionario (codigo_funcionario),
	qual_periodo varchar(5) DEFAULT 'todos' CHECK ( qual_periodo IN ('manha', 'tarde', 'noite', 'todos'))
);
INSERT INTO tbl_professor(codigo_funcionario) SELECT codigo_funcionario FROM tbl_funcionario WHERE nome LIKE 'Professor%';

CREATE TABLE tbl_funcionario_telefone(
    codigo_funcionario INTEGER REFERENCES tbl_funcionario (codigo_funcionario),
	numero_telefone VARCHAR(15) NOT NULL,
	observacao VARCHAR(30),  --campo extra
	PRIMARY KEY (codigo_funcionario, numero_telefone)
);
INSERT INTO tbl_funcionario_telefone(codigo_funcionario, numero_telefone)
  SELECT codigo_funcionario, cast(codigo_funcionario AS varchar(5))
    FROM tbl_funcionario WHERE nome LIKE 'Func%';

CREATE TABLE tbl_dependente (
    codigo_dependente INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    codigo_funcionario INTEGER, --REFERENCES tbl_funcionario (codigo_funcionario),
    nome VARCHAR(50) NOT NULL,
    idade SMALLINT NOT NULL CHECK (idade BETWEEN 0 AND 100)
);

INSERT INTO tbl_dependente(codigo_funcionario, nome, idade) VALUES (10, 'Dependente do funcionario 10', 10);
INSERT INTO tbl_dependente(codigo_funcionario, nome, idade) VALUES (10, 'Segundo dependente do funcionario 10', 15);
INSERT INTO tbl_dependente(codigo_funcionario, nome, idade) VALUES (16, 'Dependente do funcionario 16', 13);
INSERT INTO tbl_dependente(codigo_funcionario, nome, idade) VALUES (16, 'Segundo Dependente do funcionario 16', 14);
INSERT INTO tbl_dependente(codigo_funcionario, nome, idade) VALUES (16, 'Terceiro Dependente do funcionario 16', 15);
INSERT INTO tbl_dependente(codigo_funcionario, nome, idade) VALUES (16, 'Quarto Dependente do funcionario 16', 3);
INSERT INTO tbl_dependente(codigo_funcionario, nome, idade) VALUES (16, 'Quinto Dependente do funcionario 16', 36);
INSERT INTO tbl_dependente(codigo_funcionario, nome, idade) VALUES (20, 'Dependente do funcionario 20', 43);
INSERT INTO tbl_dependente(codigo_funcionario, nome, idade) VALUES (12, 'Dependente do funcionario 21', 43);
INSERT INTO tbl_dependente(codigo_funcionario, nome, idade) VALUES (5, 'Dependente do funcionario 5', 22);
INSERT INTO tbl_dependente(codigo_funcionario, nome, idade) VALUES (6, 'Dependente do funcionario 6', 21);
INSERT INTO tbl_dependente(codigo_funcionario, nome, idade) VALUES (9, 'Dependente do funcionario 9', 23);
INSERT INTO tbl_dependente(codigo_funcionario, nome, idade) VALUES (8, 'Dependente do funcionario 8', 21);
INSERT INTO tbl_dependente(codigo_funcionario, nome, idade) VALUES (14, 'Dependente do funcionario 14', 30);

CREATE TABLE tbl_curso (
    codigo_curso INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	nome_curso VARCHAR(50) NOT NULL
);
INSERT INTO tbl_curso(nome_curso) VALUES ('Desenvolvimento de sistemas');
INSERT INTO tbl_curso(nome_curso) VALUES ('Data Science');
INSERT INTO tbl_curso(nome_curso) VALUES ('Administração de banco de dados');

CREATE TABLE tbl_disciplina (
    codigo_disciplina INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	nome_disciplina VARCHAR(50) NOT NULL
);
INSERT INTO tbl_disciplina(nome_disciplina) VALUES ('SQL - Banco de Dados I');
INSERT INTO tbl_disciplina(nome_disciplina) VALUES ('SQL - Banco de Dados II');
INSERT INTO tbl_disciplina(nome_disciplina) VALUES ('DEV - Java');
INSERT INTO tbl_disciplina(nome_disciplina) VALUES ('DEV - Python');
INSERT INTO tbl_disciplina(nome_disciplina) VALUES ('DEV - Html, CSS e Javascript');
INSERT INTO tbl_disciplina(nome_disciplina) VALUES ('SQL - Análise de Dados');
INSERT INTO tbl_disciplina(nome_disciplina) VALUES ('Gestão - Metodologias Ágeis');
INSERT INTO tbl_disciplina(nome_disciplina) VALUES ('Gestão - Ferramentas de Gestão');
INSERT INTO tbl_disciplina(nome_disciplina) VALUES ('DEV - Lógica de programação');

CREATE TABLE tbl_grade(
    codigo_curso INTEGER REFERENCES tbl_curso (codigo_curso),
    codigo_disciplina INTEGER REFERENCES tbl_disciplina (codigo_disciplina),
	PRIMARY KEY (codigo_curso, codigo_disciplina)
);
INSERT INTO tbl_grade (codigo_curso, codigo_disciplina) SELECT 1, codigo_disciplina FROM tbl_disciplina;
INSERT INTO tbl_grade (codigo_curso, codigo_disciplina) SELECT 2, codigo_disciplina FROM tbl_disciplina WHERE nome_disciplina LIKE 'SQL%';
INSERT INTO tbl_grade (codigo_curso, codigo_disciplina) SELECT 2, codigo_disciplina FROM tbl_disciplina WHERE nome_disciplina LIKE 'Gestão%';

CREATE TABLE tbl_professor_disciplina(
    codigo_funcionario INTEGER REFERENCES tbl_funcionario (codigo_funcionario),
    codigo_disciplina INTEGER REFERENCES tbl_disciplina (codigo_disciplina),
    PRIMARY KEY (codigo_funcionario, codigo_disciplina)
);

INSERT INTO tbl_professor_disciplina (codigo_funcionario, codigo_disciplina) 
SELECT codigo_funcionario, codigo_disciplina
FROM tbl_professor
CROSS JOIN tbl_disciplina
WHERE nome_disciplina LIKE 'SQL%' AND codigo_funcionario IN (8,9,10);

INSERT INTO tbl_professor_disciplina (codigo_funcionario, codigo_disciplina) 
SELECT codigo_funcionario, codigo_disciplina
FROM tbl_professor
CROSS JOIN tbl_disciplina
WHERE nome_disciplina LIKE 'Gestão%' AND codigo_funcionario IN (11,12,16);

INSERT INTO tbl_professor_disciplina (codigo_funcionario, codigo_disciplina) 
SELECT codigo_funcionario, codigo_disciplina
FROM tbl_professor
CROSS JOIN tbl_disciplina
WHERE nome_disciplina LIKE 'DEV%' AND codigo_funcionario IN (12,16,17,11);

CREATE TABLE tbl_aluno (
    codigo_aluno INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	nome varchar(50) NOT NULL,
	rua  VARCHAR(100) NOT NULL,
	numero INTEGER,
	complemento VARCHAR(50),
	bairro VARCHAR(50) NOT NULL,
	cidade VARCHAR(50) NOT NULL,
	estado CHAR(2) NOT NULL,
	telefone_1 VARCHAR(15) NOT NULL,
	telefone_2 VARCHAR(15)
);
INSERT INTO tbl_aluno (nome, rua, numero, complemento, bairro, cidade, estado, telefone_1) VALUES ('Aluno 01', 'Avenida 23 de Março',156,NULL,'Centro','São Paulo', 'SP','');
INSERT INTO tbl_aluno (nome, rua, numero, complemento, bairro, cidade, estado, telefone_1) VALUES ('Aluno 02', 'Avenida 23 de Março',156,NULL,'Centro','São Paulo', 'SP','');
INSERT INTO tbl_aluno (nome, rua, numero, complemento, bairro, cidade, estado, telefone_1) VALUES ('Aluno 03', 'Avenida 23 de Março',156,NULL,'Centro','São Paulo', 'SP','');
INSERT INTO tbl_aluno (nome, rua, numero, complemento, bairro, cidade, estado, telefone_1) VALUES ('Aluno 04', 'Avenida 23 de Março',156,NULL,'Centro','São Paulo', 'SP','');
INSERT INTO tbl_aluno (nome, rua, numero, complemento, bairro, cidade, estado, telefone_1) VALUES ('Aluno 05', 'Avenida 23 de Março',156,NULL,'Centro','São Paulo', 'SP','');
INSERT INTO tbl_aluno (nome, rua, numero, complemento, bairro, cidade, estado, telefone_1) VALUES ('Aluno 06', 'Avenida 23 de Março',156,NULL,'Centro','São Paulo', 'SP','');
INSERT INTO tbl_aluno (nome, rua, numero, complemento, bairro, cidade, estado, telefone_1) VALUES ('Aluno 07', 'Avenida 23 de Março',156,NULL,'Centro','São Paulo', 'SP','');
INSERT INTO tbl_aluno (nome, rua, numero, complemento, bairro, cidade, estado, telefone_1) VALUES ('Aluno 08', 'Avenida 23 de Março',156,NULL,'Centro','São Paulo', 'SP','');
INSERT INTO tbl_aluno (nome, rua, numero, complemento, bairro, cidade, estado, telefone_1) VALUES ('Aluno 09', 'Avenida 23 de Março',156,NULL,'Centro','São Paulo', 'SP','');
INSERT INTO tbl_aluno (nome, rua, numero, complemento, bairro, cidade, estado, telefone_1) VALUES ('Aluno 10', 'Avenida 23 de Março',156,NULL,'Centro','São Paulo', 'SP','');
INSERT INTO tbl_aluno (nome, rua, numero, complemento, bairro, cidade, estado, telefone_1) VALUES ('Aluno 11', 'Avenida 23 de Março',156,NULL,'Centro','São Paulo', 'SP','');
INSERT INTO tbl_aluno (nome, rua, numero, complemento, bairro, cidade, estado, telefone_1) VALUES ('Aluno 12', 'Avenida 23 de Março',156,NULL,'Centro','São Paulo', 'SP','');
INSERT INTO tbl_aluno (nome, rua, numero, complemento, bairro, cidade, estado, telefone_1) VALUES ('Aluno 13', 'Avenida 23 de Março',156,NULL,'Centro','São Paulo', 'SP','');
INSERT INTO tbl_aluno (nome, rua, numero, complemento, bairro, cidade, estado, telefone_1) VALUES ('Aluno 14', 'Avenida 23 de Março',156,NULL,'Centro','São Paulo', 'SP','');
INSERT INTO tbl_aluno (nome, rua, numero, complemento, bairro, cidade, estado, telefone_1) VALUES ('Aluno 15', 'Avenida 23 de Março',156,NULL,'Centro','São Paulo', 'SP','');
INSERT INTO tbl_aluno (nome, rua, numero, complemento, bairro, cidade, estado, telefone_1) VALUES ('Aluno 16', 'Avenida 23 de Março',156,NULL,'Centro','São Paulo', 'SP','');
INSERT INTO tbl_aluno (nome, rua, numero, complemento, bairro, cidade, estado, telefone_1) VALUES ('Aluno 17', 'Avenida 23 de Março',156,NULL,'Centro','São Paulo', 'SP','');
INSERT INTO tbl_aluno (nome, rua, numero, complemento, bairro, cidade, estado, telefone_1) VALUES ('Aluno 18', 'Avenida 23 de Março',156,NULL,'Centro','São Paulo', 'SP','');
INSERT INTO tbl_aluno (nome, rua, numero, complemento, bairro, cidade, estado, telefone_1) VALUES ('Aluno 19', 'Avenida 23 de Março',156,NULL,'Centro','São Paulo', 'SP','');
INSERT INTO tbl_aluno (nome, rua, numero, complemento, bairro, cidade, estado, telefone_1) VALUES ('Aluno 20', 'Avenida 23 de Março',156,NULL,'Centro','São Paulo', 'SP','');
INSERT INTO tbl_aluno (nome, rua, numero, complemento, bairro, cidade, estado, telefone_1) VALUES ('Aluno 21', 'Avenida 23 de Março',156,NULL,'Centro','São Paulo', 'SP','');
INSERT INTO tbl_aluno (nome, rua, numero, complemento, bairro, cidade, estado, telefone_1) VALUES ('Aluno 22', 'Avenida 23 de Março',156,NULL,'Centro','São Paulo', 'SP','');
INSERT INTO tbl_aluno (nome, rua, numero, complemento, bairro, cidade, estado, telefone_1) VALUES ('Aluno 23', 'Avenida 23 de Março',156,NULL,'Centro','São Paulo', 'SP','');
INSERT INTO tbl_aluno (nome, rua, numero, complemento, bairro, cidade, estado, telefone_1) VALUES ('Aluno 24', 'Avenida 23 de Março',156,NULL,'Centro','São Paulo', 'SP','');
INSERT INTO tbl_aluno (nome, rua, numero, complemento, bairro, cidade, estado, telefone_1) VALUES ('Aluno 25', 'Avenida 23 de Março',156,NULL,'Centro','São Paulo', 'SP','');
INSERT INTO tbl_aluno (nome, rua, numero, complemento, bairro, cidade, estado, telefone_1) VALUES ('Aluno 26', 'Avenida 23 de Março',156,NULL,'Centro','São Paulo', 'SP','');
INSERT INTO tbl_aluno (nome, rua, numero, complemento, bairro, cidade, estado, telefone_1) VALUES ('Aluno 27', 'Avenida 23 de Março',156,NULL,'Centro','São Paulo', 'SP','');
INSERT INTO tbl_aluno (nome, rua, numero, complemento, bairro, cidade, estado, telefone_1) VALUES ('Aluno 28', 'Avenida 23 de Março',156,NULL,'Centro','São Paulo', 'SP','');
INSERT INTO tbl_aluno (nome, rua, numero, complemento, bairro, cidade, estado, telefone_1) VALUES ('Aluno 29', 'Avenida 23 de Março',156,NULL,'Centro','São Paulo', 'SP','');
INSERT INTO tbl_aluno (nome, rua, numero, complemento, bairro, cidade, estado, telefone_1) VALUES ('Aluno 30', 'Avenida 23 de Março',156,NULL,'Centro','São Paulo', 'SP','');
INSERT INTO tbl_aluno (nome, rua, numero, complemento, bairro, cidade, estado, telefone_1) VALUES ('Aluno 31', 'Avenida 23 de Março',156,NULL,'Centro','São Paulo', 'SP','');
INSERT INTO tbl_aluno (nome, rua, numero, complemento, bairro, cidade, estado, telefone_1) VALUES ('Aluno 32', 'Avenida 23 de Março',156,NULL,'Centro','São Paulo', 'SP','');
INSERT INTO tbl_aluno (nome, rua, numero, complemento, bairro, cidade, estado, telefone_1) VALUES ('Aluno 33', 'Avenida 23 de Março',156,NULL,'Centro','São Paulo', 'SP','');
INSERT INTO tbl_aluno (nome, rua, numero, complemento, bairro, cidade, estado, telefone_1) VALUES ('Aluno 34', 'Avenida 23 de Março',156,NULL,'Centro','São Paulo', 'SP','');
INSERT INTO tbl_aluno (nome, rua, numero, complemento, bairro, cidade, estado, telefone_1) VALUES ('Aluno 35', 'Avenida 23 de Março',156,NULL,'Centro','São Paulo', 'SP','');
INSERT INTO tbl_aluno (nome, rua, numero, complemento, bairro, cidade, estado, telefone_1) VALUES ('Aluno 36', 'Avenida 23 de Março',156,NULL,'Centro','São Paulo', 'SP','');
INSERT INTO tbl_aluno (nome, rua, numero, complemento, bairro, cidade, estado, telefone_1) VALUES ('Aluno 37', 'Avenida 23 de Março',156,NULL,'Centro','São Paulo', 'SP','');
INSERT INTO tbl_aluno (nome, rua, numero, complemento, bairro, cidade, estado, telefone_1) VALUES ('Aluno 38', 'Avenida 23 de Março',156,NULL,'Centro','São Paulo', 'SP','');
INSERT INTO tbl_aluno (nome, rua, numero, complemento, bairro, cidade, estado, telefone_1) VALUES ('Aluno 39', 'Avenida 23 de Março',156,NULL,'Centro','São Paulo', 'SP','');
INSERT INTO tbl_aluno (nome, rua, numero, complemento, bairro, cidade, estado, telefone_1) VALUES ('Aluno 40', 'Avenida 23 de Março',156,NULL,'Centro','São Paulo', 'SP','');
INSERT INTO tbl_aluno (nome, rua, numero, complemento, bairro, cidade, estado, telefone_1) VALUES ('Aluno 41', 'Avenida 23 de Março',156,NULL,'Centro','São Paulo', 'SP','');
INSERT INTO tbl_aluno (nome, rua, numero, complemento, bairro, cidade, estado, telefone_1) VALUES ('Aluno 42', 'Avenida 23 de Março',156,NULL,'Centro','São Paulo', 'SP','');
INSERT INTO tbl_aluno (nome, rua, numero, complemento, bairro, cidade, estado, telefone_1) VALUES ('Aluno 43', 'Avenida 23 de Março',156,NULL,'Centro','São Paulo', 'SP','');
INSERT INTO tbl_aluno (nome, rua, numero, complemento, bairro, cidade, estado, telefone_1) VALUES ('Aluno 44', 'Avenida 23 de Março',156,NULL,'Centro','São Paulo', 'SP','');
INSERT INTO tbl_aluno (nome, rua, numero, complemento, bairro, cidade, estado, telefone_1) VALUES ('Aluno 45', 'Avenida 23 de Março',156,NULL,'Centro','São Paulo', 'SP','');
INSERT INTO tbl_aluno (nome, rua, numero, complemento, bairro, cidade, estado, telefone_1) VALUES ('Aluno 46', 'Avenida 23 de Março',156,NULL,'Centro','São Paulo', 'SP','');
INSERT INTO tbl_aluno (nome, rua, numero, complemento, bairro, cidade, estado, telefone_1) VALUES ('Aluno 47', 'Avenida 23 de Março',156,NULL,'Centro','São Paulo', 'SP','');
INSERT INTO tbl_aluno (nome, rua, numero, complemento, bairro, cidade, estado, telefone_1) VALUES ('Aluno 48', 'Avenida 23 de Março',156,NULL,'Centro','São Paulo', 'SP','');
INSERT INTO tbl_aluno (nome, rua, numero, complemento, bairro, cidade, estado, telefone_1) VALUES ('Aluno 49', 'Avenida 23 de Março',156,NULL,'Centro','São Paulo', 'SP','');
INSERT INTO tbl_aluno (nome, rua, numero, complemento, bairro, cidade, estado, telefone_1) VALUES ('Aluno 50', 'Avenida 23 de Março',156,NULL,'Centro','São Paulo', 'SP','');

CREATE TABLE tbl_turma (
    codigo_curso INTEGER NOT NULL REFERENCES tbl_curso(codigo_curso),
    codigo_turma INTEGER NOT NULL,
	codigo_aluno INTEGER NOT NULL REFERENCES tbl_aluno(codigo_aluno),
	periodo varchar(5) CHECK ( periodo IN ('manha', 'tarde', 'noite')),
	PRIMARY KEY (codigo_curso, codigo_turma, codigo_aluno)
);

--Exemplo de SELECT com JOINs
    SELECT nome,
           qual_periodo periodo_disponivel,
	       nome_disciplina
      FROM tbl_professor_disciplina pd
INNER JOIN tbl_funcionario f ON (pd.codigo_funcionario = f.codigo_funcionario)
INNER JOIN tbl_professor p ON (pd.codigo_funcionario = p.codigo_funcionario)
INNER JOIN tbl_disciplina d ON (pd.codigo_disciplina = d.codigo_disciplina)
  ORDER BY f.nome, d.nome_disciplina;

--Quantidade de professores por disciplina
    SELECT nome_disciplina,
	       COUNT(f.codigo_funcionario) quantidade_professores
      FROM tbl_professor_disciplina pd
INNER JOIN tbl_funcionario f ON (pd.codigo_funcionario = f.codigo_funcionario)
INNER JOIN tbl_professor p ON (pd.codigo_funcionario = p.codigo_funcionario)
INNER JOIN tbl_disciplina d ON (pd.codigo_disciplina = d.codigo_disciplina)
  GROUP BY d.nome_disciplina
  ORDER BY d.nome_disciplina;
