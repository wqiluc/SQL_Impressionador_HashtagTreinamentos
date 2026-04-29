/*
================================================================================
 📅 [SQL Server] Manipulando Datas
 📚 Aula 14 de 23: Decompondo e Criando Datas
================================================================================

 Trabalhar com datas exige precisão. E, o SQL Server oferece funções simples para
 extrair partes específicas de uma data ou reconstruí-las do zero.

--------------------------------------------------------------------------------
 1️⃣ DAY, MONTH e YEAR
--------------------------------------------------------------------------------
 Descrição: Funções de extração que retornam um número inteiro representando 
 a parte solicitada de uma data.
 
 - DAY(@data): Retorna o dia (1 a 31).
 - MONTH(@data): Retorna o mês (1 a 12).
 - YEAR(@data): Retorna o ano (4 dígitos).

--------------------------------------------------------------------------------
 2️⃣ DATEFROMPARTS (O Montador)
--------------------------------------------------------------------------------
 Descrição: Faz o caminho inverso. Ela recebe três inteiros (Ano, Mês, Dia)
 e os une para formar um dado do tipo DATE.

 Sintaxe: DATEFROMPARTS ( ano, mes, dia )
 
 ⚠️ Regra: Se qualquer um dos argumentos for NULL, o resultado será NULL.

--------------------------------------------------------------------------------
 💻 Exemplo Prático: Extração e Reconstrução
--------------------------------------------------------------------------------
*/

-- PARTE 1: Extraindo informações de uma data existente
DECLARE 
	@Data DATETIME = '2020-05-18'; -- Formato ISO (YYYY-MM-DD) é mais seguro

SELECT DISTINCT
    DAY(@Data) AS 'Dia Extraido',
    MONTH(@Data) AS 'Mês Extraido',
    YEAR(@Data) AS 'Ano Extraido';

-- PARTE 2: Criando uma data a partir de partes isoladas (Bloco Otimizado)
DECLARE 
    @Dia INT = 29, 
    @Mes INT = 12, 
    @Ano INT = 2020;

SELECT DISTINCT
    DATEFROMPARTS(@varAno, @varMes, @varDia) AS 'Data Gerada';

/*
================================================================================
 💡 Dica de Ouro:
    O: "DATEFROMPARTS" é excelente para quando você tem colunas separadas de 
    dia, mês e ano em uma planilha Excel importada e precisa transformá-las 
    em uma data real para fazer cálculos de tempo ou filtros!✅
================================================================================
*/