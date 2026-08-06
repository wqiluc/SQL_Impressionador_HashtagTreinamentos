-- ==============================================================================
-- 🗄️ [SQL Server] CRUD - Módulo 12
-- 📘 Aula 10 de 21 - UPDATE - Atualizando o dado de uma tabela
-- ==============================================================================
-- 🎯 Objetivo: Modificar valores já existentes em uma tabela com UPDATE ... SET.
--
-- 📌 Sintaxe:
--   UPDATE <tabela>
--   SET    <coluna> = <novo_valor>  [, <coluna2> = <valor2>, ...]
--   WHERE  <condição>;
--
-- 🚨 ATENÇÃO: Nunca execute um UPDATE sem cláusula WHERE a menos que queira
--     alterar TODAS as linhas da tabela!
--
-- 💡 Dica: antes de executar o UPDATE, rode um SELECT com o mesmo WHERE para
--     confirmar quais linhas serão afetadas.
-- ==============================================================================

USE BDImpressionador;

-- 🏗️ Setup da tabela (recap aulas 7 e 8) --------------------------------------

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

-- 🔎 Verificando o registro antes de alterar
SELECT * FROM Produtos WHERE id_produto = 3;

-- ✏️ Atualizando o nome do produto com id = 3
UPDATE Produtos
SET nome_produto = 'Macarrão'
WHERE id_produto = 3;

-- ✅ Confirmando a alteração
SELECT * FROM Produtos WHERE id_produto = 3;

-- 📊 Visão geral da tabela
SELECT * FROM Produtos;