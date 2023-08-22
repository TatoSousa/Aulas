-- Adicione a chave primária em todas as entidades utilizando o comando ALTER;
ALTER TABLE tbl_voo_passageiro_RMxxxx MODIFY id PRIMARY KEY;
ALTER TABLE tbl_voo_passageiro_RMxxxx ADD ( PRIMARY KEY (id) );
ALTER TABLE tbl_voo_passageiro_RMxxxx MODIFY id CONSTRAINT PK_COD_CLIENTE PRIMARY KEY;

ALTER TABLE tbl_aeronave_RMxxxx MODIFY matricula_aeronave PRIMARY KEY;
ALTER TABLE tbl_carga_RMxxxx MODIFY identificacao_carga PRIMARY KEY;
ALTER TABLE tbl_passageiro_RMxxxx MODIFY numero_passageiro PRIMARY KEY;
ALTER TABLE tbl_tripulante_RMxxxx MODIFY numero_tripulante PRIMARY KEY;
ALTER TABLE tbl_voo_carga_RMxxxx MODIFY id PRIMARY KEY;
ALTER TABLE tbl_voo_passageiro_RMxxxx MODIFY id PRIMARY KEY;
ALTER TABLE tbl_voo_tripulante_RMxxxx MODIFY id PRIMARY KEY;
ALTER TABLE tbl_voo_RMxxxx MODIFY nr_voo PRIMARY KEY;

--Adicione todas as chave estrangeiras (FOREIGN KEYS ou Chave de referência)
ALTER TABLE tbl_voo_RMxxxx ADD CONSTRAINT fk_aeronave_voo FOREIGN KEY(matricula_aeronave) REFERENCES tbl_aeronave_RMxxxx(matricula_aeronave);
ALTER TABLE tbl_voo_passageiro_RMxxxx ADD CONSTRAINT fk_passageiro_voo FOREIGN KEY(numero_passageiro) REFERENCES tbl_passageiro_RMxxxx(numero_passageiro);
ALTER TABLE tbl_voo_passageiro_RMxxxx ADD CONSTRAINT fk_passageiro_nr_voo FOREIGN KEY(nr_voo) REFERENCES tbl_voo_RMxxxx(nr_voo);
ALTER TABLE tbl_voo_tripulante_RMxxxx ADD CONSTRAINT fk_tripulante_voo FOREIGN KEY(numero_tripulante) REFERENCES tbl_tripulante_RMxxxx(numero_tripulante);
ALTER TABLE tbl_voo_tripulante_RMxxxx ADD CONSTRAINT fk_tripulante_nr_voo FOREIGN KEY(nr_voo) REFERENCES tbl_voo_RMxxxx(nr_voo);
ALTER TABLE tbl_voo_carga_RMxxxx ADD CONSTRAINT fk_carga_nr_voo FOREIGN KEY(nr_voo) REFERENCES tbl_voo_RMxxxx(nr_voo);
ALTER TABLE tbl_voo_carga_RMxxxx ADD CONSTRAINT fk_identificacao_carga_nr_voo FOREIGN KEY(nr_voo) REFERENCES tbl_voo_carga_RMxxxx(nr_voo);


-- Adicione uma chave de verificação (CHECK) para o ano de fabricação da aeronave maior que 2000;
ALTER TABLE tbl_aeronave_RMxxxx ADD CONSTRAINT ck_aeronave_ano CHECK(ano_fabricacao > 2000);

-- Adicione uma chave de verificação (CHECK) para a capacidade de passageiros na aeronave menor ou igual a 500;
ALTER TABLE tbl_aeronave_RMxxxx ADD CONSTRAINT ck_aeronave_capacidade CHECK(capacidade <= 500);

--Adicione uma chave de verificação (CHECK) no voo onde a data de chegada deve ser superior a data de partida
ALTER TABLE tbl_voo_RMxxxx ADD CONSTRAINT ck_data_chegada CHECK(data_chegada > data_partida);

/*
Sabendo que o comando SYSDATE, adicione um novo atributo nomeado comodata_registro na
tabela tbl_voo_RMxxxx, este atributo deverá ter o valor padrão de SYSDATE, e adicione
uma chave de verificação do campo data_partida maior ou igual a data_registro?
*/
ALTER TABLE tbl_voo_RMxxxx ADD data_registro date DEFAULT SYSDATE;
ALTER TABLE tbl_voo_RMxxxx
   ADD CONSTRAINT ck_data_partida CHECK(data_partida > data_registro);

/*
Adicione uma restrição unica na tabela de voos indicando que uma aeronave não pode 
efetuar duas viagens na mesma data.
*/

ALTER TABLE tbl_voo_RMxxxx
   ADD CONSTRAINT un_aeronave_data_partida UNIQUE (matricula_aeronave, data_partida);

/*
Adicione uma restrição Unica (chave única) para passageiros no voo, evitando assim
varios registros duplicados.
*/

ALTER TABLE tbl_voo_passageiro_RMxxxx
   ADD CONSTRAINT un_passageiro_voo UNIQUE (nr_voo, numero_passageiro);

/*
Adicione uma restrição Unica (chave única) para tripulantes no voo, evitando assim
varios registros duplicados.
*/

ALTER TABLE tbl_voo_tripulante_RMxxxx ADD CONSTRAINT un_tripulante_voo UNIQUE (nr_voo, numero_tripulante);

-- Adicione uma verificação no tbl_voo onde a origem e o destino sejam diferentes

ALTER TABLE tbl_voo_RMxxxx ADD CONSTRAINT ck_origem_destino CHECK(origem <> destino);


/*
Crie uma entidade para adicionar os modelos para aeronaves contendo um ID, modelo,
capacidade de passageiros, ano de fabricação e pais de origem, altere a estrutura
da tabela tbl_aeronave, referenciando a tabela de modelos, crie as verificações adicionadas 
anteriormente e remova as informações duplicadas (desnecessárias).
*/

CREATE TABLE tbl_modelo_aeronave_RMxxxx (
   id_modelo INTEGER GENERATED ALWAYS AS IDENTITY NOT NULL PRIMARY KEY,
   modelo VARCHAR(100) NOT NULL,
   capacidade INTEGER NOT NULL,
   ano_fabricacao INTEGER NOT NULL,
   pais_origem VARCHAR(30) NOT NULL
);
ALTER TABLE tbl_modelo_aeronave_RMxxxx ADD CONSTRAINT ck_ano_fabricacao CHECK(ano_fabricacao > 2000);
ALTER TABLE tbl_modelo_aeronave_RMxxxx ADD CONSTRAINT ck_capacidade CHECK(capacidade <= 500);

--DESCRIBE tbl_aeronave_RMxxxx;

INSERT INTO tbl_modelo_aeronave_RMxxxx (modelo, capacidade, ano_fabricacao, pais_origem)
SELECT DISTINCT modelo, capacidade, ano_fabricacao,'' FROM tbl_aeronave_RMxxxx;

ALTER TABLE tbl_aeronave_RMxxxx ADD id_modelo INTEGER REFERENCES tbl_modelo_aeronave_RMxxxx (id_modelo);
ALTER TABLE tbl_aeronave_RMxxxx DROP (modelo, capacidade, ano_fabricacao);

