-- ==============================================================================
-- [SQL Server] Views
-- Aula 2 de 13: CREATE VIEW - Criando a primeira View
-- ==============================================================================
-- O que é uma View?
-- Uma View é uma tabela virtual baseada no resultado de uma consulta SQL.
-- Ela não armazena dados fisicamente — apenas armazena a definição da consulta.
--
-- Vantagens:
--   • Simplifica consultas complexas reutilizando-as como uma "tabela"
--   • Controla o que o usuário pode visualizar (segurança)
--   • Centraliza a lógica de negócios
--
-- Sintaxe:
--   CREATE VIEW <NomeDaView> AS
--   <Consulta SQL>
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

-- Consultando a View criada
SELECT * FROM vwClientes;

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

-- Consultando a View criada
SELECT * FROM vwProdutos