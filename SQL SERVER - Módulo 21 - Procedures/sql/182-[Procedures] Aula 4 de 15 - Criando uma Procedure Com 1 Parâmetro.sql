-- ============================================================
-- 🗄️  SQL Server  |  📦 Módulo 21 — Procedures
-- 📖 Aula 4 de 15  |  Criando uma Procedure Com 1 Parâmetro
-- ============================================================

/*
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📚 CONCEITO — Parâmetros de entrada
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  Um parâmetro funciona como uma variável que recebe valor de fora
  da procedure, na hora da chamada (EXEC). Dentro do corpo, o
  parâmetro é usado normalmente, como qualquer outra variável
  declarada com DECLARE.
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
*/

USE BD_Procedures

-- ────────────────────────────────────────────────────────────
-- 🏋️ Exemplo prático
-- ────────────────────────────────────────────────────────────

CREATE PROCEDURE sp_ContratosPorCliente
   @ID_Cliente INT
AS
BEGIN
   SELECT
      c.ID_Contrato,
      cli.Nome AS Cliente,
      c.ValorContrato,
      c.DataContrato,
      c.Status
   FROM fContratos c
   JOIN dCliente cli ON cli.ID_Cliente = c.ID_Cliente
   WHERE c.ID_Cliente = @ID_Cliente
END

-- 1️⃣  Passando o valor de forma posicional
EXEC sp_ContratosPorCliente 1

-- 2️⃣  Passando o valor de forma nomeada (mais legível)
EXEC sp_ContratosPorCliente @ID_Cliente = 2
