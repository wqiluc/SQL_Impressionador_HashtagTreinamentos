-- ============================================================
-- 🗄️  SQL Server  |  📦 Módulo 15 — Window Functions
-- 📖 Exércicios — Lista de Exercícios (Window Functions)
-- ============================================================

USE ContosoRetailDW;

-- ────────────────────────────────────────────────────────────
-- 🏋️ Exercícios 1 a 4
-- ────────────────────────────────────────────────────────────
-- Para resolver os exercícios 1 a 4, crie uma View chamada vwProdutos, que
-- contenha o agrupamento das colunas BrandName, ColorName e os totais de
-- quantidade vendida por marca/cor e também o total de receita por marca/cor.

CREATE VIEW vwProdutos AS
SELECT
    BrandName AS 'Marca',
    ColorName AS 'Cor',
    COUNT(*) AS 'Quantidade_Vendida',
    ROUND(SUM(SalesAmount), 2) AS 'Receita_Total'
FROM 
    DimProduct
INNER JOIN FactSales
    ON DimProduct.ProductKey = FactSales.ProductKey
GROUP BY 
    BrandName, ColorName;

-- 1️⃣  Utilize a View vwProdutos para criar uma coluna extra calculando a
--     quantidade total vendida dos produtos.

SELECT
    *,
    SUM(Quantidade_Vendida) OVER() AS 'Qtd Total Produtos'
FROM 
    vwProdutos
ORDER BY 
    Marca;

-- 2️⃣  Crie mais uma coluna na consulta anterior, incluindo o total de
--     produtos vendidos para cada marca.

SELECT
    *,
    SUM(Quantidade_Vendida) OVER() AS 'Qtd Total Produtos',
    SUM(Quantidade_Vendida) OVER(PARTITION BY Marca) AS 'Qtd Total Por Marca'
FROM 
    vwProdutos
ORDER BY 
    Marca;

-- 3️⃣  Calcule o % de participação do total de vendas de produtos por marca.
--     Ex: A marca A. Datum teve uma quantidade total de vendas de 199.041 de
--     um total de 3.406.089 de vendas. Isso significa que a participação da
--     marca A. Datum é 199.041/3.406.089 = 5,84%.

SELECT
    *,
    SUM(Quantidade_Vendida) OVER() AS 'Qtd1',
    SUM(Quantidade_Vendida) OVER(PARTITION BY Marca) AS 'Qtd2',
    FORMAT(
        1.0 * (SUM(Quantidade_Vendida) OVER(PARTITION BY Marca))
            / SUM(Quantidade_Vendida) OVER(),
        '0.00%'
    ) AS '% Participação'
FROM vwProdutos
ORDER BY Marca;

-- 4️⃣  Crie uma consulta à View vwProdutos, selecionando as colunas Marca,
--     Cor, Quantidade_Vendida e também criando uma coluna extra de Rank para
--     descobrir a posição de cada Marca/Cor. Obs: a consulta deve ser
--     filtrada para mostrar apenas a marca Contoso.

SELECT
    *,
    RANK() OVER(ORDER BY Quantidade_Vendida DESC) AS 'Rank'
FROM vwProdutos
WHERE Marca = 'Contoso';

-- ────────────────────────────────────────────────────────────
-- 🏆 Exercício Desafio 1 (exercícios 5 e 6)
-- ────────────────────────────────────────────────────────────
-- Crie a View vwHistoricoLojas, com um histórico da quantidade de lojas
-- abertas a cada Ano/Mês. Desafios:
--   (1) Criar uma coluna de ID para essa View, a partir de uma função de
--       janela, ordenada de forma que Ano/Mês fique na ordem cronológica
--       correta (2005/January, 2005/February... e não 2005/April,
--       2005/August...).
--   (2) Relacionar as tabelas DimDate e DimStore. As colunas Ano, Mês e
--       Qtd_Lojas correspondem, respectivamente, a CalendarYear e
--       CalendarMonthLabel (DimDate) e a uma contagem de OpenDate (DimStore).

CREATE VIEW vwHistoricoLojas AS
SELECT
    ROW_NUMBER() OVER(ORDER BY CalendarMonth) AS 'ID',
    CalendarYear AS 'Ano',
    CalendarMonthLabel AS 'Mês',
    COUNT(DimStore.OpenDate) AS 'Qtd_Lojas'
FROM DimDate
LEFT JOIN DimStore
    ON DimDate.Datekey = DimStore.OpenDate
GROUP BY CalendarYear, CalendarMonthLabel, CalendarMonth;

-- 5️⃣  A partir da view criada no exercício anterior, faça uma soma móvel
--     considerando sempre o mês atual + 2 meses para trás.

SELECT
    *,
    SUM(Qtd_Lojas) OVER(
        ORDER BY ID
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ) AS 'Soma Móvel (2 meses)'
FROM vwHistoricoLojas;

-- 6️⃣  Utilize a vwHistoricoLojas para calcular o acumulado de lojas abertas
--     a cada ano/mês.

SELECT
    *,
    SUM(Qtd_Lojas) OVER(
        ORDER BY ID
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS 'Acumulado'
FROM vwHistoricoLojas;

-- ────────────────────────────────────────────────────────────
-- 🏆 Exercício Desafio 2 (exercícios 7 e 8)
-- ────────────────────────────────────────────────────────────
-- Os próximos exercícios envolvem análises de novos clientes. Para isso,
-- será necessário criar uma nova tabela e uma nova view.

-- PASSO 1: Criar um novo banco de dados chamado Desafio e selecioná-lo.

CREATE DATABASE Desafio;
USE Desafio;

-- PASSO 2: Criar a tabela Calendario, com apenas 1 coluna (data DATE), entre
-- o dia 1 de janeiro do ano da compra (DateFirstPurchase) mais antiga e o
-- dia 31 de dezembro do ano da compra mais recente.

CREATE TABLE Calendario (
    data DATE
);

DECLARE @varAnoInicial INT = YEAR((SELECT MIN(DateFirstPurchase) FROM ContosoRetailDW.dbo.DimCustomer));
DECLARE @varAnoFinal INT = YEAR((SELECT MAX(DateFirstPurchase) FROM ContosoRetailDW.dbo.DimCustomer));

DECLARE @varDataInicial DATE = DATEFROMPARTS(@varAnoInicial, 1, 1);
DECLARE @varDataFinal DATE = DATEFROMPARTS(@varAnoFinal, 12, 31);

WHILE @varDataInicial <= @varDataFinal
BEGIN
    INSERT INTO Calendario (data) VALUES (@varDataInicial)
    SET @varDataInicial = DATEADD(DAY, 1, @varDataInicial)
END

SELECT * FROM Calendario;

-- PASSO 3: Criar colunas auxiliares na tabela Calendario: Ano, Mes, Dia,
-- AnoMes e NomeMes (todas INT, exceto NomeMes).

ALTER TABLE Calendario
ADD
    Ano INT,
    Mes INT,
    Dia INT,
    AnoMes INT,
    NomeMes VARCHAR(50);

-- PASSO 4: Adicionar os valores de Ano, Mês, Dia, AnoMes e NomeMes (nome do
-- mês em português, via CASE).

UPDATE Calendario SET Ano = YEAR(data);
UPDATE Calendario SET Mes = MONTH(data);
UPDATE Calendario SET Dia = DAY(data);
UPDATE Calendario SET AnoMes = CONCAT(YEAR(data), FORMAT(MONTH(data), '00'));
UPDATE Calendario SET NomeMes =
    CASE
        WHEN MONTH(data) = 1  THEN 'Janeiro'
        WHEN MONTH(data) = 2  THEN 'Fevereiro'
        WHEN MONTH(data) = 3  THEN 'Março'
        WHEN MONTH(data) = 4  THEN 'Abril'
        WHEN MONTH(data) = 5  THEN 'Maio'
        WHEN MONTH(data) = 6  THEN 'Junho'
        WHEN MONTH(data) = 7  THEN 'Julho'
        WHEN MONTH(data) = 8  THEN 'Agosto'
        WHEN MONTH(data) = 9  THEN 'Setembro'
        WHEN MONTH(data) = 10 THEN 'Outubro'
        WHEN MONTH(data) = 11 THEN 'Novembro'
        WHEN MONTH(data) = 12 THEN 'Dezembro'
    END;

-- PASSO 5: Criar a View vwNovosClientes.

CREATE VIEW vwNovosClientes AS
SELECT
    ROW_NUMBER() OVER(ORDER BY AnoMes) AS 'ID',
    Ano,
    NomeMes,
    COUNT(DimCustomer.DateFirstPurchase) AS 'Novos_Clientes'
FROM Calendario
LEFT JOIN ContosoRetailDW.dbo.DimCustomer
    ON Calendario.data = DimCustomer.DateFirstPurchase
GROUP BY Ano, NomeMes, AnoMes;

SELECT * FROM vwNovosClientes;

-- 7️⃣  a) Soma móvel de novos clientes nos últimos 2 meses.
--     b) Média móvel de novos clientes nos últimos 2 meses.
--     c) Acumulado dos novos clientes ao longo do tempo.
--     d) Acumulado intra-ano (janeiro a dezembro de cada ano, reiniciando a
--        cada ano seguinte).

SELECT
    *,
    SUM(Novos_Clientes) OVER(
        ORDER BY ID
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ) AS 'Soma Móvel (2 meses)',
    AVG(Novos_Clientes) OVER(
        ORDER BY ID
        ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
    ) AS 'Média Móvel (2 meses)',
    SUM(Novos_Clientes) OVER(
        ORDER BY ID
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS 'Acumulado Total',
    SUM(Novos_Clientes) OVER(
        PARTITION BY Ano
        ORDER BY ID
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS 'Acumulado (YTD)'
FROM vwNovosClientes;

-- 8️⃣  Calcule o MoM e o YoY do percentual de crescimento de novos clientes:
--     entre o mês atual e o mês anterior (MoM), e entre o mês atual e o
--     mesmo mês do ano anterior (YoY).
--     Obs: é preciso separar o CONVERT do cálculo para evitar erro de divisão.

SELECT
    *,
    FORMAT(
        CONVERT(FLOAT, Novos_Clientes) / NULLIF(LAG(Novos_Clientes, 1) OVER(ORDER BY ID), 0) - 1,
        '0.00%'
    ) AS '% MoM',
    FORMAT(
        CONVERT(FLOAT, Novos_Clientes) / NULLIF(LAG(Novos_Clientes, 12) OVER(ORDER BY ID), 0) - 1,
        '0.00%'
    ) AS '% YoY'
FROM vwNovosClientes;