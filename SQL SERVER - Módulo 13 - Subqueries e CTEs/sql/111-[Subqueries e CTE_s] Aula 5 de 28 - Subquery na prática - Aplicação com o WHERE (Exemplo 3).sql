-- ============================================================
-- 🗄️  SQL Server  |  📦 Módulo 13 — Subqueries e CTEs
-- 📖 Aula 5 de 28  |  Subquery na prática — WHERE (Exemplo 3)
-- ============================================================

/*
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
🎯 CONTEXTO
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
Quando a Subquery retorna MÚLTIPLOS valores, usamos IN
em vez de = para comparar a lista inteira de resultados.
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
*/

-- ❓ Exemplo 3: Mostre apenas as vendas (FactSales) referentes
--    a lojas com 100 ou mais funcionários.

-- ✅ Subquery em lista — a Subquery retorna vários StoreKeys
SELECT * FROM FactSales 
WHERE 
    StoreKey IN 
        (
        SELECT StoreKey
        FROM DimStore
        WHERE EmployeeCount >= 100
        )