/*
================================================================================
 🧹 [SQL Server] Limpeza de Dados
 📚 Aula 13 de 23: Removendo espaços com TRIM, LTRIM e RTRIM
================================================================================

 Frequentemente, os dados são importados com espaços invisíveis que atrapalham 
 comparações e joins. Estas três funções são essenciais para "limpar" esses 
 caracteres indesejados.

--------------------------------------------------------------------------------
 1️⃣ LTRIM (Left Trim) <----
--------------------------------------------------------------------------------
 Descrição: Remove espaços em branco do início (lado esquerdo) da string.
 
 2️⃣ RTRIM (Right Trim) ---->
--------------------------------------------------------------------------------
 Descrição: Remove espaços em branco do final (lado direito) da string.
 
 3️⃣ TRIM (Disponível a partir do SQL 2017)
--------------------------------------------------------------------------------
 Descrição: Remove espaços em branco de AMBOS os lados (esquerda e direita)
 simultaneamente. É a forma mais eficiente e moderna.


 💻 Exemplo Prático: Comparando o comportamento
--------------------------------------------------------------------------------
*/

DECLARE 
	@Codigo VARCHAR(50) = '   ABC123   ';

-- Visualizando as strings após a limpeza
SELECT DISTINCT
    '|' + TRIM(@Codigo) + '|'  AS 'Trim Ambos',
    '|' + LTRIM(@Codigo) + '|' AS 'Trim Esquerda',
    '|' + RTRIM(@Codigo) + '|' AS 'Trim Direita';

-- Verificando o tamanho em bytes (o que realmente importa para a memória)
SELECT DISTINCT
    DATALENGTH(TRIM(@varCodigo)) AS 'Tamanho Trim',
    DATALENGTH(LTRIM(@varCodigo)) AS 'Tamanho Ltrim',
    DATALENGTH(RTRIM(@varCodigo)) AS 'Tamanho Rtrim';

/*
================================================================================
 💡 Dica de Ouro:
    Se você estiver usando uma versão do SQL Server anterior a de 2017, a função 
    TRIM não estará disponível❌. Nesses casos, você deve combinar LTRIM e 
    RTRIM em uma única expressão:
    
    RTRIM(LTRIM(@Codigo))
    
    Isso limpará os dois lados do texto corretamente!
================================================================================
*/