-- ============================================================
-- 🗄️  SQL Server  |  📦 Módulo 13 — Subqueries e CTEs
-- 📖 Aula 15 de 28  |  Calculando agregações com CTE
-- ============================================================

/*
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📚 CONCEITO — Agregação em cima de agregação
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Um caso clássico de uso de CTE: precisamos fazer uma
agregação (ex.: AVG) sobre um resultado já agrupado.

Sem CTE, isso exigiria uma Subquery no FROM — o que
funciona, mas é menos legível. Com CTE, declaramos
o agrupamento primeiro e depois calculamos em cima.
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
*/

-- ❓ Exemplo: Qual é a média de produtos por marca?
--    (primeiro agrupar por marca, depois calcular a média)

WITH cte AS (
    -- Passo 1: agrupar — total de produtos por marca
    SELECT
        BrandName,
        COUNT(*) AS Total
    FROM   DimProduct
    GROUP BY BrandName
)

-- Passo 2: calcular a média dos totais por marca ✅
SELECT AVG(Total)
FROM   cte

-- 💡 Sem CTE, a mesma lógica ficaria assim (menos legível):
-- SELECT AVG(Total) FROM (
--     SELECT BrandName, COUNT(*) AS Total
--     FROM DimProduct GROUP BY BrandName
-- ) AS T
