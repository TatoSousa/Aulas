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

### Alterando

### Excluindo

### Mesclando

### Perguntas e respostas
<details>
  <summary>Oque é autocommit?</summary>
  Os bancos de dados relacionais possuem a configuração de autocommit (geralmente ativadas), isso indica que a cada comando enviado para o banco de dados será persistido o comando.</br>
  É possível alterar essa configuração, porém isso não é aconselhável, pois dependerá de fatores externos onde todos os comandos devem possuir o COMMIT ou ROLLBACK no seu final, ficando todo o processo em memória.
</details>

<details>
  <summary>Oque significa ACID?</summary>
ACID é o acronimo para as seguintes características: Atomicidade, Consistência, Isolamento e Durabilidade.
</details>

<details>
  <summary>Por que falamos que um registro deve ser atomico na base de dados?</summary>
Quando falamos de algo atomico em banco de dados significa que é um registro unico dentro da base de dados, ou seja, não possui nenhum valor igual a ele.
</details>

<details>
  <summary>Como definir persistência em banco de dados?</summary>
Quando gravamos ou atualizamos um registro em banco de dados, chamamos de persistência das informações na base de dados.
</details>

<details>
  <summary>Quais tipos de falhas podem cancelar uma transação?</summary>
- Falha de Hardware, Software e/ou rede;
- Erro durante a execução de operação na transação;
- Excessões detectadas pela transação, que necessitam o cancelamento;
- Falta de Energia;
- Falhas prevista pelo programador
</details>

<details>
  <summary>Podemos executar comando DDL dentro de um bloco de comandos?</summary>
Não, comandos DDL são executados implicitamente pelo banco de dados, por este motivo não é possível executar em um bloco de comandos.
</details>

<details>
  <summary>Em que momento uma transação fica disponível para todos os usuário no banco de dados?</summary>
Após a realização do comando COMMIT, a transação ficará disponível para todos os usuários, antes desse comando a informação estará disponível somente na sessão que originou a transação. Ou seja, antes do comando COMMIT a informação estará somente em memória.
</details>
