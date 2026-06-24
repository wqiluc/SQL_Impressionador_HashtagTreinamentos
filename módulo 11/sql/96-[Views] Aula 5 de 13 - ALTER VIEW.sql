-- ==============================================================================
-- [SQL Server] Views
-- Aula 5 de 13: ALTER VIEW
-- ==============================================================================
-- O ALTER VIEW modifica a definição de uma View existente.
--
-- Por que usar em vez de DROP + CREATE?
--   • Preserva as permissões já concedidas na View
--   • Mantém dependências intactas
--   • É mais seguro em ambientes de produção
--
-- Sintaxe:
--   ALTER VIEW <NomeDaView> AS
--   <Nova Consulta SQL>
--   GO
--
-- IMPORTANTE: Assim como o CREATE VIEW, o ALTER VIEW também deve ser o único
--             statement no lote — use GO para isolá-lo.
-- ==============================================================================

-- ==============================================================================
-- Exemplos
-- ==============================================================================

-- a) Altere a View vwClientes para incluir também a coluna Gender,
--    e filtrar apenas os clientes do sexo Feminino.

ALTER VIEW vwClientes AS
SELECT
    FirstName       AS 'Nome',
    EmailAddress    AS 'E-mail',
    BirthDate       AS 'Data de Nascimento',
    Gender          AS 'Sexo'
FROM
    DimCustomer
WHERE Gender = 'F'
GO

SELECT * FROM vwClientes
