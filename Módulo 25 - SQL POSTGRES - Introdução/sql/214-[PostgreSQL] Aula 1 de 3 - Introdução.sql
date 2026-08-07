-- ============================================================
-- 🐘 PostgreSQL  |  📦 Módulo 25 — Introdução
-- 📖 Aula 1 de 3  |  Introdução
-- ============================================================

/*
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📚 CONCEITO — Virando a chave: de SQL Server para PostgreSQL
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  Até aqui, todo o curso foi construído em cima do SQL Server.
  A partir de agora começamos um novo SGBD: o PostgreSQL - um
  banco de dados open source, gratuito, robusto e um dos mais
  usados do mercado (startups, big techs e o mundo open source
  em geral).

  A boa notícia: o SQL (a linguagem) continua o mesmo em sua
  essência - SELECT, FROM, WHERE, JOIN, GROUP BY... o que muda
  são alguns detalhes de sintaxe e o "dialeto" (assim como o
  SQL Server tem o T-SQL, o PostgreSQL tem o PL/pgSQL).

  Algumas diferenças que já vale adiantar:
  - SQL Server usa IDENTITY(1,1) → PostgreSQL usa SERIAL / IDENTITY
  - SQL Server usa TOP 10  →  PostgreSQL usa LIMIT 10
  - SQL Server usa GETDATE() →  PostgreSQL usa NOW() / CURRENT_DATE
  - SQL Server usa +  p/ concatenar → PostgreSQL usa ||
  - PostgreSQL é case-sensitive p/ nomes entre aspas duplas ""

  Neste módulo introdutório vamos ver:
  1. Como instalar o PostgreSQL na máquina
  2. Como criar as tabelas do banco Northwind (nosso banco de
     estudo daqui pra frente, no lugar do BD criado no SQL Server)

  Depois deste módulo, seguimos para queries básicas e filtros,
  já dentro do PostgreSQL.
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
*/