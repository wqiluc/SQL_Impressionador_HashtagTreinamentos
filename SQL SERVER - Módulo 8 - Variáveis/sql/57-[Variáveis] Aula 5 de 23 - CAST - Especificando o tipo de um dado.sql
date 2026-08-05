/*
================================================================================
 🪄 [SQL Server] A Função CAST
 📚 Aula 5 de 23: Especificando o tipo de dado
================================================================================

 O CAST é usado para converter uma expressão de um tipo de dado para outro.
 Sintaxe: CAST(expressão AS tipo_de_dado)

 Tipos comuns: INT (Inteiro), FLOAT (Decimal), VARCHAR (Texto), DATETIME (Data)
*/

-- 1️⃣ CONVERSÕES BÁSICAS
-- Transformando Decimal em Inteiro (Note que ele trunca, não arredonda)
SELECT CAST(21.45 AS INT) AS 'Decimal_Para_Int';

-- Transformando Inteiro em Decimal (Adiciona precisão)
SELECT CAST(21 AS FLOAT) AS 'Int_Para_Float';

-- Transformando Número em Texto (Necessário para juntar com outros textos)
SELECT CAST(18.7 AS VARCHAR(10)) AS 'Numero_Para_Varchar';

-- Transformando String em Número
SELECT CAST('15.6' AS FLOAT) AS 'String_Para_Float';

-- Transformando String em Data (Dica: Use sempre o formato YYYYMMDD para evitar erros!)
SELECT CAST('20140531' AS DATETIME) AS 'String_Para_Data';


-- 2️⃣ EXEMPLOS PRÁTICOS

-- Exemplo 1: Juntando texto com número
-- Precisamos usar o CAST porque o SQL não consegue somar (concatenar) texto com decimal diretamente.
SELECT 'O preço do produto é: ' + CAST(30.99 AS VARCHAR(30)) AS 'Mensagem';


-- Exemplo 2: Manipulando Datas
-- Embora o SQL entenda o + 1 para datas, o uso de DATEADD é a melhor prática 
-- (mais legível e profissional) para somar dias.
SELECT DATEADD(DAY, 1, '2021-06-20') AS 'Data_Amanhã';


/* ================================================================================
 💡 Resumo:
 1. Use CAST quando precisar tratar um número como texto (para exibição).
 2. Use CAST quando precisar tratar um texto como número (para cálculos).
 3. Sempre prefira formatos de data universais (YYYYMMDD) para evitar erros
    de interpretação de dia/mês.
================================================================================
*/