-- =========================================================
-- 📘 [SQL Server] JOIN EM TABELAS DIMENSIONAIS
-- Aula 12 de 17 — INNER, LEFT e RIGHT 🔗
-- =========================================================
-- Objetivo🎯:
-- Demonstrar JOIN entre DimProduct
-- e DimProductSubcategory.
-- =========================================================

login mysql(or your database);
show databases;
use modulo6;
show tables;

SELECT
	ProductKey,
	ProductName,
	ProductSubcategoryName
FROM 
    DimProduct
INNER JOIN 
    DimProductSubcategory
	ON 
        DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey;