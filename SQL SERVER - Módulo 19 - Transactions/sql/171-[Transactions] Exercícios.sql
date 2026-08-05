-- ============================================================
-- 🗄️  SQL Server  |  📦 Módulo 19 — Transactions
-- 📝 Exercícios
-- ============================================================

/*
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📚 ENUNCIADO
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

1. Criar uma tabela chamada Carro com os dados abaixo.
   Obs: não precisa se preocupar com constraints, pode criar uma
   tabela simples.

     id_carro | placa    | modelo            | tipo
     ---------|----------|-------------------|-------
     1        | DAS-1412 | Hyundai HB20       | Hatch
     2        | JHG-3902 | Fiat Cronos        | Sedan
     3        | IPW-9018 | Citroen C4 Cactus  | SUV
     4        | JKR-8891 | Nissan Kicks       | SUV
     5        | TRF-5904 | Chevrolet Onix     | Sedan

2. Executar as seguintes transações no banco de dados, sempre na
   tabela Carro. Lembrar de dar um COMMIT para efetivar cada uma
   das transações.

   a) Inserir uma nova linha com os seguintes valores:
        id_carro = 6
        placa    = CDR-0090
        modelo   = Fiat Argo
        tipo     = Hatch

   b) Atualizar o tipo do carro de id = 1 de Hatch para Sedan.

   c) Deletar a linha referente ao carro de id = 6.
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
*/

USE BD_Transactions;
GO

-- ==============================================================================
-- 🏋️ Exercício 1: Criando a tabela Carro
-- ==============================================================================

DROP TABLE IF EXISTS Carro;

CREATE TABLE Carro
(
   id_carro INT,
   placa    VARCHAR(10),
   modelo   VARCHAR(50),
   tipo     VARCHAR(10)
)

INSERT INTO Carro(id_carro, placa, modelo, tipo)
VALUES
   (1, 'DAS-1412', 'Hyundai HB20',      'Hatch'),
   (2, 'JHG-3902', 'Fiat Cronos',       'Sedan'),
   (3, 'IPW-9018', 'Citroen C4 Cactus', 'SUV'),
   (4, 'JKR-8891', 'Nissan Kicks',      'SUV'),
   (5, 'TRF-5904', 'Chevrolet Onix',    'Sedan')

SELECT * FROM Carro;

-- ==============================================================================
-- 🏋️ Exercício 2: Transações na tabela Carro
-- ==============================================================================

-- a) Inserindo o carro de id = 6
BEGIN TRAN

   INSERT INTO Carro(id_carro, placa, modelo, tipo)
   VALUES (6, 'CDR-0090', 'Fiat Argo', 'Hatch')

COMMIT

SELECT * FROM Carro;

-- b) Atualizando o tipo do carro de id = 1 de Hatch para Sedan
BEGIN TRAN

   UPDATE Carro SET tipo = 'Sedan' WHERE id_carro = 1

COMMIT

SELECT * FROM Carro;

-- c) Deletando a linha referente ao carro de id = 6
BEGIN TRAN

   DELETE FROM Carro WHERE id_carro = 6

COMMIT

SELECT * FROM Carro;