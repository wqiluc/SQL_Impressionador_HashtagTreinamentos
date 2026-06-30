-- ============================================================
-- 🗄️  SQL Server  |  📦 Módulo 13 — Subqueries e CTEs
-- 📖 Aula 10 de 28  |  Subquery na prática — FROM
-- ============================================================

/*
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📚 CONCEITO — Subquery no FROM (Derived Table)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Ao usar uma Subquery no FROM, criamos uma tabela derivada
(derived table) — uma tabela temporária que existe apenas
durante a execução da query.

Obrigatório: a tabela derivada precisa de um alias (AS T).
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
*/

-- ❓ Exemplo: Contar a quantidade total de produtos da marca Contoso.

-- Abordagem 1 — direta com WHERE (simples e suficiente aqui)
SELECT COUNT(*)
FROM   DimProduct
WHERE  BrandName = 'Contoso'

-- ────────────────────────────────────────────────────────────
-- ✅ Abordagem 2 — usando Subquery no FROM (derived table)
-- ────────────────────────────────────────────────────────────
SELECT COUNT(*)
FROM (
    SELECT *
    FROM   DimProduct
    WHERE  BrandName = 'Contoso'
) AS T

-- 💡 A Subquery no FROM é mais útil quando precisamos
--    de agregações em cima de resultados já filtrados/agrupados,
--    sem precisar repetir a lógica ou criar CTEs.
