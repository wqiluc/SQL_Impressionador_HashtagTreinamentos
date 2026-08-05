-- ============================================================
-- 🗄️  SQL Server  |  📦 Módulo 20 — Functions
-- 📖 Aula 6 de 11  |  Criando funções complexas (Parte 2)
-- ============================================================

/*
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📚 CONCEITO — Table-Valued Function (TVF)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  Além de devolver um único valor, uma function pode devolver uma
  TABELA inteira - a chamada TABLE-VALUED FUNCTION. Ela é usada no
  FROM de uma consulta, como se fosse uma tabela.

  Sintaxe (versão "inline", mais simples - baseada em um único
  SELECT):

     CREATE FUNCTION nome (@parametro tipo)
     RETURNS TABLE
     AS
     RETURN
     (
        SELECT ...
     )
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
*/

USE BD_Functions

-- ────────────────────────────────────────────────────────────
-- 🏋️ Exemplo prático
-- ────────────────────────────────────────────────────────────

-- Function de tabela: devolve os funcionários com bônus (usando a
-- fn_CalcularBonus criada na aula anterior) acima de um valor mínimo
CREATE FUNCTION dbo.fn_FuncionariosComBonusAcimaDe(@ValorMinimo DECIMAL(10,2))
RETURNS TABLE
AS
RETURN
(
   SELECT
      Nome,
      Salario,
      AnosDeCasa,
      dbo.fn_CalcularBonus(Salario, AnosDeCasa) AS Bonus
   FROM Funcionario
   WHERE dbo.fn_CalcularBonus(Salario, AnosDeCasa) >= @ValorMinimo
)

-- 1️⃣  Usando a table-valued function no FROM, como se fosse uma tabela
SELECT *
FROM dbo.fn_FuncionariosComBonusAcimaDe(500.00)

-- 2️⃣  Combinando com outras cláusulas, como qualquer outra tabela
SELECT Nome, Bonus
FROM dbo.fn_FuncionariosComBonusAcimaDe(200.00)
ORDER BY Bonus DESC
