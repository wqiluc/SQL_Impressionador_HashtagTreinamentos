-- Aula 4 de 5:
-- WHERE + IN - Alternativa ao uso de múltiplos OR

-- 1. Selecione a tabela customers
-- a) Quais clientes são dos países 'Mexico', 'UK', 'Canada' (utilize o método OR para resolver)

SELECT * FROM customers
WHERE country = 'Mexico' OR country = 'UK' OR country = 'Canada';

-- b) Quais clientes são dos países 'Mexico', 'UK', 'Canada' (utilize o método IN para resolver)

SELECT * FROM customers
WHERE country IN ('Mexico', 'UK', 'Canada');
