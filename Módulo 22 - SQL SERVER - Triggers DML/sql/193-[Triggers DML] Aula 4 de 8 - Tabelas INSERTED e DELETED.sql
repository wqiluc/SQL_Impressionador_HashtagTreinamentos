-- ============================================================
-- 🗄️  SQL Server  |  📦 Módulo 22 — Triggers DML
-- 📖 Aula 4 de 8  |  Tabelas INSERTED e DELETED
-- ============================================================

/*
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📚 CONCEITO — As tabelas "mágicas" inserted e deleted
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  Dentro de QUALQUER trigger DML, o SQL Server disponibiliza duas
  tabelas temporárias, com a mesma estrutura da tabela monitorada:

  • inserted -> contém as linhas NOVAS
       - INSERT: as linhas que foram inseridas
       - UPDATE: os valores DEPOIS da alteração
  • deleted  -> contém as linhas ANTIGAS
       - DELETE: as linhas que foram removidas
       - UPDATE: os valores ANTES da alteração

  Ou seja, um UPDATE preenche as DUAS tabelas ao mesmo tempo:
  deleted com o "antes" e inserted com o "depois".
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
*/

USE BD_Triggers

-- ────────────────────────────────────────────────────────────
-- 🏋️ Exemplo prático
-- ────────────────────────────────────────────────────────────

DROP TRIGGER trg_Produto_AfterInsert

-- Trigger que reage aos três eventos e só exibe (PRINT) o
-- conteúdo de inserted/deleted, para fins didáticos
CREATE TRIGGER trg_Produto_Debug
ON Produto
AFTER INSERT, UPDATE, DELETE
AS
BEGIN
   PRINT '--- Conteúdo de INSERTED ---'
   SELECT * FROM inserted

   PRINT '--- Conteúdo de DELETED ---'
   SELECT * FROM deleted
END

-- 1️⃣  INSERT -> só popula "inserted"
INSERT INTO Produto(Nome, Estoque, PrecoUnitario)
VALUES ('Headset', 30, 350.00)

-- 2️⃣  UPDATE -> popula "deleted" (valor antigo) e "inserted" (valor novo)
UPDATE Produto SET Estoque = Estoque - 5 WHERE Nome = 'Headset'

-- 3️⃣  DELETE -> só popula "deleted"
DELETE FROM Produto WHERE Nome = 'Headset'
