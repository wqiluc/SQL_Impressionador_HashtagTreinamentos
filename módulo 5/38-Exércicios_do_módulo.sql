-- =========================================================
-- 📘 [MySQL] AGRUPAMENTOS NO SQL
-- Módulo 7 — Lista de Exercícios 📊
-- =========================================================
-- Objetivo🎯:
-- Resolver exercícios utilizando
-- GROUP BY;
-- WHERE; 
--HAVING; 
--ORDER BY; e
-- Funções de Agregação.
-- =========================================================

USE 
    dados_modulo5_res;

-- =========================================================
-- 🧠 EXERCÍCIO 1 — FACTSALES 📦
-- =========================================================
-- a) Faça um resumo da quantidade vendida
-- (SalesQuantity) de acordo com o canal
-- de vendas (ChannelKey)

SELECT 
    * 
FROM
    FactSales;

SELECT 
    SalesQuantity as "Quantidade de Itens Vendidos"
FROM 
    FactSales
ORDER BY
    ChannelKey DESC;
--
-- b) Faça um agrupamento mostrando:
--    - quantidade total vendida✅
--    - quantidade total devolvida✅
--    por ID das lojas (StoreKey)✅

SELECT 
    id as "ID da Venda",
    SalesQuantity as "Quantidade de Itens Vendidos",
    ReturnQuantity as "Quantidade de Itens Retornados"
FROM 
    FactSales
ORDER BY
    ChannelKey;

-- c) Faça um resumo do valor total vendido
-- (SalesAmount) para cada canal,
-- considerando apenas o ano de 2007

SELECT
    SalesAmount AS "Total Vendidos (em U$D)",
    DateKey AS "Ano"
FROM
    FactSales
WHERE
    DateKey BETWEEN '2007-01-10' AND '2007-12-30';

-- =========================================================
-- 🧠 EXERCÍCIO 2 — ANÁLISE DE PRODUTOS 💰
-- =========================================================
-- a) Descubra o valor total vendido
-- (SalesAmount) por produto (ProductKey)

SELECT 
    ProductKey as "ID do Produto",
    Sum(SalesAmount) as "Total Vendido (U$D)"
FROM
    FactSales
GROUP BY
    ProductKey
ORDER BY
    ProductKey;

-- b) Ordene pela quantidade vendida
-- e mostre apenas produtos com vendas
-- maiores que $5.000.000

SELECT
    ProductKey AS "ID do Produto",
    SUM(SalesAmount) AS "Total Vendido (U$D)"
FROM
    FactSales
GROUP BY
    ProductKey
HAVING
    SUM(SalesQuantity) >= 5000
ORDER BY
    SUM(SalesQuantity);

-- c) Mostre os TOP 10 produtos
-- com maior volume de vendas

SELECT
    ProductKey AS "ID do Produto",
    SalesAmount AS "Total Vendido (U$D)"
FROM
    FactSales
WHERE
    SalesAmount >= 5000
    AND 
    DateKey 
        BETWEEN '2007-01-10' AND '2007-12-30'
LIMIT
    10;
    
-- =========================================================
-- 🧠 EXERCÍCIO 3 — FACTONLINESALES 🌐
-- =========================================================
-- a) Descubra qual cliente (CustomerKey)
-- mais realizou compras online
-- baseado em SalesQuantity

SELECT 
    * 
FROM 
    FACTONLINESALES;

SELECT 
    MAX(SalesQuantity) as "Máximo de Compras Online"
FROM
    FACTONLINESALES
GROUP BY
    SalesQuantity
ORDER BY
    SalesQuantity DESC
LIMIT 
    1;

-- b) Descubra os TOP 3 produtos
-- mais comprados por esse cliente

SELECT DISTINCT
    ProductKey as "ID do Produto",
    MAX(SalesQuantity) as "Máximo de Compras Online"
FROM
    FACTONLINESALES
GROUP BY
    ProductKey
ORDER BY
    ProductKey
LIMIT
    3;

-- =========================================================
-- 🧠 EXERCÍCIO 4 — DIMPRODUCT 📦
-- =========================================================
-- a) Descubra a quantidade total
-- de produtos por marca

SELECT 
    *
FROM
    DimProduct;

SELECT DISTINCT
    ProductKey as "ID do Produto",
    BrandName as "Nome da Marca do Produto",
    UnitPrice as "Preço Unitário (U$D)"
FROM
    DimProduct
ORDER BY
    BrandName;

-- b) Descubra a média do preço
-- (UnitPrice) por ClassName

SELECT DISTINCT
    ClassName as "Classe de Nome do Produto",
    AVG(UnitPrice) as "Média de Preço Unitário do Produto (U$D)"
FROM
    DimProduct
GROUP BY
    ClassName
ORDER BY
    ClassName DESC;

-- c) Descubra o peso total
-- por cor de produto

SELECT DISTINCT
    ColorName as "Cor do Produto",
    Weight as "Peso do Produto"
FROM
    DimProduct
ORDER BY
    ColorName DESC;

-- =========================================================
-- 🧠 EXERCÍCIO 5 — FILTRO + ORDER BY 🏷️
-- =========================================================
-- a)Descubra o peso total por tipo
-- de produto (StockTypeName)

SELECT 
    *
FROM
    DimProduct;

SELECT DISTINCT
    StockTypeName as "Tipo de Estoque do Produto",
    MAX(Weight) as "Peso total dos Produtos"
FROM
    DimProduct
GROUP BY
    StockTypeName
ORDER BY
    StockTypeName ASC;

-- b)Considerar apenas:
-- marca = 'Contoso'

SELECT DISTINCT
    BrandName as "Nome da Marca do Produto",
    StockTypeName as "Tipo de Estoque do Produto",
    MAX(Weight) as "Peso total dos Produtos"
FROM
    DimProduct
WHERE
    BrandName = "Contoso"
GROUP BY
    StockTypeName
ORDER BY
    StockTypeName ASC;

-- c)ordenar em ordem decrescente

SELECT DISTINCT
    BrandName as "Nome da Marca do Produto",
    StockTypeName as "Tipo de Estoque do Produto",
    MAX(Weight) as "Peso total dos Produtos"
FROM
    DimProduct
WHERE
    BrandName = "Contoso"
GROUP BY
    StockTypeName
ORDER BY
    StockTypeName DESC;

-- =========================================================
-- 🧠 EXERCÍCIO 6 — VALIDAÇÃO DE CORES 🎨
-- =========================================================
-- a)Verifique se todas as marcas
-- possuem as 16 opções de cores
-- disponíveis
-- =========================================================

SELECT 
    *
FROM
    DimProduct;

SELECT DISTINCT
    BrandName AS "Nome do Produto",
    ColorName AS "Cores dos Produtos"
FROM
    DimProduct
WHERE
    ColorName IN ('Red','Blue','Black','White','Silver','Yellow','Green','Multi','Grey','Orange','Brown','Purple','Pink','Gold');

-- =========================================================
-- 🧠 EXERCÍCIO 7 — DIMCUSTOMER 👥
-- =========================================================
-- Descubra:
-- - total de clientes por sexo✅
-- - média salarial por sexo

SELECT 
    *
FROM
    DimCustomer;

/*Gênero Masculino:*/
SELECT DISTINCT
    CustomerKey as "ID do Cliente",
    Gender as "Gênero Masculino"
FROM
    DimCustomer
WHERE
    Gender = "M";

/*Gênero Feminino:*/
SELECT DISTINCT
    CustomerKey as "ID do Cliente",
    Gender as "Gênero Feminino"
FROM
    DimCustomer
WHERE
    Gender = "F";

/*Média Salarial Masculina:*/
SELECT DISTINCT
    AVG(YearlyIncome) as "Média Salarial Masculina",
    Gender as "Gênero Masculino"
FROM
    DimCustomer
WHERE
    Gender = "M"
GROUP BY
    YearlyIncome;

/*Média Salarial Feminina:*/
SELECT DISTINCT
    AVG(YearlyIncome) as "Média Salarial Feminina",
    Gender as "Gênero Feminino"
FROM
    DimCustomer
WHERE
    Gender = "F"
GROUP BY
    YearlyIncome;

-- =========================================================
-- 🧠 EXERCÍCIO 8 — ESCOLARIDADE 🎓
-- =========================================================
-- Descubra:
-- - total de clientes
-- - média salarial
-- por nível educacional (Education)
-- =========================================================


-- =========================================================
-- 🧠 EXERCÍCIO 9 — DIMEMPLOYEE 👨‍💼
-- =========================================================
-- Descubra o total de funcionários
-- por departamento
--
-- Considerar apenas funcionários ativos
-- =========================================================


-- =========================================================
-- 🧠 EXERCÍCIO 10 — FÉRIAS 🏖️
-- =========================================================
-- Descubra o total de VacationHours
-- por cargo (Title)
--
-- Considerar apenas:
-- - mulheres
-- - departamentos Production,
--   Marketing, Engineering e Finance
-- - contratadas entre 1999 e 2000
-- =========================================================

