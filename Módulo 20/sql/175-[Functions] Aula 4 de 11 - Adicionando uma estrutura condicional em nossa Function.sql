-- ============================================================
-- 🗄️  SQL Server  |  📦 Módulo 20 — Functions
-- 📖 Aula 4 de 11  |  Adicionando uma estrutura condicional em nossa Function
-- ============================================================

/*
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📚 CONCEITO — IF/ELSE dentro de uma Function
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  O corpo de uma function aceita estruturas de controle como
  IF/ELSE, exatamente como em um bloco de T-SQL comum - a única
  regra é que, em QUALQUER caminho possível, a function precisa
  terminar em um RETURN.
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
*/

USE BD_Functions

-- ────────────────────────────────────────────────────────────
-- 🏋️ Exemplo prático
-- ────────────────────────────────────────────────────────────

CREATE FUNCTION dbo.fn_ClassificarSalario(@Salario DECIMAL(10,2))
RETURNS VARCHAR(20)
AS
BEGIN
   DECLARE @Classificacao VARCHAR(20)

   IF @Salario < 2000
      SET @Classificacao = 'Baixo'
   ELSE IF @Salario BETWEEN 2000 AND 8000
      SET @Classificacao = 'Médio'
   ELSE
      SET @Classificacao = 'Alto'

   RETURN @Classificacao
END

-- Usando a function para classificar cada funcionário
SELECT
   Nome,
   Salario,
   dbo.fn_ClassificarSalario(Salario) AS Classificacao
FROM Funcionario

-- Usando a function para filtrar
SELECT *
FROM Funcionario
WHERE dbo.fn_ClassificarSalario(Salario) = 'Alto'
