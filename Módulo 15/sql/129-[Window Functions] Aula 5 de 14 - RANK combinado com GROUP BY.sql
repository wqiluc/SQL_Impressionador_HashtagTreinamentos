-- ============================================================
-- 🗄️  SQL Server  |  📦 Módulo 15 — Window Functions
-- 📖 Aula 5 de 14  |  RANK() combinado com GROUP BY
-- ============================================================

/*
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📚 CONCEITO — RANK() sobre um resultado já agrupado
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  Até agora o RANK() foi usado linha a linha, sobre a tabela
  Lojas original. Mas ele também pode ser aplicado em cima de um
  resultado que já foi colapsado por um GROUP BY.

  Isso funciona porque, na ordem lógica de execução do SQL, o
  GROUP BY é processado ANTES das funções de janela — então,
  quando o RANK() OVER() entra em ação, ele já enxerga uma linha
  por grupo (ex.: uma linha por Regiao), e não mais uma linha por
  loja.

  Ou seja: primeiro o GROUP BY reduz as linhas aos grupos e
  calcula os agregados (SUM, COUNT etc.); depois o RANK() classifica
  esses grupos entre si — sem precisar de subquery ou CTE para isso.
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
*/

-- ────────────────────────────────────────────────────────────
-- 🏋️ Exemplo prático
-- ────────────────────────────────────────────────────────────

USE WF

-- 1️⃣  GROUP BY simples — total vendido por região, sem classificação

SELECT DISTINCT
    Regiao AS "Região",
    SUM(Qtd_Vendida) AS 'Total Vendido'
FROM
    Lojas
GROUP BY
    Regiao;

-- 2️⃣  RANK() sobre o resultado agrupado — ranking das regiões pelo total vendido

SELECT DISTINCT
    Regiao AS "Região",
    SUM(Qtd_Vendida) AS 'Total Vendido',
    RANK() OVER(ORDER BY SUM(Qtd_Vendida) DESC) AS 'Posição'
FROM
    Lojas
GROUP BY
    Regiao
ORDER BY
    SUM(Qtd_Vendida) DESC;

-- 3️⃣  DENSE_RANK() sobre o mesmo agrupamento — para comparar com o RANK()

SELECT DISTINCT
    Regiao AS "Região",
    SUM(Qtd_Vendida) AS 'Total Vendido',
    RANK()       OVER(ORDER BY SUM(Qtd_Vendida) DESC) AS 'RANK',
    DENSE_RANK() OVER(ORDER BY SUM(Qtd_Vendida) DESC) AS 'DENSE_RANK'
FROM
    Lojas
GROUP BY
    Regiao
ORDER BY
    SUM(Qtd_Vendida) DESC;

-- 4️⃣  GROUP BY + HAVING + RANK() — ranking apenas das regiões com mais de 2 lojas

SELECT DISTINCT
    Regiao as "Região",
    COUNT(*) AS 'Qtd de Lojas',
    SUM(Qtd_Vendida) AS 'Total Vendido',
    RANK() OVER(ORDER BY SUM(Qtd_Vendida) DESC) AS 'Posição'
FROM
    Lojas
GROUP BY
    Regiao
HAVING
    COUNT(*) > 2
ORDER BY
    SUM(Qtd_Vendida) DESC;