-- ============================================================
-- 🗄️  SQL Server  |  📦 Módulo 17 — Constraints
-- 📖 Aula 2 de 14  |  NOT NULL, UNIQUE, CHECK, DEFAULT, IDENTITY, PRIMARY KEY, FOREIGN KEY
-- ============================================================

/*
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📚 CONCEITO — Sintaxe de cada Constraint
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  Cada constraint é escrita logo após o tipo de dado da coluna,
  dentro do CREATE TABLE. Também é possível nomear a constraint
  com CONSTRAINT nome_da_regra, o que facilita alterá-la ou
  excluí-la depois.
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
*/

USE BD_Constraints

-- ────────────────────────────────────────────────────────────
-- 🏋️ Exemplo prático
-- ────────────────────────────────────────────────────────────

-- 1️⃣  NOT NULL - a coluna nunca pode ficar em branco
CREATE TABLE Exemplo_NotNull(
   Nome VARCHAR(100) NOT NULL
)

-- 2️⃣  UNIQUE - não permite valores repetidos
CREATE TABLE Exemplo_Unique(
   Email VARCHAR(100) UNIQUE
)

-- 3️⃣  CHECK - valida uma condição antes de aceitar o valor
CREATE TABLE Exemplo_Check(
   Idade INT CHECK (Idade >= 18)
)

-- 4️⃣  DEFAULT - valor usado quando nada é informado no INSERT
CREATE TABLE Exemplo_Default(
   Status VARCHAR(20) DEFAULT 'Ativo'
)

-- 5️⃣  IDENTITY - gera valores automáticos e sequenciais
--     IDENTITY(valor_inicial, incremento)
CREATE TABLE Exemplo_Identity(
   ID INT IDENTITY(1,1)
)

-- 6️⃣  PRIMARY KEY - identifica cada linha de forma única
--     (por baixo dos panos, já aplica NOT NULL + UNIQUE)
CREATE TABLE Exemplo_PrimaryKey(
   ID INT PRIMARY KEY
)

-- 7️⃣  FOREIGN KEY - garante que o valor exista em outra tabela
CREATE TABLE Exemplo_Categoria(
   ID INT PRIMARY KEY,
   Nome VARCHAR(50)
)

CREATE TABLE Exemplo_ForeignKey(
   ID INT PRIMARY KEY,
   ID_Categoria INT FOREIGN KEY REFERENCES Exemplo_Categoria(ID)
)

-- Combinando várias constraints na mesma coluna
CREATE TABLE Exemplo_Combinado(
   ID     INT IDENTITY(1,1) PRIMARY KEY,
   Nome   VARCHAR(100) NOT NULL,
   Email  VARCHAR(100) UNIQUE NOT NULL,
   Idade  INT CHECK (Idade >= 18),
   Status VARCHAR(20) DEFAULT 'Ativo'
)
