## DML - Linguagem de Manipulação de dados

Todas as informações armazenadas no banco de dados são persistidas a partir dos comandos do grupo de DML. Com estes comandos podemos adicionar, alterar, e apagar registros em nossa base de dados.

A sintaxe destes comandos tendem a ser de fácil compreensão facilitando o seu uso, e transformando o seu banco de dados no repositório ideal para os seus dados e informações.

Mas porque repositório? Neste momento estamos somente armazenando as informações que geramos em nossa aplicação, sem a abstração adequada para gerar conhecimento ou inteligência para o nosso cliente, porém com essa informação bem estrutura em nossa base de dados é possível identificar pontos interessantes para a tomada de decisão, exemplo:

O cadastro de vendas é somente a representação das vendas que ocorreram durante um determinado período, assim a tabela terá milhões de registros no decorrer do tempo. Esta é a principal função dos comandos DML. Após este armazenamento, precisamos adicionar inteligência que ser podemos adicionar com a geração de consultas onde iremos aprender com os comandos da Linguagem de consulta de dados - DQL;

Abaixo está uma representação basica de cada comando pertencente ao grupo de DML.

<a href="https://github.com/TatoSousa/Aulas/blob/main/aulas_dml.md#inserindo">Inserindo/Adicionando (INSERT)</a></br>
<a href="https://github.com/TatoSousa/Aulas/blob/main/aulas_dml.md#alterando">Alterando (UPDATE)</a></br>
<a href="https://github.com/TatoSousa/Aulas/blob/main/aulas_dml.md#excluindo">Excluindo/Apagando (DELETE)</a></br>
<a href="https://github.com/TatoSousa/Aulas/blob/main/aulas_dml.md#mesclando">Mesclando (MERGE)</a></br>
<a href="https://github.com/TatoSousa/Aulas/blob/main/aulas_dml.md#perguntas-e-respostas">Perguntas e respostas</a></br>

<a href="https://github.com/TatoSousa/Aulas">Voltar para a página principal do repositório</a></br>

### Inserindo

```sql
--Sintaxe básica do comando INSERT:
INSERT INTO tbl_estados (uf, nome_estado) VALUES ('SP', 'São Paulo');

--Vários registro com um único comando de INSERT:
INSERT INTO tbl_estados (uf, nome_estado) VALUES ('RJ', 'Rio de Janeiro'),
                                                 ('MG', 'Minas Gerais'),
                                                 ('ES', 'Espirito Santo');

--Inserindo a partir de outra tabela
INSERT INTO tbl_estados (uf, nome_estado)
SELECT UF, nome_estado FROM tbl_estados_regiao_sul;
```

### Alterando

```sql
--Atualizando o status de todos os funcionarios para inativo
UPDATE tbl_funcionarios SET status = 'INATIVO';

--Atualizando a uf do funcionario com id_funcionario igual a 1 para RJ
UPDATE tbl_funcionarios SET uf = 'RJ' WHERE id_funcionario = 1;

--Atualizando o salario em 10% dos funcionarios que estão presentes na tabela de funcionários promovidos;
UPDATE tbl_funcionarios SET salario = salario * 1.1
FROM tbl_funcionarios_promovidos
WHERE tbl_funcionarios_promovidos.id_funcionario = tbl_funcionarios.id_funcionario;
--ou
UPDATE tbl_funcionarios SET salario = salario * 1.1
WHERE id_funcionario IN (SELECT id_funcionario
                           FROM tbl_funcionarios_promovidos.id_funcionario);
```

### Excluindo
```sql
--excluindo todos os funcionarios inativos
DELETE FROM tbl_funcionarios WHERE status = 'INATIVO';

```

### Mesclando
```sql
--Atualizando um resumo de vendas
MERGE INTO destino target
USING origem source --neste ponto pode ser uma tabela, view, sub-select
ON (target.id_produto = source.id_produto)
WHEN MATCHED THEN --Encontrou
UPDATE SET qtde_vendas = source.qtde_vendas, dt_update = current_timestamp
WHEN NOT MATCHED THEN -- Nao Encontrou
INSERT (id_produto, qtde_vendas) VALUES (source.id_produto, source.qtde_
```

### Perguntas e respostas
<details>
  <summary>Porque a utilização do WHERE é tão importante</summary>
  Quando executamos o comando UPDATE e DELETE devemos informar quais são as condições do registro que deve ser persistido,  caso não informarmos essa cláusula indica que iremos alterar (ou apagar) todos os registros da tabela em questão. Neste caso pode gerar uma quantidade enorme de incosistências.</details>

<details>
  <summary>Qual a diferença entre DROP, TRUNCATE e DELETE?</summary>
Usamos o DROP para apagar a estrutura completa (registros e estrutura), TRUNCATE quando precisamos limpar uma tabela por completo, sem atualizar os indices que foram criados, DELETE para apagar registros especificos da tabela, atualizando os indices e melhorando o desempenho após a sua execução.
</details>

<details>
  <summary>Quando podemos usar o  MERGE no banco de dados?</summary>
  Podemos usar o `MERGE` em atualizações de preços, atualização da listagem de produtos em caso de atualização de preços e/ou adicionar novos registros ao mesmo tempo. Ou seja, as possibilidades são enormes quando precisamos executar dois ou mais comandos DML na mesma transação.
</details>

