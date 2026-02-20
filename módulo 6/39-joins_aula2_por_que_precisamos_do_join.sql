-- =========================================================
-- 📘 [SQL Server] ENTENDENDO A NECESSIDADE DO JOIN
-- Aula 2 de 17 — Por que precisamos do JOIN? 🔗
-- =========================================================
-- Objetivo🎯:
-- Demonstrar que as tabelas fato armazenam
-- métricas numéricas e as tabelas dimensão
-- armazenam descrições. Precisamos do JOIN
-- para combinar essas informações.
-- =========================================================

login basemysql(or your database);
show databases;
use modulo6;
show tables;

-- =========================================================
-- 🧠 EXPLORAÇÃO 1
-- Analisando a tabela de vendas
-- =========================================================

SELECT 
    TOP(1000) * 
FROM 
    FactSales;

SELECT 
    * 
FROM 
    DimChannel;

SELECT
	channelKey,
	SUM(SalesQuantity) AS 'Qtd. Vendida'
FROM
	FactSales
GROUP BY
	channelKey;

-- =========================================================
-- 🧠 EXPLORAÇÃO 2
-- Produto e descrição estão separados
-- =========================================================

SELECT 
    TOP(1000) * 
FROM 
    FactSales;
SELECT 
    * 
FROM 
    DimProduct;

-- =========================================================
-- 🧠 EXPLORAÇÃO 3
-- Vendas online e clientes
-- =========================================================

SELECT 
    TOP(1000) * 
FROM 
    FactOnlineSales;
SELECT 
    * 
FROM 
    DimCustomer;

-- =========================================================
-- 🧠 EXPLORAÇÃO 4
-- Planejamento estratégico
-- =========================================================

SELECT 
    *  
FROM 
    FactStrategyPlan;


SELECT 
    * 
FROM 
    DimScenario;

-- =========================================================
-- 💡 CONCLUSÃO
-- =========================================================
-- A tabela fato possui números.
-- A dimensão possui descrição.
-- O JOIN é necessário para análise completa.
-- =========================================================