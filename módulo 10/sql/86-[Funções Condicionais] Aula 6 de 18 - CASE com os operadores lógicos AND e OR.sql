-- ==============================================================================
-- 🔤 [SQL Server] Funções Condicionais
-- 📚 Aula 6 de 18: CASE com os operadores lógicos AND e OR
-- ==============================================================================
-- Introdução: Podemos combinar a função CASE com operadores lógicos (AND e OR) 
-- para criar regras de negócio mais complexas baseadas em múltiplas colunas ou 
-- condições simultâneas.
-- ==============================================================================

-- 🔍 Consulta de referência (Tabela de origem)
-- SELECT * FROM DimProduct;

-- ==============================================================================
-- 📋 Exemplo A: Utilizando o operador lógico AND
-- ==============================================================================
-- Objetivo: Caso o produto seja da marca 'Contoso' E da cor 'Red', o desconto será de 10% (0.1).
-- Caso contrário, não terá desconto (0).

SELECT DISTINCT
    ProductName AS "Nome do Produto", -- 🏷️ Nome do produto
    BrandName AS "Nome da Marca", -- 🏢 Marca do produto
    ColorName AS "Cor do Produto", -- 🎨 Cor do produto
    UnitPrice AS "Preco Unitário", -- 💰 Preço original do produto
    CASE
        WHEN 
			BrandName = 'Contoso' 
			AND 
			ColorName = 'Red' 
			THEN 
				0.10 -- 📉 Desconto de 10%
        ELSE 
			0.0 -- ❌ Sem desconto
    END AS 
		"Preco Com Desconto A" -- 🏷️ Taxa de desconto calculada
FROM
    DimProduct;

-- ==============================================================================
-- 📋 Exemplo B: Utilizando o operador lógico OR
-- ==============================================================================
-- Objetivo: Caso o produto seja da marca 'Litware' OU 'Fabrikam', o desconto será de 5% (0.05).
-- Caso contrário, não terá desconto (0).

SELECT DISTINCT
    ProductName AS "Nome do Produto", -- 🏷️ Nome do produto
    BrandName AS "Nome da Marca", -- 🏢 Marca do produto
    ColorName AS "Cor do Produto", -- 🎨 Cor do produto
    UnitPrice AS "Preco Unitário", -- 💰 Preço original do produto
    CASE
        WHEN 
			BrandName = 'Litware' 
      OR 
      BrandName = 'Fabrikam' 
			THEN 
        0.05 -- 📉 Desconto de 5%
        ELSE 
          0.0-- ❌ Sem desconto
    END AS 
		"Preco Com Desconto B" -- 🏷️ Taxa de desconto calculada
FROM
    DimProduct;