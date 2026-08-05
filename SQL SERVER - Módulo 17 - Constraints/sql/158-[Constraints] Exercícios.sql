-- ============================================================
-- 🗄️  SQL Server  |  📦 Módulo 17 — Constraints
-- 📝 Exercícios
-- ============================================================

/*
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📚 ENUNCIADO
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

1. Criar o banco AlugaFacil, de uma locadora de carros, com 3 tabelas:

   Tabela Cliente
     • id_cliente   -> PRIMARY KEY, autoincrementada
     • nome_cliente -> NOT NULL
     • cnh          -> NOT NULL + UNIQUE
     • cartao       -> NOT NULL

   Tabela Carro
     • id_carro -> PRIMARY KEY, autoincrementada
     • placa    -> NOT NULL + UNIQUE
     • modelo   -> NOT NULL
     • tipo     -> NOT NULL + CHECK IN ('Hatch', 'Sedan', 'SUV')

   Tabela Locacoes
     • id_locacao     -> PRIMARY KEY, autoincrementada
     • data_locacao   -> NOT NULL
     • data_devolucao -> NOT NULL
     • id_carro       -> NOT NULL + FOREIGN KEY -> Carro(id_carro)
     • id_cliente     -> NOT NULL + FOREIGN KEY -> Cliente(id_cliente)

2. Tentar violar as constraints criadas (exercício livre) e, ao final,
   excluir o banco de dados criado.
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
*/

-- ==============================================================================
-- 🏋️ Exercício 1: Criando o banco e as tabelas com suas constraints
-- ==============================================================================

-- a) Criando o banco de dados

IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'AlugaFacil')

CREATE DATABASE AlugaFacil;

USE AlugaFacil;

-- b) Criando as tabelas

CREATE TABLE Cliente
(
   id_cliente   INT IDENTITY(1,1) CONSTRAINT PK_Cliente PRIMARY KEY,
   nome_cliente VARCHAR(100) NOT NULL,
   cnh          CHAR(11) NOT NULL CONSTRAINT UQ_Cliente_CNH UNIQUE,
   cartao       VARCHAR(20) NOT NULL
)

CREATE TABLE Carro
(
   id_carro INT IDENTITY(1,1) CONSTRAINT PK_Carro PRIMARY KEY,
   placa    CHAR(7) NOT NULL CONSTRAINT UQ_Carro_Placa UNIQUE,
   modelo   VARCHAR(50) NOT NULL,
   tipo     VARCHAR(10) NOT NULL CONSTRAINT CK_Carro_Tipo CHECK 
   (tipo IN ('Hatch', 'Sedan', 'SUV'))
)

CREATE TABLE Locacoes
(
   id_locacao     INT IDENTITY(1,1) CONSTRAINT PK_Locacoes PRIMARY KEY,
   data_locacao   DATE NOT NULL,
   data_devolucao DATE NOT NULL,
   id_carro       INT NOT NULL CONSTRAINT FK_Locacoes_Carro REFERENCES Carro(id_carro),
   id_cliente     INT NOT NULL CONSTRAINT FK_Locacoes_Cliente REFERENCES Cliente(id_cliente)
)

-- Conferindo as constraints criadas em cada tabela
sp_helpconstraint 'Cliente'
sp_helpconstraint 'Carro'
sp_helpconstraint 'Locacoes'

-- Inserindo alguns dados válidos para testar as tabelas
INSERT INTO Cliente(nome_cliente, cnh, cartao)
VALUES
   ('Marcus Andrade', '11122233344', '4111111111111111'),
   ('Bianca Ferreira', '22233344455', '4222222222222222')

INSERT INTO Carro(placa, modelo, tipo)
VALUES
   ('ABC1D23', 'Onix', 'Hatch'),
   ('XYZ9K87', 'Corolla', 'Sedan')

INSERT INTO Locacoes(data_locacao, data_devolucao, id_carro, id_cliente)
VALUES
   ('2026-08-01', '2026-08-05', 1, 1),
   ('2026-08-02', '2026-08-10', 2, 2)

SELECT * FROM Cliente;
SELECT * FROM Carro;
SELECT * FROM Locacoes;

-- ==============================================================================
-- 🏋️ Exercício 2: Tentando violar as constraints criadas - livre
-- ==============================================================================

-- a) NOT NULL: cliente sem nome
INSERT INTO Cliente(nome_cliente, cnh, cartao)
VALUES (NULL, '33344455566', '4333333333333333')
-- ❌ Msg 515: Não é possível inserir o valor NULL na coluna 'nome_cliente'. 🚫

-- b) UNIQUE: cnh já cadastrada
INSERT INTO Cliente(nome_cliente, cnh, cartao)
VALUES ('Rafael Souza', '11122233344', '4444444444444444')
-- ❌ Msg 2627: Violação da restrição UNIQUE KEY 'UQ_Cliente_CNH'. 🔁

-- c) CHECK: tipo de carro fora dos valores permitidos
INSERT INTO Carro(placa, modelo, tipo)
VALUES ('QWE4R56', 'Fiorino', 'Furgão')
-- ❌ Msg 547: A instrução INSERT conflitou com a restrição CHECK
-- 'CK_Carro_Tipo'. 🚧

-- d) UNIQUE: placa já cadastrada
INSERT INTO Carro(placa, modelo, tipo)
VALUES ('ABC1D23', 'HB20', 'Hatch')
-- ❌ Msg 2627: Violação da restrição UNIQUE KEY 'UQ_Carro_Placa'. 🔁

-- e) FOREIGN KEY: locação referenciando um carro inexistente
INSERT INTO Locacoes(data_locacao, data_devolucao, id_carro, id_cliente)
VALUES ('2026-08-03', '2026-08-06', 999, 1)
-- ❌ Msg 547: A instrução INSERT conflitou com a restrição FOREIGN KEY
-- 'FK_Locacoes_Carro'. 🔗

-- f) FOREIGN KEY: locação referenciando um cliente inexistente
INSERT INTO Locacoes(data_locacao, data_devolucao, id_carro, id_cliente)
VALUES ('2026-08-03', '2026-08-06', 1, 999)
-- ❌ Msg 547: A instrução INSERT conflitou com a restrição FOREIGN KEY
-- 'FK_Locacoes_Cliente'. 🔗

-- g) NOT NULL: locação sem data de devolução
INSERT INTO Locacoes(data_locacao, data_devolucao, id_carro, id_cliente)
VALUES ('2026-08-03', NULL, 1, 1)
-- ❌ Msg 515: Não é possível inserir o valor NULL na coluna 'data_devolucao'. 🚫

-- Excluindo o banco de dados criado
USE master;

DROP DATABASE AlugaFacil;