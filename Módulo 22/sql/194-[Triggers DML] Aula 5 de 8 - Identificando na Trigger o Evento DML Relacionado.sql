-- ============================================================
-- 🗄️  SQL Server  |  📦 Módulo 22 — Triggers DML
-- 📖 Aula 5 de 8  |  Identificando na Trigger o Evento DML Relacionado
-- ============================================================

/*
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📚 CONCEITO — Descobrindo se foi INSERT, UPDATE ou DELETE
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  Quando uma única trigger reage a vários eventos (AFTER INSERT,
  UPDATE, DELETE), muitas vezes é preciso saber QUAL DOS TRÊS
  disparou a execução, para aplicar uma lógica diferente em cada
  caso.

  O truque é combinar a presença de linhas em inserted/deleted:

  | Evento | inserted tem linhas? | deleted tem linhas? |
  |--------|------------------------|------------------------|
  | INSERT | Sim                    | Não                    |
  | UPDATE | Sim                    | Sim                    |
  | DELETE | Não                    | Sim                    |
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
*/

USE BD_Triggers

-- ────────────────────────────────────────────────────────────
-- 🏋️ Exemplo prático
-- ────────────────────────────────────────────────────────────

DROP TRIGGER trg_Produto_Debug

CREATE TRIGGER trg_Produto_Log
ON Produto
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
   DECLARE @Operacao VARCHAR(10)

   IF EXISTS (SELECT 1 FROM inserted) AND EXISTS (SELECT 1 FROM deleted)
      SET @Operacao = 'UPDATE'
   ELSE IF EXISTS (SELECT 1 FROM inserted)
      SET @Operacao = 'INSERT'
   ELSE
      SET @Operacao = 'DELETE'

   IF @Operacao IN ('INSERT', 'UPDATE')
      INSERT INTO ProdutoLog(ID_Produto, Operacao)
      SELECT ID_Produto, @Operacao FROM inserted
   ELSE
      INSERT INTO ProdutoLog(ID_Produto, Operacao)
      SELECT ID_Produto, @Operacao FROM deleted
END

-- Testando os três eventos
INSERT INTO Produto(Nome, Estoque, PrecoUnitario) VALUES ('Webcam', 20, 220.00)
UPDATE Produto SET Estoque = Estoque - 1 WHERE Nome = 'Webcam'
DELETE FROM Produto WHERE Nome = 'Webcam'

SELECT * FROM ProdutoLog
