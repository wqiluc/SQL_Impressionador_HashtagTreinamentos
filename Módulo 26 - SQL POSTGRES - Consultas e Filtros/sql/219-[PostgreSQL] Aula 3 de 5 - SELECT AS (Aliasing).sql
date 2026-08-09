-- Aula 3 de 5:
-- ALIAS: Renomeando colunas e tabelas com o AS

SELECT
    p.product_id AS ID_Produto,
    p.product_name AS Nome_Produto,
    p.unit_price AS Preco_Unitario
FROM products AS p;
