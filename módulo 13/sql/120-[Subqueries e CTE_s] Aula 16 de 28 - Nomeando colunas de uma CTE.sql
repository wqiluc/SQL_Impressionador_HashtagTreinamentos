-- ============================================================
-- 🗄️  SQL Server  |  📦 Módulo 13 — Subqueries e CTEs
-- 📖 Aula 16 de 28  |  Nomeando colunas de uma CTE
-- ============================================================

/*
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📚 CONCEITO — Alias de colunas na declaração da CTE
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Além de nomear a CTE, podemos definir os nomes das colunas
diretamente na assinatura — sem usar AS dentro do SELECT.

Sintaxe:
  WITH nome_cte(Coluna1, Coluna2) AS (
      SELECT campo1, campo2 FROM ...
  )

O mapeamento é posicional: o 1º SELECT → Coluna1,
o 2º SELECT → Coluna2, e assim por diante.
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
*/

-- ❓ Exemplo: Mesma CTE de agrupamento por marca,
--    mas com os nomes das colunas definidos na assinatura.

-- ✅ Colunas nomeadas na declaração da CTE
WITH cte(Marca, Total) AS (
    SELECT
        BrandName,
        COUNT(*)
    FROM   DimProduct
    GROUP BY BrandName
)

SELECT
    Marca,
    Total
FROM cte
ORDER BY Total DESC

-- 💡 Útil quando as colunas do SELECT interno não têm alias
--    (ex.: COUNT(*), SUM(x)) — evita alias duplicado.
