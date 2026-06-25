-- ==============================================================================
-- 🗄️ [SQL Server] CRUD - Módulo 12
-- 📘 Aula 12 de 21 - DROP TABLE - Excluindo uma tabela
-- ==============================================================================
-- 🎯 Objetivo: Remover permanentemente uma tabela do banco de dados com DROP TABLE.
--
-- 📌 Sintaxe:
--   DROP TABLE <tabela>;
--
-- 🔄 Diferença entre DELETE, TRUNCATE e DROP TABLE:
--   • DELETE       → remove linhas específicas; a estrutura da tabela permanece
--   • TRUNCATE     → remove TODOS os dados; a estrutura da tabela permanece
--   • DROP TABLE   → remove os dados E a estrutura da tabela (tudo some!)
--
-- 🚨 ATENÇÃO: DROP TABLE é irreversível. Após a execução, a tabela e todos
--     os seus dados são permanentemente perdidos.
--
-- 💡 Dica: Use IF EXISTS para evitar erros quando a tabela não existir:
--   DROP TABLE IF EXISTS <tabela>;
-- ==============================================================================

USE BDImpressionador;

-- 🏗️ Setup da tabela (recap aulas 7, 8, 10 e 11) ------------------------------

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

DELETE FROM Produtos
WHERE id_produto = 3;

-- 📊 Visão da tabela antes de excluir
SELECT * FROM Produtos;

-- 💣 Excluindo a tabela definitivamente
DROP TABLE Produtos;

-- ✅ Tentando selecionar após o DROP (deve gerar erro — tabela não existe mais)
-- SELECT * FROM Produtos;