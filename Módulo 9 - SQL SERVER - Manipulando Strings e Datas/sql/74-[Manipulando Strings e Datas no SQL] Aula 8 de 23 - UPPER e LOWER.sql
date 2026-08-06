/*
================================================================================
 🔠 [SQL Server] Manipulando Strings
 📚 Aula 08 de 23: Padronização com UPPER e LOWER
================================================================================

 Estas são as funções fundamentais para padronização de dados. Muitas vezes, 
 os dados chegam ao banco de dados com variações de digitação (ex: 'joao', 
 'JOAO', 'Joao') e precisamos uniformizá-los.

--------------------------------------------------------------------------------
 1️⃣ UPPER
--------------------------------------------------------------------------------
 Descrição: Converte todas as letras de uma string para maiúsculas.
 Sintaxe: UPPER(string)

--------------------------------------------------------------------------------
 2️⃣ LOWER
--------------------------------------------------------------------------------
 Descrição: Converte todas as letras de uma string para minúsculas.
 Sintaxe: LOWER(string)

 3️⃣ Por que padronizar?
--------------------------------------------------------------------------------
 A padronização é essencial para:
 - Melhorar a legibilidade de relatórios;
 - Facilitar buscas (WHERE) sem se preocupar com a variação de case; e
 - Limpeza de dados antes de exportar para outras ferramentas.

--------------------------------------------------------------------------------
 💻 Exemplo Prático (DimCustomer)
--------------------------------------------------------------------------------
*/

SELECT DISTINCT
    FirstName AS 'Nome Original',
    UPPER(FirstName) AS 'NOME EM MAIÚSCULO',
    LOWER(FirstName) AS 'nome em minúsculo',
    EmailAddress AS 'E-mail'
FROM
    DimCustomer;

/*
================================================================================
 💡 Dica de Ouro:
    Se o seu banco de dados estiver configurado com uma Collation Case-Sensitive
    (que diferencia maiúsculas de minúsculas), a busca por um nome pode falhar 
    se você digitar 'Joao' e no banco estiver 'JOAO'.
    
    A solução é aplicar a função LOWER (ou UPPER) nos dois lados da comparação:
    
    WHERE LOWER(FirstName) = 'joao';
    
    Isso garante que a comparação seja feita de forma uniforme!
================================================================================
*/