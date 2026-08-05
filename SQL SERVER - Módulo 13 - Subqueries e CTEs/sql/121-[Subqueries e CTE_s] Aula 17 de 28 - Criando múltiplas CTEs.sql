-- ============================================================
-- 🗄️  SQL Server  |  📦 Módulo 13 — Subqueries e CTEs
-- 📖 Aula 17 de 28  |  Criando múltiplas CTEs
-- ============================================================

/*
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📚 CONCEITO — Múltiplas CTEs em um único bloco WITH
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

É possível declarar várias CTEs em sequência, separadas
por vírgula. A segunda CTE pode até referenciar a primeira!

Sintaxe:
  WITH cte1 AS (
      SELECT ...
  ),
  cte2 AS (
      SELECT ... FROM cte1   -- pode referenciar cte1
  )
  SELECT ... FROM cte1 JOIN cte2 ...
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
*/

-- ❓ Exemplo: Criar duas CTEs e fazer um JOIN entre elas.
--
--  1. produtos_contoso → produtos da marca Contoso
--     (DimProduct: ProductKey, ProductName, BrandName)
--
--  2. vendas_top100 → top 100 vendas mais recentes
--     (FactSales: SalesKey, ProductKey, DateKey, SalesQuantity)
--
--  Por fim, unir com INNER JOIN para ver quais dos top 100
--  vendas são de produtos Contoso.

WITH produtos_contoso AS (
    -- CTE 1: produtos da marca Contoso
    SELECT
        ProductKey,
        ProductName,
        BrandName
    FROM   DimProduct
    WHERE  BrandName = 'Contoso'
),
vendas_top100 AS (
    -- CTE 2: as 100 vendas mais recentes
    SELECT TOP(100)
        SalesKey,
        ProductKey,
        DateKey,
        SalesQuantity
    FROM   FactSales
    ORDER BY DateKey DESC
)

-- ✅ JOIN das duas CTEs como se fossem tabelas normais
SELECT
    v.SalesKey,
    v.DateKey,
    v.SalesQuantity,
    p.ProductName,
    p.BrandName
FROM   vendas_top100 AS v
INNER JOIN produtos_contoso AS p
    ON v.ProductKey = p.ProductKey
ORDER BY v.DateKey DESC
