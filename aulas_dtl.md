## DTL - Linguagem de Transação de dados

Quando executamos a execução de qualquer comando no banco de dados chamamos de transação, mas também é possível executar um bloco de transação em única transação, vamos detalhar melhor:

- Quando executamos qualquer comando DDL em nossa base de dados, chamamos de uma transação implicita, pois o SGBD será responsável por sua execução por completo (persistindo os dados).
- Quando chamamos essa responsabilidade para o nosso app  (site, aplicativo, programa desktop etc) chamamos de transação explicita pois o programador irá decidir quando persistir (ou não) os dados na base de dados.

Todas as transações que são executadas devem respeitar 4 características que o banco de dados relacional deve controlar:
Atomicidade, isso quer dizer que todos os comandos do bloco de instrução serão executados;
Consistência, todas as restrições do banco de dados estão/serão respeitadas, e em caso de sucesso, o banco de dados será atualizado ou em caso de erro, o estado original não será alterado.
Isolamento, será evitado qualquer conflito entre as transações, evitando assim incosistências de dados, internamente executando uma serialização das transações.
Durabilidade, todos as transações concluídas com sucesso serão armazenadas no banco de dados de maneira integra e durável.

Também chamamos estas características pelo acronimo ACID.

<a href="https://github.com/TatoSousa/Aulas/blob/main/aulas_dtl.md#iniciando">Inciando (SET TRANSACTION, BEGIN)</a></br>
<a href="https://github.com/TatoSousa/Aulas/blob/main/aulas_dtl.md#gravando">Gravando (BEGIN)</a></br>
<a href="https://github.com/TatoSousa/Aulas/blob/main/aulas_dtl.md#pontos-de-salvamento">Pontos de Salvamento (SAVEPOINT)</a></br>
<a href="https://github.com/TatoSousa/Aulas/blob/main/aulas_dtl.md#cancelando">Cancelando (ROLLBACK)</a></br>
<a href="https://github.com/TatoSousa/Aulas/blob/main/aulas_dtl.md#exemplo-completo">Exemplo</a></br>
<a href="https://github.com/TatoSousa/Aulas/blob/main/aulas_dtl.md#perguntas-e-respostas">Perguntas e respostas</a></br>

<a href="https://github.com/TatoSousa/Aulas">Voltar para a página principal do repositório</a></br>

### Iniciando
Para iniciar uma transação no banco de dados é necessário executar um dos comandos abaixo, são vários pois depende do banco de dados utilizado.

```sql
BEGIN; --Postgresql
SET TRANSACTION  READ WRITE; --Oracle  
BEGIN TRANSACTION; --SQL Server
```

Estes comandos possuem parametros especificos para melhor o controle da sua transação como por exemplo, uma transação com acesso exclusivo e/ou somente leitura. Atendendo sempre uma necessidade especifica.

### Gravando
Para gravar/persistira transação no banco de dados executamos o comando COMMIT, que irá enviar a confirmação para o banco de dados. Neste momento a transação que está somente em memória será persistida na base de dados. 

### Pontos de salvamento
SAVEPOINT são posições em nossa transação que podemos salvar sem que ocorra erros de incosistências em nossa base de dados, ou seja, respeitando a característica de Consistência mencionada anteriormente, quando ocorra algum erro podemos persistir até o ponto que foi salvo anteriormente.

A sintaxe desse comando é a seguinte:

```sql
SAVEPOINT nome_ponto_salvamento;
```

### Cancelando
Podemos cancelar uma transação por completa, ou retorná-la até um ponto de salvamento, respeitando sempre o ACID. podemos usar esse comando da seguinte maneira:

```sql
ROLLBACK; --Cancela a transação por inteiro;
ROLLBACK TO SAVEPOINT nome_ponto_salvamento;   --Podocorrer variações desse comando, consulte a documentação do banco de dados.
```

### Exemplo completo

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
