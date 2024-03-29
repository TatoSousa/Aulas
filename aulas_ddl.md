## DDL - Linguagem de definição de dados
Após elaborar os diagramas (DER/MER) é necessário que convertamos para o diagrama fisico, complementando o que foi apresentado nas aulas, abaixo podemos identificar alguns modelos de scripts para os principais comandos utilizados.

Estes comandos são responsáveis por realizar a modificações na estrutura física do banco de dados. Em qualquer treinamento/ou curso é comum tratar estes comandos somente com tabelas, porém eles são utilizados para trabalhar com Usuários, Views, Procedures, Functions, entre outros recursos disponíveis no banco de dados em questão, então pesquise sobre estes comandos e veja as possibilidades disponíveis aumentando assim o seu  conhecimento em banco de dados.

Todos os comandos presentes nesta categoria, são executados imediatamente ou seja não é possível retornar caso execute a limpeza de uma tabela ou exclusão de alguma coluna. Caso isso ocorra será necessário restaurar o backup.

<a href="https://github.com/TatoSousa/Aulas/blob/main/Aulas-DDL.md#criando-tabelas">Criando tabelas</a></br>
<a href="https://github.com/TatoSousa/Aulas/blob/main/Aulas-DDL.md#alterando-eou-modificando-tabelas">Alterando tabelas</a></br>
<a href="https://github.com/TatoSousa/Aulas/blob/main/Aulas-DDL.md#apagando-as-tabelas">Apagando</a></br>
<a href="https://github.com/TatoSousa/Aulas/blob/main/Aulas-DDL.md#limpando-uma-tabelas">Limpando</a></br>
<a href="https://github.com/TatoSousa/Aulas/blob/main/Aulas-DDL.md#exemplo-completo">Exemplo</a></br>
<a href="https://github.com/TatoSousa/Aulas/blob/main/Aulas-DDL.md#perguntas-e-respostas">Perguntas e respostas</a></br>

<a href="https://github.com/TatoSousa/Aulas">Voltar para a página principal do repositório</a></br>

### Criando tabelas
Para criar as tabelas (entidades) é necessario que tenhamos em mente oque será armazenado e a distribuição das informações. Além das restrições necessárias como campo obrigatório (NULL), relacionamento entre as tabelas e suas cardinalidades, e também as opções aceitas em cada atributo (coluna). No exemplo abaixo temos duas tabelas que serão relacionadas entre si.

```sql
CREATE TABLE tbl_funcionarios(
  id_funcionario INTEGER GENERATED ALWAYS AS IDENTITY,
  nome           VARCHAR(30),
  status         VARCHAR(8),
  estado_civil   VARCHAR(10)
);

CREATE TABLE tbl_estados (
   uf CHAR(2) PRIMARY KEY,
   nome_estado VARCHAR(30) NOT NULL 
);
```

### Alterando e/ou modificando tabelas
Como boa prática é interessante que cada informação da modelagem esteja bem definida, facilitando o entendimento da criação do diagrama, em alguns momentos pode parecer preciosismo, mas enquanto estamos aprendendo os comandos, é mais compreensivel que faça o passo-a-passo fixando assim o conhecimento, então todas as restrições estão identificadas abaixo:

```sql
-- Adicionando as restrições
ALTER TABLE tbl_funcionarios ALTER COLUMN nome SET NOT NULL;
ALTER TABLE tbl_funcionarios ALTER COLUMN status DEFAULT 'ATIVO';
ALTER TABLE tbl_funcionarios ALTER COLUMN status CHECK ('ATIVO', 'INATIVO', 'AFASTADO');
ALTER TABLE tbl_funcionarios ADD CONSTRAINT  tbl_funcionarios_pk PRIMARY KEY (id_funcionario);
```

```sql
--Adicionando uma nova coluna e tornando chave única
ALTER TABLE tbl_funcionarios ADD COLUMN cpf VARCHAR(11) UNIQUE; --ou

ALTER TABLE tbl_funcionarios ADD COLUMN cpf VARCHAR(11);
CREATE UNIQUE INDEX tbl_funcionarios_cpf_un ON tbl_funcionarios(cpf);
```

```sql
--Adicionando uma coluna com chave estrangeira para a tbl_estados
ALTER TABLE tbl_funcionarios ADD COLUMN uf CHAR(2); --Com o mesmo datatype da coluna que será relacionada
ALTER TABLE tbl_funcionarios ADD CONSTRAINT tbl_funcionarios_uf_fk REFERENCES tbl_estados(uf);
--ou
ALTER TABLE tbl_funcionarios ADD COLUMN uf CHAR(2) REFERENCES tbl_estados(uf);
```

```sql
--Apagando uma coluna/atributo
ALTER TABLE tbl_funcionarios DROP COLUMN  estado_civil;
```

### Apagando as tabelas
Normalmente para apagar uma tabela podemos utilizar o comando **DROP**, porém pode ocorrer erros caso exista algum relacionamento definido, neste caso é necessário apagar os relacionamentos (chaves estrangeiras), para concluir ação.

```sql
DROP TABLE tbl_funcionarios;
```

### Limpando uma tabelas
Para limpar os registros rapidamente utilizamos o comando TRUNCATE, atenção, como este comando faz parte do grupo de DDL não é possível executar o ROLLBACK (retornar as informações), por este motivo caso necessite restaurar a informação será necessário executar o restore da tabela, porque ela estará vazia após o comando.

```sql
 TRUNCATE TABLE tbl_funcionarios;
```

### Exemplo completo

```sql
CREATE TABLE tbl_estados (
   uf CHAR(2) PRIMARY KEY,
   nome_estado VARCHAR(30) NOT NULL 
);

CREATE TABLE tbl_funcionarios(
   id_funcionario INTEGER GENERATED ALWAYS AS IDENTITY,
   nome           VARCHAR(30) NOT NULL,
   status         VARCHAR(8) DEFAULT 'ATIVO' CHECK ('ATIVO', 'INATIVO', 'AFASTADO'),
   uf             CHAR(2) NOT NULL,
   cpf            VARCHAR(11),
   salario        DECIMAL(10,2) DEFAULT 0,
   CONSTRAINT tbl_funcionarios_pk    PRIMARY KEY (id_funcionario),
   CONSTRAINT tbl_funcionarios_uf_fk FOREIGN KEY (uf) REFERENCES tbl_estados(uf)
);
CREATE UNIQUE INDEX tbl_funcionarios_cpf_un ON tbl_funcionarios(cpf);
```

### Perguntas e respostas
<details>
  <summary>Oque é o conceito de mini-mundo?</summary>
Quando estamos desenvolvimento um projeto é normal que tenhamos a vontade de trabalhar com "o todo", porém é necessário manter o foco em uma estrutura menor para que tenhamos sucesso no nosso planejamento, este foco chamamos de mini-mundo, que no decorrer do tempo (e do projeto) será ampliado, até o ponto que conseguimos dimensionar o sistema.</br>
  Um exemplo que podemos citar é um Sistema de relacionamento com cliente (CRM), onde o mini-mundo pode ser simplesmente o cadastro do cliente, pois sabemos que o CRM é muito superior a este mini-mundo, porém se este ponto não for bem projeto todo o contexto pode correr risco de não atender as necessidades.</br>
  Em resumo, podemos dizer que o mini-mundo é a compilação das informações encontradas na análise de requisitos para uma parte especifica do projeto a ser criado no banco de dados.
</details>

<details>
  <summary>Oque é um Dataset</summary>
Dataset é uma coleção de registros armazenados em tabelas e/ou arquivo.</br>
É comum encontrarmos datasets públicos disponíveis na internet exemplo do e-commerce Olist no site do Kaggle, estes datasets podem ser trabalhados livremente para pesquisas e estudos.
</details>

<details>
  <summary>Porque usamos a cláusula CONSTRAINT antes de criar uma restrição (Primary ou Foreign Key)?</summary>
Esta instrução é opcional, porém quando utilizamos ela temos o controle de qual nome será utilizado, em caso de manutenção na estrutura podemos identificar facilmente em casos de erros.
</details>

<details>
  <summary>Qual a diferença entre chave primária (Primary Key) e indice unico (Unique), se ambos podem ser utilizados como referencias (Foreign Keys)?</summary>
A chave primária é um identificador único na tabela, ou seja todos os registros possuem esta informação persistida, porém a chave única não está preenchida em todos os registros, gerando assim registros nulos (vazios) na tabela. Podemos dizer que internamente uma chave primária é igual ao Indice único porém obrigatório (NOT NULL).
</details>

<details>
  <summary>É possível localizar todas as tabelas que estão relacionadas com a tabela que desejamos apagar (DROP)?</summary>
Cada banco de dados possuem o seu dicionário de dados, por este motivo é possível identificar quais tabelas estão relacionadas, porém é necessário identificar em cada banco este recurso, muitas IDE (Ferramentas case) tem este recurso visual, ficando a seu critério como será efetuado esse processo para apagar a tabela desejada.
</details>


