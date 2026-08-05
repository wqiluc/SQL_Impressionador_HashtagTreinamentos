-- ============================================================
-- 🗄️  SQL Server  |  📦 Módulo 23 — Triggers DDL
-- 📖 Aula 3 de 4  |  Criando uma Trigger DDL
-- ============================================================

/*
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📚 CONCEITO — Registrando CREATE/ALTER/DROP TABLE
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  Cada informação do EVENTDATA() é extraída com métodos XML
  (.value), navegando pelos nós do XML retornado:

  • EventType             -> tipo do evento (ex.: CREATE_TABLE)
  • ObjectName             -> nome do objeto afetado
  • TSQLCommand/CommandText -> comando T-SQL que disparou o evento
  • LoginName              -> quem executou
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
*/

USE BD_TriggersDDL

-- ────────────────────────────────────────────────────────────
-- 🏋️ Exemplo prático
-- ────────────────────────────────────────────────────────────

CREATE TRIGGER trg_LogEstrutura
ON DATABASE
FOR CREATE_TABLE, ALTER_TABLE, DROP_TABLE
AS
BEGIN
   DECLARE @EventData XML = EVENTDATA()

   INSERT INTO LogAlteracoesEstrutura(Evento, ObjetoAlvo, ComandoTSQL, LoginUsado)
   VALUES (
      @EventData.value('(/EVENT_INSTANCE/EventType)[1]', 'VARCHAR(100)'),
      @EventData.value('(/EVENT_INSTANCE/ObjectName)[1]', 'VARCHAR(200)'),
      @EventData.value('(/EVENT_INSTANCE/TSQLCommand/CommandText)[1]', 'NVARCHAR(MAX)'),
      @EventData.value('(/EVENT_INSTANCE/LoginName)[1]', 'VARCHAR(100)')
   )
END

-- 1️⃣  Criando uma tabela -> dispara CREATE_TABLE
CREATE TABLE TabelaTeste(
   ID INT PRIMARY KEY,
   Nome VARCHAR(50)
)

-- 2️⃣  Alterando a tabela -> dispara ALTER_TABLE
ALTER TABLE TabelaTeste ADD Email VARCHAR(100)

-- 3️⃣  Excluindo a tabela -> dispara DROP_TABLE
DROP TABLE TabelaTeste

-- Conferindo tudo que foi registrado automaticamente
SELECT * FROM LogAlteracoesEstrutura
