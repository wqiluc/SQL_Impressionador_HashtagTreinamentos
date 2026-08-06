-- ==============================================================================
-- 🔤 [SQL Server] Funções Condicionais
-- 📚 Aula 3 de 18: CASE WHEN... ELSE (Exemplo Prático)
-- ==============================================================================
-- Objetivo: Selecionar colunas da tabela DimCustomer e usar a função CASE para 
-- traduzir as siglas de gênero para um formato mais legível.
-- ==============================================================================

-- 🔍 Consulta de referência (Comentada para visualização da estrutura original)
-- SELECT * FROM DimCustomer;

-- ==============================================================================
-- 📋 Execução do Exemplo
-- ==============================================================================

SELECT DISTINCT
    CustomerKey AS "ID do Cliente", -- 🆔 Identificador único do cliente
    FirstName AS "Nome",        -- 👤 Primeiro nome do cliente
    Gender AS "Gênero Sigla",     -- ⚧️ Sigla do gênero na base (ex: 'M')
    CASE
        WHEN 
			Gender = 'M' 
		THEN 
			'Masculino' -- 👨 Se o gênero for 'M', traduz para 'Masculino'
        ELSE 
			'Feminino'           -- 👩 Caso contrário, traduz para 'Feminino'
    END AS 
		Sexo_Descricao -- 🏷️ Nova coluna com o gênero detalhado
FROM
    DimCustomer; -- 🏢 Tabela de onde os dados são extraídos