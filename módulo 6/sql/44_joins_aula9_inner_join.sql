-- =========================================================
-- 📘 [SQL Server] INNER JOIN
-- Aula 9 de 17 — Interseção entre tabelas 🔗
-- =========================================================
-- Objetivo🎯:
-- Retornar apenas registros que possuem;
-- correspondência em ambas as tabelas.
-- =========================================================

login mysql (or your database);
show databases;
use modulo6;
show tables;

SELECT
	produtos.id_produto,
	produtos.nome_produto,
	subcategoria.nome_subcategoria
FROM 
    produtos
INNER JOIN 
    subcategoria
	    ON 
        	produtos.id_subcategoria = subcategoria.id_subcategoria;