-- ============================================================
-- 🗄️  SQL Server  |  📦 Módulo 23 — Triggers DDL
-- 📖 Aula 1 de 4  |  Introdução
-- ============================================================

/*
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📚 CONCEITO — Auditando alterações de estrutura do banco
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  Até aqui, as Triggers DML reagiam a mudanças nos DADOS (INSERT,
  UPDATE, DELETE). Uma TRIGGER DDL reage a mudanças na ESTRUTURA
  do banco: CREATE TABLE, ALTER TABLE, DROP TABLE, CREATE
  PROCEDURE, e assim por diante.

  É uma ferramenta de AUDITORIA e GOVERNANÇA: permite registrar
  (ou até bloquear) quem alterou a estrutura do banco, quando e o
  quê - útil em ambientes onde alterações de schema precisam ser
  rastreadas ou controladas.

  Neste módulo vamos ver:
  1. O que é uma Trigger DDL
  2. Como criar uma Trigger DDL
  3. Habilitando, desabilitando e excluindo uma Trigger DDL
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
*/

-- ────────────────────────────────────────────────────────────
-- 🏋️ Exemplo prático
-- ────────────────────────────────────────────────────────────

CREATE DATABASE BD_TriggersDDL
GO

USE BD_TriggersDDL
GO

-- Tabela onde vamos registrar as alterações de estrutura do banco
CREATE TABLE LogAlteracoesEstrutura(
   ID_Log     INT IDENTITY(1,1) PRIMARY KEY,
   Evento     VARCHAR(100),
   ObjetoAlvo VARCHAR(200),
   ComandoTSQL NVARCHAR(MAX),
   DataHora   DATETIME DEFAULT GETDATE(),
   LoginUsado VARCHAR(100)
)

SELECT * FROM LogAlteracoesEstrutura
