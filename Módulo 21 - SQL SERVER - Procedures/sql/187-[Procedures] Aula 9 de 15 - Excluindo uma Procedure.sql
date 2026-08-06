-- ============================================================
-- 🗄️  SQL Server  |  📦 Módulo 21 — Procedures
-- 📖 Aula 9 de 15  |  Excluindo uma Procedure
-- ============================================================

/*
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📚 CONCEITO — DROP PROCEDURE
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  DROP PROCEDURE remove definitivamente a procedure do banco.
  Se ela não existir, o comando gera erro - por isso é comum
  verificar a existência antes (ou usar a sintaxe "IF EXISTS",
  disponível a partir do SQL Server 2016).
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
*/

USE BD_Procedures;

-- ────────────────────────────────────────────────────────────
-- 🏋️ Exemplo prático
-- ────────────────────────────────────────────────────────────

-- 1️⃣  Excluindo diretamente (falha se a procedure não existir)
DROP PROCEDURE sp_ContratosPorStatus;

-- 2️⃣  Verificando a existência manualmente antes de excluir
IF OBJECT_ID('sp_ContratosPorPeriodo', 'P') IS NOT NULL
   DROP PROCEDURE sp_ContratosPorPeriodo

-- 3️⃣  Forma mais moderna e direta (SQL Server 2016+)
DROP PROCEDURE IF EXISTS sp_ContratosPorCliente;

-- Conferindo o que restou
SELECT name FROM sys.procedures;
