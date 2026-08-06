-- ============================================================
-- 🗄️  SQL Server  |  📦 Módulo 20 — Functions
-- 📝 Exercícios
-- ============================================================

/*
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📚 ENUNCIADO
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Todas as functions dos exercícios a seguir devem ser criadas para
manipulação de dados do banco de dados ContosoRetailDW.

1. Criar uma Function que calcule o tempo (em anos) entre duas
   datas. Essa function deve receber dois argumentos: data_inicial
   e data_final. Caso a data_final não seja informada, a function
   deve automaticamente considerar a data atual do sistema. Essa
   function será usada para calcular o tempo de casa de cada
   funcionário.
   Obs: a função DATEDIFF não é suficiente para resolver este
   problema.

2. Criar uma function que calcula a bonificação de cada
   funcionário (5% a mais em relação ao BaseRate). Porém, tome
   cuidado! Nem todos os funcionários deverão receber bônus...

3. Criar uma Function que retorna uma tabela. Esta function deve
   receber como parâmetro o gênero do cliente e retornar todos os
   clientes que são do gênero informado na function.
   Observe que esta function será utilizada particularmente com a
   tabela DimCustomer.

4. Criar uma Function que retorna uma tabela resumo com o total de
   produtos por cores. Sua function deve receber 1 argumento, onde
   será possível especificar de qual marca você deseja o resumo.
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
*/

USE ContosoRetailDW;

-- ==============================================================================
-- 🏋️ Exercício 1: Tempo (em anos) entre duas datas
-- ==============================================================================

-- O DATEDIFF(YEAR, ...) sozinho não serve: ele conta apenas quantas
-- viradas de ano-calendário existem entre as duas datas, não o tempo
-- cheio decorrido (ex.: de 31/12/2020 a 01/01/2021 ele "acha" que já
-- se passou 1 ano). Por isso é preciso corrigir o resultado
-- verificando se o "aniversário" da data_inicial já ocorreu ou não
-- dentro do ano da data_final.

CREATE FUNCTION dbo.fn_TempoDeCasaAnos(@data_inicial DATE, @data_final DATE = NULL)
RETURNS INT
AS
BEGIN
   IF
      @data_final IS NULL
      SET
         @data_final = GETDATE()

   DECLARE @Anos INT = DATEDIFF(YEAR, @data_inicial, @data_final)

   IF
      (MONTH(@data_final) < MONTH(@data_inicial))
      OR (MONTH(@data_final) = MONTH(@data_inicial) AND DAY(@data_final) < DAY(@data_inicial))
      SET
         @Anos = @Anos - 1

   RETURN @Anos
END

-- Calculando o tempo de casa de cada funcionário
-- (EndDate é NULL para quem ainda está ativo -> a function assume a
-- data atual automaticamente nesses casos)
SELECT DISTINCT
   FirstName AS "Primeiro Nome",
   LastName AS "Sobrenome",
   HireDate AS "Data de Admissão",
   EndDate AS "Data de Demissão",
   dbo.fn_TempoDeCasaAnos(HireDate, EndDate) AS "Tempo de Casa (Anos)"
FROM DimEmployee
ORDER BY 
   dbo.fn_TempoDeCasaAnos(HireDate, EndDate) DESC;

-- ==============================================================================
-- 🏋️ Exercício 2: Bonificação de 5% sobre o BaseRate
-- ==============================================================================

-- Cuidado: apenas funcionários ainda ativos (sem data de
-- desligamento, ou seja, EndDate IS NULL) devem receber bônus
CREATE FUNCTION dbo.fn_CalcularBonificacao(@BaseRate DECIMAL(10,2), @EndDate DATE)
RETURNS DECIMAL(10,2)
AS
BEGIN
   DECLARE @Bonificacao DECIMAL(10,2)

   IF
      @EndDate IS NULL
      SET
         @Bonificacao = @BaseRate * 1.05
   ELSE
      SET
         @Bonificacao = @BaseRate

   RETURN @Bonificacao
END

-- Aplicando a function em cada funcionário
SELECT DISTINCT
   FirstName AS "Primeiro Nome",
   LastName AS "Sobrenome",
   BaseRate AS "Salário Base",
   EndDate AS "Data de Demissão",
   dbo.fn_CalcularBonificacao(BaseRate, EndDate) AS "Bonificação"
FROM DimEmployee
ORDER BY 
    dbo.fn_CalcularBonificacao(BaseRate, EndDate) DESC;

-- ==============================================================================
-- 🏋️ Exercício 3: Clientes por gênero (table-valued function)
-- ==============================================================================

CREATE FUNCTION dbo.fn_ClientesPorGenero(@Genero CHAR(1))
RETURNS TABLE
AS
RETURN
(
   SELECT DISTINCT
      CustomerKey AS "Id do Cliente",
      FirstName AS "Primeiro Nome",
      LastName AS "Sobrenome",
      Gender AS "Gênero",
      EmailAddress AS "Endereço de Email"
   FROM 
        DimCustomer
   WHERE 
        Gender = @Genero
)

-- Usando a table-valued function no FROM, como se fosse uma tabela
SELECT * FROM dbo.fn_ClientesPorGenero('F');
SELECT * FROM dbo.fn_ClientesPorGenero('M');

-- ==============================================================================
-- 🏋️ Exercício 4: Resumo de produtos por cor, filtrando por marca
-- ==============================================================================

CREATE FUNCTION dbo.fn_ResumoProdutosPorCor(@Marca VARCHAR(50))
RETURNS TABLE
AS
RETURN
(
   SELECT
      ColorName,
      COUNT(*) AS TotalProdutos
   FROM DimProduct
   WHERE BrandName = @Marca
   GROUP BY ColorName
)

-- Consultando o resumo para uma marca específica
SELECT *
FROM dbo.fn_ResumoProdutosPorCor('Contoso')
ORDER BY TotalProdutos DESC;