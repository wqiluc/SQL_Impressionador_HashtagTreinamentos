-- ============================================================
-- 🗄️  SQL Server  |  📦 Módulo 21 — Procedures
-- 📖 Aula 3 de 15  |  Criando uma Procedure Sem Parâmetros
-- ============================================================

/*
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📚 CONCEITO — Procedure mais simples possível
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  Uma procedure não precisa de parâmetro nenhum - útil para
  encapsular uma consulta fixa que é rodada com frequência, sempre
  da mesma forma.
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
*/

USE BD_Procedures

-- ────────────────────────────────────────────────────────────
-- 🏋️ Exemplo prático
-- ────────────────────────────────────────────────────────────

CREATE PROCEDURE sp_ListarContratosAtivos
AS
BEGIN
   SELECT
      c.ID_Contrato,
      cli.Nome AS Cliente,
      ger.Nome AS Gerente,
      c.ValorContrato,
      c.DataContrato
   FROM fContratos c
   JOIN dCliente cli ON cli.ID_Cliente = c.ID_Cliente
   JOIN dGerente ger ON ger.ID_Gerente = c.ID_Gerente
   WHERE c.Status = 'Ativo'
END

-- Executando a procedure
EXEC sp_ListarContratosAtivos

-- Forma alternativa de executar
EXECUTE sp_ListarContratosAtivos
