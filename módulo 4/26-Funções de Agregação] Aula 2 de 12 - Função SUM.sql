--=========================================================
-- 📘 [SQL Server] FUNÇÕES DE AGREGAÇÃO
-- Aula 2 de 12 — Função SUM ➕
-- =========================================================
-- Objetivo:
-- Calcular o total de itens vendidos e o total de itens devolvidos
-- utilizando a função de agregação SUM
-- =========================================================

SELECT DISTINCT
    SUM(SalesQuantity) AS 'Total de Itens Vendidos ',
    SUM(ReturnQuantity) AS 'Total de Itens Devolvidos '
FROM
    FactSales;