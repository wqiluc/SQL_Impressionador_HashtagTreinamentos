-- ============================================================
-- 🗄️  SQL Server  |  📦 Módulo 18 — Sequences
-- 📝 Exercícios
-- ============================================================

/*
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📚 ENUNCIADO
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

0. Criar o banco AlugaFacil, onde serão criadas as sequences e
   as tabelas dos exercícios.

1. Criar 3 sequences que serão usadas nas tabelas Carro, Cliente
   e Locacoes: cliente_seq, carro_seq e locacoes_seq.
   Todas devem começar pelo número 1, incrementar de 1 em 1 e
   não ter valor máximo.

2. Utilizar as sequences nas 3 tabelas. Excluir as tabelas
   existentes e recriá-las - como a PK passa a usar a Sequence,
   não é mais necessário o IDENTITY.

   Tabela Cliente
     • id_cliente   -> PRIMARY KEY (cliente_seq)
     • nome_cliente -> NOT NULL
     • cnh          -> NOT NULL + UNIQUE
     • cartao       -> NOT NULL

   Tabela Carro
     • id_carro -> PRIMARY KEY (carro_seq)
     • placa    -> NOT NULL + UNIQUE
     • modelo   -> NOT NULL
     • tipo     -> NOT NULL + CHECK IN ('Hatch', 'Sedan', 'SUV')

   Tabela Locacoes
     • id_locacao     -> PRIMARY KEY (locacoes_seq)
     • data_locacao   -> NOT NULL
     • data_devolucao -> NOT NULL
     • id_carro       -> NOT NULL + FOREIGN KEY -> Carro(id_carro)
     • id_cliente     -> NOT NULL + FOREIGN KEY -> Cliente(id_cliente)

3. Excluir as sequences criadas.
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
*/

-- ==============================================================================
-- 🏋️ Exercício 0: Criando o banco de dados
-- ==============================================================================

IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'AlugaFacil')

CREATE DATABASE AlugaFacil;

USE AlugaFacil;

-- ==============================================================================
-- 🏋️ Exercício 1: Criando as sequences
-- ==============================================================================

CREATE SEQUENCE cliente_seq
   START WITH 1
   INCREMENT BY 1
   NO MAXVALUE;

CREATE SEQUENCE carro_seq
   START WITH 1
   INCREMENT BY 1
   NO MAXVALUE;

CREATE SEQUENCE locacoes_seq
   START WITH 1
   INCREMENT BY 1
   NO MAXVALUE;

-- Conferindo as sequences criadas
SELECT name, start_value, increment, maximum_value
FROM sys.sequences;

-- ==============================================================================
-- 🏋️ Exercício 2: Recriando as tabelas com as sequences no lugar do IDENTITY
-- ==============================================================================

-- a) Excluindo as tabelas existentes (Locacoes primeiro, por causa das FKs)
DROP TABLE IF EXISTS Locacoes;
DROP TABLE IF EXISTS Carro;
DROP TABLE IF EXISTS Cliente;

-- b) Recriando as tabelas, com a PK preenchida pela Sequence correspondente
CREATE TABLE Cliente
(
   id_cliente   INT CONSTRAINT PK_Cliente PRIMARY KEY DEFAULT (NEXT VALUE FOR cliente_seq),
   nome_cliente VARCHAR(100) NOT NULL,
   cnh          CHAR(11) NOT NULL CONSTRAINT UQ_Cliente_CNH UNIQUE,
   cartao       VARCHAR(20) NOT NULL
)

CREATE TABLE Carro
(
   id_carro INT CONSTRAINT PK_Carro PRIMARY KEY DEFAULT (NEXT VALUE FOR carro_seq),
   placa    CHAR(7) NOT NULL CONSTRAINT UQ_Carro_Placa UNIQUE,
   modelo   VARCHAR(50) NOT NULL,
   tipo     VARCHAR(10) NOT NULL CONSTRAINT CK_Carro_Tipo CHECK
   (tipo IN ('Hatch', 'Sedan', 'SUV'))
)

CREATE TABLE Locacoes
(
   id_locacao     INT CONSTRAINT PK_Locacoes PRIMARY KEY DEFAULT (NEXT VALUE FOR locacoes_seq),
   data_locacao   DATE NOT NULL,
   data_devolucao DATE NOT NULL,
   id_carro       INT NOT NULL CONSTRAINT FK_Locacoes_Carro REFERENCES Carro(id_carro),
   id_cliente     INT NOT NULL CONSTRAINT FK_Locacoes_Cliente REFERENCES Cliente(id_cliente)
)

-- c) Testando: inserindo sem informar a PK - quem gera o valor é a Sequence
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
-- 🏋️ Exercício 3: Excluindo as sequences criadas
-- ==============================================================================

DROP SEQUENCE cliente_seq;
DROP SEQUENCE carro_seq;
DROP SEQUENCE locacoes_seq;