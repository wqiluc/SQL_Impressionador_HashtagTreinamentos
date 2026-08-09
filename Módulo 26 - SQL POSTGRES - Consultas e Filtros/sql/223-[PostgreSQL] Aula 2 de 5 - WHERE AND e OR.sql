-- Aula 2 de 5:
-- WHERE + AND e OR - Combinando múltiplas condições

-- Permite criar filtros com mais de uma coluna.
-- AND: o filtro será realizado se todas as condições forem verdadeiras.
-- OR: o filtro será realizado desde que PELO MENOS 1 condição seja verdadeira.

-- 1. Selecione a tabela customers
-- a) Crie um filtro para que sejam mostrados apenas os clientes com contact_title = 'Owner' E do país France.

SELECT * FROM customers
WHERE contact_title = 'Owner' AND country = 'France';

-- b) Crie um filtro para que sejam mostrados apenas os clientes do Mexico OU France.

SELECT * FROM customers
WHERE country = 'Mexico' OR country = 'France';
