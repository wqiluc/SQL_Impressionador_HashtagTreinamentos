-- ==============================================================================
-- 🗄️ [SQL Server] CRUD - Módulo 12
-- 📘 Aula 8 de 21 - INSERT INTO - Adicionando novos valores na tabela
-- ==============================================================================
-- 🎯 Objetivo: Inserir linhas manualmente em uma tabela usando VALUES.
--
-- 📌 Sintaxe:
--   INSERT INTO <tabela> (<col1>, <col2>, ...)
--   VALUES
--       (<val1>, <val2>, ...),   ← múltiplas linhas de uma só vez
--       (<val1>, <val2>, ...);
--
-- 💡 Dica: é boa prática listar explicitamente as colunas no INSERT INTO,
--     assim a inserção não quebra se a estrutura da tabela mudar no futuro.
-- ==============================================================================

USE BDImpressionador;

-- 🏗️ Criando a tabela ---------------------------------------------------------

CREATE TABLE Produtos
(
    id_produto    INT,
    nome_produto  VARCHAR(200),
    data_validade DATETIME,
    preco_produto FLOAT
);

-- 📥 Passo 1 – Copiando dados de outra tabela (recap Aula 7) ------------------

INSERT INTO Produtos (id_produto, nome_produto, data_validade, preco_produto)
SELECT
    ProductKey,
    ProductName,
    AvailableForSaleDate,
    UnitPrice
FROM
    ContosoRetailDW.dbo.DimProduct;

-- 📝 Passo 2 – Inserindo linhas manualmente com VALUES ------------------------

INSERT INTO Produtos (id_produto, nome_produto, data_validade, preco_produto)
VALUES
    (1, 'Arroz',  '2021-12-31', 22.50),
    (2, 'Feijão', '2021-12-31',  8.99);

-- ✅ Verificando os dados
SELECT * FROM Produtos;