-- =========================================================
-- 📘 [SQL Server] RIGHT JOIN
-- Aula 8 de 17 — Preservando a tabela da direita ➡️
-- =========================================================
-- Objetivo🎯:
-- Retornar todos os registros da tabela;
-- subcategoria mesmo sem produto associado.
-- =========================================================

login mysql (or your database);
show databases;
use modulo6;
show tables;

SELECT
	produtos.id_produto,
	produtos.nome_produto,
	produtos.id_subcategoria,
	subcategoria.nome_subcategoria
FROM 
    produtos
RIGHT JOIN /*Preserva a tabela da DIREITA*/
    subcategoria
	    ON 
            produtos.id_subcategoria = subcategoria.id_subcategoria;