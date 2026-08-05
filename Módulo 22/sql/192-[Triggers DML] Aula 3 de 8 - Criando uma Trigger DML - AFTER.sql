-- ============================================================
-- 🗄️  SQL Server  |  📦 Módulo 22 — Triggers DML
-- 📖 Aula 3 de 8  |  Criando uma Trigger DML - AFTER
-- ============================================================

/*
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📚 CONCEITO — Primeira Trigger AFTER INSERT
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  Vamos criar uma trigger que, toda vez que um produto novo for
  inserido em Produto, registra automaticamente uma linha em
  ProdutoLog - sem que quem faz o INSERT precise se preocupar com
  isso.
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
*/

USE BD_Triggers

-- ────────────────────────────────────────────────────────────
-- 🏋️ Exemplo prático
-- ────────────────────────────────────────────────────────────

CREATE TRIGGER trg_Produto_AfterInsert
ON Produto
AFTER INSERT
AS
BEGIN
   INSERT INTO ProdutoLog(ID_Produto, Operacao)
   SELECT ID_Produto, 'INSERT'
   FROM inserted
END

-- Inserindo um produto normalmente - a trigger dispara sozinha
INSERT INTO Produto(Nome, Estoque, PrecoUnitario)
VALUES ('Cadeira Gamer', 10, 1200.00)

-- Conferindo que o log foi criado automaticamente
SELECT * FROM Produto
SELECT * FROM ProdutoLog
