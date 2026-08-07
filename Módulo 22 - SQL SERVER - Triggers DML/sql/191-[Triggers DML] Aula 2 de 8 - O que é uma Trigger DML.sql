-- ============================================================
-- 🗄️  SQL Server  |  📦 Módulo 22 — Triggers DML
-- 📖 Aula 2 de 8  |  O que é uma Trigger DML
-- ============================================================

/*
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📚 CONCEITO — AFTER vs INSTEAD OF
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  Existem dois tipos de Trigger DML:

  1. AFTER (ou FOR) -> dispara DEPOIS que o comando (INSERT,
     UPDATE ou DELETE) já foi executado na tabela. Usada para
     ações complementares: auditoria, notificações, validações
     que cancelam a operação já feita com um ROLLBACK.

  2. INSTEAD OF -> dispara NO LUGAR do comando original - o
     INSERT/UPDATE/DELETE que o usuário tentou rodar NÃO acontece
     sozinho; é a trigger que decide o que realmente fazer. Muito
     usada para regras de negócio mais restritivas ou para permitir
     escrita em VIEWs complexas.

  Sintaxe geral:

     CREATE TRIGGER nome_da_trigger
     ON tabela
     AFTER INSERT, UPDATE, DELETE       
     -- ou: INSTEAD OF INSERT, UPDATE, DELETE
     AS
     BEGIN
        -- comandos T-SQL
     END

  Uma trigger pode reagir a um ou mais eventos ao mesmo tempo,
  bastando listá-los separados por vírgula.
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
*/

USE BD_Triggers;

-- ────────────────────────────────────────────────────────────
-- 🏋️ Exemplo prático
-- ────────────────────────────────────────────────────────────

-- Consultando as triggers já criadas no banco
SELECT DISTINCT
   t.name AS Trigger_,
   OBJECT_NAME(t.parent_id) AS Tabela,
   t.is_instead_of_trigger,
   t.is_disabled
FROM sys.triggers t;