-- ============================================================
-- 🗄️  SQL Server  |  📦 Módulo 24 — Pivot Table
-- 📖 Aula 4 de 9  |  Adicionando Grupos de Linha à Pivot Table
-- ============================================================

/*
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📚 CONCEITO — Mais de uma coluna de agrupamento nas linhas
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  Qualquer coluna que apareça no SELECT final, na subquery
  "Origem" e NÃO seja a coluna usada no FOR, automaticamente vira
  um grupo de linha - exatamente como aconteceria com um GROUP BY
  com mais de uma coluna.
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
*/

USE BD_PivotTable;

-- ────────────────────────────────────────────────────────────
-- 🏋️ Exemplo prático
-- ────────────────────────────────────────────────────────────

-- Adicionando Regiao como um segundo grupo de linha, junto com Loja
SELECT Regiao, Loja, [Q1], [Q2], [Q3], [Q4]
FROM 
(
   SELECT Loja, Regiao, Trimestre, ValorVenda
   FROM Vendas
) AS Origem
PIVOT 
(
   SUM(ValorVenda)
   FOR Trimestre IN ([Q1], [Q2], [Q3], [Q4])
) AS TabelaPivotada;