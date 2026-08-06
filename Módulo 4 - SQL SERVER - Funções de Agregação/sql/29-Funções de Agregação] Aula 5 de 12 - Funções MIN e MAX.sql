-- =========================================================
-- 📘 [SQL Server] FUNÇÕES DE AGREGAÇÃO
-- Aula 5 de 12 — Funções MIN ⬇️ e MAX ⬆️
-- =========================================================
-- Objetivo🎯:
-- Utilizar as funções MIN e MAX para identificar
-- os valores mínimo e máximo de uma coluna numérica
-- =========================================================

-- =========================================================
-- 🧠 EXERCÍCIO 1
-- Identificação do custo mínimo e máximo dos produtos:
-- =========================================================
-- Descrição💬:
-- Esta consulta retorna:
-- ⬆️ O maior custo de produto (UnitCost)
-- ⬇️ O menor custo de produto (UnitCost)
-- =========================================================

SELECT DISTINCT
    MAX(UnitCost) AS 'Custo Máximo ',
    MIN(UnitCost) AS 'Custo Mínimo '
FROM
    DimProduct;

-- =========================================================
-- 💡 OBSERVAÇÃO IMPORTANTE
-- =========================================================
-- As funções MIN e MAX:
-- ✅ Funcionam com valores numéricos, datas e textos
-- ❌ Ignoram valores NULL automaticamente
--
-- Exemplos de uso:
-- Menor data de cadastro🖋️;  
-- Maior preço de venda💵;  
-- Produto mais caro ou mais barato📦.
-- =========================================================