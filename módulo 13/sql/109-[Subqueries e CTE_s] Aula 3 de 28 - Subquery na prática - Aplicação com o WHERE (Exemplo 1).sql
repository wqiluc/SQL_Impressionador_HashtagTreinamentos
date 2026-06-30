-- ============================================================
-- 🗄️  SQL Server  |  📦 Módulo 13 — Subqueries e CTEs
-- 📖 Aula 3 de 28  |  Subquery na prática — WHERE (Exemplo 1)
-- ============================================================

/*
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
🎯 CONTEXTO
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Vamos explorar 3 exemplos de Subquery junto ao WHERE.
O WHERE com Subquery permite criar filtros dinâmicos —
o valor do filtro é calculado em tempo de execução.
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
*/

-- ❓ Exemplo 1: Quais produtos da tabela DimProduct possuem
--    custo (UnitCost) acima da média?

-- 🔎 Passo 1: descobrir a média de custo
SELECT AVG(UnitCost) FROM DimProduct     -- ≈ 147.65

-- ✅ Passo 2: filtrar com Subquery — valor calculado dinamicamente
SELECT *
FROM   DimProduct
WHERE  UnitCost >= (SELECT AVG(UnitCost) FROM DimProduct)
