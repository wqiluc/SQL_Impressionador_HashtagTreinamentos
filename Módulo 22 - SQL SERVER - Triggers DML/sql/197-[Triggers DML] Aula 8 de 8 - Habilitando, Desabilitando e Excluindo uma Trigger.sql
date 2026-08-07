-- ============================================================
-- 🗄️  SQL Server  |  📦 Módulo 22 — Triggers DML
-- 📖 Aula 8 de 8  |  Habilitando, Desabilitando e Excluindo uma Trigger
-- ============================================================

/*
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📚 CONCEITO — DISABLE, ENABLE e DROP TRIGGER
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  Assim como uma constraint, uma trigger pode ser desabilitada
  temporariamente (sem ser excluída) - útil para cargas de dados
  em massa que não devem disparar a lógica da trigger.

  • DISABLE TRIGGER nome ON tabela -> desliga a trigger
  • ENABLE TRIGGER nome ON tabela  -> liga de novo
  • DROP TRIGGER nome              -> remove definitivamente
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
*/

USE BD_Triggers;

-- ────────────────────────────────────────────────────────────
-- 🏋️ Exemplo prático
-- ────────────────────────────────────────────────────────────

-- 1️⃣  Desabilitando a trigger de log em Produto
DISABLE TRIGGER trg_Produto_Log ON Produto

-- Enquanto desabilitada, o INSERT não gera log
INSERT INTO Produto(Nome, Estoque, PrecoUnitario)
VALUES ('Impressora', 5, 890.00)

SELECT * FROM ProdutoLog -- não tem log da Impressora

-- 2️⃣  Reabilitando a trigger
ENABLE TRIGGER trg_Produto_Log ON Produto

INSERT INTO Produto(Nome, Estoque, PrecoUnitario)
VALUES ('Scanner', 8, 430.00)

SELECT * FROM ProdutoLog;
 -- já tem log do Scanner

-- 3️⃣  Consultando o status (habilitada/desabilitada) das triggers
SELECT name, is_disabled FROM sys.triggers

-- 4️⃣  Excluindo definitivamente uma trigger
DROP TRIGGER trg_Funcionario_ValidarAutorizacao;

SELECT name FROM sys.triggers;