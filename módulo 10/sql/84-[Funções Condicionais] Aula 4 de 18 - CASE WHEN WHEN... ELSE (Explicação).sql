-- ==============================================================================
-- 🔤 [SQL Server] Funções Condicionais
-- 📚 Aula 4 de 18: CASE WHEN... WHEN... ELSE (Explicação e Exemplos)
-- ==============================================================================
-- Introdução: A estrutura CASE permite avaliar múltiplas condições em sequência.
-- O SQL Server avalia as condições de cima para baixo. Assim que uma condição 
-- for verdadeira, ele retorna o valor correspondente e ignora as demais.
-- ==============================================================================

/*
Estrutura básica:
CASE
    WHEN 
		teste_logico1 
	THEN 
		'resultado1'
    WHEN 
		teste_logico2 
	THEN 
		'resultado2'
    ELSE 
		'resultado3'
END
*/

-- ==============================================================================
-- 📋 Exemplo 1: Verificação da Situação do Aluno
-- ==============================================================================
-- Objetivo: Determinar a situação do aluno com base na nota.
-- Regras:
-- - Aprovado: nota >= 6
-- - Prova final: nota entre 4 e 6 (nota >= 4 e < 6)
-- - Reprovado: nota abaixo de 4

DECLARE 
	@Nota FLOAT; -- 🔢 Declaração da variável de nota
SET 
	@Nota = 10.0;     -- 🎯 Atribuindo valor à variável

SELECT
    @Nota AS "Nota do aluno", -- 📊 Exibe a nota avaliada
    CASE
        WHEN 
			@Nota >= 6.0 
		THEN 
			'Aprovado' -- 🟢 Se nota >= 6
        WHEN 
			@Nota >= 4.0 
			THEN 
				'Prova Final'  -- 🟡 Se nota >= 4 e < 6
        ELSE 
			'Reprovado' -- 🔴 Caso contrário
    END AS 
		"Situação do Aluno"; -- 🏷️ Nome da coluna de saída

-- ==============================================================================
-- 📦 Exemplo 2: Classificação do Produto pelo Preço
-- ==============================================================================
-- Objetivo: Classificar o produto de acordo com o seu preço.
-- Regras:
-- - Luxo: Preço >= 40000
-- - Econômico: Preço >= 10000 e Preço < 40000
-- - Básico: Preço < 10000

DECLARE 
	@Preco FLOAT; -- 💰 Declaração da variável de preço
SET 
	@Preco = 30000.0; -- 🎯 Atribuindo valor à variável

SELECT DISTINCT
    @Preco AS "Preço Informado", -- 📊 Exibe o preço avaliado
    CASE
        WHEN 
			@Preco >= 40000.0 
		THEN 
			'Luxo' -- 💎 Categoria Luxo
        WHEN 
			@Preco >= 10000.0 
		THEN 
			'Econômico' -- 💳 Categoria Econômica
        ELSE 
			'Básico' -- 🛒 Categoria Básica
    END AS 
		"Categoria do Produto"; -- 🏷️ Nome da coluna de saída