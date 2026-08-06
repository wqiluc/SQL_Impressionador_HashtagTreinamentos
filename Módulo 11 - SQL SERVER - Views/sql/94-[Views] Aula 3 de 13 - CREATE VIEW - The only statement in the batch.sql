-- ==============================================================================
-- [SQL Server] Views
-- Aula 3 de 13: CREATE VIEW - The only statement in the batch
-- ==============================================================================
-- REGRA IMPORTANTE: O CREATE VIEW deve ser o ÚNICO comando no lote (batch).
--
-- O que é um "batch" (lote)?
--   Um lote é um conjunto de instruções SQL enviadas ao servidor de uma vez.
--   No SQL Server, o separador de lote é o GO.
--
-- Por que isso importa?
--   Se houver qualquer outro comando (SELECT, DECLARE, etc.) antes do
--   CREATE VIEW no mesmo lote, o SQL Server retorna erro:
--   "CREATE VIEW must be the only statement in the batch."
--
-- Solução: Usar GO antes e depois do CREATE VIEW para isolá-lo em seu próprio lote.
-- ==============================================================================

-- ==============================================================================
-- Exemplos
-- ==============================================================================

-- a) Crie uma View contendo as seguintes informações da tabela DimCustomer:
--    FirstName, EmailAddress e BirthDate. Chame essa View de vwClientes.

GO
CREATE VIEW vwClientes AS
SELECT
    FirstName       AS 'Nome',
    EmailAddress    AS 'E-mail',
    BirthDate       AS 'Data de Nascimento'
FROM
    DimCustomer
GO

SELECT * FROM vwClientes

-- ------------------------------------------------------------------------------

-- b) Crie uma View contendo as seguintes informações da tabela DimProduct:
--    ProductKey, ProductName, BrandName e UnitPrice. Chame essa View de vwProdutos.

GO
CREATE VIEW vwProdutos AS
SELECT
    ProductKey              AS 'ID Produto',
    ProductName             AS 'Nome do Produto',
    ProductSubcategoryKey   AS 'ID Subcategoria',
    BrandName               AS 'Marca',
    UnitPrice               AS 'Preço Unitário'
FROM
    DimProduct
GO

SELECT * FROM vwProdutos
