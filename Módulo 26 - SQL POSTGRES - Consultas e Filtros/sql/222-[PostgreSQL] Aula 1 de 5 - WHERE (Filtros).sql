-- Aula 1 de 5:
-- WHERE - Criando filtros nas consultas

-- Permite criar filtros nas consultas. Obs.: O Postgres é case-sensitive.

-- 1. Selecione a tabela customers
-- a) Crie um filtro para que sejam mostrados apenas os clientes com contact_title = 'Owner'.

SELECT * FROM customers
WHERE contact_title = 'Owner';

-- b) Crie um filtro para que sejam mostrados apenas os clientes do país France.

SELECT * FROM customers
WHERE country = 'France';

-- 2. Selecione a tabela products
-- a) Crie um filtro para que sejam mostrados os produtos com estoque igual a zero (units_in_stock).
-- b) Crie um filtro para mostrar os produtos com unit_price maior ou igual a 50.

SELECT * FROM products
WHERE units_in_stock = 0;

SELECT * FROM products
WHERE unit_price >= 50
ORDER BY unit_price DESC;

-- 3. Selecione a tabela orders
-- Crie um filtro para mostrar apenas os pedidos feitos depois do dia '01/01/1998'.

SELECT * FROM orders
WHERE order_date >= '1998-01-01';
