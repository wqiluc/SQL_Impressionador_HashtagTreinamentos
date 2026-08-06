-- ============================================================
-- 🗄️  SQL Server  |  📦 Módulo 14 — Loops
-- 📖 Exercícios — Lista de Exercícios (Loops)
-- ============================================================

-- ────────────────────────────────────────────────────────────
-- 🏋️ Exercícios
-- ────────────────────────────────────────────────────────────

-- 1️⃣  Utilize o Loop WHILE para criar um contador que comece em um valor inicial @ValorInicial
--     e termine em um valor final @ValorFinal. Você deverá printar na tela a seguinte frase:
--     "O valor do contador é: " + ___

DECLARE 
    @ValorInicial INT
DECLARE 
    @ValorFinal INT

SET 
    @ValorInicial = 1
SET 
    @ValorFinal = 100

WHILE 
    @ValorInicial <= @ValorFinal
BEGIN
	PRINT 'O valor do contador é: ' + CONVERT(VARCHAR, @ValorInicial)
	SET @ValorInicial+=1
END

-- 2️⃣  Crie uma estrutura de repetição que printe na tela a quantidade de contratações
--     para cada ano, desde 1996 até 2003. A data de contratação está na coluna HireDate
--     da tabela DimEmployee. Utilize o formato:
--     X contratações em 1996
--     Y contratações em 1997
--     ...
--     N contratações em 2003
--     Obs: a coluna HireDate contém a data completa (dd/mm/aaaa) — printar a quantidade por ano.

DECLARE
    @AnoInicial INT
DECLARE 
    @AnoFinal INT

SET @AnoInicial = 1996
SET @AnoFinal = 2003

WHILE 
    @AnoInicial <= @AnoFinal
BEGIN
	DECLARE @QtdFuncionarios INT
	SET @QtdFuncionarios = (SELECT COUNT(*) FROM DimEmployee WHERE YEAR(HireDate) = @AnoInicial)

	PRINT CONVERT(VARCHAR, @QtdFuncionarios) + ' contratações em ' + CONVERT(VARCHAR, @AnoInicial)
	SET @AnoInicial = @AnoInicial + 1
END

-- 3️⃣  Utilize um Loop WHILE para criar uma tabela chamada Calendario, contendo uma coluna
--     que comece com a data 01/01/2021 e vá até 31/12/2021.

DROP TABLE 
    (IF EXISTS)
Calendario

CREATE TABLE Calendario 
(
	Data DATE
)

DECLARE 
    @DataInicio DATE
DECLARE 
    @DataFim DATE
DECLARE 
    @DataAux DATE

SET 
    @DataInicio = '2021-01-01'
SET 
    @DataFim = '2021-12-31'
SET 
    @DataAux = @DataInicio

WHILE 
    @DataAux <= @DataFim
BEGIN
	INSERT INTO Calendario (Data) VALUES (@DataAux)
	SET @DataAux = DATEADD(DAY, 1, @DataAux)
END

SELECT * FROM Calendario;