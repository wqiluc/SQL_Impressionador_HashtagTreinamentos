-- ==============================================================================
-- 🔤 [SQL Server] Funções Condicionais
-- 📚 Aula 8 de 18: CASE Aditivo (Additive CASE)
-- ==============================================================================
-- Introdução: O CASE aditivo permite somar os resultados de múltiplos blocos 
-- CASE para compor um valor final. Isso é muito útil quando queremos aplicar 
-- descontos ou regras que são cumulativos baseados em diferentes categorias.
-- ==============================================================================

-- 🔍 Consulta de referência (Tabelas de origem)

-- SELECT * FROM DimProduct;
-- SELECT * FROM DimProductSubcategory;
-- SELECT * FROM DimProductCategory;

-- ==============================================================================
-- 📋 Execução do Exemplo: Cálculo de Desconto Acumulativo
-- ==============================================================================
-- Regras:
-- - Categoria 'TV and Video' = + 10% (0.10)
-- - Subcategoria 'Televisions' (pertencente à categoria) = + 5% (0.05)
-- ==============================================================================

SELECT DISTINCT
    ProductKey AS "ID do Produto", -- 🆔 Identificador único do produto
    ProductName AS "Nome do Produto", -- 🏷️ Nome do produto
    ProductCategoryName AS "Categoria", -- 🏢 Categoria do produto
    ProductSubcategoryName AS "Subcategoria", -- 📦 Subcategoria do produto
    UnitPrice AS Preco_Unitario, -- 💰 Preço original do produto
    (
        CASE 
            WHEN 
                ProductCategoryName = 'TV and Video' 
			THEN 
				0.10 
            ELSE 
				0.00 
        END
        + 
        CASE 
            WHEN 
                ProductSubcategoryName = 'Televisions' 
			THEN 
				0.05 
            ELSE 
				0.00 
        END
    ) AS "Percentual de Desconto", -- 🏷️ Percentual de desconto total (ex: 0.10, 0.05 ou 0.15)
    
    -- 💵 Calculando o valor final do produto com o desconto aplicado
    UnitPrice * 
	(1 - 
        (
            CASE 
                WHEN ProductCategoryName = 'TV and Video' 
				THEN 
					0.10 
                ELSE 
					0.00 
            END 
            + 
            CASE 
                WHEN ProductSubcategoryName = 'Televisions' 
				THEN 
					0.05 
                ELSE 
					0.00 
            END
        )
    ) AS "Preco Com Desconto"
FROM 
    DimProduct
INNER JOIN 
    DimProductSubcategory 
    ON DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey
INNER JOIN 
    DimProductCategory 
    ON DimProductSubcategory.ProductCategoryKey = DimProductCategory.ProductCategoryKey;