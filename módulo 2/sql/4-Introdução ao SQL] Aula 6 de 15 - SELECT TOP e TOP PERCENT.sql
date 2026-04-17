-- [SQL] Introdução ao SELECT TOP e TOP PERCENT
-- Banco de dados: contoso_ficticio
--
-- Objetivo:
-- Demonstrar como limitar a quantidade de registros retornados
-- utilizando SELECT TOP(N) e SELECT TOP(N) PERCENT.
--
-- Tabelas disponíveis no banco:
-- categorias; clientes; itens_pedido; pagamentos; pedidos; produtos; resumo_pagamentos; e vendedores.
--
-- Exemplo 1:
-- Retorna os 10 primeiros registros da tabela de produtos

SELECT TOP (10) *
FROM produtos;

-- Exemplo 2:
-- Retorna 10% dos primeiros registros da tabela de clientes

SELECT TOP (10) PERCENT *
FROM clientes;
