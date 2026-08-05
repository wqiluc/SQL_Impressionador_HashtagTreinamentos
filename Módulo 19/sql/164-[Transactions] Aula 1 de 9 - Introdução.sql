-- ============================================================
-- 🗄️  SQL Server  |  📦 Módulo 19 — Transactions
-- 📖 Aula 1 de 9  |  Introdução
-- ============================================================

/*
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📚 CONCEITO — O problema que a Transaction resolve
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  Imagine uma transferência bancária: é preciso DEBITAR de uma
  conta e CREDITAR em outra. Se o débito acontecer e, por qualquer
  motivo (erro, queda de conexão), o crédito não acontecer, o
  dinheiro simplesmente desaparece.

  Uma TRANSACTION agrupa vários comandos em um único "bloco
  atômico": ou TODOS os comandos são efetivados (COMMIT), ou
  NENHUM é (ROLLBACK). Não existe meio-termo.

  Isso é resumido nas propriedades ACID:
  • Atomicidade  -> tudo ou nada
  • Consistência -> o banco sai de um estado válido para outro
  • Isolamento   -> transações não "enxergam" mudanças incompletas de outras
  • Durabilidade -> depois do COMMIT, a mudança é permanente

  Neste módulo vamos ver:
  1. O que é uma Transaction
  2. BEGIN TRAN, COMMIT e ROLLBACK
  3. Transações nomeadas
  4. Commit/Rollback condicionais
  5. Tratamento de erros com TRY/CATCH
  6. TRANCOUNT e transações aninhadas
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
*/

-- ────────────────────────────────────────────────────────────
-- 🏋️ Exemplo prático
-- ────────────────────────────────────────────────────────────

CREATE DATABASE BD_Transactions
GO

USE BD_Transactions
GO

CREATE TABLE Conta(
   ID_Conta INT IDENTITY(1,1) PRIMARY KEY,
   Titular  VARCHAR(100) NOT NULL,
   Saldo    DECIMAL(10,2) NOT NULL DEFAULT 0
)

INSERT INTO Conta(Titular, Saldo)
VALUES ('Ana Beatriz', 1000.00), ('Carlos Eduardo', 500.00)

SELECT * FROM Conta
