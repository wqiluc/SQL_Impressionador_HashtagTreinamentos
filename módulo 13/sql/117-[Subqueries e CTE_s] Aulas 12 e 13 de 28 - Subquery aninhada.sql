-- ============================================================
-- 🗄️  SQL Server  |  📦 Módulo 13 — Subqueries e CTEs
-- 📖 Aulas 12 e 13 de 28  |  Subquery aninhada (Nested Subquery)
-- ============================================================

/*
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📚 CONCEITO — Subquery aninhada
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

É possível aninhar Subqueries — uma dentro da outra —
para resolver problemas em múltiplas etapas.

Execução: de dentro para fora.
  Nível 3 → Nível 2 → Nível 1 → Query externa
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
*/

-- ❓ Exemplo: Descubra os nomes dos clientes que ganham
--    o SEGUNDO maior salário anual.

-- ────────────────────────────────────────────────────────────
-- 🔎 Exploração passo a passo
-- ────────────────────────────────────────────────────────────

-- Passo 1: ver os clientes do tipo 'Person' ordenados por renda
SELECT * FROM DimCustomer
WHERE  CustomerType = 'Person'
ORDER BY YearlyIncome DESC

-- Passo 2: os 2 maiores salários distintos
SELECT DISTINCT TOP(2) YearlyIncome
FROM   DimCustomer
WHERE  CustomerType = 'Person'
ORDER BY YearlyIncome DESC

-- Passo 3: clientes que ganham exatamente o 2º maior (hardcoded)
SELECT CustomerKey, FirstName, LastName, YearlyIncome
FROM   DimCustomer
WHERE  YearlyIncome = 160000

-- ────────────────────────────────────────────────────────────
-- ✅ Solução com Subquery aninhada (3 níveis)
-- ────────────────────────────────────────────────────────────

/*
  Lógica:
  1. Nível mais interno → descobre o MAIOR salário
  2. Nível intermediário → descobre o MAIOR salário
                           que seja menor que o maior
                           (= 2º maior)
  3. Query externa → filtra clientes com esse salário
*/

SELECT
    CustomerKey,
    FirstName,
    LastName,
    YearlyIncome
FROM DimCustomer
WHERE YearlyIncome = (
    -- Nível 2: maior salário abaixo do máximo absoluto
    SELECT MAX(YearlyIncome)
    FROM   DimCustomer
    WHERE  YearlyIncome < (
        -- Nível 3: maior salário absoluto
        SELECT MAX(YearlyIncome)
        FROM   DimCustomer
        WHERE  CustomerType = 'Person'
    )
)
