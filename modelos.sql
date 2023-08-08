CREATE TABLE nome (  id INTEGER , descricao VARCHAR(100) );

CREATE TABLE categoria_produtos (
    id INTEGER GENERATED ALWAYS AS IDENTITY (START WITH 2 INCREMENT BY 2 MAXVALUE 200 NOCYCLE),
    descricao VARCHAR(50),
    PRIMARY KEY (id)
);


TRUNCATE TABLE xyz;


ALTER TABLE tbl_clientes DROP COLUMN email; --Apagando uma coluna

ALTER TABLE tbl_cursos MODIFY (nome_curso VARCHAR(100));


ALTER TABLE tbl_cursos MODIFY (
nome_curso VARCHAR(50) DEFAULT 'Valor não informado',
abreviatura_curso VARCHAR(10),
turmas_abertas BIT DEFAULT 0
);


ALTER TABLE tbl_cursos MODIFY (
nome_curso VARCHAR(50) DEFAULT 'Valor não informado',
abreviatura_curso VARCHAR(10),
turmas_abertas BIT DEFAULT 0
);

CREATE UNIQUE INDEX {nome do indice} ON nome_da_tabela(coluna1, coluna2, colunaN);
ALTER TABLE {nome_da_tabela}
ADD CONSTRAINT {nome_chave_primaria}
PRIMARY KEY (coluna1, coluna2, colunaN);

ALTER TABLE produtos ADD CONSTRAINT ck_produtos_saldo CHECK ( saldo > 0 );

--Chave de referência / Estrangeira
ALTER TABLE {tabela_filha_ou_fraca}
ADD CONSTRAINT {nome_chave_estrangeira}
FOREIGN KEY (coluna1, …, colunaN) REFERENCES {tabela_pai_ou_forte}(coluna1, …, colunaN);


ALTER TABLE tbl_clientes
ADD CONSTRAINT fk_clients_situacoes
FOREIGN KEY (situ_codigo) REFERENCES situacao(situ_codigo);


RENAME table_name TO new_name;
ALTER TABLE tbl_curso RENAME COLUMN nome_curso TO nome_treinamento;









--Vamos adicionar na entidade tbl_funcionarios a chave de referência
ALTER TABLE tbl_funcionarios
ADD CONSTRAINT tbl_funcionarios_codigo_funcionario1_fkey FOREIGN KEY (codigo_funcionario1)
REFERENCES public.tbl_funcionarios ( codigo_funcionario );



-- Criando dados genericos
BEGIN --Iniciando uma transação para executar o insert 10x
FOR v_LoopCounter IN 0..10 LOOP
INSERT INTO teste_auto_incremento (descricao) VALUES ('cadastro');
COMMIT;
END LOOP;
END;
