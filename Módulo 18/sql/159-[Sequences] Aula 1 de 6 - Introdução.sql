-- ============================================================
-- 🗄️  SQL Server  |  📦 Módulo 18 — Sequences
-- 📖 Aula 1 de 6  |  Introdução
-- ============================================================

/*
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📚 CONCEITO — O problema que a Sequence resolve
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  Já conhecemos o IDENTITY, que gera valores automáticos e
  sequenciais - mas ele está sempre "preso" a uma única coluna de
  uma única tabela.

  A SEQUENCE resolve isso: é um objeto do banco de dados,
  INDEPENDENTE de qualquer tabela, que gera uma sequência de
  números. O mesmo objeto SEQUENCE pode ser compartilhado por
  várias tabelas e colunas diferentes.

  Neste módulo vamos ver:
  1. O que é uma Sequence
  2. Como criar uma Sequence
  3. Como utilizar uma Sequence
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
*/

-- ────────────────────────────────────────────────────────────
-- 🏋️ Exemplo prático
-- ────────────────────────────────────────────────────────────

CREATE DATABASE BD_Sequences
GO

USE BD_Sequences
GO

-- Uma prévia do que vamos construir: um objeto de sequência,
-- independente de tabela
CREATE SEQUENCE Seq_Exemplo
   START WITH 1
   INCREMENT BY 1

SELECT NEXT VALUE FOR Seq_Exemplo
SELECT NEXT VALUE FOR Seq_Exemplo
