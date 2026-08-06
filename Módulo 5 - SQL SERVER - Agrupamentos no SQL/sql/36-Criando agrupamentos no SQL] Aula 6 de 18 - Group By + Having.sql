-- =========================================================
-- 📘 [MySQL] CRIANDO AGRUPAMENTOS NO SQL
-- Aula 6 de 18 — GROUP BY + HAVING 📊
-- =========================================================
-- Objetivo🎯:
-- Utilizar HAVING para filtrar resultados
-- após a aplicação do GROUP BY
-- =========================================================

USE 
	dados_modulo5;

-- =========================================================
-- 🧠 EXERCÍCIO 1
-- Categorias com quantidade mínima
-- de produtos cadastrados
-- =========================================================
-- Descrição💬:
-- Esta consulta agrupa os produtos por
-- categoria e retorna apenas aquelas
-- que possuem quantidade igual ou
-- superior ao valor definido
-- =========================================================

SELECT 
	* 
FROM 
	produtos;

SELECT DISTINCT
    categoria_id AS 'Categoria 🗂️',
    COUNT(categoria_id) AS 'Total de Produtos 📦'
FROM
    produtos
GROUP BY
    categoria_id
HAVING
    COUNT(categoria_id) >= 3;

-- =========================================================
-- 💡 OBSERVAÇÃO IMPORTANTE
-- =========================================================
-- HAVING:
	-- ✅ Filtra resultados após o GROUP BY; e
	-- ✅ Permite condições com funções
	--    de agregação como COUNT e SUM.
-- Diferença:
	-- WHERE filtra ANTES do agrupamento;
	-- HAVING filtra DEPOIS do agrupamento.
-- =========================================================
