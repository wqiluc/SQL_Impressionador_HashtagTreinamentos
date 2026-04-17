-- =========================================================
-- 📘 [MySQL] CRIANDO AGRUPAMENTOS NO SQL
-- Aula 3 de 18 — GROUP BY (Parte 2) 📊
-- =========================================================
-- Objetivo🎯:
-- Aplicar funções de agregação em conjunto
-- com a cláusula GROUP BY para análises
-- estatísticas em dados agrupados
-- =========================================================

USE 
	dados_modulo5;

-- =========================================================
-- 🧠 CONSULTA 1
-- Quantidade total de produtos por categoria
-- =========================================================
-- Descrição💬:
-- Esta consulta agrupa os produtos por
-- categoria e soma o valor total dos preços (use SUM)
-- dos produtos em cada categoria
-- =========================================================

SELECT 
	* 
FROM 
	produtos;

SELECT DISTINCT
    categoria_id AS 'Categoria ',
    SUM(preco) AS 'Soma Total dos Preços '
FROM
    produtos
GROUP BY
    categoria_id;

-- =========================================================
-- 🧠 CONSULTA 2
-- Média de preço dos produtos por categoria
-- =========================================================
-- Descrição💬:
-- Esta consulta calcula o preço médio (use AVG)
-- dos produtos em cada categoria
-- =========================================================

SELECT 
	* 
FROM 
	produtos;

SELECT
    categoria_id AS 'Categoria ',
    AVG(preco) AS 'Preço Médio '
FROM
    produtos
GROUP BY
    categoria_id;

-- =========================================================
-- 🧠 CONSULTA 3
-- Maior preço de produto por categoria (use max)
-- =========================================================
-- Descrição💬:
-- Esta consulta retorna o maior preço
-- existente dentro de cada categoria
-- =========================================================

SELECT * FROM produtos;

SELECT
    categoria_id AS 'Categoria',
    MAX(preco) AS 'Maior Preço'
FROM
    produtos
GROUP BY
    categoria_id;

-- =========================================================
-- 💡 OBSERVAÇÃO IMPORTANTE
-- =========================================================
-- GROUP BY:
	-- ✅ Agrupa registros com valores iguais; e
	-- ✅ Permite análises com funções de agregação
	--    como SUM, AVG e MAX.
-- Atenção:
	-- Toda coluna no SELECT deve estar dentro
	-- de uma função agregada ou no GROUP BY.
-- =========================================================