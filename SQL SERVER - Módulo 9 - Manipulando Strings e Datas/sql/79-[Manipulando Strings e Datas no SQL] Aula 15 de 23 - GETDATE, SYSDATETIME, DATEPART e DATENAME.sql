/*
================================================================================
 🕒 [SQL Server] Manipulando Datas e Horas
 📚 Aula 15 de 23: GETDATE, SYSDATETIME, DATEPART e DATENAME
================================================================================

 Dominar o tempo no SQL envolve saber capturar o momento exato do sistema e 
 extrair componentes específicos para relatórios detalhados.

--------------------------------------------------------------------------------
 1️⃣ Captura de Tempo (Agora)
--------------------------------------------------------------------------------
 - GETDATE(): Retorna a data e hora atual. Precisão de até 3 milissegundos.
 - SYSDATETIME(): Retorna a data e hora atual com muito mais precisão 
   (até 7 casas decimais nos segundos).

--------------------------------------------------------------------------------
 2️⃣ Extração: DATENAME vs DATEPART
--------------------------------------------------------------------------------
 Ambas extraem partes da data (dia, mês, ano, semana, trimestre), mas o 
 tipo de dado retornado é diferente:

 - DATENAME: Retorna uma STRING (NVARCHAR). 
   Útil para exibir nomes (ex: "Janeiro", "Segunda-feira").
 
 - DATEPART: Retorna um NÚMERO INTEIRO (INT). 
   Útil para cálculos, ordenações e filtros matemáticos.

--------------------------------------------------------------------------------
 💻 Exemplo Prático: Captura e Diferenciação
--------------------------------------------------------------------------------
*/

-- Comparando precisão das funções de sistema
SELECT DISTINCT
    GETDATE() AS 'Data por GetDate', 
    SYSDATETIME() AS 'Data por SysDateTime';

-- Comparando DATENAME vs DATEPART (Bloco Otimizado)
DECLARE 
	@Data DATETIME = GETDATE();

SELECT DISTINCT
    DATENAME(MONTH, @Data) AS 'Mes_Texto', -- Ex: "April" ou "Abril"
    DATEPART(MONTH, @Data) AS 'Mes_Numero', -- Ex: 4
    DATENAME(WEEKDAY, @Data) AS 'Dia_Semana', -- Ex: "Wednesday"
    DATEPART(DAYOFYEAR, @Data) AS 'Dia_do_Ano'; -- Ex: 119

--------------------------------------------------------------------------------
-- PROVA TÉCNICA: Verificando o Tipo de Dado
--------------------------------------------------------------------------------
-- Usamos SQL_VARIANT_PROPERTY para provar que um é Texto e o outro é Inteiro

SELECT DISTINCT
    SQL_VARIANT_PROPERTY(DATENAME(DAY, @varData), 'BaseType') AS 'Tipo DATENAME',
    SQL_VARIANT_PROPERTY(DATEPART(DAY, @varData), 'BaseType') AS 'Tipo DATEPART';

/*
================================================================================
 💡 Dica de Ouro:
    Sempre que precisar ordenar um relatório por mês, use o DATEPART. 
    Se você usar o DATENAME ("Janeiro", "Fevereiro"...), o SQL vai ordenar 
    em ordem alfabética ("Abril" viria antes de "Janeiro"), o que estragaria 
    sua análise cronológica!
================================================================================
*/