/*
  =============================================================================
  📝 EXERCÍCIOS DE FIXAÇÃO: SQL SERVER (GROUP BY + JOINS)
  Banco de Dados: Fictício
  Objetivo: Praticar agrupamentos e relacionamentos entre tabelas.
  =============================================================================
*/

-- 🚀 [1. FACT SALES] --

-- a) Faça um resumo da quantidade vendida (Sales Quantity) de acordo com o Id do canal 
-- de vendas (ChanneKey). Ordene a tabela final por SalesQuantity em ordem decrescente
-- RESPOSTA AQUI:

SELECT 
  DimChannel.ChannelKey AS "Id do Canal",
  DimChannel.ChannelName AS "Nome do Canal",
  SUM(FactSales.SalesQuantity) AS "QTD. Vendas"
FROM 
  FactSales
INNER JOIN 
  DimChannel 
  ON FactSales.ChannelKey = DimChannel.ChannelKey
GROUP BY 
  DimChannel.ChannelKey, 
  DimChannel.ChannelName
ORDER BY 
  SUM(FactSales.SalesQuantity) ASC;

-- b) Faça um agrupamento mostrando a quantidade total vendida (Sales Quantity) e 
-- quantidade total devolvida (Return Quantity) de acordo com o nome das lojas (StoreName)
-- RESPOSTA AQUI:

SELECT DISTINCT
  StoreName as "Loja",
  Sum(SalesQuantity) as "Total Vendido",
  Sum(ReturnQuantity) as "Total Devolvido"
FROM
  FactSales
INNER JOIN
  DimStore
  ON FactSales.StoreKey = DimStore.StoreKey
GROUP BY
  StoreName
ORDER BY
  StoreName;

-- c) Faça um resumo do valor total vendido (Sales Amount) para cada mês 
-- (Calendar MonthLabel) e ano (CalendarYear)
-- RESPOSTA AQUI:

SELECT DISTINCT
  CalendarYear AS "Ano",
  CalendarMonthLabel AS "Mês",
  SUM(SalesAmount) AS "Faturamento Total" 
FROM FactSales
INNER JOIN 
  DimDate 
  ON FactSales.Datekey = DimDate.Datekey
GROUP BY 
  CalendarYear, CalendarMonth, CalendarMonthLabel 
ORDER BY 
  CalendarYear, CalendarMonth; 

-- 🎯 [2. ANÁLISE DE PRODUTOS] --

-- a) Descubra qual é a cor de produto que mais é vendida, considerando a 
-- coluna SalesQuantity
-- RESPOSTA AQUI:

SELECT DISTINCT
  Color as "Cor do Produto",
  Sum(SalesQuantity) as "QTD. Vendas"
FROM
  FactSales
INNER JOIN
  DimProduct
  ON FactSales.ProductKey = DimProduct.ProductKey
GROUP BY
  Color;


-- b) Identifique quantas cores tiveram uma quantidade total vendida acima de 3.000.000
-- RESPOSTA AQUI:

SELECT DISTINCT
  Color as "Cor do Produto",
  SUM(F.SalesQuantity) AS "R$ Total"
FROM 
  FactSales
INNER JOIN 
  DimProduct 
  ON FactSales.ProductKey = DimProduct.ProductKey
GROUP BY 
  Color
HAVING 
  SUM(SalesQuantity) > 3000000;

-- 🔗 [3. MULTI-JOIN: CATEGORIAS] --

-- Crie um agrupamento de quantidade vendida (SalesQuantity) por categoria do produto 
-- (ProductCategoryName). Obs: Será necessário mais de 1 INNER JOIN para relacionar 
-- FactSales e DimProductCategory
-- RESPOSTA AQUI:

SELECT * FROM FactSales;
SELECT * FROM DimProduct;
SELECT * FROM DimProductSubcategory;
SELECT * FROM DimProductCategory;

SELECT DISTINCT
  DimProductCategory.CategoryName,
  SUM(FactSales.SalesQuantity) AS "QTD. Total Vendido"
FROM 
  FactSales
INNER JOIN 
  DimProduct 
  ON FactSales.ProductKey = DimProduct.ProductKey
INNER JOIN 
  DimProductSubcategory 
  ON DimProduct.SubcategoryKey = DimProductSubcategory.SubcategoryKey
INNER JOIN 
  DimProductCategory 
  ON DimProductSubcategory.CategoryKey = DimProductCategory.CategoryKey
GROUP BY 
  DimProductCategory.CategoryName;

-- 💻 [4. FACT ONLINE SALES - CLIENTE VIP] --

-- a) Consulte a tabela FactOnlineSales e descubra qual o nome completo do cliente 
-- que mais realizou compras online (baseado em Sales Quantity)
-- RESPOSTA AQUI:

SELECT * FROM FactOnlineSales;
SELECT * FROM DimCustomer;

SELECT DISTINCT
  DimCustomer.CustomerName as "Nome do cliente",
  SUM(FactOnlineSales.SalesQuantity) AS "Total Comprado"
FROM 
  FactOnlineSales
INNER JOIN 
  DimCustomer 
  ON FactOnlineSales.CustomerKey = DimCustomer.CustomerKey
GROUP BY 
  DimCustomer.CustomerName
ORDER BY 
  SUM(FactOnlineSales.SalesQuantity) DESC
LIMIT 1;

-- b) Com base no cliente da letra 'a', descubra o top 10 produtos mais comprados 
-- por ele, considerando o nome do produto
-- RESPOSTA AQUI:

SELECT DISTINCT
  DimProduct.ProductName as "Nome do Produto",
  SUM(FactOnlineSales.SalesQuantity) AS "Total Vendido"
FROM 
  FactOnlineSales
INNER JOIN 
  DimProduct 
  ON FactOnlineSales.ProductKey = DimProduct.ProductKey
WHERE 
  FactOnlineSales.CustomerKey = 
  (
    SELECT CustomerKey
    FROM FactOnlineSales
    GROUP BY CustomerKey
    ORDER BY SUM(SalesQuantity) DESC
    LIMIT 1
  )
GROUP BY 
  DimProduct.ProductName
ORDER BY 
  SUM(FactOnlineSales.SalesQuantity) DESC
LIMIT 10;

-- 🚻 [5. COMPRAS POR SEXO] --

-- Faça um resumo mostrando o total de produtos comprados (Sales Quantity) 
-- de acordo com o sexo dos clientes
-- RESPOSTA AQUI:

SELECT * FROM FactOnlineSales;
SELECT * FROM DimCustomer;

SELECT DISTINCT
  Gender as "Gênero do(a) Cliente",
  CustomerName as "Nome do(a) Cliente",
  SalesQuantity as "Total QTD. Vendas"
FROM
  FactOnlineSales
INNER JOIN
  DimCustomer
  ON FactOnlineSales.CustomerKey = DimCustomer.CustomerKey
ORDER BY
  SalesQuantity asc;

-- 💱 [6. FACT EXCHANGE RATE] --

-- Crie uma tabela resumo com a taxa de câmbio média de acordo com cada 
-- Currency Description. Filtre para mostrar apenas taxas entre 10 e 100
-- RESPOSTA AQUI:

SELECT * FROM DimCurrency;
SELECT * FROM FactExchangeRate;

SELECT DISTINCT
  CurrencyDescription as "Descrição",
  (AverageRate) as "Média do Câmbio"
FROM
  FactExchangeRate
INNER JOIN
  DimCurrency
  ON FactExchangeRate.CurrencyKey = DimCurrency.CurrencyKey
WHERE
  CurrencyDescription = "Dolar";

-- 📊 [7. FACT STRATEGY PLAN] --

-- Calcule a SOMA TOTAL de AMOUNT referente à tabela FactStrategyPlan destinado 
-- aos cenários: 'Actual' e 'Budget'. Dica: Use a tabela DimScenario
-- RESPOSTA AQUI:

SELECT * FROM FactStrategyPlan;
SELECT * FROM DimScenario;

SELECT DISTINCT
  ScenarioName AS "Nome do Cenário",
  (Amount) AS "R$ Soma Total"
FROM
  FactStrategyPlan
INNER JOIN
  DimScenario
  ON FactStrategyPlan.ScenarioKey = DimScenario.ScenarioKey
ORDER BY
  Amount;

-- 📅 [8. PLANEJAMENTO POR ANO] --

-- Crie uma tabela resumo mostrando o resultado do planejamento estratégico por ano
-- RESPOSTA AQUI:

SELECT * FROM FactStrategyPlan;
SELECT * FROM DimDate;  

SELECT DISTINCT
  CalendarYear as "Ano",
  CalendarMonthLabel as "Mês do ano",
  (Amount) as "R$ QTD. Total Vendida"
FROM
  FactStrategyPlan
INNER JOIN
  DimDate
  ON FactStrategyPlan.Datekey = DimDate.Datekey
ORDER BY
  Amount ASC;


-- 🏷️ [9. DIM PRODUCT / SUBCATEGORY] --

-- Agrupe a quantidade de produtos por ProductSubcategoryName. Considere 
-- apenas a marca 'Contoso' e a cor 'Silver'
-- RESPOSTA AQUI:

SELECT * FROM DimProduct;
SELECT * FROM DimProductSubcategory;

SELECT DISTINCT
    DimProductSubcategory.SubcategoryName as "Nome da Sub Categoria",
    COUNT(DimProduct.ProductKey) AS "Total Produtos"
FROM
    DimProduct
INNER JOIN
    DimProductSubcategory 
    ON DimProduct.SubcategoryKey = DimProductSubcategory.SubcategoryKey
WHERE
    DimProduct.BrandName = 'Contoso'
    AND 
    DimProduct.Color = 'Silver'
GROUP BY
    DimProductSubcategory.SubcategoryName;

-- 🏗️ [10. AGRUPAMENTO DUPLO] --

-- Faça um agrupamento duplo de quantidade de produtos por BrandName e 
-- ProductSubcategoryName. Ordene o resultado pela coluna BrandName
-- RESPOSTA AQUI:

SELECT * FROM DimProduct;
SELECT * FROM DimProductSubcategory;

SELECT DISTINCT
  ProductName as "Nome do Produto",
  SubcategoryName as "Categoria do Produto",
  BrandName as "Nome da Marca",
  Color as "Cor do Produto"
FROM
  DimProduct
INNER JOIN
  DimProductSubCategory
  ON DimProduct.SubcategoryKey = DimProductSubcategory.SubcategoryKey
ORDER BY
  BrandName;

/* =============================================================================
   FIM DOS EXERCÍCIOS!! 💻
   =============================================================================
*/