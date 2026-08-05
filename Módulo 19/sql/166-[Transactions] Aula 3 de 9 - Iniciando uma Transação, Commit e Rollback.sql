-- ============================================================
-- 🗄️  SQL Server  |  📦 Módulo 19 — Transactions
-- 📖 Aula 3 de 9  |  Iniciando uma Transação, Commit e Rollback
-- ============================================================

/*
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📚 CONCEITO — BEGIN TRAN, COMMIT e ROLLBACK
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  BEGIN TRAN
     comando 1
     comando 2
     ...
  COMMIT     -> confirma comando 1 e comando 2 permanentemente
  -- ou --
  ROLLBACK   -> desfaz comando 1 e comando 2, como se nunca tivessem
                acontecido
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
*/

USE BD_Transactions

-- ────────────────────────────────────────────────────────────
-- 🏋️ Exemplo prático
-- ────────────────────────────────────────────────────────────

SELECT * FROM Conta

-- 1️⃣  Transferência com COMMIT: as duas mudanças são efetivadas
BEGIN TRAN

   UPDATE Conta SET Saldo = Saldo - 200 WHERE ID_Conta = 1
   UPDATE Conta SET Saldo = Saldo + 200 WHERE ID_Conta = 2

COMMIT

SELECT * FROM Conta -- saldo já alterado e permanente

-- 2️⃣  Transferência com ROLLBACK: as duas mudanças são desfeitas
BEGIN TRAN

   UPDATE Conta SET Saldo = Saldo - 5000 WHERE ID_Conta = 1
   UPDATE Conta SET Saldo = Saldo + 5000 WHERE ID_Conta = 2

   SELECT * FROM Conta -- dentro da transação, já parece alterado...

ROLLBACK

SELECT * FROM Conta -- ...mas o ROLLBACK desfez tudo, saldo volta ao original
