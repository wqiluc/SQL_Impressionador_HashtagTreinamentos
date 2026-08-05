/*
================================================================================
 🔄 [SQL Server] Manipulando Strings
 📚 Aula 05 e 06 de 23: Substituição de Textos com REPLACE
================================================================================

 A função: "REPLACE" é uma das ferramentas mais versáteis para limpeza e 
 padronização de dados, permitindo substituir partes de uma string por 
 um novo valor definido.

--------------------------------------------------------------------------------
 1️⃣ O que é o REPLACE?
--------------------------------------------------------------------------------
 Descrição: Procura por uma substring específica dentro de uma string 
 original e a substitui por outra.
 
 Sintaxe: REPLACE(string_original, 'texto_antigo', 'texto_novo')

 2️⃣ REPLACE Aninhado 🪡
--------------------------------------------------------------------------------
 Quando precisamos realizar múltiplas substituições em sequência, podemos 
 "aninhar" (colocar um dentro do outro) as funções REPLACE.

 ⚠️ Atenção: A ordem importa! Sempre verifique se o valor novo de uma 
    substituição não contém o valor antigo da próxima substituição.

--------------------------------------------------------------------------------
 💻 Exemplo Prático (DimCustomer)
--------------------------------------------------------------------------------
 Transformando códigos abreviados ('M', 'F') em valores legíveis.
*/

SELECT DISTINCT
    CONCAT(FirstName, ' ', LastName) AS 'Nome Completo',
    Gender AS 'Sexo (Abrev)',
    REPLACE(REPLACE(Gender, 'M', 'Masculino'), 'F', 'Feminino') AS "Gênero (Extenso)"
FROM
    DimCustomer;

-- Substitui 'M' por 'Masculino' e, em seguida, o resultado por 'Feminino'

/*
================================================================================
 💡 Dica de Ouro:
    Embora o REPLACE aninhado funcione, quando você tiver muitas opções 
    (ex: M, F, N, O, etc.), a instrução CASE WHEN é a prática recomendada, 
    pois é muito mais legível e fácil de manter em projetos grandes.

    Exemplo rápido:
    CASE 
        WHEN 
            Gender = 'M' 
            THEN 'Masculino';
        WHEN 
            Gender = 'F' 
            THEN 'Feminino';
        ELSE 
            'Não Informado'
    END AS 
        'Sexo Formatado'
================================================================================
*/