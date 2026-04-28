/*
================================================================================
 📉 [SQL Server] Funções de Arredondamento
 📚 Aula 7 de 23: ROUND, FLOOR e CEILING
================================================================================

 Estas funções são essenciais para ajustar valores numéricos conforme 
 a necessidade do seu relatório.
*/

-- 1️⃣ REVISÃO: OPERAÇÕES BÁSICAS
-- O SQL Server mantém a precisão decimal ao dividir números.
SELECT 10 + 20 AS 'Soma';
SELECT 20 - 5  AS 'Subtração';
SELECT 31 * 40 AS 'Multiplicação';
SELECT 431.0 / 23 AS 'Divisão_Precisao';

-- 2️⃣ ROUND (Arredondamento Padrão)
-- ROUND(valor, precisão)
-- Se o próximo dígito for 5 ou maior, ele arredonda para cima.
SELECT ROUND(18.739130, 2) AS 'Arredondado de 2 Casas'; -- Resultado: 18.74 (padrão no excel)

-- 3️⃣ ROUND (Truncamento)
-- ROUND(valor, precisão, 1)
-- O terceiro parâmetro (1) força o SQL a "cortar" o número em vez de arredondar.
SELECT ROUND(18.739130, 2, 1) AS 'Truncado_2_Casas'; -- Resultado: 18.73


-- 4️⃣ FLOOR (Piso - Arredonda sempre para baixo) 👇
-- O FLOOR "joga" o número para o inteiro menor mais próximo (o chão).
SELECT FLOOR(18.739130) AS 'Floor_Arredonda_Baixo'; -- Resultado: 18


-- 5️⃣ CEILING (Teto - Arredonda sempre para cima)👆
-- O CEILING "joga" o número para o inteiro maior mais próximo (o teto).
SELECT CEILING(18.739130) AS 'Ceiling_Arredonda_Cima'; -- Resultado: 19


/* ================================================================================
 💡 Resumo Rápido para consulta:
 
 🔹 ROUND(x, n)   -> Arredonda matematicamente (para cima ou para baixo).
 🔹 ROUND(x, n, 1)-> Corta o número (sempre para baixo).
 🔹 FLOOR(x)      -> Vai para o inteiro inferior (sempre para baixo).
 🔹 CEILING(x)    -> Vai para o inteiro superior (sempre para cima).
================================================================================
*/