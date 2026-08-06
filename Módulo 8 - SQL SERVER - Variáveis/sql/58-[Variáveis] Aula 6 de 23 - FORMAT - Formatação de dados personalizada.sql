/*
================================================================================
 🎨 [SQL Server] Função FORMAT e SQL_VARIANT_PROPERTY
 📚 Aula 6 de 23: Formatação e Metadados
================================================================================

 O FORMAT permite formatar valores de saída (numéricos, datas, etc.) em strings
 legíveis. O SQL_VARIANT_PROPERTY retorna informações sobre o tipo de base 
 de um valor específico.
*/

-- 1️⃣ FORMATAÇÃO NUMÉRICA ------------------------------------------------------
-- 'N' = Formato numérico (padrão com separador de milhar);
-- 'C' = Formato de moeda (Currency); e
-- 'G' = Formato geral (General)

SELECT FORMAT(1000, 'N') AS 'Numerico_Padrao';
SELECT FORMAT(1000, 'C') AS 'Como_Moeda';
SELECT FORMAT(1000, 'G') AS 'Geral';


-- 2️⃣ FORMATAÇÃO PERSONALIZADA (Máscaras) --------------------------------------
-- Útil para criar máscaras de documentos (CPF, Telefone, CEP)
-- O símbolo '#' atua como um placeholder para cada dígito.

SELECT FORMAT(123456789, '###-##-####') AS 'Mascara_Personalizada';


-- 3️⃣ FORMATAÇÃO DE DATA -------------------------------------------------------
-- Transforma datas em strings com o formato desejado.

SELECT FORMAT(CAST('2021-03-21' AS DATETIME), 'dd/MMMM/yyyy') AS 'Data_Formatada';
SELECT FORMAT(CAST('2021-03-21' AS DATETIME), 'dddd')



-- 4️⃣ SQL_VARIANT_PROPERTY -----------------------------------------------------
-- Analisa o tipo de dado subjacente de um valor.

-- Exemplo A: Retorna 'varchar' pois o valor está entre aspas
SELECT SQL_VARIANT_PROPERTY('31/05/2014', 'BaseType') AS 'Tipo_Dado_String';

-- Exemplo B: Retorna 'datetime' após a conversão (CAST)
SELECT SQL_VARIANT_PROPERTY(CAST('2014-05-31' AS DATETIME), 'BaseType') AS 'Tipo_Dado_Real';


/* ================================================================================
 💡 Resumo da Aula:
 1. FORMAT: Use para exibir dados de forma amigável ao usuário final.
 2. Performance: O FORMAT é ótimo para relatórios, mas evite usar em filtros
    pesados (WHERE) de grandes tabelas, pois pode deixar a consulta lenta.
 3. SQL_VARIANT_PROPERTY: Uma excelente forma de "investigar" o que o SQL 
    está armazenando na memória antes de realizar um tratamento.
================================================================================
*/