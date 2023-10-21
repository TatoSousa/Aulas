## DQL - Linguagem de Consulta de dados
Definitivamente o comando mais utilizado em seu projeto, pois a inteligência que tanto é falada é gerado a partir de instruções bem elaboradas com o comando SELECT, com este comando é possível gerar resumos, relatórios, novas tabelas, alteração/inclusão/exclusão em massa, entre outras ações que serão adquiridas conforme a sua carreira em T.I for aumentando.

O sintaxe básica do comando SELECT é a seguinte:

```sql
SELECT *
FROM tbl_estados
```
Porém essa sintaxe vai muito além disso envolvendo Junções entre tabelas, uniões, intersecções, sub-selects, gerando assim um mundo de possibilidades para criação de relatórios com informações que poderá alterar a identificação de gargalhos e novas oportunidades para as empresas que estão utilizando estes recursos.

Um exemplo que podemos claramente executar com um comando de SELECT utilizando as seguintes tabelas: vendas, clientes, produtos, categorias, estados:
- Relação de vendas por estado;
- Relação de produtos mais vendidos por estados;
- Qual a média de vendas por clientes/estados/produtos;
- Venda média mensal/semanal/diária por categoria de produtos;
- etc

## Junções (JOIN)
Quando você pesquisa por JOIN, facilmente você irá encontrar diversos "sabores" como: LEFT, RIGHT, INNER, CROSS, NATURAL, entre diversos outros.
Praticamente o comando JOIN existe para satisfazer alguma necessidade de usar o relacionamento entre as tabelas (aquele mesmo que você define nos MER/DER).
Explicando de uma forma prática você tem que tratar como criar um JOIN, vamos seguir as instruções abaixo:

JOINs sempre estará relacionado a duas tabelas então quando estamos com um join "simples" (Somente duas tabelas), podemos dizer que a tabela principal (a esquerda) sempre será a tabela que está no FROM do comando SELECT, então a tabela que está a direita sempre estará no JOIN.

Então para localizar o nome do estado que o funcionário pertence o código será esse:

```sql
    SELECT nome, nome_estado
      FROM tbl_funcionarios
INNER JOIN tbl_estados  ON tbl_funcionarios.uf = tbl_estados.uf
ORDER BY nome_estado, nome;
```

No exemplo acima somente retornará os registros que existem nas duas tabelas (INNER), mas se quisermos retornar todos os registros da tabela tbl_funcionarios, indenpendente se tem ou não relacionamento na tabela tbl_estados, utilizamos o LEFT. Lembrando oque foi dito acima, a tabela principal está no FROM.

Existe caso que precisamos retornar todos os registros da tabela que está no JOIN (direita), neste caso utilizamos o RIGHT.

Você pode encontrar definições do LEFT e JOIN, utilizando a descrição LEFT OUTER ou RIGHT OUTER, em ambos os casos a execução é o mesmo.

Agora se o objetivo for retornar todos os registros de ambas as tabelas você precisará usar o FULL INNER JOIN, neste caso irá retornar todos os registros de ambas as tabelas envolvidas.

Caso você utilize LEFT, RIGHT, FULL todos os atributos que não forem localizados serão retornados como NULO. Abaixo uma forma visual dos JOIN apresentados.

![JOINS mais populares](https://github.com/TatoSousa/Aulas/blob/main/images/dml-selet-join.png)

**Modelos de SELECT com JOIN**
```sql
-- Inner join
    SELECT nome, nome_estado
      FROM tbl_funcionarios
INNER JOIN tbl_estados  ON tbl_funcionarios.uf = tbl_estados.uf
ORDER BY nome_estado, nome;

-- LEFT join
    SELECT nome, nome_estado
      FROM tbl_funcionarios
LEFT JOIN tbl_estados  ON tbl_funcionarios.uf = tbl_estados.uf
ORDER BY nome_estado, nome;

-- RIGHT join
    SELECT nome, nome_estado
      FROM tbl_funcionarios
RIGHT JOIN tbl_estados  ON tbl_funcionarios.uf = tbl_estados.uf
ORDER BY nome_estado, nome;

-- Inner join
    SELECT nome, nome_estado
      FROM tbl_funcionarios
OUTER INNER JOIN tbl_estados  ON tbl_funcionarios.uf = tbl_estados.uf
ORDER BY nome_estado, nome;
```

Em consultas com mais de um JOIN, deverá seguir a regra da tabela que está com a informação que você precisa "buscar" será será a tabela da direita.

## União, Intersecção e Excessão
Copiando a regra de conjuntos utilizadas na matemática podemos executá-la em instruções que precisamos buscar informações similares em diversos pontos do nosso banco de dados:
Vou chamar o resultado dos SELECTs de conjunto para melhorar o entendimento:

Exemplo: A empresa em que trabalhamos adquiriu uma concorrente, e para isso é necessário atualizar a base de dados de clientes, unindo as informações de ambos os sistemas. Podemos fazer das seguintes maneiras estas validações:

```sql
--Selecionando todas os clientes das tabelas, inclusive os repetidos
SELECT nome, cpf FROM clientes_empresa_x UNION
SELECT nome, cpf FROM clientes_empresa_y;

--Selecionando todas os clientes das tabelas, REMOVENDO os repetidos
SELECT nome, cpf FROM clientes_empresa_x UNION ALL
SELECT nome, cpf FROM clientes_empresa_y;

--Selecionando os clientes das duas empresas
SELECT nome, cpf FROM clientes_empresa_x INTERSECT
SELECT nome, cpf FROM clientes_empresa_y;

--Somente os clientes da empresa X
SELECT nome, cpf FROM clientes_empresa_x EXCEPT
SELECT nome, cpf FROM clientes_empresa_y;

--EXCEPT em alguns bancos de dados pode ser o comando MINUS
```

## SUB-SELECT/SUB-CONSULTAS
Em alguns momentos o SELECT começa a ficar muito complexo, quando isso acontece devemos melhorar o processo de forma que fique mais legivel, reduzindo a manutenção podemos usar sub-consultas.

EXEMPLO: No seu e-commerce você tem alguns procutos classificados como produto estrela, sendo que essa lista pode ser alterada a qualquer momento, então podemos utilizar uma consulta com estes produtos no filtro de outros relatórios:

```sql
SELECT produto_id, descricao, total_vendas
FROM vendas
INNER JOIN produtos ON vendas.produto_id = produtos.produto_id
WHERE vendas.produto_id IN (SELECT produto_id FROM produtos_estrela);
--Caso o subselect retorne vazio este código vai ocorrer o erro porquê na condição IN estará vazia.
```

Esta consulta poderia ser resolvida com outro JOIN, porém temos que pensar em dois casos Manutenção e Desempenho. 


<a href="https://github.com/TatoSousa/Aulas">Voltar para a página principal do repositório</a></br>
