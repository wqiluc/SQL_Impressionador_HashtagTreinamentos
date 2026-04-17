-- =========================================================
-- 📘 [SQL Server] FULL OUTER JOIN
-- Aula 10 de 17 — União total das tabelas 🔄
-- =========================================================
-- Objetivo🎯:
-- Retornar correspondências e também
-- registros não correspondentes de ambas.
-- =========================================================

login mysql(or your database);
show databases;
use modulo6;
show tables;

SELECT
	produtos.id_produto,
	produtos.nome_produto,
	subcategoria.nome_subcategoria
FROM 
    produtos
FULL JOIN 
    subcategoria
	    ON 
            produtos.id_subcategoria = subcategoria.id_subcategoria;