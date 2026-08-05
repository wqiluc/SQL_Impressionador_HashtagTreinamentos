-- ============================================================
-- 🗄️  SQL Server  |  📦 Módulo 17 — Constraints
-- 📖 Aula 4 de 14  |  Criando Constraints para a Tabela dCliente
-- ============================================================

/*
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📚 CONCEITO — Regras de negócio da tabela dCliente
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  • ID_Cliente  -> identifica cada cliente de forma única e gerada
                   automaticamente pelo banco       -> IDENTITY + PRIMARY KEY
  • Nome        -> sempre obrigatório                -> NOT NULL
  • CPF         -> obrigatório e nunca pode repetir   -> NOT NULL + UNIQUE
  • Email       -> opcional, mas se existir não pode
                   repetir entre clientes             -> UNIQUE
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
*/

USE BD_Constraints

-- ────────────────────────────────────────────────────────────
-- 🏋️ Exemplo prático
-- ────────────────────────────────────────────────────────────

DROP TABLE dCliente

CREATE TABLE dCliente(
   ID_Cliente INT IDENTITY(1,1) CONSTRAINT PK_dCliente PRIMARY KEY,
   Nome       VARCHAR(100) NOT NULL,
   CPF        CHAR(11) NOT NULL CONSTRAINT UQ_dCliente_CPF UNIQUE,
   Email      VARCHAR(100) CONSTRAINT UQ_dCliente_Email UNIQUE
)

-- Conferindo as constraints criadas na tabela
sp_helpconstraint 'dCliente'

-- Inserindo alguns clientes válidos (ID_Cliente é gerado sozinho)
INSERT INTO dCliente(Nome, CPF, Email)
VALUES
   ('Marcus Andrade', '11122233344', 'marcus@email.com'),
   ('Bianca Ferreira', '22233344455', 'bianca@email.com'),
   ('Rafael Souza', '33344455566', NULL)

SELECT * FROM dCliente
