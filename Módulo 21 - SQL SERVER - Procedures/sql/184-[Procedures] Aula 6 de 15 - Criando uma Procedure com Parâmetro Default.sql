-- ============================================================
-- 🗄️  SQL Server  |  📦 Módulo 21 — Procedures
-- 📖 Aula 6 de 15  |  Criando uma Procedure com Parâmetro Default
-- ============================================================

/*
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📚 CONCEITO — Parâmetros opcionais
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  Assim como em uma coluna, um parâmetro pode ter um valor DEFAULT.
  Se ele for omitido na hora do EXEC, a procedure usa o valor
  padrão automaticamente - o parâmetro se torna opcional.
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
*/

USE BD_Procedures;

-- ────────────────────────────────────────────────────────────
-- 🏋️ Exemplo prático
-- ────────────────────────────────────────────────────────────

CREATE OR ALTER PROCEDURE sp_ContratosPorStatus
   @Status VARCHAR(20) = 'Ativo'
AS
BEGIN
   SELECT DISTINCT
      c.ID_Contrato AS "ID do Contrato",
      cli.Nome AS "Cliente",
      c.ValorContrato AS "Valor do Contrato",
      c.Status AS "Status"
   FROM 
      fContratos c
   JOIN 
      dCliente cli ON cli.ID_Cliente = c.ID_Cliente
   WHERE 
      c.Status = @Status
END

-- 1️⃣  Sem informar o parâmetro -> usa o DEFAULT ('Ativo')
EXEC sp_ContratosPorStatus;

-- 2️⃣  Informando explicitamente um valor diferente do default
EXEC sp_ContratosPorStatus @Status = 'Cancelado';