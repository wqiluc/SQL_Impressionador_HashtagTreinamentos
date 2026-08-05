-- ============================================================
-- 🗄️  SQL Server  |  📦 Módulo 21 — Procedures
-- 📖 Aula 1 de 15  |  Introdução
-- ============================================================

/*
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📚 CONCEITO — Por que criar Procedures
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  Uma STORED PROCEDURE é um bloco de comandos T-SQL salvo no banco
  de dados, com um nome, que pode ser executado quantas vezes for
  preciso - como uma "função" para o banco, mas com muito mais
  liberdade: pode executar SELECT, INSERT, UPDATE, DELETE,
  controlar transações, e devolver múltiplos resultados.

  Vantagens:
  • Reutilização - a lógica fica centralizada em um único objeto
  • Performance - o plano de execução é compilado e reaproveitado
  • Segurança - dá para liberar acesso à procedure sem liberar
    acesso direto às tabelas

  Neste módulo vamos ver:
  1. O que é uma Procedure
  2. Como criar procedures com 0, 1 e vários parâmetros
  3. Parâmetros com valor padrão (DEFAULT)
  4. Uma procedure mais completa para cadastro de contratos
  5. Como excluir uma procedure
  6. Functions vs Procedures
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
*/

-- ────────────────────────────────────────────────────────────
-- 🏋️ Exemplo prático
-- ────────────────────────────────────────────────────────────

CREATE DATABASE BD_Procedures
GO

USE BD_Procedures
GO

CREATE TABLE dCliente(
   ID_Cliente INT IDENTITY(1,1) PRIMARY KEY,
   Nome       VARCHAR(100) NOT NULL,
   CPF        CHAR(11) NOT NULL UNIQUE
)

CREATE TABLE dGerente(
   ID_Gerente INT IDENTITY(1,1) PRIMARY KEY,
   Nome       VARCHAR(100) NOT NULL
)

CREATE TABLE fContratos(
   ID_Contrato   INT IDENTITY(1,1) PRIMARY KEY,
   ID_Cliente    INT NOT NULL REFERENCES dCliente(ID_Cliente),
   ID_Gerente    INT NOT NULL REFERENCES dGerente(ID_Gerente),
   ValorContrato DECIMAL(10,2) NOT NULL CHECK (ValorContrato > 0),
   DataContrato  DATE NOT NULL DEFAULT GETDATE(),
   Status        VARCHAR(20) NOT NULL DEFAULT 'Ativo'
)

INSERT INTO dGerente(Nome) VALUES ('Otávio Lima'), ('Carla Meireles')

INSERT INTO dCliente(Nome, CPF)
VALUES ('Marcus Andrade', '11122233344'), ('Bianca Ferreira', '22233344455')

INSERT INTO fContratos(ID_Cliente, ID_Gerente, ValorContrato)
VALUES (1, 1, 15000.00), (2, 2, 8500.50)

SELECT * FROM dCliente
SELECT * FROM dGerente
SELECT * FROM fContratos
