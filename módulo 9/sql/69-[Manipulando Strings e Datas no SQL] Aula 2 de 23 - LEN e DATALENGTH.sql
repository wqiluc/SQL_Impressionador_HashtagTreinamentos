/*
================================================================================
 🔤 [SQL Server] Manipulando Strings e Datas
 📚 Aula 02 de 23: Entendendo LEN e DATALENGTH
================================================================================

 Ambas as funções medem o tamanho de uma string, porém com comportamentos 
 distintos. É fundamental entender essa diferença para evitar erros de lógica.

--------------------------------------------------------------------------------
 1️⃣ LEN (Length)
--------------------------------------------------------------------------------
 Descrição: Retorna o número de caracteres da expressão de string.
 
 ⚠️ Regra importante: A função LEN ignora espaços em branco que estão 
    ao final da string (trailing spaces).

--------------------------------------------------------------------------------
 2️⃣ DATALENGTH
--------------------------------------------------------------------------------
 Descrição: Retorna o número de bytes usados para representar a expressão.
 
 ⚠️ Regra importante: Considera todos os caracteres, incluindo espaços 
    em branco ao final da string. É ideal para medir o espaço real ocupado 
    em disco ou memória, especialmente com tipos de dados Unicode.

--------------------------------------------------------------------------------
 💻 Exemplo Prático
--------------------------------------------------------------------------------
 A consulta abaixo compara como cada função interpreta a mesma string.
*/

SELECT DISTINCT
    'SQL Hashtag' AS 'Texto Original',
    LEN('SQL Hashtag') AS 'Len (Comprimento)',               
	-- Conta caracteres, ignora espaços finais
    DATALENGTH('SQL Hashtag') AS 'Datalength'; 
	-- Conta bytes, inclui tudo

/*
================================================================================
 💡 Dica de Ouro:
    Se você estiver comparando strings que podem conter espaços indesejados, 
    use TRIM() antes de aplicar o LEN() para garantir que a contagem dos 
    caracteres reais esteja correta!
================================================================================
*/