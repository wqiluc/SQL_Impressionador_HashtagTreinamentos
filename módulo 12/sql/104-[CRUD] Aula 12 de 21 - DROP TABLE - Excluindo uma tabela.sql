-- ==============================================================================
-- [SQL Server] CRUD - Módulo 12
-- Aula 12 de 21 - DROP TABLE - Excluindo uma tabela
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

-- Adicionando novos valores na tabela

INSERT INTO Produtos(id_produto, nome_produto, data_validade, preco_produto)
VALUES
	(1, 'Arroz', '2021-12-31', 22.50),
	(2, 'Feijão', '2021-12-31', 8.99)

-- Atualizando o dado de uma tabela

UPDATE Produtos
SET nome_produto = 'Macarrão'
WHERE id_produto = 3;


-- Deletando dados de uma tabela

DELETE
FROM Produtos
WHERE id_produto = 3;

-- Excluindo uma tabela

DROP TABLE Produtos;