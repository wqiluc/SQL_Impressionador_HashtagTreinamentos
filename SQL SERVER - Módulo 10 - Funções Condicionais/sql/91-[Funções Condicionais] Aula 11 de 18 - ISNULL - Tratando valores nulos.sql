-- ==============================================================================
-- 🔤 [SQL Server] Funções Condicionais
-- 📚 Aula 11 de 18: ISNULL - Tratando valores nulos
-- ==============================================================================
-- Introdução: A função ISNULL avalia uma expressão e, caso seu valor seja NULL 
-- (ausente ou vazio), ela o substitui pelo valor alternativo que definirmos.
-- ==============================================================================

-- 🔍 Consulta de referência (Tabela de origem - Comentada)
-- SELECT * FROM DimGeography;

-- ==============================================================================
-- 📋 Execução do Exemplo: Substituição de Nulos na Coluna CityName
-- ==============================================================================

SELECT DISTINCT
    GeographyKey AS "ID Geografia", -- 🆔 Identificador único da localização
    ContinentName AS "Nome do Continente", -- 🌍 Nome do continente
    CityName AS "Nome da Cidade", -- 🏙️ Nome da cidade (pode conter valores nulos)
    ISNULL
	(
		CityName, 'Local desconhecido'
	) 
		AS 
			"Cidade Tratada"
FROM
    DimGeography; -- 🏢 Tabela de onde os dados são extraídos