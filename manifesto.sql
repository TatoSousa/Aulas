/*
-- Conecte no Oracle SQL Developer;
-- Altere o texto RMxxxx pelo seu RM .... exemplo RM123456
-- Execute a criação de todas as tabelas
-- Crie os códigos solicitados ao final do script
*/

CREATE TABLE tbl_aeronave_RMxxxx (
    matricula_aeronave VARCHAR(20) NOT NULL,
    modelo VARCHAR(100) NOT NULL,
    capacidade INTEGER NOT NULL,
    ano_fabricacao INTEGER NOT NULL,
    companhia_aerea_proprietaria VARCHAR(100) NOT NULL
);

CREATE TABLE tbl_carga_RMxxxx (
   identificacao_carga INTEGER GENERATED ALWAYS AS IDENTITY NOT NULL,
   descricao VARCHAR(200) NOT NULL,
   peso NUMBER(10,3) NOT NULL,
   volume NUMBER(10,3) NOT NULL
);

CREATE TABLE tbl_tripulante_RMxxxx (
   numero_tripulante INTEGER GENERATED ALWAYS AS IDENTITY NOT NULL,
   nome VARCHAR(100) NOT NULL,
   documento_identificacao VARCHAR(20) NOT NULL,
   funcao VARCHAR(50) NOT NULL
);

CREATE TABLE tbl_passageiro_RMxxxx (
   numero_passageiro INTEGER GENERATED ALWAYS AS IDENTITY NOT NULL,
   nome VARCHAR(100) NOT NULL,
   documento_identificacao VARCHAR(20) NOT NULL,
   data_nascimento DATE NOT NULL
);

CREATE TABLE tbl_voo_RMxxxx (
   nr_voo INTEGER GENERATED ALWAYS AS IDENTITY NOT NULL,
   origem VARCHAR(100) NOT NULL,
   destino VARCHAR(100) NOT NULL,
   data_partida DATE NOT NULL,
   data_chegada DATE NOT NULL,
   matricula_aeronave VARCHAR(20) NOT NULL
);

CREATE TABLE tbl_voo_carga_RMxxxx (
   id INTEGER GENERATED ALWAYS AS IDENTITY NOT NULL,
   nr_voo INTEGER NOT NULL,
   identificacao_carga INTEGER NOT NULL
);

CREATE TABLE tbl_voo_tripulante_RMxxxx (
   nr_voo INTEGER NOT NULL,
   numero_tripulante INTEGER NOT NULL,
   id INTEGER GENERATED ALWAYS AS IDENTITY NOT NULL
);

CREATE TABLE tbl_voo_passageiro_RMxxxx (
   nr_voo INTEGER NOT NULL,
   numero_passageiro INTEGER NOT NULL,
   id INTEGER GENERATED ALWAYS AS IDENTITY NOT NULL
);


/* -- > Crie os scripts para atender as solicitações abaixo:

 1 - Adicione a chave primária em todas as entidades utilizando o comando ALTER;
 2 - Adicione todas as chave estrangeiras (FOREIGN KEYS ou Chave de referência)
 3 - Adicione uma chave de verificação (CHECK) para o ano de fabricação da aeronave maior que 2000;
 4 - Adicione uma chave de verificação (CHECK) para a capacidade de passageiros na aeronave menor ou igual a 500;
 5 - Adicione uma chave de verificação (CHECK) no voo onde a data de chegada deve ser superior a data de partida

 6 - Sabendo que o comando SYSDATE, adicione um novo atributo nomeado comodata_registro na
     tabela tbl_voo_RMxxxx, este atributo deverá ter o valor padrão de SYSDATE, e adicione
     uma chave de verificação do campo data_partida maior ou igual a data_registro?

 7 - Adicione uma restrição unica na tabela de voos indicando que uma aeronave não pode efetuar duas viagens na mesma data.
 8 - Adicione uma restrição Unica (chave única) para passageiros no voo, evitando assim varios registros duplicados.
 9 - Adicione uma restrição Unica (chave única) para tripulantes no voo, evitando assim varios registros duplicados.
10 - Adicione uma verificação no tbl_voo onde a origem e o destino sejam diferentes
11 - Crie uma entidade para adicionar os modelos para aeronaves contendo um ID, modelo, capacidade de passageiros, ano de 
     fabricação e pais de origem, altere a estrutura da tabela tbl_aeronave, referenciando a tabela de modelos, crie as
	 verificações adicionadas anteriormente e remova as informações duplicadas (desnecessárias).
*/
--COMMIT
