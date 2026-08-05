-- ============================================================
-- 🗄️  SQL Server  |  📦 Módulo 17 — Constraints
-- 📖 Aula 5 de 14  |  Criando Constraints para a Tabela dGerente
-- ============================================================

/*
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📚 CONCEITO — Regras de negócio da tabela dGerente
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  • ID_Gerente -> identifica cada gerente de forma única e gerada
                  automaticamente pelo banco     -> IDENTITY + PRIMARY KEY
  • Nome       -> sempre obrigatório              -> NOT NULL
  • Email      -> obrigatório e nunca pode repetir -> NOT NULL + UNIQUE
  • Regional   -> obrigatório, mas repete entre
                  vários gerentes de uma mesma
                  regional; sem informação assume
                  'Não definida'                  -> NOT NULL + DEFAULT
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
*/

USE BD_Constraints

-- ────────────────────────────────────────────────────────────
-- 🏋️ Exemplo prático
-- ────────────────────────────────────────────────────────────

DROP TABLE dGerente

CREATE TABLE dGerente(
   ID_Gerente INT IDENTITY(1,1) CONSTRAINT PK_dGerente PRIMARY KEY,
   Nome       VARCHAR(100) NOT NULL,
   Email      VARCHAR(100) NOT NULL CONSTRAINT UQ_dGerente_Email UNIQUE,
   Regional   VARCHAR(50) NOT NULL CONSTRAINT DF_dGerente_Regional DEFAULT 'Não definida'
)

-- Conferindo as constraints criadas na tabela
sp_helpconstraint 'dGerente'

-- Inserindo gerentes válidos
INSERT INTO dGerente(Nome, Email, Regional)
VALUES
   ('Otávio Lima', 'otavio@empresa.com', 'Sudeste'),
   ('Carla Meireles', 'carla@empresa.com', 'Nordeste')

-- Inserindo sem informar a Regional -> usa o valor DEFAULT
INSERT INTO dGerente(Nome, Email)
VALUES
   ('João Prado', 'joao@empresa.com')

SELECT * FROM dGerente
