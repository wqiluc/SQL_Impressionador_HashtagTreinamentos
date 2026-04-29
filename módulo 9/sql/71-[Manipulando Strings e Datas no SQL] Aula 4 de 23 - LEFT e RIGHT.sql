/*
================================================================================
 ✂️ [SQL Server] Manipulando Strings
 📚 Aula 04 de 23: Extração com LEFT e RIGHT
================================================================================

 Estas funções permitem recortar partes de uma string com base na quantidade 
 de caracteres desejada, partindo das extremidades do texto.

--------------------------------------------------------------------------------
 1️⃣ LEFT (Esquerda) <---
--------------------------------------------------------------------------------
 Descrição: Extrai um número especificado de caracteres do início (esquerda) 
 da string.
 Sintaxe: LEFT(coluna_ou_texto, quantidade)

--------------------------------------------------------------------------------
 2️⃣ RIGHT (Direita) --->
--------------------------------------------------------------------------------
 Descrição: Extrai um número especificado de caracteres do final (direita) 
 da string.
 Sintaxe: RIGHT(coluna_ou_texto, quantidade)

--------------------------------------------------------------------------------
 🔍 Representação Visual:
 
 Texto: 'SQL-12345'
 
 LEFT(texto, 3)  <--- [SQL]
 RIGHT(texto, 5) ---> [12345]

--------------------------------------------------------------------------------
 💻 Exemplo Prático (DimProduct)
--------------------------------------------------------------------------------
 Dividindo a coluna StyleName em duas partes para análise de códigos.
*/

SELECT DISTINCT
    ProductName AS 'Produto',
    UnitPrice AS 'Preço',
    LEFT(StyleName, 7) AS 'Cod 1',
    RIGHT(StyleName, 7) AS 'Cod 2'
FROM
    DimProduct;

/*
================================================================================
 💡 Dica de Ouro:
    Se você precisar extrair partes do meio de um texto, estas funções não 
    serão suficientes. Nesse caso, utilizamos a função SUBSTRING, que permite 
    definir a posição inicial de início do recorte!
================================================================================
*/