-- ==============================================================================
-- [SQL Server] Views
-- Aula 4 de 13: USE Database - Como especificar o banco de dados usado
-- ==============================================================================
-- O comando USE define qual banco de dados será utilizado na sessão atual.
--
-- Por que usar?
--   Quando há múltiplos bancos de dados no servidor, o SQL Server precisa saber
--   em qual contexto executar os comandos. Sem o USE, ele usa o banco padrão
--   da conexão, o que pode causar erros de "tabela não encontrada".
--
-- Sintaxe:
--   USE <NomeDoBancoDeDados>
--
-- Dica: Ao criar uma View em um banco específico, sempre declare o USE antes
--       para garantir que a View seja criada no lugar certo.
-- ==============================================================================

-- ==============================================================================
-- Exemplos
-- ==============================================================================

-- Acessando o banco de dados "Teste" e consultando a tabela Produtos
USE Teste
SELECT * FROM Produtos

-- Alternando para o banco "ContosoRetailDW" e consultando a tabela DimProduct
USE ContosoRetailDW
SELECT * FROM DimProduct
