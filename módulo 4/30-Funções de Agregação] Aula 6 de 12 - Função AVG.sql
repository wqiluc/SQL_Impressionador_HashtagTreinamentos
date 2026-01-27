-- =========================================================
-- 📘 [SQL Server] FUNÇÕES DE AGREGAÇÃO
-- Aula 6 de 12 — Função AVG 📐
-- =========================================================
-- Objetivo🎯:
-- Utilizar a função AVG para calcular a média
-- de valores numéricos em uma coluna
-- =========================================================

-- =========================================================
-- 🧠 EXERCÍCIO 1
-- Cálculo da média anual de salário dos clientes
-- =========================================================
-- Descrição💬:
-- Esta consulta retorna a média do salário anual
-- (YearlyIncome) dos clientes cadastrados
-- na tabela DimCustomer
-- =========================================================

SELECT DISTINCT
    AVG(YearlyIncome) AS 'Média Anual de Salário dos Clientes (U$D)💼'
FROM
    DimCustomer;

-- =========================================================
-- 💡 OBSERVAÇÃO IMPORTANTE
-- =========================================================
-- A função AVG🗽:
-- ✅ Calcula a média aritmética dos valores; e
-- ❌ Ignora automaticamente valores NULL.
-- Atenção:
-- Se existirem salários nulos na tabela,
-- eles NÃO entram no cálculo da média.
-- =========================================================