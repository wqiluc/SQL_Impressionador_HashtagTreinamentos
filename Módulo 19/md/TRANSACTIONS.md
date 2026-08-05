<h1 align="center">
  🔁 Transactions <br>
  <img src="https://img.shields.io/badge/-BEGIN%20TRAN%20..%20COMMIT%20..%20ROLLBACK-14b8a6?style=flat-square"/>
</h1>

<p align="center">
  <img src="https://img.shields.io/badge/-SQL%20Server-111827?style=flat-square&logo=microsoftsqlserver&logoColor=white"/>
  <img src="https://img.shields.io/badge/Módulo-19-4FC3F7?style=flat-square"/>
  <img src="https://img.shields.io/badge/Slide-Módulo%2020-blueviolet?style=flat-square"/>
</p>

> 📌 Seguindo o padrão dos módulos anteriores, nos slides de abertura o instrutor deve numerar este
> conteúdo como **"Módulo 20"**, correspondendo à pasta `Módulo 19` deste repositório.

> 🖼️ Este módulo ainda não tem screenshots das aulas na pasta `img/` — assim que forem adicionados,
> as tags `<img>` correspondentes entram nas seções abaixo.

<h2 align="center">💡 O que é uma Transaction? <br>
<img src="https://img.shields.io/badge/-Conceito-f59e0b?style=flat-square"/></h2>

**Para que serve:**

- Uma **transação** agrupa vários comandos em um bloco **atômico**: ou **todos** são efetivados, ou
  **nenhum** é;
- Clássico exemplo: uma transferência bancária precisa **debitar** de uma conta e **creditar** em
  outra — se só uma das duas partes acontecer, o dinheiro "desaparece";
- Resumido nas propriedades **ACID**: **A**tomicidade, **C**onsistência, **I**solamento,
  **D**urabilidade.

Por padrão, o SQL Server roda em modo **autocommit**: cada comando isolado já é uma transação
implícita. Uma **transação explícita** delimita o bloco manualmente:

```sql
BEGIN TRAN
    UPDATE Conta SET Saldo = Saldo - 100 WHERE ID_Conta = 1
    UPDATE Conta SET Saldo = Saldo + 100 WHERE ID_Conta = 2
COMMIT
```

<h2 align="center">✅❌ COMMIT e ROLLBACK <br>
<img src="https://img.shields.io/badge/-COMMIT%20..%20ROLLBACK-8b5cf6?style=flat-square"/></h2>

| Comando | O que faz |
|---------|-----------|
| `BEGIN TRANSACTION` (ou `BEGIN TRAN`) | Inicia o bloco de transação |
| `COMMIT` | Confirma **permanentemente** todas as mudanças do bloco |
| `ROLLBACK` | Desfaz **todas** as mudanças do bloco, como se nunca tivessem acontecido |

<h2 align="center">🏷️ Transações nomeadas e SAVE TRANSACTION <br>
<img src="https://img.shields.io/badge/-Nomea%C3%A7%C3%A3o-3b82f6?style=flat-square"/></h2>

```sql
BEGIN TRAN TransferenciaAnaCarlos
    UPDATE Conta SET Saldo = Saldo - 50 WHERE ID_Conta = 1
    UPDATE Conta SET Saldo = Saldo + 50 WHERE ID_Conta = 2
COMMIT TRAN TransferenciaAnaCarlos
```

`SAVE TRANSACTION nome_do_ponto` cria um ponto de salvamento no meio da transação, permitindo um
**rollback parcial** — só até aquele ponto, sem desfazer o bloco inteiro:

```sql
BEGIN TRAN
    UPDATE Conta SET Saldo = Saldo - 100 WHERE ID_Conta = 1
    SAVE TRANSACTION PontoAposDebito

    UPDATE Conta SET Saldo = Saldo + 999999 WHERE ID_Conta = 2 -- valor errado
    ROLLBACK TRANSACTION PontoAposDebito -- desfaz só esse UPDATE

    UPDATE Conta SET Saldo = Saldo + 100 WHERE ID_Conta = 2 -- valor correto
COMMIT
```

<h2 align="center">🧠 Commit/Rollback condicionais e TRY/CATCH <br>
<img src="https://img.shields.io/badge/-Tratamento%20de%20erros-f59e0b?style=flat-square"/></h2>

Regras de negócio (como "saldo não pode ficar negativo") podem decidir entre `COMMIT`/`ROLLBACK` com
um `IF`. O padrão profissional, porém, combina `BEGIN TRAN` com `TRY/CATCH`, capturando **qualquer**
erro em tempo de execução:

```sql
BEGIN TRY
    BEGIN TRAN
        UPDATE Conta SET Saldo = Saldo - 150 WHERE ID_Conta = 1
        UPDATE Conta SET Saldo = Saldo + 150 WHERE ID_Conta = 2
    COMMIT
END TRY
BEGIN CATCH
    IF @@TRANCOUNT > 0
        ROLLBACK

    PRINT 'Erro ao transferir: ' + ERROR_MESSAGE()
END CATCH
```

| Função | O que retorna |
|--------|----------------|
| `ERROR_MESSAGE()` | Mensagem do erro capturado |
| `ERROR_NUMBER()` | Código do erro |
| `ERROR_LINE()` | Linha onde o erro ocorreu |
| `XACT_STATE()` | Estado da transação (`1` = pode commitar, `-1` = só pode dar rollback, `0` = sem transação aberta) |

<h2 align="center">🪆 @@TRANCOUNT e Transações Aninhadas <br>
<img src="https://img.shields.io/badge/-Aninhamento-475569?style=flat-square"/></h2>

`@@TRANCOUNT` devolve quantas transações estão "empilhadas" na conexão atual:

| Comando | Efeito no `@@TRANCOUNT` |
|---------|---------------------------|
| `BEGIN TRAN` | `+1` |
| `COMMIT` | `-1` (só efetiva de verdade quando chega a `0`) |
| `ROLLBACK` (em qualquer nível) | Zera tudo e **desfaz o bloco inteiro**, mesmo transações internas que já tinham dado `COMMIT` |

> ⚠️ Um `COMMIT` interno **não** efetiva nada sozinho enquanto existir uma transação externa aberta.
> Já um `ROLLBACK`, não importa em qual nível de aninhamento, sempre desfaz tudo.

<h2 align="center">📋 Resumo <br>
<img src="https://img.shields.io/badge/-Resumo-475569?style=flat-square"/></h2>

| Sintaxe | O que faz |
|---------|-----------|
| `BEGIN TRAN [nome]` | Inicia uma transação (opcionalmente nomeada) |
| `COMMIT [TRAN nome]` | Confirma as mudanças permanentemente |
| `ROLLBACK [TRAN nome/ponto]` | Desfaz as mudanças (total ou até um ponto de salvamento) |
| `SAVE TRANSACTION nome` | Cria um ponto de salvamento para rollback parcial |
| `BEGIN TRY / BEGIN CATCH` | Captura erros em tempo de execução dentro da transação |
| `@@TRANCOUNT` | Quantidade de transações abertas/aninhadas na sessão |
| `XACT_STATE()` | Estado atual da transação |

<h2 align="center">🗄️ Conteúdo do Módulo <br>
<img src="https://img.shields.io/badge/-Tópicos-475569?style=flat-square"/></h2>

| Tópico | Status |
|--------|--------|
| O que é uma Transaction (ACID, autocommit vs explícita) | ✅ Concluído |
| BEGIN TRAN, COMMIT e ROLLBACK | ✅ Concluído |
| Transações nomeadas e SAVE TRANSACTION | ✅ Concluído |
| Commit e Rollback condicionais | ✅ Concluído |
| Tratamento de erros com TRY/CATCH | ✅ Concluído |
| @@TRANCOUNT e Transações Aninhadas | ✅ Concluído |
| Exercícios | ⏳ Pendente (aguardando enunciado) |
