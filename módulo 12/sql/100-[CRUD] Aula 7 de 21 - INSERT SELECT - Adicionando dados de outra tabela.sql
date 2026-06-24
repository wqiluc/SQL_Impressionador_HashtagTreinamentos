-- ==============================================================================
-- [SQL Server] CRUD - Módulo 12
-- Aula 7 de 21 - INSERT SELECT - Adicionando dados de outra tabela
-- ==============================================================================

USE BDImpressionador

CREATE TABLE Produtos
(
	id_produto INT,
	nome_produto VARCHAR(200),
	data_validade DATETIME,
	preco_produto FLOAT
)

SELECT * FROM Produtos;

-- Adicionando valores de outra tabela

INSERT INTO Produtos(id_produto, nome_produto, data_validade, preco_produto)
SELECT
	ProductKey,
	ProductName,
	AvailableForSaleDate,
	UnitPrice
FROM
	ContosoRetailDW.dbo.DimProduct;