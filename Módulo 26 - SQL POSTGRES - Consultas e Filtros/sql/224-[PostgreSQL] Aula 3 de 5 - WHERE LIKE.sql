-- Aula 3 de 5:
-- WHERE + LIKE - Filtros especiais de texto

-- Permite criar filtros especiais de textos.

-- 1. Selecione a tabela products
-- a) Quais são os produtos medidos em boxes?

SELECT * FROM products
WHERE quantity_per_unit LIKE '%boxes%';

-- b) Quais são os produtos medidos em ml?

SELECT * FROM products
WHERE quantity_per_unit LIKE '%ml%';
