-- [MySQL / SQL Server] Introdução ao SQL
-- Aula 4 de 15: Como organizar melhor os códigos com indentação


-- Para organizar melhor os seus códigos, pule linhas.
-- Abaixo temos dois exemplos de códigos que chegam no mesmo resultado,
-- só que na versão 1 não utilizamos a indentação, e na versão 2 usamos.


-- Selecionando todas as linhas e colunas da tabela vendedores (equivalente à DimStore)

-- versão 1
SELECT * FROM vendedores;

-- versão 2
SELECT
    *
FROM
    vendedores;


-- Selecionando todas as linhas da tabela vendedores,
-- especificamente as colunas id_vendedor, nome e salario

-- versão 1
SELECT id_vendedor, nome, salario FROM vendedores;

-- versão 2
SELECT
    id_vendedor,
    nome,
    salario
FROM
    vendedores;
