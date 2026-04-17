-- [SQL] SELECT DISTINCT
-- Banco de dados: contoso_ficticio
--
-- Objetivo:
-- Utilizar o SELECT DISTINCT para retornar valores únicos,
-- eliminando registros duplicados do resultado da consulta.

-- Exemplo 1:
-- Retorna as formas de pagamento sem repetição

SELECT DISTINCT forma_pagamento
FROM pagamentos;

-- Resultado esperado:
-- Cartão de Crédito
-- PIX
-- Boleto

-- Exemplo 2:
-- Retorna as formas de pagamento distintas
-- com alias para melhorar a leitura

SELECT DISTINCT
    forma_pagamento AS FormaPagamento
FROM pagamentos;

-- Exemplo 3:
-- Total arrecadado por forma de pagamento

SELECT
    forma_pagamento AS FormaPagamento,
    SUM(valor) AS TotalRecebido
FROM pagamentos
GROUP BY forma_pagamento;
