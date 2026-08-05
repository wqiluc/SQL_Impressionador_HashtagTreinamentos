-- ============================================================
-- 🗄️  SQL Server  |  📦 Módulo 17 — Constraints
-- 📖 Aula 8 de 14  |  Violação de Constraints (Parte 1)
-- ============================================================

/*
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📚 CONCEITO — Violações de NOT NULL, UNIQUE e PRIMARY KEY
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  Nesta primeira parte, o foco é entender o comportamento do SQL
  Server ao violar as constraints mais básicas de integridade de
  linha: NOT NULL, UNIQUE e PRIMARY KEY (que por baixo dos panos é
  NOT NULL + UNIQUE).
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
*/

USE BD_Constraints

-- ────────────────────────────────────────────────────────────
-- 🏋️ Exemplo prático
-- ────────────────────────────────────────────────────────────

-- 1️⃣  NOT NULL: tentando deixar uma coluna obrigatória em branco
INSERT INTO dGerente(Nome, Email, Regional)
VALUES (NULL, 'sememail@empresa.com', 'Sul')
-- Msg 515: Cannot insert the value NULL into column 'Nome', table
-- 'BD_Constraints.dbo.dGerente'; column does not allow nulls.

-- 2️⃣  UNIQUE: tentando repetir um e-mail já cadastrado
INSERT INTO dGerente(Nome, Email, Regional)
VALUES ('Novo Gerente', 'otavio@empresa.com', 'Sul')
-- Msg 2627: Violation of UNIQUE KEY constraint 'UQ_dGerente_Email'.
-- Cannot insert duplicate key in object 'dbo.dGerente'.

-- 3️⃣  PRIMARY KEY: tentando informar manualmente um ID_Cliente
--     que já existe (mesmo com IDENTITY, é possível burlar com
--     SET IDENTITY_INSERT ON - o que também expõe a colisão)
SET IDENTITY_INSERT dCliente ON

INSERT INTO dCliente(ID_Cliente, Nome, CPF, Email)
VALUES (1, 'Cliente Colidindo', '00011122233', 'colisao@email.com')
-- Msg 2627: Violation of PRIMARY KEY constraint 'PK_dCliente'.
-- Cannot insert duplicate key in object 'dbo.dCliente'.

SET IDENTITY_INSERT dCliente OFF
