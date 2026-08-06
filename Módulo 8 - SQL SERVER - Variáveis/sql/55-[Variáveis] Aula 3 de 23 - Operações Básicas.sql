/*
================================================================================
 📊 [SQL Server] Operações Básicas
 📚 Aula 3 de 23: Manipulação de Dados
================================================================================
*/

-- 1️⃣ SELECT SIMPLES (Exibindo dados)
-- O 'AS' cria um apelido (alias) para a coluna, deixando o resultado mais legível.
SELECT 10 AS 'Número';
SELECT 'Marcus' AS 'Nome';
SELECT '2021-06-21' AS 'Data'; -- Note: SQL Server prefere o formato 'AAAA-MM-DD'


-- 2️⃣ OPERAÇÕES ARITMÉTICAS
-- O SQL funciona como uma calculadora básica.
SELECT 10 + 20 AS 'Soma';
SELECT 20 - 5  AS 'Subtração';
SELECT 31 * 40 AS 'Multiplicação';
SELECT 431.0 / 23 AS 'Divisão'; -- Usando o ".0" garante uma precisão decimal

-- 3️⃣ OPERAÇÕES COM TEXTOS (Concatenação)
-- No SQL Server, usamos o sinal de '+' para juntar (concatenar) textos.
SELECT 'SQL' + ' ' + 'Impressionador' AS 'Mensagem';

-- 4️⃣ OPERAÇÕES COM DATAS
-- Dica: O SQL Server não permite somar '+ 1' diretamente em uma string de data.
-- Para somar dias, usamos a função DATEADD(intervalo, quantidade, data).

-- ERRADO: SELECT '21/03/2021' + 1; (Isso geraria um erro de conversão)

-- CORRETO:
SELECT DATEADD(day, 1, '2021-03-21') AS 'DataSomada';

/* ================================================================================
 💡 Resumo da Aula:
 1. O 'AS' renomeia colunas temporariamente na visualização.
 2. O sinal '+' é usado tanto para somar números quanto para juntar textos.
 3. Para manipular datas, evite aritmética simples; prefira funções próprias 
    do SQL como DATEADD para evitar erros.
================================================================================
*/