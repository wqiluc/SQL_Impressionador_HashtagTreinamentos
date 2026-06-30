-- ============================================================
-- 🗄️  SQL Server  |  📦 Módulo 13 — Subqueries e CTEs
-- 📖 Aula 18-28 de 28  |  Exercícios
-- ============================================================

/*
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
🏋️ EXERCÍCIOS — Subqueries e CTEs
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Tabelas disponíveis:
  • DimProduct          
  (ProductKey, ProductName, BrandName, ColorName, UnitCost, UnitPrice, ProductSubcategoryKey)

  • DimProductSubcategory (ProductSubcategoryKey, ProductSubcategoryName)

  • DimCustomer (CustomerKey, FirstName, LastName, CustomerType, YearlyIncome)

  • DimStore (StoreKey, StoreName, EmployeeCount)
  • FactSales (SalesKey, ProductKey, StoreKey, DateKey, SalesQuantity, SalesAmount)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
*/

-- ────────────────────────────────────────────────────────────
-- 🔷 BLOCO 1 — Subquery com WHERE
-- ────────────────────────────────────────────────────────────

-- 1️⃣  Retorne todos os produtos cujo preço unitário (UnitPrice)
--     seja maior que a média de UnitPrice de TODOS os produtos.

SELECT *
FROM   DimProduct
WHERE  UnitPrice > (SELECT AVG(UnitPrice) FROM DimProduct)

-- 2️⃣  Retorne os produtos que pertencem à subcategoria 'Laptops'.
--     (Dica: a coluna ProductSubcategoryName está em DimProductSubcategory)

SELECT *
FROM   DimProduct
WHERE  ProductSubcategoryKey = 
      (
        SELECT ProductSubcategoryKey
        FROM   DimProductSubcategory
        WHERE  ProductSubcategoryName = 'Laptops'
      )

-- 3️⃣  Liste todas as vendas (FactSales) realizadas em lojas
--     localizadas em países com mais de 50 funcionários.
--     (Use a coluna EmployeeCount de DimStore)

SELECT *
FROM   FactSales
WHERE  StoreKey IN 
(
        SELECT StoreKey
        FROM   DimStore
        WHERE  EmployeeCount > 50
);

-- 4️⃣  Retorne os clientes do tipo 'Person' cujo YearlyIncome
--     seja maior que a média de YearlyIncome de todos os clientes
--     do tipo 'Person'.

SELECT *
FROM   DimCustomer
WHERE  CustomerType = 'Person'
  AND  YearlyIncome > 
          (
           SELECT AVG(YearlyIncome)
           FROM   DimCustomer
           WHERE  CustomerType = 'Person'
          );

-- ────────────────────────────────────────────────────────────
-- 🔶 BLOCO 2 — Subquery com SELECT e FROM
-- ────────────────────────────────────────────────────────────

-- 5️⃣  Crie uma consulta que retorne: ProductKey, ProductName,
--     e a quantidade total de vendas de cada produto como coluna
--     adicional 'Qtd. Vendas'. (Use Subquery no SELECT)

SELECT
    ProductKey,
    ProductName,
    (SELECT COUNT(*)
     FROM   FactSales
     WHERE  FactSales.ProductKey = DimProduct.ProductKey) AS 'Qtd. Vendas'
FROM DimProduct;

-- 6️⃣  Usando uma Subquery no FROM, retorne a marca (BrandName)
--     e a contagem de produtos de marcas que possuem mais de
--     50 produtos. (Derived table com GROUP BY + HAVING ou filtro externo)

SELECT BrandName, TotalProdutos
FROM 
(
    SELECT
        BrandName,
        COUNT(*) AS TotalProdutos
    FROM   DimProduct
    GROUP BY BrandName
) AS T
WHERE TotalProdutos > 50;

-- ────────────────────────────────────────────────────────────
-- 🟣 BLOCO 3 — ANY, ALL e EXISTS
-- ────────────────────────────────────────────────────────────

-- 7️⃣  Usando = ANY, retorne os produtos cujo UnitPrice seja
--     igual ao UnitPrice de algum produto da marca 'Contoso'.

SELECT * FROM DimProduct
WHERE UnitPrice = ANY 
      (
        SELECT UnitPrice
        FROM   DimProduct
        WHERE  BrandName = 'Contoso'
      )


-- 8️⃣  Usando > ALL, retorne os produtos cujo UnitCost seja
--     maior que o MAIOR UnitCost dos produtos da cor 'Black'.

SELECT * FROM DimProduct
WHERE  UnitCost > ALL 
      (
        SELECT UnitCost
        FROM   DimProduct
        WHERE  ColorName = 'Black'
      )


-- 9️⃣  Usando EXISTS, retorne os clientes (CustomerKey, FirstName)
--     que possuem ao menos uma compra registrada em FactSales.

SELECT CustomerKey, FirstName FROM  DimCustomer
WHERE EXISTS 
        (
          SELECT 1
          FROM   FactSales
          WHERE  FactSales.CustomerKey = DimCustomer.CustomerKey
        )


-- ────────────────────────────────────────────────────────────
-- 🟢 BLOCO 4 — Subquery aninhada
-- ────────────────────────────────────────────────────────────

-- 🔟  Descubra o nome dos clientes do tipo 'Person' que ganham
--     o TERCEIRO maior YearlyIncome.
--     (Dica: aninhe 3 níveis de MAX com filtro de exclusão)

SELECT 
  CustomerKey, FirstName, LastName, YearlyIncome
FROM 
  DimCustomer
WHERE  
  CustomerType = 'Person'
AND 
  YearlyIncome = 
    (
           -- 2º maior: máximo abaixo do máximo absoluto
           SELECT MAX(YearlyIncome)
           FROM   DimCustomer
           WHERE  CustomerType = 'Person'
             AND  YearlyIncome < 
             (
                      -- 1º maior: máximo absoluto entre 'Person'
                      SELECT MAX(YearlyIncome)
                      FROM   DimCustomer
                      WHERE  CustomerType = 'Person'
                        AND  YearlyIncome < 
                            (
                                 -- máximo absoluto geral entre 'Person'
                                 SELECT MAX(YearlyIncome)
                                 FROM   DimCustomer
                                 WHERE  CustomerType = 'Person'
                             )
              )
    )


-- ────────────────────────────────────────────────────────────
-- 🔵 BLOCO 5 — CTEs
-- ────────────────────────────────────────────────────────────

-- 1️⃣1️⃣  Crie uma CTE chamada produtos_caros que contenha os produtos
--      com UnitPrice acima da média geral.
--      Em seguida, selecione todos os campos da CTE.

WITH 
  produtos_caros AS 
(
    SELECT *
    FROM   DimProduct
    WHERE  UnitPrice > (SELECT AVG(UnitPrice) FROM DimProduct)
)

SELECT * FROM produtos_caros;

-- 1️⃣2️⃣  Crie uma CTE que agrupe as vendas por StoreKey, calculando
--      o total de SalesAmount por loja. Depois, selecione apenas
--      as lojas com total de vendas acima de 1.000.000.

WITH 
  vendas_por_loja AS 
(
    SELECT
        StoreKey,
        SUM(SalesAmount) AS TotalVendas
    FROM   FactSales
    GROUP BY StoreKey
)

SELECT * FROM vendas_por_loja WHERE  TotalVendas > 1000000;

-- 1️⃣3️⃣  Crie duas CTEs:
--       • top_lojas   → as 5 lojas com maior total de SalesAmount
--       • top_produtos → os 5 produtos com maior total de SalesQuantity
--      Não é necessário fazer JOIN — apenas selecione cada CTE separadamente.

-- Top 5 lojas
WITH 
  top_lojas AS 
(
    SELECT TOP(5)
        StoreKey,
        SUM(SalesAmount) AS TotalVendas
    FROM 
      FactSales
    GROUP BY 
      StoreKey
    ORDER BY 
      TotalVendas DESC
)

SELECT * FROM top_lojas;

-- Top 5 produtos
WITH 
  top_produtos AS 
(
    SELECT TOP(5)
        ProductKey,
        SUM(SalesQuantity) AS TotalQuantidade
    FROM 
      FactSales
    GROUP BY 
      ProductKey
    ORDER BY 
      TotalQuantidade DESC
)

SELECT * FROM top_produtos;