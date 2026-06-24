-- ==============================================================================
-- [SQL Server] CRUD - Módulo 12
-- Aula 6 de 21 - CREATE TABLE - Criando a primeira tabela
-- ==============================================================================

-- Crie uma tabela chamada 'Produtos'
-- Essa tabela deve conter 4 colunas: id_produto, nome_produto, data_validade e preco_produto
-- Certifique-se de que o tipo das colunas está correto.

CREATE DATABASE BDImpressionador;

-- Obs: Se você já criou o BD Impressionador não precisa executar esta linha

USE BDImpressionador;

CREATE TABLE Produtos
(
	id_produto INT,
	nome_produto VARCHAR(200),
	data_validade DATETIME,
	preco_produto FLOAT
)

SELECT * FROM Produtos;