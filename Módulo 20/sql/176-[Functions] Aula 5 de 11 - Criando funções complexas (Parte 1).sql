-- ============================================================
-- 🗄️  SQL Server  |  📦 Módulo 20 — Functions
-- 📖 Aula 5 de 11  |  Criando funções complexas (Parte 1)
-- ============================================================

/*
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📚 CONCEITO — Múltiplos parâmetros e múltiplas variáveis locais
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  Uma function pode receber vários parâmetros e usar quantas
  variáveis locais (DECLARE) forem necessárias para organizar o
  cálculo em etapas, antes do RETURN final.

  Regra de negócio desta function (fn_CalcularBonus):
  • Funcionários com mais de 5 anos de casa ganham bônus de 10%
    do salário
  • Funcionários com 5 anos ou menos ganham bônus de 5%
  • Em qualquer caso, o bônus mínimo é de R$ 100,00
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
*/

USE BD_Functions

-- ────────────────────────────────────────────────────────────
-- 🏋️ Exemplo prático
-- ────────────────────────────────────────────────────────────

CREATE FUNCTION dbo.fn_CalcularBonus(@Salario DECIMAL(10,2), @AnosDeCasa INT)
RETURNS DECIMAL(10,2)
AS
BEGIN
   DECLARE @PercentualBonus DECIMAL(5,2)
   DECLARE @ValorBonus DECIMAL(10,2)
   DECLARE @BonusMinimo DECIMAL(10,2) = 100.00

   IF @AnosDeCasa > 5
      SET @PercentualBonus = 0.10
   ELSE
      SET @PercentualBonus = 0.05

   SET @ValorBonus = @Salario * @PercentualBonus

   IF @ValorBonus < @BonusMinimo
      SET @ValorBonus = @BonusMinimo

   RETURN @ValorBonus
END

-- Aplicando a function em cada funcionário
SELECT
   Nome,
   Salario,
   AnosDeCasa,
   dbo.fn_CalcularBonus(Salario, AnosDeCasa) AS Bonus
FROM Funcionario
