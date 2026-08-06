-- ============================================================
-- 🗄️  SQL Server  |  📦 Módulo 23 — Triggers DDL
-- 📖 Aula 4 de 4  |  Habilitando, Desabilitando e Excluindo uma Trigger DDL
-- ============================================================

/*
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📚 CONCEITO — Gerenciando uma Trigger DDL
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  O gerenciamento segue o mesmo espírito das Triggers DML, mas
  sempre informando o escopo (ON DATABASE ou ON ALL SERVER):

  • DISABLE TRIGGER nome ON DATABASE
  • ENABLE TRIGGER nome ON DATABASE
  • DROP TRIGGER nome ON DATABASE
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
*/

USE BD_TriggersDDL

-- ────────────────────────────────────────────────────────────
-- 🏋️ Exemplo prático
-- ────────────────────────────────────────────────────────────

-- 1️⃣  Desabilitando a trigger de auditoria
DISABLE TRIGGER trg_LogEstrutura ON DATABASE

-- Enquanto desabilitada, alterações de estrutura não são registradas
CREATE TABLE TabelaSemAuditoria(ID INT PRIMARY KEY)
DROP TABLE TabelaSemAuditoria

SELECT * FROM LogAlteracoesEstrutura -- nenhum registro novo

-- 2️⃣  Reabilitando a trigger
ENABLE TRIGGER trg_LogEstrutura ON DATABASE

CREATE TABLE TabelaComAuditoria(ID INT PRIMARY KEY)

SELECT * FROM LogAlteracoesEstrutura -- já aparece o CREATE_TABLE

-- 3️⃣  Consultando o status das triggers DDL do banco
SELECT name, is_disabled
FROM sys.triggers
WHERE parent_class = 0

-- 4️⃣  Excluindo definitivamente
DROP TRIGGER trg_LogEstrutura ON DATABASE
