-- ==============================================================================
-- 🔤 [SQL Server] Funções Condicionais
-- 📚 Aula 9 de 18: IIF (Alternativa ao CASE)
-- ==============================================================================
-- Introdução: A função IIF (Immediate IF) é uma forma mais curta e simplificada de 
-- escrever uma expressão condicional (semelhante ao CASE simples). Ela recebe 
-- 3 parâmetros: 
-- 1) O teste lógico;
-- 2) O valor retornado se a condição for verdadeira;
-- 3) O valor retornado se a condição for falsa.
-- ==============================================================================

-- ==============================================================================
-- 📋 Exemplo 1: Verificação de Risco do Projeto
-- ==============================================================================
-- Objetivo: Avaliar a classificação de um projeto e definir o nível de risco.
-- Regras:
-- - Risco Alto: Classificação >= 5
-- - Risco Baixo: Classificação < 5
-- ==============================================================================

DECLARE 
	@Classificacao INT; -- 🔢 Declaração da variável de classificação
SET 
	@Classificacao = 9; -- 🎯 Atribuindo valor à variável

SELECT DISTINCT
    @Classificacao AS "Classificação oInformada", -- 📊 Exibe o valor avaliado
    IIF
    (
        @Classificacao >= 5, -- 🧪 Teste lógico
        'Risco Alto', -- 🔴 Resultado se a condição for VERDADEIRA
        'Risco Baixo' -- 🟢 Resultado se a condição for FALSA
    ) 
	AS 
		"Categoria de Risco";  -- 🏷️ Nome da coluna de saída

-- ==============================================================================
-- 📋 Exemplo 2: Classificação do Cliente (Pessoa ou Empresa)
-- ==============================================================================
-- Objetivo: Criar uma coluna única chamada 'Cliente' contendo o nome ou razão social.
-- ==============================================================================

-- 🔍 Consulta de referência (Tabela de origem - Comentada)
-- SELECT * FROM DimCustomer;

SELECT DISTINCT
    CustomerKey AS "ID do Cliente", -- 🆔 Identificador único do cliente
    CustomerType AS "Tipo do Cliente", -- 🏷️ Tipo do cliente (ex: 'Person' ou 'Company')
    -- Utilização do IIF para escolher entre o Primeiro Nome e o Nome da Empresa
    IIF
    (
        CustomerType = 'Person', -- 🧪 Teste lógico: Se for Pessoa (Person)
        FirstName as "Primeiro Nome", -- 👤 Retorna o primeiro nome
        CompanyName as "Empresa" -- 🏢 Retorna o nome da empresa
    ) AS 
		"Resultado" -- 🏷️ Coluna resultante
FROM
    DimCustomer; -- 🏢 Tabela de onde os dados são extraídos