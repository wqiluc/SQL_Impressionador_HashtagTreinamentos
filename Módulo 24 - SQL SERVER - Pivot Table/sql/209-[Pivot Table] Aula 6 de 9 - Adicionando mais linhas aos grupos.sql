-- ============================================================
-- 🗄️  SQL Server  |  📦 Módulo 24 — Pivot Table
-- 📖 Aula 6 de 9  |  Adicionando mais linhas aos grupos
-- ============================================================

/*
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📚 CONCEITO — Detalhando ainda mais o grupo de linhas
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  É possível ir detalhando cada vez mais o nível das linhas,
  adicionando outras colunas de dimensão (aqui, o Vendedor) - a
  pivot table passa a ter uma linha para cada combinação de
  Regiao + Loja + Vendedor.
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
*/

USE BD_PivotTable;

-- ────────────────────────────────────────────────────────────
-- 🏋️ Exemplo prático
-- ────────────────────────────────────────────────────────────

SELECT Regiao, Loja, Vendedor, [Q1], [Q2], [Q3], [Q4]
FROM 
(
   SELECT DISTINCT
   Loja AS "Loja", 
   Regiao AS "Região", 
   Vendedor AS "Vendedor", 
   Trimestre AS "Trimestre", 
   ValorVenda AS "Valor da Venda"
   FROM Vendas
) AS Origem
PIVOT
(
   SUM(ValorVenda)
   FOR Trimestre IN ([Q1], [Q2], [Q3], [Q4])
) AS TabelaPivotada
ORDER BY Regiao, Loja, Vendedor;