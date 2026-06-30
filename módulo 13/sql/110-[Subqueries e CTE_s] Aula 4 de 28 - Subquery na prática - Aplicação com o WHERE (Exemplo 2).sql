-- ============================================================
-- 🗄️  SQL Server  |  📦 Módulo 13 — Subqueries e CTEs
-- 📖 Aula 4 de 28  |  Subquery na prática — WHERE (Exemplo 2)
-- ============================================================

/*
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
🎯 CONTEXTO
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
A tabela DimProduct não possui o nome da Subcategoria
diretamente. Precisamos buscar o ID em DimProductSubcategory
e passá-lo como filtro via Subquery.
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
*/

-- ❓ Exemplo 2: Retorne todos os produtos da subcategoria 'Televisions'.

-- ✅ Subquery escalar — retorna um único valor (o ID da subcategoria)
SELECT *
FROM   DimProduct
WHERE  ProductSubcategoryKey =
           (SELECT ProductSubcategoryKey
            FROM   DimProductSubcategory
            WHERE  ProductSubcategoryName = 'Televisions')
