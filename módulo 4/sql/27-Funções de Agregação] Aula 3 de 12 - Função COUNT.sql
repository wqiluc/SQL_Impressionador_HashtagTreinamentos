-- =========================================================
-- 📘 [SQL Server] FUNÇÕES DE AGREGAÇÃO
-- Aula 3 de 12 — Função COUNT 🔢
-- =========================================================
-- Objetivo🎯:
-- Utilizar a função COUNT para realizar contagens
-- considerando diferentes colunas da tabela DimProduct
-- =========================================================

-- =========================================================
-- 🧠 EXERCÍCIO 1
-- Contagem total de produtos usando a coluna ProductName
-- =========================================================
-- Descrição💬:
-- Esta consulta retorna a quantidade total de produtos
-- considerando apenas registros onde ProductName NÃO é NULL
-- =========================================================

SELECT DISTINCT
    COUNT(ProductName) AS 'Quantidade de Produtos 📦'
FROM
    DimProduct;

-- =========================================================
-- 🧠 EXERCÍCIO 2
-- Contagem total de produtos usando a coluna Size
-- =========================================================
-- Descrição:
-- Esta consulta retorna a quantidade de produtos
-- que possuem valor preenchido na coluna Size
-- =========================================================

SELECT DISTINCT
    COUNT(Size) AS 'Quantidade de Produtos com Tamanho 📏'
FROM
    DimProduct;

-- =========================================================
-- ⚠️ OBSERVAÇÃO IMPORTANTE
-- =========================================================
-- A função COUNT(coluna):
-- ✅ Conta apenas valores NÃO NULOS
-- ❌ Ignora registros com valor NULL
--
-- Caso seja necessário contar TODOS os registros da tabela,
-- independentemente de valores nulos, utilize:
-- COUNT(*)
-- =========================================================