-- ==============================================================================
-- 🗄️ [SQL Server] CRUD - Módulo 12
-- 📘 Aula 11 de 21 - DELETE - Deletando dados
-- ==============================================================================
-- 🎯 Objetivo: Remover linhas de uma tabela usando DELETE.
--
-- 📌 Sintaxe:
--   DELETE FROM <tabela>
--   WHERE <condição>;
--
-- 🚨 ATENÇÃO: Assim como no UPDATE, nunca rode DELETE sem WHERE a menos que
--     queira apagar TODOS os registros da tabela!
--
-- 🔄 Diferença entre DELETE e TRUNCATE:
--   • DELETE  → remove linhas específicas (pode usar WHERE); registrado no log
--   • TRUNCATE → remove TODAS as linhas de uma vez; não registra cada linha no log
--               e não pode ser usado com WHERE
-- ==============================================================================

USE BDImpressionador;

-- 🏗️ Setup da tabela (recap aulas 7, 8 e 10) ----------------------------------

CREATE TABLE Produtos
(
    id_produto    INT,
    nome_produto  VARCHAR(200),
    data_validade DATETIME,
    preco_produto FLOAT
);

INSERT INTO Produtos (id_produto, nome_produto, data_validade, preco_produto)
SELECT
    ProductKey,
    ProductName,
    AvailableForSaleDate,
    UnitPrice
FROM
    ContosoRetailDW.dbo.DimProduct;

INSERT INTO Produtos (id_produto, nome_produto, data_validade, preco_produto)
VALUES
    (1, 'Arroz',  '2021-12-31', 22.50),
    (2, 'Feijão', '2021-12-31',  8.99);

UPDATE Produtos
SET nome_produto = 'Macarrão'
WHERE id_produto = 3;

-- 🔎 Verificando o registro antes de deletar
SELECT * FROM Produtos WHERE id_produto = 3;

-- 🗑️ Deletando a linha com id_produto = 3
DELETE FROM Produtos
WHERE id_produto = 3;

-- ✅ Confirmando a exclusão (deve retornar 0 linhas)
SELECT * FROM Produtos WHERE id_produto = 3;

-- 📊 Visão geral da tabela
SELECT * FROM Produtos;