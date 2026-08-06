/*
================================================================================
 🔗 [SQL Server] Manipulando Strings
 📚 Aula 03 de 23: Concatenando Textos com CONCAT 🔁
================================================================================

 A função CONCAT é utilizada para unir duas ou mais strings em um único 
 resultado. É uma ferramenta essencial para formatar saídas de dados.

--------------------------------------------------------------------------------
 1️⃣ O que é o CONCAT?
--------------------------------------------------------------------------------
 Descrição: Recebe uma lista de argumentos (strings, números, datas) e 
 os converte para o tipo VARCHAR, unindo-os em uma única string.
 
 ⚠️ Diferença crucial: Ao contrário do operador "+", a função CONCAT 
    trata valores NULL como strings vazias ('') automaticamente. Isso 
    evita que o resultado da concatenação seja NULL caso um dos campos esteja vazio.

--------------------------------------------------------------------------------
 2️⃣ Sintaxe Básica
--------------------------------------------------------------------------------
 SELECT CONCAT(string1, string2, ..., stringN);

--------------------------------------------------------------------------------
 💻 Exemplo Prático (DimCustomer)
--------------------------------------------------------------------------------
 Visualizando o nome completo dos clientes.
*/

SELECT DISTINCT
    FirstName AS 'Nome',
    LastName AS 'Sobrenome',
    EmailAddress AS 'E-mail',
    CONCAT(FirstName, ' ', LastName) AS 'Nome Completo'
FROM
    DimCustomer;

/*
================================================================================
 💡 Dica de Ouro:
    Se precisar de um separador (como uma vírgula ou traço) entre muitos campos,
    considere usar a função CONCAT_WS (Concatenate With Separator), que permite
    definir o separador apenas uma vez no início da função!
================================================================================
*/