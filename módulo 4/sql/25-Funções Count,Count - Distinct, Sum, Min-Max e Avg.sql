-- =========================================================
-- 📘 SQL — FUNÇÕES DE AGREGAÇÃO
-- COUNT | COUNT DISTINCT | SUM | MIN | MAX | AVG
-- =========================================================
-- As funções de agregação são usadas para realizar
-- cálculos sobre um conjunto de linhas e retornar
-- um único valor consolidado. 🧮
-- =========================================================


-- =========================================================
-- 🔢 FUNÇÃO COUNT
-- =========================================================
-- Objetivo🎯:
-- Contar o número total de registros de uma tabela
-- ou o número de valores NÃO NULOS de uma coluna.
--
-- Importante❗️:
-- COUNT(coluna) ignora valores NULL
-- COUNT(*) conta todas as linhas da tabela
-- =========================================================

SELECT
    COUNT(*) AS 'Total de Registros 📊'
FROM
    FactSales;

-- =========================================================
-- 🔁 FUNÇÃO COUNT(DISTINCT)
-- =========================================================
-- Objetivo🎯:
-- Contar valores únicos (sem repetição) em uma coluna.
--
-- Muito usada para descobrir🔍:
-- Quantidade de clientes distintos;  
-- Quantidade de produtos diferentes vendidos;  
-- Quantidade de categorias únicas.
-- =========================================================

SELECT
    COUNT(DISTINCT ProductKey) AS 'Total de Produtos Diferentes 🧩'
FROM
    FactSales;

-- =========================================================
-- ➕ FUNÇÃO SUM
-- =========================================================
-- Objetivo🎯:
-- Somar valores numéricos de uma coluna.
--
-- Usada para calcular:
-- Total vendido;  
-- Total faturado;  
-- Total de itens devolvidos.
-- =========================================================

SELECT
    SUM(SalesQuantity)  AS 'Total de Itens Vendidos 🛒',
    SUM(ReturnQuantity) AS 'Total de Itens Devolvidos 🔄'
FROM
    FactSales;

-- =========================================================
-- ⬇️ FUNÇÃO MIN
-- =========================================================
-- Objetivo🎯:
-- Retornar o menor valor encontrado em uma coluna.
--
-- Exemplos de uso:
-- Menor preço de um produto;  
-- Menor venda realizada;  
-- Menor quantidade registrada.
-- =========================================================

SELECT
    MIN(UnitPrice) AS 'Menor Preço Encontrado 💸'
FROM
    DimProduct;

-- =========================================================
-- ⬆️ FUNÇÃO MAX
-- =========================================================
-- Objetivo🎯:
-- Retornar o maior valor encontrado em uma coluna.
--
-- Exemplos de uso:
-- Produto mais caro;  
-- Maior venda registrada;  
-- Maior quantidade vendida.
-- =========================================================

SELECT
    MAX(UnitPrice) AS 'Maior Preço Encontrado 💰'
FROM
    DimProduct;

-- =========================================================
-- 📐 FUNÇÃO AVG
-- =========================================================
-- Objetivo🎯:
-- Calcular a média dos valores de uma coluna.
--
-- Importante❗️:
-- AVG ignora valores NULL automaticamente.
--
-- Exemplos de uso:
-- Preço médio dos produtos;  
-- Média de vendas;  
-- Média de funcionários por loja.
-- =========================================================

SELECT
    AVG(UnitPrice) AS 'Preço Médio dos Produtos 📦'
FROM
    DimProduct;

-- =========================================================
-- 🧠 EXEMPLO COMPLETO (VÁRIAS FUNÇÕES JUNTAS)
-- =========================================================
-- Esse tipo de consulta é muito comum em relatórios
-- gerenciais e dashboards.
-- =========================================================

SELECT
    COUNT(*)                 AS 'Total de Produtos 📊',
    COUNT(DISTINCT BrandName) AS 'Total de Marcas 🏷️',
    MIN(UnitPrice)            AS 'Menor Preço 💸',
    MAX(UnitPrice)            AS 'Maior Preço 💰',
    AVG(UnitPrice)            AS 'Preço Médio 📐'
FROM
    DimProduct;