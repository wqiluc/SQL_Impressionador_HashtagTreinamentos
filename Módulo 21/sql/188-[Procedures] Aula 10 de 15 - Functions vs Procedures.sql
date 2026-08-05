-- ============================================================
-- 🗄️  SQL Server  |  📦 Módulo 21 — Procedures
-- 📖 Aula 10 de 15  |  Functions vs Procedures
-- ============================================================

/*
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📚 CONCEITO — Comparando Function e Procedure
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  | Característica                          | FUNCTION            | PROCEDURE            |
  |-------------------------------------------|----------------------|------------------------|
  | Precisa devolver um valor com RETURN       | Sim, obrigatório     | Não (RETURN é opcional, sem valor de retorno de dado) |
  | Pode executar INSERT/UPDATE/DELETE         | Não                  | Sim                    |
  | Pode ser usada dentro de um SELECT/WHERE   | Sim                  | Não                    |
  | Pode controlar transações (BEGIN TRAN...)  | Não                  | Sim                    |
  | Pode devolver múltiplos result sets        | Não                  | Sim                    |
  | Pode ter parâmetros de SAÍDA (OUTPUT)      | Não                  | Sim                    |
  | Chamada                                    | dbo.nome(args)       | EXEC nome args         |

  Resumindo: use FUNCTION quando o objetivo é CALCULAR e devolver
  um valor (ou uma tabela) para ser usado dentro de outra
  consulta. Use PROCEDURE quando o objetivo é EXECUTAR uma rotina
  - especialmente se ela precisa alterar dados ou controlar uma
  transação.
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
*/

USE BD_Procedures

-- ────────────────────────────────────────────────────────────
-- 🏋️ Exemplo prático
-- ────────────────────────────────────────────────────────────

-- Procedure com parâmetro de SAÍDA (OUTPUT) - algo que uma
-- function NUNCA consegue fazer
CREATE PROCEDURE sp_ContarContratosDoCliente
   @ID_Cliente INT,
   @Total      INT OUTPUT
AS
BEGIN
   SELECT @Total = COUNT(*)
   FROM fContratos
   WHERE ID_Cliente = @ID_Cliente
END

DECLARE @QuantidadeContratos INT

EXEC sp_ContarContratosDoCliente
   @ID_Cliente = 1,
   @Total = @QuantidadeContratos OUTPUT

SELECT @QuantidadeContratos AS TotalDeContratosDoCliente
