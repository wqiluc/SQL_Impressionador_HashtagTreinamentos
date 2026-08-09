-- Aula 1:
-- Views - Introdução e Sintaxe

-- Views são formas de armazenar o resultado de uma query em uma espécie de tabela, dentro dos bancos de dados.
-- É uma forma muito prática de consultar e reaproveitar os resultados de consultas criadas de forma rotineira.

-- A view mostra sempre resultados atualizados da tabela.

-- Podemos criar (CREATE), atualizar (REPLACE), alterar (ALTER) e excluir (DROP) views.


-- Aula 2:
-- Criando uma View

-- Exemplo: Faça uma consulta à tabela 'products'. Você deve retornar apenas as colunas product_id, product_name e unit_price:

SELECT
    product_id,
    product_name,
    unit_price
FROM products;

-- Crie uma view a partir da consulta anterior

CREATE OR REPLACE VIEW vwprodutos AS
SELECT
    product_id,
    product_name,
    unit_price
FROM products;

SELECT * FROM vwprodutos;


-- Aula 3:
-- Alterando uma View

-- Exemplo: Imagine que faltou incluir na sua view a coluna de units_in_stock. Altere a view criada anteriormente para fazer essa inclusão:

CREATE OR REPLACE VIEW vwprodutos AS
SELECT
    product_id,
    product_name,
    unit_price,
    units_in_stock
FROM products;

SELECT * FROM vwprodutos;


-- Aula 4:
-- Renomeando uma View

-- Exemplo: Altere o nome da sua view de 'vwprodutos' para 'vw_prod':

ALTER VIEW vwprodutos RENAME TO vw_prod;

SELECT * FROM vw_prod;


-- Aula 5:
-- Excluindo uma View

-- Exemplo: Exclua a view 'vw_prod':

DROP VIEW IF EXISTS vw_prod;