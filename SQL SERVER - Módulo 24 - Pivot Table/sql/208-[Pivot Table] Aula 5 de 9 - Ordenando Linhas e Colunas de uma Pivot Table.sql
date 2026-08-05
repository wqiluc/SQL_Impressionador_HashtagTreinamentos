-- ============================================================
-- 🗄️  SQL Server  |  📦 Módulo 24 — Pivot Table
-- 📖 Aula 5 de 9  |  Ordenando Linhas e Colunas de uma Pivot Table
-- ============================================================

/*
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📚 CONCEITO — ORDER BY nas linhas e a ordem do IN() nas colunas
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  • A ORDEM DAS LINHAS de uma pivot table é controlada, como em
    qualquer SELECT, por um ORDER BY no final da consulta.
  • A ORDEM DAS COLUNAS é controlada pela ORDEM em que os valores
    aparecem dentro do FOR ... IN (...) - basta escrever na
    sequência desejada.
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
*/

USE BD_PivotTable

-- ────────────────────────────────────────────────────────────
-- 🏋️ Exemplo prático
-- ────────────────────────────────────────────────────────────

-- 1️⃣  Ordenando as linhas por total vendido no Q4, do maior para o menor
SELECT Loja, [Q1], [Q2], [Q3], [Q4]
FROM (
   SELECT Loja, Trimestre, ValorVenda
   FROM Vendas
) AS Origem
PIVOT (
   SUM(ValorVenda)
   FOR Trimestre IN ([Q1], [Q2], [Q3], [Q4])
) AS TabelaPivotada
ORDER BY [Q4] DESC

-- 2️⃣  Invertendo a ordem das colunas (do Q4 para o Q1)
SELECT Loja, [Q4], [Q3], [Q2], [Q1]
FROM (
   SELECT Loja, Trimestre, ValorVenda
   FROM Vendas
) AS Origem
PIVOT (
   SUM(ValorVenda)
   FOR Trimestre IN ([Q4], [Q3], [Q2], [Q1])
) AS TabelaPivotada
ORDER BY Loja
