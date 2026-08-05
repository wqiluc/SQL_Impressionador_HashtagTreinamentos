-- ============================================================
-- 🗄️  SQL Server  |  📦 Módulo 20 — Functions
-- 📖 Aula 3 de 11  |  Como criar e utilizar uma Function
-- ============================================================

/*
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📚 CONCEITO — Criando a primeira Scalar Function
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  Depois de criada, a function é usada como qualquer outra função
  do SQL Server, prefixada pelo schema (normalmente dbo):

     SELECT dbo.nome_da_function(argumento)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
*/

USE BD_Functions

-- ────────────────────────────────────────────────────────────
-- 🏋️ Exemplo prático
-- ────────────────────────────────────────────────────────────

-- Criando uma function que calcula o salário anual (com 13º)
CREATE FUNCTION dbo.fn_SalarioAnual(@Salario DECIMAL(10,2))
RETURNS DECIMAL(10,2)
AS
BEGIN
   DECLARE @SalarioAnual DECIMAL(10,2)

   SET @SalarioAnual = @Salario * 13

   RETURN @SalarioAnual
END

-- 1️⃣  Usando a function com um valor fixo
SELECT dbo.fn_SalarioAnual(5000.00) AS SalarioAnual

-- 2️⃣  Usando a function em cima de uma coluna, dentro do SELECT
SELECT
   Nome,
   Salario,
   dbo.fn_SalarioAnual(Salario) AS SalarioAnual
FROM Funcionario

-- 3️⃣  Usando a function dentro do WHERE
SELECT *
FROM Funcionario
WHERE dbo.fn_SalarioAnual(Salario) > 50000
