-- ==============================================================================
-- [SQL Server] Views
-- Aula 6 de 13: DROP VIEW
-- ==============================================================================
-- O DROP VIEW exclui permanentemente uma View do banco de dados.
--
-- Sintaxe (uma View):
--   DROP VIEW <NomeDaView>
--
-- Sintaxe (múltiplas Views):
--   DROP VIEW <View1>, <View2>, <View3>
--
-- Atenção:
--   • A operação é irreversível — a View será perdida definitivamente
--   • Apenas a definição da View é excluída; os dados das tabelas originais
--     permanecem intactos
--   • Use IF EXISTS para evitar erro caso a View não exista:
--     DROP VIEW IF EXISTS <NomeDaView>
-- ==============================================================================

-- ==============================================================================
-- Exemplos
-- ==============================================================================

-- Exclua as Views vwClientes e vwProdutos

DROP VIEW vwProdutos
DROP VIEW vwClientes

-- Alternativa segura com IF EXISTS (evita erro se a View não existir)
-- DROP VIEW IF EXISTS vwProdutos
-- DROP VIEW IF EXISTS vwClientes
