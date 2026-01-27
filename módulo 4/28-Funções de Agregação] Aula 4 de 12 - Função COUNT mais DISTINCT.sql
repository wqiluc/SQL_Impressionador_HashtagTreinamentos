-- =========================================================
-- 📘 [SQL Server] FUNÇÕES DE AGREGAÇÃO
-- Aula 4 de 12 — Função COUNT + DISTINCT 🔁
-- =========================================================
-- Objetivo🎯:
-- Utilizar a função COUNT em conjunto com DISTINCT
-- para contar valores únicos de uma coluna
-- =========================================================

-- =========================================================
-- 🧠 EXERCÍCIO 1
-- Contagem distinta das marcas de produtos
-- =========================================================
-- Descrição💬:
-- Esta consulta retorna a quantidade de marcas DIFERENTES
-- existentes na tabela DimProduct
--
-- Importante❗️:
-- Mesmo que uma marca apareça várias vezes,
-- ela será contada apenas UMA vez 🏷️
-- =========================================================

SELECT
    COUNT(DISTINCT BrandName) AS 'Total de Marcas Distintas 🏷️'
FROM
    DimProduct;

-- =========================================================
-- 💡 OBSERVAÇÃO IMPORTANTE
-- =========================================================
-- COUNT(DISTINCT coluna):
-- ✅ Conta apenas valores únicos
-- ❌ Ignora valores NULL
-- Exemplo prático:
-- Contoso, Contoso, Litware → resultado = 2 =========================================================