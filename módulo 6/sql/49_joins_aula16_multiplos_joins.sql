-- =========================================================
-- 📘 [SQL Server] MÚLTIPLOS JOINS
-- Aula 16 de 17 — Navegando no modelo estrela ⭐
-- =========================================================
-- Objetivo🎯:
-- Conectar Produto → Subcategoria → Categoria.
-- =========================================================

login mysql(or your database);
show databases;
use modulo6;
show tables;

SELECT
	ProductKey,
	ProductName,
	ProductCategoryName
FROM 
    DimProduct
INNER JOIN 
    DimProductSubcategory
	ON 
        DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey
INNER JOIN 
    DimProductCategory
	ON 
        DimProductSubcategory.ProductCategoryKey = DimProductCategory.ProductCategoryKey;