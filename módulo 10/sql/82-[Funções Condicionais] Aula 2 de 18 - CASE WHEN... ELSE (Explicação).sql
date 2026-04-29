-- [SQL Server] Fun��es Condicionais
-- Aula 2 de 18: CASE WHEN... ELSE (Explica��o)

-- Introdu��o: A fun��o CASE permite tratar condi��es no SQL

/*
CASE
	WHEN teste_logico THEN 'resultado1'
	ELSE 'resultado2'
END
*/

-- Exemplo 1: Determine a situa��o do aluno. Se a M�dia for >= 6, ent�o est� aprovado. Caso contr�rio, reprovado.

DECLARE 
	@rNota FLOAT
SET 
	@varNota = 6

SELECT
	CASE
		WHEN @varNota >= 6 THEN 'Aprovado'
		ELSE 'Reprovado'
	END AS 'Situa��o'


-- Exemplo 2: A data de vencimento de um produto � no dia 10/03/2022. Fa�a um teste l�gico para verificar se um produto passou da validade ou n�o.

DECLARE @varDataVencimento DATETIME, @varDataAtual DATETIME
SET @varDataVencimento = '10/03/2025'
SET @varDataAtual = '30/04/2022'

SELECT
	CASE
		WHEN @varDataAtual > @varDataVencimento THEN 'Produto Vencido'
		ELSE 'Na validade'
	END
