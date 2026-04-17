-- [MySQL / SQL Server] Introdução ao SQL
-- Aula 3 de 15: Salvando a primeira consulta e resolvendo 2 problemas


-- 1. Antes de executar os códigos, garanta que o banco de dados correto está selecionado
-- Banco de dados: contoso
USE contoso;

-- 2. Sempre que executar um código, selecione todo ele para não ter problemas


-- Selecionando todas as linhas e colunas da tabela clientes (equivalente à DimCustomer)
SELECT * FROM clientes;

-- Selecionando todas as linhas e colunas da tabela vendedores (equivalente à DimStore)
SELECT * FROM vendedores;

-- Selecionando todas as linhas da tabela vendedores,
-- especificamente as colunas id_vendedor, nome e salario
SELECT id_vendedor, nome, salario 
FROM vendedores;

-- Selecionando todas as linhas e colunas da tabela produtos (equivalente à DimProduct)
SELECT * FROM produtos;

-- Selecionando todas as linhas da tabela produtos,
-- especificamente as colunas nome e preco
SELECT nome, preco 
FROM produtos;
