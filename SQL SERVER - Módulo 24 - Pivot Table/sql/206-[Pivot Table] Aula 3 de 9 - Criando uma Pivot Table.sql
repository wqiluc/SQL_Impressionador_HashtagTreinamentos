-- ============================================================
-- 🗄️  SQL Server  |  📦 Módulo 24 — Pivot Table
-- 📖 Aula 3 de 9  |  Criando uma Pivot Table
-- ============================================================

/*
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📚 CONCEITO — A cláusula PIVOT na prática
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  Montando o PIVOT em 3 partes:
  1. A subquery "Origem", só com as colunas que interessam
  2. A função de agregação aplicada à coluna de valor
  3. O FOR ... IN (...), informando qual coluna vira cabeçalho e
     quais valores dela viram novas colunas
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
*/

USE BD_PivotTable

-- ────────────────────────────────────────────────────────────
-- 🏋️ Exemplo prático
-- ────────────────────────────────────────────────────────────

SELECT Loja, [Q1], [Q2], [Q3], [Q4]
FROM (
   SELECT Loja, Trimestre, ValorVenda
   FROM Vendas
) AS Origem
PIVOT (
   SUM(ValorVenda)
   FOR Trimestre IN ([Q1], [Q2], [Q3], [Q4])
) AS TabelaPivotada
