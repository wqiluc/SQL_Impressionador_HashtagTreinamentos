-- ============================================================
-- 🗄️  SQL Server  |  📦 Módulo 16 — Regex - Regular Expressions
-- 📖 Aula 1 de 9  |  COLLATE - Introdução
-- ============================================================

/*
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📚 CONCEITO — O que é COLLATE
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  O COLLATION nos permite configurar se haverá diferenciação entre
  maiúsculas e minúsculas (Case Sensitivity), ou entre palavras
  acentuadas (Accent Sensitivity), nas comparações de texto do
  SQL Server.

  O COLLATION pode ser definido em três níveis diferentes:
  1. A nível de SQL Server
  2. A nível de Banco de Dados
  3. A nível de Tabela/Coluna

  1. A nível de SQL Server
  O COLLATION, a princípio, é definido durante a instalação do
  programa. Por padrão, o COLLATION padrão é o seguinte:

     Latin1_General_CI_AS

  Onde CI significa Case Insensitive (não diferencia maiúsculas de
  minúsculas) e AS significa Accent Sensitive (sensível ao sotaque).
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
*/

-- ────────────────────────────────────────────────────────────
-- 🏋️ Exemplo prático
-- ────────────────────────────────────────────────────────────

-- 1️⃣  Descobrindo o COLLATION configurado a nível de SQL Server
SELECT SERVERPROPERTY('collation')
