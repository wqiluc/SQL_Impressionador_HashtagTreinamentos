-- ============================================================
-- 🗄️  SQL Server  |  📦 Módulo 21 — Procedures
-- 📖 Aula 5 de 15  |  Criando uma Procedure com mais de 1 parâmetro
-- ============================================================

/*
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📚 CONCEITO — Vários parâmetros, separados por vírgula
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  Cada parâmetro extra é declarado com vírgula, na mesma cláusula.
  Ao chamar de forma NOMEADA, a ordem deixa de importar.
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
*/

USE BD_Procedures

-- ────────────────────────────────────────────────────────────
-- 🏋️ Exemplo prático
-- ────────────────────────────────────────────────────────────

CREATE PROCEDURE sp_ContratosPorPeriodo
   @DataInicio DATE,
   @DataFim    DATE
AS
BEGIN
   SELECT
      c.ID_Contrato,
      cli.Nome AS Cliente,
      c.ValorContrato,
      c.DataContrato
   FROM fContratos c
   JOIN dCliente cli ON cli.ID_Cliente = c.ID_Cliente
   WHERE c.DataContrato BETWEEN @DataInicio AND @DataFim
END

-- 1️⃣  Passando os valores de forma posicional (respeita a ordem declarada)
EXEC sp_ContratosPorPeriodo '2026-01-01', '2026-12-31'

-- 2️⃣  Passando os valores de forma nomeada (ordem não importa mais)
EXEC sp_ContratosPorPeriodo @DataFim = '2026-12-31', @DataInicio = '2026-01-01'
