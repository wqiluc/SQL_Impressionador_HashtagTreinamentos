-- ==============================================================================
-- 🗄️ [SQL Server] CRUD - Módulo 12
-- 📘 Aula 7 de 21 - INSERT SELECT - Adicionando dados de outra tabela
-- ==============================================================================
-- 🎯 Objetivo: Aprender a popular uma tabela copiando dados de outra tabela
--              utilizando INSERT INTO ... SELECT.
--
-- 📌 Sintaxe:
--   INSERT INTO <tabela_destino> (<col1>, <col2>, ...)
--   SELECT <col1>, <col2>, ...
--   FROM   <tabela_origem>;
--
-- ⚠️  A ordem e os tipos das colunas selecionadas devem corresponder exatamente
--     às colunas listadas no INSERT INTO.
-- ==============================================================================

USE BDImpressionador;

-- 🏗️ Criando a tabela destino -------------------------------------------------

CREATE TABLE Produtos
(
    id_produto    INT,
    nome_produto  VARCHAR(200),
    data_validade DATETIME,
    preco_produto FLOAT
);

SELECT * FROM Produtos; -- tabela vazia ✅

-- 📥 Populando a partir da tabela DimProduct (ContosoRetailDW) 
----------------
-- ProductKey        → id_produto
-- ProductName       → nome_produto
-- AvailableForSaleDate → data_validade
-- UnitPrice         → preco_produto

INSERT INTO Produtos (id_produto, nome_produto, data_validade, preco_produto)
SELECT
    ProductKey,
    ProductName,
    AvailableForSaleDate,
    UnitPrice
FROM
    ContosoRetailDW.dbo.DimProduct;

-- ✅ Verificando os dados inseridos
SELECT * FROM Produtos;