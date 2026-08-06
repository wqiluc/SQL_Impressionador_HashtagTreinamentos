-- =========================================================
-- 📘 [MySQL] CRIANDO AGRUPAMENTOS NO SQL
-- Aula 2 de 18 — GROUP BY (Parte 1) 📊
-- =========================================================
-- Objetivo🎯:
-- Utilizar a cláusula GROUP BY para agrupar dados
-- e realizar contagens por categoria
-- =========================================================

USE 
	dados_modulo5;

-- =========================================================
-- 🧠 EXPLORAÇÃO INICIAL
-- Visualização completa da tabela produtos
-- =========================================================
-- Descrição💬:
-- Esta consulta retorna todos os registros
-- da tabela produtos para análise inicial
-- =========================================================

SELECT 
	* 
FROM 
	produtos;

-- =========================================================
-- 🧠 EXERCÍCIO 1
-- Quantidade total de produtos por categoria
-- =========================================================
-- Descrição💬:
-- Esta consulta agrupa os produtos pela
-- categoria (categoria_id) e conta quantos
-- produtos existem em cada categoria
-- =========================================================

SELECT DISTINCT
    categoria_id AS 'ID da Categoria )',
    COUNT(*) AS 'Qtd Total de Produtos '
FROM
    produtos
GROUP BY
    categoria_id;

-- =========================================================
-- 💡 OBSERVAÇÃO IMPORTANTE
-- =========================================================
-- A cláusula GROUP BY:
	-- ✅ Agrupa registros com valores iguais; e
	-- ✅ Permite o uso de funções de agregação
	--    como COUNT, SUM, AVG, MIN e MAX.
-- Atenção:
	-- Toda coluna no SELECT deve estar em uma
	-- função agregada ou presente no GROUP BY.
-- =========================================================