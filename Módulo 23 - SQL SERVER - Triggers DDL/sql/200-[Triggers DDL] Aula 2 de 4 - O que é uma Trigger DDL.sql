-- ============================================================
-- 🗄️  SQL Server  |  📦 Módulo 23 — Triggers DDL
-- 📖 Aula 2 de 4  |  O que é uma Trigger DDL
-- ============================================================

/*
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📚 CONCEITO — Escopo (DATABASE vs SERVER) e EVENTDATA()
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  Uma Trigger DDL pode ser criada em dois escopos:

  • ON DATABASE -> reage a eventos DDL dentro de UM banco
    específico (CREATE_TABLE, ALTER_TABLE, DROP_TABLE, CREATE_VIEW...)
  • ON ALL SERVER -> reage a eventos DDL em QUALQUER banco da
    instância (CREATE_DATABASE, eventos de login, etc.)

  Diferente das Triggers DML, uma Trigger DDL não tem as tabelas
  inserted/deleted - em vez disso, usamos a função EVENTDATA(), que
  devolve um XML com os detalhes do evento: tipo, objeto afetado,
  comando T-SQL executado, login que executou, data/hora etc.

  Sintaxe geral:

     CREATE TRIGGER nome_da_trigger
     ON DATABASE
     FOR CREATE_TABLE, ALTER_TABLE, DROP_TABLE
     AS
     BEGIN
        -- comandos T-SQL, usando EVENTDATA()
     END
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
*/

USE BD_TriggersDDL;

-- ────────────────────────────────────────────────────────────
-- 🏋️ Exemplo prático
-- ────────────────────────────────────────────────────────────

-- Consultando as triggers DDL já criadas no banco atual
SELECT name, parent_class_desc, is_disabled
FROM sys.triggers
WHERE parent_class = 0;
 -- 0 = trigger de banco de dados (DDL)