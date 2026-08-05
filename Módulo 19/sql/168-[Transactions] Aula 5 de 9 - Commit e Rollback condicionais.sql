-- ============================================================
-- 🗄️  SQL Server  |  📦 Módulo 19 — Transactions
-- 📖 Aula 5 de 9  |  Commit e Rollback condicionais
-- ============================================================

/*
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📚 CONCEITO — Decidindo entre COMMIT e ROLLBACK com IF
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  Nem sempre um erro de sintaxe é o problema - às vezes a
  transação precisa ser desfeita por uma REGRA DE NEGÓCIO, como
  "não permitir saldo negativo".

  Nesses casos, usamos um IF depois dos comandos, testando a
  condição de negócio (aqui, ainda sem TRY/CATCH) para decidir se
  fazemos COMMIT ou ROLLBACK.
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
*/

USE BD_Transactions

-- ────────────────────────────────────────────────────────────
-- 🏋️ Exemplo prático
-- ────────────────────────────────────────────────────────────

SELECT * FROM Conta

-- 1️⃣  Transferência que respeitaria a regra "saldo não pode ficar negativo"
DECLARE @ValorTransferencia DECIMAL(10,2) = 300.00

BEGIN TRAN

   UPDATE Conta SET Saldo = Saldo - @ValorTransferencia WHERE ID_Conta = 1
   UPDATE Conta SET Saldo = Saldo + @ValorTransferencia WHERE ID_Conta = 2

   IF EXISTS (SELECT 1 FROM Conta WHERE Saldo < 0)
   BEGIN
      PRINT 'Saldo ficaria negativo - desfazendo transação'
      ROLLBACK
   END
   ELSE
   BEGIN
      PRINT 'Transferência válida - confirmando transação'
      COMMIT
   END

SELECT * FROM Conta

-- 2️⃣  Transferência que violaria a regra (valor maior que o saldo)
DECLARE @ValorInvalido DECIMAL(10,2) = 100000.00

BEGIN TRAN

   UPDATE Conta SET Saldo = Saldo - @ValorInvalido WHERE ID_Conta = 1
   UPDATE Conta SET Saldo = Saldo + @ValorInvalido WHERE ID_Conta = 2

   IF EXISTS (SELECT 1 FROM Conta WHERE Saldo < 0)
   BEGIN
      PRINT 'Saldo ficaria negativo - desfazendo transação'
      ROLLBACK
   END
   ELSE
   BEGIN
      PRINT 'Transferência válida - confirmando transação'
      COMMIT
   END

SELECT * FROM Conta -- saldo permanece igual ao passo anterior
