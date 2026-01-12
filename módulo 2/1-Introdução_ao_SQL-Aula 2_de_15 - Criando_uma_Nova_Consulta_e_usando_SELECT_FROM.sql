-- [MySQL / SQL Server] Introdução ao SQL 📊

-- Aula 2 de 15: Criando uma Nova Consulta e usando SELECT FROM

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
