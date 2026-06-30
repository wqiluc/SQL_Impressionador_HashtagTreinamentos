-- ============================================================
-- 🗄️  SQL Server  |  📦 Módulo 13 — Subqueries e CTEs
-- 📖 Aula 14 de 28  |  CTE — O que é e como criar
-- ============================================================

/*
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📚 CONCEITO — CTE (Common Table Expression)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Uma CTE é uma tabela temporária nomeada, definida no início
de uma query com a cláusula WITH. Ela existe apenas durante
a execução do bloco de código e torna a query mais legível.

Sintaxe básica:
  WITH nome_cte AS (
      SELECT ...
  )
  SELECT ... FROM nome_cte

CTE vs Subquery no FROM:
  • Subquery → encadeada, mais difícil de ler
  • CTE      → declarada antes, mais organizada e reutilizável
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
*/

-- ❓ Exemplo: Criar uma CTE com os produtos da marca Contoso,
--    contendo: ProductKey, ProductName, BrandName, ColorName e UnitPrice.
--    Em seguida, contar quantos produtos existem nessa CTE.

WITH cte AS (
    SELECT
        ProductKey,
        ProductName,
        BrandName,
        ColorName,
        UnitPrice
    FROM   DimProduct
    WHERE  BrandName = 'Contoso'
)

-- ✅ Query que consome a CTE — pode usar como uma tabela comum
SELECT COUNT(*)
FROM   cte
