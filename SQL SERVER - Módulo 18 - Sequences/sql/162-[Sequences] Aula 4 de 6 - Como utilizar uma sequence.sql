-- ============================================================
-- 🗄️  SQL Server  |  📦 Módulo 18 — Sequences
-- 📖 Aula 4 de 6  |  Como utilizar uma sequence
-- ============================================================

/*
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📚 CONCEITO — NEXT VALUE FOR e o gerenciamento da Sequence
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  O comando NEXT VALUE FOR nome_da_sequence devolve o próximo
  valor da sequência - pode ser usado tanto em um SELECT avulso
  quanto dentro de um INSERT, inclusive como DEFAULT de uma coluna.

  Também é possível:
  • Reiniciar a sequência com ALTER SEQUENCE ... RESTART WITH
  • Reservar um intervalo de valores de uma vez, sem gastar um a
    um, usando a procedure sp_sequence_get_range (útil para
    aplicações que precisam de vários IDs de uma vez, sem fazer
    várias chamadas ao banco)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
*/

USE BD_Sequences;

-- ────────────────────────────────────────────────────────────
-- 🏋️ Exemplo prático
-- ────────────────────────────────────────────────────────────

-- 1️⃣  Usando a sequence como DEFAULT de uma coluna
CREATE TABLE Pedido(
   ID_Pedido INT PRIMARY KEY DEFAULT (NEXT VALUE FOR Seq_Pedido),
   Descricao VARCHAR(100)
)

INSERT INTO Pedido(Descricao) VALUES ('Pedido A')
INSERT INTO Pedido(Descricao) VALUES ('Pedido B')

SELECT * FROM Pedido

-- 2️⃣  Usando a sequence explicitamente dentro do INSERT
CREATE TABLE Produto(
   Codigo INT PRIMARY KEY,
   Nome VARCHAR(100)
)

INSERT INTO Produto(Codigo, Nome)
VALUES (NEXT VALUE FOR Seq_CodigoProduto, 'Teclado')

INSERT INTO Produto(Codigo, Nome)
VALUES (NEXT VALUE FOR Seq_CodigoProduto, 'Mouse')

SELECT * FROM Produto

-- 3️⃣  Reiniciando a sequência
ALTER SEQUENCE Seq_Pedido RESTART WITH 1

-- 4️⃣  Reservando um intervalo de 5 valores de uma só vez
DECLARE @PrimeiroValor SQL_VARIANT

EXEC sp_sequence_get_range
   @sequence_name = N'Seq_CodigoProduto',
   @range_size = 5,
   @range_first_value = @PrimeiroValor OUTPUT

SELECT @PrimeiroValor AS PrimeiroValorDoIntervalo;