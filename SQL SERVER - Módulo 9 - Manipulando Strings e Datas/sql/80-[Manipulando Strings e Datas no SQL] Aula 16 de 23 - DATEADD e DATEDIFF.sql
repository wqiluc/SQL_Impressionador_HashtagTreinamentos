/*
================================================================================
 📅 [SQL Server] Manipulando Datas
 📚 Aula 16 de 23: Cálculos com DATEADD e DATEDIFF
================================================================================

 Estas duas funções são os pilares para cálculos temporais no SQL. Com elas, 
 você pode "viajar no tempo" adicionando períodos ou medir a distância entre 
 dois eventos.

--------------------------------------------------------------------------------
 1️⃣ DATEADD (Adicionar ou Subtrair)
--------------------------------------------------------------------------------
 Descrição: Adiciona um intervalo (dia, mês, ano, hora) a uma data específica.
 Sintaxe: DATEADD(intervalo, número, data)

 - Para subtrair, basta usar um número negativo (ex: -1).
 - Exemplo: DATEADD(MONTH, 2, GETDATE()) -> Data daqui a 2 meses.

--------------------------------------------------------------------------------
 2️⃣ DATEDIFF (Calcular a Diferença)
--------------------------------------------------------------------------------
 Descrição: Retorna a quantidade de intervalos (dias, meses, anos) que 
 existem entre duas datas.
 Sintaxe: DATEDIFF(intervalo, data_inicial, data_final)

 ⚠️ Regra: O cálculo é (Data Final - Data Inicial). Se a data inicial for 
    maior que a final, o resultado será negativo.

 💻 Exemplo Prático: Cálculos Temporais
--------------------------------------------------------------------------------
*/

-- Declaração Otimizada
DECLARE 
    @Data1 DATETIME = '2020-07-10', 
    @Data2 DATETIME = '2020-03-05', 
    @Data3 DATETIME = '2021-11-14';

-- Testando DATEADD (Subtraindo 1 mês da Data 1)
SELECT DISTINCT
    @Data1 AS 'Data Original',
    DATEADD(MONTH, -1, @Data1) AS 'Menos 1 Mês"';

-- Testando DATEDIFF (Diferença de meses entre Data 2 e Data 3)
SELECT DISTINCT
    @Data2 AS 'Inicio',
    @Data3 AS 'Fim',
    DATEDIFF(MONTH, @Data2, @Data3) AS 'Diferenca Meses',
    DATEDIFF(DAY, @Data2, @Data3) AS 'Diferenca Dias';

/*
================================================================================
 💡 Dica de Ouro:
    O DATEDIFF conta as "fronteiras" atravessadas. Por exemplo:
    DATEDIFF(YEAR, '2025-12-31', '2026-01-01') retornará 1, pois houve a virada 
    de ano, mesmo que tenha passado apenas 1 dia. Tenha isso em mente ao 
    criar regras de negócio precisas!
================================================================================
*/