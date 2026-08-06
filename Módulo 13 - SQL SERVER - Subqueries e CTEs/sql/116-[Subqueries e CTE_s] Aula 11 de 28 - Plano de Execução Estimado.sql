-- ============================================================
-- 🗄️  SQL Server  |  📦 Módulo 13 — Subqueries e CTEs
-- 📖 Aula 11 de 28  |  Plano de Execução Estimado
-- ============================================================

/*
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📚 CONCEITO — Plano de Execução Estimado
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

O Plano de Execução mostra como o SQL Server internamente
processa uma query — quais índices usa, em que ordem
percorre as tabelas, qual o custo estimado de cada etapa.

Como acessar no SSMS:
  ▶ Query → Include Estimated Execution Plan  (Ctrl + L)
  ▶ Query → Include Actual Execution Plan     (Ctrl + M)

Por que comparar Subquery vs WHERE direto?
  → O otimizador do SQL Server costuma gerar o mesmo plano
    para ambas as formas abaixo, mas é importante verificar.
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
*/

-- ❓ Exemplo: Contar produtos da marca Contoso de duas formas
--    e comparar o Plano de Execução de cada uma.

-- 🔷 Forma 1 — filtro direto no WHERE
SELECT COUNT(*)
FROM   DimProduct
WHERE  BrandName = 'Contoso'

-- 🔶 Forma 2 — Subquery no FROM (derived table)
SELECT COUNT(*)
FROM (
    SELECT *
    FROM   DimProduct
    WHERE  BrandName = 'Contoso'
) AS T

-- 💡 Selecione ambas as queries, pressione Ctrl + L e compare
--    o custo percentual de cada uma no diagrama de execução.
