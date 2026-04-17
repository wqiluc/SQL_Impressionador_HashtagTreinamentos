-- [SQL] SELECT DISTINCT
--
-- Objetivo:
-- O comando SELECT DISTINCT é utilizado para retornar apenas
-- valores únicos, eliminando registros duplicados do resultado.
--
-- Sintaxe:
-- SELECT DISTINCT coluna
-- FROM tabela;
--
-- Exemplo 1:
-- Retorna todas as categorias sem repetição

SELECT DISTINCT categorias
FROM produtos;

-- Exemplo 2:
-- Retorna as cidades distintas dos clientes

SELECT DISTINCT cidade_cliente
    FROM clientes;

-- Exemplo 3:
-- Retorna combinações únicas de mais de uma coluna

SELECT DISTINCT cidade_cliente, estado_cliente
    FROM clientes;