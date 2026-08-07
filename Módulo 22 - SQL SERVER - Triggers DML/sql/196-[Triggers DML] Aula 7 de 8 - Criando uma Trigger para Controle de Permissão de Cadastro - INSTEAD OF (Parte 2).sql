-- ============================================================
-- 🗄️  SQL Server  |  📦 Módulo 22 — Triggers DML
-- 📖 Aula 7 de 8  |  Criando uma Trigger para Controle de Permissão de Cadastro - INSTEAD OF (Parte 2)
-- ============================================================

/*
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📚 CONCEITO — Completando a trigger: inserir de verdade (ou bloquear)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  Agora a trigger passa a:
  1. Se o código for válido -> fazer o INSERT de verdade na
     tabela Funcionario, mas sem persistir o CodigoAutorizacao
  2. Se o código for inválido -> bloquear com RAISERROR, sem
     inserir nada

  Como é uma trigger INSTEAD OF, o INSERT original do usuário
  NUNCA acontece sozinho - é a trigger que decide (e executa) o
  que realmente vai para a tabela.
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
*/

USE BD_Triggers;

-- ────────────────────────────────────────────────────────────
-- 🏋️ Exemplo prático
-- ────────────────────────────────────────────────────────────

DROP TRIGGER trg_Funcionario_ValidarAutorizacao;

CREATE OR ALTER TRIGGER trg_Funcionario_ValidarAutorizacao
ON Funcionario
INSTEAD OF INSERT
AS
BEGIN
   -- 1️⃣  Bloqueia quem não informou um código válido
   IF EXISTS 
   (
      SELECT 1
      FROM inserted i
      WHERE NOT EXISTS 
      (
         SELECT 1 FROM CodigosAutorizacaoRH c WHERE c.Codigo = i.CodigoAutorizacao
      )
   )
   BEGIN
      RAISERROR('Código de autorização inválido ❌ - cadastro bloqueado', 16, 1)
      RETURN
   END

   -- 2️⃣  Código válido: insere de verdade, sem persistir o código
   INSERT INTO Funcionario(Nome, Salario, CodigoAutorizacao)
   SELECT Nome, Salario, NULL
   FROM inserted
END

-- 1️⃣  Código válido -> cadastro é realizado
INSERT INTO Funcionario(Nome, Salario, CodigoAutorizacao)
VALUES ('Rafael Souza', 4500.00, 'RH2026')

SELECT * FROM Funcionario

-- 2️⃣  Código inválido -> cadastro é bloqueado
INSERT INTO Funcionario(Nome, Salario, CodigoAutorizacao)
VALUES ('Cliente Suspeito', 9000.00, 'XXXXXX')
-- Msg: Código de autorização inválido - cadastro bloqueado

SELECT * FROM Funcionario -- só o cadastro válido aparece