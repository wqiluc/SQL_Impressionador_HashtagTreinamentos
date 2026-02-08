-- =========================================================
-- 📘 [MySQL] CRIANDO AGRUPAMENTOS NO SQL
-- Aula 7 de 18 — WHERE vs HAVING 📊
-- =========================================================
-- Objetivo🎯:
-- Demonstrar a diferença entre 
-- WHERE (filtro ANTES do agrupamento) e 
-- HAVING (filtro APÓS o agrupamento)
-- =========================================================

USE 
	dados_modulo5;

-- =========================================================
-- 🧠 EXERCÍCIO 1
-- Filtragem antes e depois do agrupamento
-- =========================================================
-- Descrição💬:
-- Esta consulta primeiro filtra os produtos
-- de uma categoria específica usando WHERE
-- e depois aplica o GROUP BY. Em seguida,
-- utiliza HAVING para filtrar apenas os
-- grupos que possuem quantidade mínima
-- de registros
-- =========================================================

SELECT 
	*
FROM 
	produtos;

SELECT
    categoria_id AS 'Categoria ',
    COUNT(categoria_id) AS 'Total de Produtos '
FROM
    produtos
WHERE
    categoria_id = 2  -- Filtra a tabela original ANTES do agrupamento
GROUP BY
    categoria_id
HAVING
    COUNT(categoria_id) >= 3; -- Filtra os dados APÓS o agrupamento

-- =========================================================
-- 💡 OBSERVAÇÃO IMPORTANTE
-- =========================================================
-- WHERE:
	-- ✅ Filtra os registros antes do GROUP BY.
	-- HAVING:
	-- ✅ Filtra os resultados após o GROUP BY.
-- Dica💡:
	-- Use WHERE para condições simples e
	-- HAVING para funções de agregação.
-- =========================================================