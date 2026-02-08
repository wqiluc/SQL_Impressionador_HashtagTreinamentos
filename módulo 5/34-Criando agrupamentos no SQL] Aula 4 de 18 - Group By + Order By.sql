-- =========================================================
-- 📘 [MySQL] CRIANDO AGRUPAMENTOS NO SQL
-- Aula 4 de 18 — GROUP BY + ORDER BY 📊
-- =========================================================
-- Objetivo🎯:
-- Utilizar GROUP BY para agrupar dados
-- e ORDER BY para ordenar os resultados
-- de forma decrescente
-- =========================================================

USE dados_modulo5;

-- =========================================================
-- 🧠 EXERCÍCIO 1
-- Soma total dos preços por categoria
-- ordenado do maior para o menor
-- =========================================================
-- Descrição💬:
-- Esta consulta agrupa os produtos pela
-- categoria e soma o valor total dos preços,
-- ordenando os resultados de forma
-- decrescente
-- =========================================================

SELECT 
	* 
FROM
	 produtos;

SELECT DISTINCT
    categoria_id AS 'Categoria 🗂️',
    SUM(preco) AS 'Valor Total em Produtos 💰'
FROM
    produtos
GROUP BY
    categoria_id
ORDER BY
    SUM(preco) DESC;

-- =========================================================
-- 💡 OBSERVAÇÃO IMPORTANTE
-- =========================================================
-- ORDER BY:
	-- ✅ Organiza os resultados da consulta; e
	-- ✅ Pode ordenar por colunas ou funções agregadas.
-- DESC:
	-- 🔻 Ordem decrescente (maior para menor).
-- =========================================================