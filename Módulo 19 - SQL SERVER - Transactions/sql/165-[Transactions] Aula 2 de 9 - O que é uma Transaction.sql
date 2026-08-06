-- ============================================================
-- 🗄️  SQL Server  |  📦 Módulo 19 — Transactions
-- 📖 Aula 2 de 9  |  O que é uma Transaction
-- ============================================================

/*
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📚 CONCEITO — Transação implícita (autocommit) vs explícita
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  Por padrão, o SQL Server já roda em modo "autocommit": todo
  comando isolado (um único INSERT, UPDATE, DELETE) já é uma
  transação implícita, efetivada sozinha assim que termina.

  Uma TRANSAÇÃO EXPLÍCITA é quando nós mesmos delimitamos o início
  e o fim do bloco, com:

  • BEGIN TRANSACTION (ou BEGIN TRAN) -> inicia o bloco
  • COMMIT TRANSACTION (ou COMMIT)    -> efetiva todas as mudanças
  • ROLLBACK TRANSACTION (ou ROLLBACK) -> desfaz todas as mudanças

  Enquanto uma transação não é finalizada (COMMIT ou ROLLBACK), as
  mudanças ficam visíveis apenas para a própria conexão que as
  fez - outras conexões continuam vendo o estado anterior.
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
*/

USE BD_Transactions

-- ────────────────────────────────────────────────────────────
-- 🏋️ Exemplo prático
-- ────────────────────────────────────────────────────────────

-- Sem transação explícita (autocommit): cada UPDATE já é
-- efetivado sozinho, um por um
UPDATE Conta SET Saldo = Saldo - 100 WHERE ID_Conta = 1
UPDATE Conta SET Saldo = Saldo + 100 WHERE ID_Conta = 2

SELECT * FROM Conta

-- Verificando se existe uma transação em aberto na sessão atual
-- (0 = nenhuma transação aberta)
SELECT @@TRANCOUNT AS TransacoesAbertas;