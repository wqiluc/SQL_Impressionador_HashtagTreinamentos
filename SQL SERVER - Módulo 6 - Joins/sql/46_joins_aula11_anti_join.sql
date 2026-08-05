-- =========================================================
-- 📘 [SQL Server] ANTI JOIN
-- Aula 11 de 17 — Encontrando registros órfãos 🚫
-- =========================================================
-- Objetivo🎯:
-- Identificar registros sem correspondência.
-- =========================================================

login mysql (or your database);
show databases;
use modulo6;
show tables;

SELECT
	produtos.id_produto,
	produtos.nome_produto
FROM 
    produtos
LEFT JOIN 
    subcategoria
	    ON 
            produtos.id_subcategoria = subcategoria.id_subcategoria
WHERE 
    id_produto IS NULL OR nome_subcategoria IS NULL;