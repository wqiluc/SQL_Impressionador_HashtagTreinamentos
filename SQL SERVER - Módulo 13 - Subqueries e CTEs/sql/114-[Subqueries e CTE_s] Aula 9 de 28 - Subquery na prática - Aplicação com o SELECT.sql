-- ============================================================
-- 🗄️  SQL Server  |  📦 Módulo 13 — Subqueries e CTEs
-- 📖 Aula 9 de 28  |  Subquery na prática — SELECT
-- ============================================================

/*
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📚 CONCEITO — Subquery no SELECT
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Ao colocar uma Subquery dentro do SELECT, ela é executada
uma vez por linha da query externa — chamamos de
Subquery correlacionada.

Restrição: a Subquery no SELECT deve retornar exatamente
um único valor (escalar). Se retornar mais de uma linha
ou coluna, o SQL Server lança erro.
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
*/

-- ❓ Exemplo: Retornar todos os produtos com a quantidade
--    total de vendas de cada um como coluna adicional.

-- ✅ Subquery correlacionada no SELECT
SELECT
    ProductKey,
    ProductName,
    (
    SELECT COUNT(ProductKey) FROM FactSales
    WHERE 
        FactSales.ProductKey = DimProduct.ProductKey) AS 'Qtd. Vendas'
FROM
    DimProduct;

-- 💡 Para cada linha de DimProduct, a Subquery conta as
--    vendas correspondentes em FactSales — correlação via ProductKey.