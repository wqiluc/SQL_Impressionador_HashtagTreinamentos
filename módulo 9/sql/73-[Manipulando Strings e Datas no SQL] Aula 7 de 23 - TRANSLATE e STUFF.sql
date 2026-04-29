/*
================================================================================
 🔧 [SQL Server] Manipulando Strings Avançadas
 📚 Aula 07 de 23: Entendendo TRANSLATE e STUFF
================================================================================

O SQL Server oferece ferramentas poderosas para manipulação de caracteres que
vão muito além do simples REPLACE.

--------------------------------------------------------------------------------
 1️⃣ TRANSLATE (Substituição de Caracteres) 
--------------------------------------------------------------------------------
 Descrição: Substitui um conjunto de caracteres por outro, caractere por caractere.
 - É um mapeamento: o 1º caractere da lista 'de' é trocado pelo 1º de 'para', 
   o 2º pelo 2º, e assim por diante.
 
 - Diferença para o REPLACE: O REPLACE troca a string completa; o TRANSLATE 
   troca caracteres individuais mapeados.

--------------------------------------------------------------------------------
 2️⃣ STUFF (Excluir e Inserir)
--------------------------------------------------------------------------------
 Descrição: Deleta uma quantidade específica de caracteres e insere uma nova
 string na posição especificada.

 Sintaxe: STUFF(string, posição_inicial, tamanho_deleção, 'nova_string')
 - É perfeito para quando você precisa trocar apenas um pedaço do texto 
   baseado em uma posição fixa.

--------------------------------------------------------------------------------
 💻 Exemplos Práticos
--------------------------------------------------------------------------------
*/

-- TRANSLATE: Substituindo símbolos de estruturação (mapeamento 1:1)
-- Troca '[' por '(' e ']' por ')'
SELECT DISTINCT
    TRANSLATE('3*[2+1]/{8-4}', '[]{}', '()()') AS 'Translate do Exemplo 1';

-- TRANSLATE: Substituindo letras
-- A vira W, B vira X, C vira Y, D vira Z
SELECT DISTINCT
    TRANSLATE('ABCD-490123', 'ABCD', 'WXYZ') AS 'Translate do Exemplo 2';

-- STUFF: Substituindo uma parte do texto ('VBA' por 'Excel')
-- Começa na posição 1, deleta 3 caracteres ('VBA'), insere 'Excel'
SELECT DISTINCT
    STUFF('VBA Impressionador', 1, 3, 'Excel') AS 'Stuff Exemplo';

/*
================================================================================
 💡 Dica de Ouro:
    Use o STUFF quando precisar criar 'máscaras' de dados, como ocultar
    parte de um CPF (ex: 123.***.***-89) ou números de cartão de crédito.
    
    Já o TRANSLATE é imbatível para limpar dados sujos, removendo múltiplos
    caracteres indesejados (como acentos ou pontuação estranha) de uma só 
    vez, sem precisar de múltiplos REPLACE aninhados!
================================================================================
*/