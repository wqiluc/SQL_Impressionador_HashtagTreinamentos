-- ============================================================
-- 🗄️  SQL Server  |  📦 Módulo 22 — Triggers DML
-- 📖 Aula 1 de 8  |  Introdução
-- ============================================================

/*
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📚 CONCEITO — O que é uma Trigger
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  Uma TRIGGER é um bloco de comandos T-SQL que é executado
  AUTOMATICAMENTE pelo SQL Server, em reação a um evento - sem
  precisar ser chamada explicitamente como uma Procedure ou
  Function.

  Uma TRIGGER DML dispara em reação a comandos que alteram dados:
  INSERT, UPDATE e/ou DELETE.

  Neste módulo vamos ver:
  1. O que é uma Trigger DML (AFTER vs INSTEAD OF)
  2. Criando uma Trigger AFTER
  3. As tabelas mágicas INSERTED e DELETED
  4. Identificando qual evento disparou a trigger
  5. Uma trigger INSTEAD OF para controle de permissão de cadastro
  6. Habilitando, desabilitando e excluindo triggers
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
*/

-- ────────────────────────────────────────────────────────────
-- 🏋️ Exemplo prático
-- ────────────────────────────────────────────────────────────

IF EXISTS (SELECT * FROM sys.databases WHERE name = 'BD_Triggers')

BEGIN
   DROP DATABASE BD_Triggers
END

CREATE DATABASE BD_Triggers
GO

USE BD_Triggers
GO

CREATE TABLE Produto
(
   ID_Produto     INT IDENTITY(1,1) PRIMARY KEY,
   Nome           VARCHAR(100) NOT NULL,
   Estoque        INT NOT NULL DEFAULT 0,
   PrecoUnitario  DECIMAL(10,2) NOT NULL
)

CREATE TABLE ProdutoLog
(
   ID_Log      INT IDENTITY(1,1) PRIMARY KEY,
   ID_Produto  INT,
   Operacao    VARCHAR(10),
   DataHora    DATETIME DEFAULT GETDATE()
)

INSERT INTO Produto(Nome, Estoque, PrecoUnitario)
VALUES ('Teclado', 50, 120.00), ('Mouse', 80, 60.00), ('Monitor', 15, 750.00)

SELECT * FROM Produto;