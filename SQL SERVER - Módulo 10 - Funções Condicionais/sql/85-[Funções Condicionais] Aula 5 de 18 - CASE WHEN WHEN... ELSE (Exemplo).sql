-- ==============================================================================
-- 🔤 [SQL Server] Funções Condicionais
-- 📚 Aula 5 de 18: CASE WHEN... WHEN... ELSE (Exemplo Prático)
-- ==============================================================================
-- Objetivo: Selecionar colunas da tabela DimCustomer e utilizar a instrução CASE 
-- para converter siglas de gênero e tratar possíveis casos atípicos (como empresas).
-- ==============================================================================

-- 🔍 Consulta de referência (Comentada para visualização da estrutura original)
-- SELECT * FROM DimCustomer;

-- ==============================================================================
-- 📋 Execução do Exemplo
-- ==============================================================================

SELECT DISTINCT
    CustomerKey AS "ID do Cliente", -- 🆔 Identificador único do cliente
    FirstName AS "Nome do cliente", -- 👤 Primeiro nome do cliente
    Gender AS "Gênero Sigla", -- ⚧️ Sigla do gênero na base (ex: 'M', 'F', ou outro valor)
    CASE
        WHEN 
			Gender = 'M' 
		THEN 
			'Masculino' -- 👨 Se o gênero for 'M', traduz para 'Masculino'
        WHEN 
			Gender = 'F' 
		THEN 
			'Feminino' -- 👩 Se o gênero for 'F', traduz para 'Feminino'
        ELSE 
			'Empresa' -- 🏢 Tratamento de exceção: classifica valores diferentes (como 'U' ou nulos) como 'Empresa'
    END AS 
		"Descrição" -- 🏷️ Nova coluna com o gênero detalhado ou classificação
FROM
    DimCustomer; -- 🏢 Tabela de onde os dados são extraídos