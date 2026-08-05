-- =========================================================
-- 📘 [MySQL] CRIANDO AGRUPAMENTOS NO SQL
-- Aula 5 de 18 — GROUP BY + WHERE 📊
-- =========================================================
-- Objetivo🎯:
-- Utilizar WHERE para filtrar registros
-- antes da aplicação do GROUP BY
-- =========================================================

USE 
	dados_modulo5;

-- =========================================================
-- 🧠 EXERCÍCIO 1
-- Quantidade total de produtos filtrados
-- por categoria específica
-- =========================================================
-- Descrição💬:
-- Esta consulta filtra os produtos de uma
-- categoria específica e realiza a contagem
-- total de produtos agrupados pela própria
-- categoria
-- =========================================================

SELECT 
	* 
FROM 
	produtos;

SELECT DISTINCT
    categoria_id AS 'Categoria ',
    COUNT(categoria_id) AS 'Qtd Total de Produtos '
FROM
    produtos
WHERE
    categoria_id = 2
GROUP BY
    categoria_id;

-- =========================================================
-- 💡 OBSERVAÇÃO IMPORTANTE
-- =========================================================
-- WHERE:
	-- ✅ Filtra os dados antes do agrupamento; e
	-- ✅ Reduz a quantidade de registros
	--    processados pelo GROUP BY.
-- Atenção⚠️:
	-- WHERE é aplicado ANTES❌ do GROUP BY durante a execução da consulta.
-- =========================================================