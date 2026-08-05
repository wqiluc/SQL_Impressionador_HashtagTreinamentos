-- ============================================================
-- 🗄️  SQL Server  |  📦 Módulo 17 — Constraints
-- 📖 Aula 1 de 14  |  Introdução
-- ============================================================

/*
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📚 CONCEITO — O que são Constraints
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  CONSTRAINTS são regras aplicadas a colunas ou tabelas que
  restringem o tipo de dado que pode ser inserido/alterado nelas.
  Elas garantem a INTEGRIDADE e a CONSISTÊNCIA dos dados, impedindo
  que o banco fique com informações inválidas, duplicadas ou
  "órfãs" (sem relação com outra tabela).

  As principais constraints do SQL Server são:

  1. NOT NULL     -> obriga a coluna a sempre ter um valor
  2. UNIQUE       -> não permite valores repetidos na coluna
  3. CHECK        -> valida uma condição lógica antes de aceitar o valor
  4. DEFAULT      -> define um valor padrão quando nada é informado
  5. IDENTITY     -> gera valores numéricos automáticos e sequenciais
  6. PRIMARY KEY  -> identifica unicamente cada linha da tabela
  7. FOREIGN KEY  -> garante que o valor exista em outra tabela (relação)

  Ao longo do módulo, vamos criar três tabelas de exemplo
  (dCliente, dGerente e fContratos) primeiro SEM constraints, ver os
  problemas que isso causa, e depois recriá-las COM constraints
  para entender, na prática, o que cada uma resolve.
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
*/

-- ────────────────────────────────────────────────────────────
-- 🏋️ Exemplo prático
-- ────────────────────────────────────────────────────────────

-- Banco de dados usado neste módulo
CREATE DATABASE BD_Constraints
GO

USE BD_Constraints
GO

-- Consultando as constraints já existentes em uma tabela (útil
-- durante todo o módulo, mesmo sem tabelas criadas ainda)
-- sp_helpconstraint 'NomeDaTabela'
