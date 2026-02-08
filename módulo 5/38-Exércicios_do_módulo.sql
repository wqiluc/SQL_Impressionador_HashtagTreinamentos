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
--
-- b) Descubra os TOP 3 produtos
-- mais comprados por esse cliente
-- =========================================================



-- =========================================================
-- 🧠 EXERCÍCIO 4 — DIMPRODUCT 📦
-- =========================================================
-- a) Descubra a quantidade total
-- de produtos por marca
--
-- b) Descubra a média do preço
-- (UnitPrice) por ClassName
--
-- c) Descubra o peso total
-- por cor de produto
-- =========================================================



-- =========================================================
-- 🧠 EXERCÍCIO 5 — FILTRO + ORDER BY 🏷️
-- =========================================================
-- Descubra o peso total por tipo
-- de produto (StockTypeName)
--
-- Considerar apenas:
-- marca = 'Contoso'
--
-- Ordenar em ordem decrescente
-- =========================================================



-- =========================================================
-- 🧠 EXERCÍCIO 6 — VALIDAÇÃO DE CORES 🎨
-- =========================================================
-- Verifique se todas as marcas
-- possuem as 16 opções de cores
-- disponíveis
-- =========================================================



-- =========================================================
-- 🧠 EXERCÍCIO 7 — DIMCUSTOMER 👥
-- =========================================================
-- Descubra:
-- - total de clientes por sexo
-- - média salarial por sexo
--
-- Corrija possíveis resultados
-- inesperados
-- =========================================================



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


