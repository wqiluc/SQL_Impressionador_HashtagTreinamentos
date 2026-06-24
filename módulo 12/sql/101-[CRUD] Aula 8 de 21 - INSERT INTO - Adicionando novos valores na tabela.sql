-- ==============================================================================
-- [SQL Server] CRUD - Módulo 12
-- Aula 8 de 21 - INSERT INTO - Adicionando novos valores na tabela
-- ==============================================================================

USE BDImpressionador;

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

-- Adicionando novos valores na tabela

INSERT INTO Produtos(id_produto, nome_produto, data_validade, preco_produto)
VALUES
	(1, 'Arroz', '2021-12-31', 22.50),
	(2, 'Feijão', '2021-12-31', 8.99)
