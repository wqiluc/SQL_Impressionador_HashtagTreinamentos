-- ==============================================================================
-- 🔤 [SQL Server] Funções Condicionais
-- 📚 Aula 2 de 18: CASE WHEN... ELSE (Explicação)
-- ==============================================================================
-- Introdução: A função CASE permite tratar condições no SQL, avaliando testes 
-- lógicos e retornando valores específicos.
-- ==============================================================================

/*
Estrutura básica:
CASE
    WHEN teste_logico THEN 'resultado1'
    ELSE 'resultado2'
END
*/

-- ==============================================================================
-- 📋 Exemplo 1: Avaliação de Situação do Aluno
-- ==============================================================================
-- Objetivo: Determinar se o aluno está aprovado ou reprovado com base na nota.

DECLARE 
    Nota FLOAT; -- 🔢 Declaração da variável que armazena a nota

SET 
    @Nota = 7.0; -- 🎯 Atribuindo valor à variável (usando ponto decimal para precisão)

SELECT
    @Nota AS "Nota Informada", -- 📊 Exibe a nota que está sendo analisada
    CASE
        WHEN 
            @Nota >= 7.0 
		THEN 
            'Aprovado' -- 🟢 Se a nota for >= 6, retorna 'Aprovado'
        ELSE 
            'Reprovado' -- 🔴 Caso contrário, retorna 'Reprovado'
    END AS 
        "Situação do Aluno"; 
	-- 🏷️ Nome da coluna de saída

-- ==============================================================================
-- 📅 Exemplo 2: Verificação de Validade do Produto
-- ==============================================================================
-- Objetivo: Comparar a data de vencimento com a data atual para verificar o status.

DECLARE 
    @DataVencimento DATETIME, -- 🗓️ Data limite de validade do produto
    @DataAtual DATETIME; -- ⏱️ Data de referência atual

-- Atribuindo os valores às variáveis (formato 'YYYY-MM-DD' para evitar problemas de idioma)
SET 
    @DataVencimento = '2025-03-10'; 
SET 
    @DataAtual = '2022-04-30';

SELECT DISTINCT
    @DataVencimento AS "Data Vencimento", -- 🗓️ Exibe a data de vencimento
    @DataAtual AS "Data Atual", -- ⏱️ Exibe a data de verificação
    CASE
        WHEN 
            @DataAtual > @DataVencimento 
		THEN 
            'Produto Vencido' -- ⚠️ Condição: A data atual é maior que a de vencimento
        ELSE 
            'Na validade' -- ✅ Condição: O produto ainda está no prazo
    END AS 
		"Status de Validade"; -- 🏷️ Nome da coluna de saída