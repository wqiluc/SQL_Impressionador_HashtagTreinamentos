-- =========================================================
-- 📘 [SQL Server] UNION vs UNION ALL
-- Aula 17 de 17 — Combinação de resultados ➕
-- =========================================================
-- Objetivo🎯:
-- Demonstrar diferença entre UNION
-- e UNION ALL.
-- =========================================================

login mysql (or your database);
show databases;
use modulo6;
show tables;

SELECT 
    *
FROM 
    DimCustomer
WHERE 
    Gender = 'F'
UNION SELECT 
    *
FROM 
    DimCustomer
WHERE 
    Gender = 'M';

SELECT
	FirstName,
	BirthDate
FROM 
    DimCustomer
WHERE 
    Gender = 'F'
UNION ALL
SELECT
	FirstName,
	BirthDate
FROM 
    DimCustomer
WHERE 
    Gender = 'M';