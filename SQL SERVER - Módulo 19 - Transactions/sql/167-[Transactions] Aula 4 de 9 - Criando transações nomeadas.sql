-- ============================================================
-- 🗄️  SQL Server  |  📦 Módulo 19 — Transactions
-- 📖 Aula 4 de 9  |  Criando transações nomeadas
-- ============================================================

/*
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📚 CONCEITO — Nomeando transações e SAVE TRANSACTION
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  É possível dar um nome à transação: BEGIN TRAN NomeDaTransacao.
  O nome serve principalmente para deixar o script mais legível
  (só o nome da transação mais "externa" é levado em conta pelo
  SQL Server quando há transações aninhadas).

  Também é possível criar um "ponto de salvamento" no meio de uma
  transação com SAVE TRANSACTION nome_do_ponto - permitindo um
  ROLLBACK PARCIAL, só até aquele ponto, sem desfazer a transação
  inteira.
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
*/

USE BD_Transactions

-- ────────────────────────────────────────────────────────────
-- 🏋️ Exemplo prático
-- ────────────────────────────────────────────────────────────

-- 1️⃣  Transação nomeada
BEGIN TRAN TransferenciaAnaCarlos

   UPDATE Conta SET Saldo = Saldo - 50 WHERE ID_Conta = 1
   UPDATE Conta SET Saldo = Saldo + 50 WHERE ID_Conta = 2

COMMIT TRAN TransferenciaAnaCarlos

SELECT * FROM Conta

-- 2️⃣  Rollback parcial com SAVE TRANSACTION
BEGIN TRAN

   UPDATE Conta SET Saldo = Saldo - 100 WHERE ID_Conta = 1

   SAVE TRANSACTION PontoAposDebito

   UPDATE Conta SET Saldo = Saldo + 999999 WHERE ID_Conta = 2 -- valor errado

   -- Desfaz só o que veio DEPOIS do ponto de salvamento
   ROLLBACK TRANSACTION PontoAposDebito

   UPDATE Conta SET Saldo = Saldo + 100 WHERE ID_Conta = 2 -- valor correto

COMMIT

SELECT * FROM Conta;