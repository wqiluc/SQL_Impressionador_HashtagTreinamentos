/*
================================================================================
 📦 [SQL Server] Variáveis
 📚 Aula 8 de 23: DECLARE e SET (Declarando Variáveis)
================================================================================

 1️⃣ O que é uma variável?
 Uma variável é um "recipiente" (objeto) que armazena um valor de um determinado 
 tipo de dado para ser utilizado posteriormente no seu script.

 2️⃣ Estrutura Básica:
 - DECLARE @nome_variavel TIPO_DADO; -- Declaração (Cria o espaço)
 - SET @nome_variavel = valor;       -- Atribuição (Guarda o valor)
*/

-- -----------------------------------------------------------------------------
-- 💡 Exemplo de uso em cálculos
-- -----------------------------------------------------------------------------

-- Sem variáveis (cálculo fixo)
SELECT 100 * 8.99 AS 'Faturamento_Fixo';

-- Com variáveis (mais profissional e dinâmico)
DECLARE @quantidade AS INT;
DECLARE @preco AS FLOAT;

SET @quantidade = 100;
SET @preco = 8.99;

SELECT @quantidade * @preco AS 'Faturamento_Variavel';

-- -----------------------------------------------------------------------------
-- 📝 Exemplos Práticos de Declaração
-- -----------------------------------------------------------------------------

-- Exemplo 1: Inteiro (Idade)
DECLARE @idade AS INT;
SET @idade = 30;
SELECT @idade AS 'Idade';

-- Exemplo 2: Decimal (Preço - usando DECIMAL(precisão, escala))
-- DECIMAL(5, 2) significa 5 dígitos totais, sendo 2 após a vírgula.
-- PS: Nome das variáveis usando cammelCase.
DECLARE @precoProduto AS DECIMAL(5, 2);
SET @precoProduto = 10.89;
SELECT @precoProduto AS 'Preco Decimal';

-- Exemplo 3: Texto (Nome)
DECLARE @nome AS VARCHAR(50);
SET @nome = 'Mateus';
SELECT @nome AS 'Nome do Usuario';

-- Exemplo 4: Data (Extraindo informações)
DECLARE @data AS DATETIME;
SET @data = '2021-10-28';
SELECT @data AS 'Data';

-- Usando uma função para extrair apenas o dia da variável de data:
SELECT DAY(@data) AS 'Dia Extraido';

/* =============================================================================
 💡 Resumo da Aula:
 1. Sempre utilize o símbolo '@' antes do nome da variável.
 2. O comando 'DECLARE' reserva o espaço na memória.
 3. O comando 'SET' insere o valor dentro desse espaço.
 4. Variáveis são essenciais para criar procedimentos armazenados (Stored 
    Procedures) e scripts complexos onde os valores mudam frequentemente.
================================================================================
*/