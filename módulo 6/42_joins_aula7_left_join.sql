-- =========================================================
-- 📘 [SQL Server] LEFT JOIN
-- Aula 7 de 17 — Preservando a tabela da esquerda ⬅️
-- =========================================================
-- Objetivo🎯:
-- Retornar todos os registros da tabela
-- produtos mesmo sem correspondência.
-- =========================================================

login mysql;
show databases;
use modulo6;

SELECT 
    * 
FROM 
    produtos;


SELECT 
    * 
FROM 
    subcategoria;


SELECT
	produtos.id_produto,
	produtos.nome_produto,
	produtos.id_subcategoria,
	subcategoria.nome_subcategoria
FROM produtos
LEFT JOIN 
    subcategoria
	    ON 
            produtos.id_subcategoria = subcategoria.id_subcategoria;