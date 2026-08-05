-- ==============================================================================
-- 🔤 [SQL Server] Funções Condicionais
-- 📚 Aula 10 de 18: ISNULL - Tratando valores nulos
-- ==============================================================================
-- Introdução: A função ISNULL é usada para substituir valores NULL (ausentes) por 
-- um valor especificado. Neste exercício, combinamos a lógica de seleção de 
-- responsáveis usando IIF com um exemplo de como tratar valores nulos.
-- ==============================================================================

SELECT DISTINCT
    ProductKey AS "ID do Produto", -- 🆔 Identificador único do produto
    ProductName AS "Nome do Produto", -- 🏷️ Nome do produto
    StockTypeName AS "Tipo do Estoque", -- 📦 Tipo de estoque (High, Mid, Low)
    IIF
	(
        StockTypeName = 'High',
        'João',
        IIF
		(
            StockTypeName = 'Mid',
            'Maria',
            'Luis' -- Low = Luis, se não se encaixar em nenhum IIF
        )
    ) AS 
		"Responsável", 
		CASE ISNULL
	(
		StockTypeName, 'Não Definido'
	) 
		AS "Tipo de Estoque Tratado" -- 🛡️ Tratamento de nulos
FROM
    DimProduct; -- 🏢 Tabela de onde os dados são extraídos