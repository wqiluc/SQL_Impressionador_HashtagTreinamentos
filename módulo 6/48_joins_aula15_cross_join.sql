-- =========================================================
-- 📘 [SQL Server] CROSS JOIN
-- Aula 15 de 17 — Produto cartesiano ✖️
-- =========================================================
-- Objetivo🎯:
-- Gerar todas as combinações possíveis;
-- entre marcas e subcategorias.
-- =========================================================

login mysql (or your database);
show databases;
use modulo6;
show tables;

SELECT DISTINCT
	marca as "Marca",
	nome_subcategoria as "SubCategoria"
FROM 
    marcas
CROSS JOIN 
    subcategoria;