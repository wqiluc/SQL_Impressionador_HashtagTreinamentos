-- ============================================================
-- 🗄️  SQL Server  |  📦 Módulo 20 — Functions
-- 📖 Aula 1 de 11  |  Introdução
-- ============================================================

/*
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📚 CONCEITO — Por que criar Functions
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  Já usamos várias funções PRONTAS do SQL Server (GETDATE, SUM,
  LEN, LIKE...). Uma FUNCTION do usuário (User-Defined Function)
  permite criar a NOSSA PRÓPRIA função, encapsulando uma lógica que
  se repete em várias consultas, com um nome reutilizável.

  Vantagens de encapsular lógica em uma Function:
  • Evita repetir a mesma expressão/CASE em várias queries
  • Centraliza a regra de negócio em um único lugar
  • Deixa o SELECT mais legível

  Neste módulo vamos ver:
  1. O que é uma Function
  2. Como criar e utilizar uma Function
  3. Estruturas condicionais dentro de uma Function
  4. Funções mais complexas (múltiplas condições, funções de tabela)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
*/

-- ────────────────────────────────────────────────────────────
-- 🏋️ Exemplo prático
-- ────────────────────────────────────────────────────────────

CREATE DATABASE BD_Functions
GO

USE BD_Functions
GO

CREATE TABLE Funcionario(
   ID_Funcionario INT IDENTITY(1,1) PRIMARY KEY,
   Nome           VARCHAR(100) NOT NULL,
   Salario        DECIMAL(10,2) NOT NULL,
   AnosDeCasa     INT NOT NULL
)

INSERT INTO Funcionario(Nome, Salario, AnosDeCasa)
VALUES
   ('Ana Beatriz', 3200.00, 1),
   ('Carlos Eduardo', 7800.00, 6),
   ('Diego Martins', 1800.00, 2),
   ('Fernanda Lima', 12500.00, 9),
   ('Gustavo Rocha', 5400.00, 4)

SELECT * FROM Funcionario;