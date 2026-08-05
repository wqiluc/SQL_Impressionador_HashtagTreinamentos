-- ============================================================
-- 🗄️  SQL Server  |  📦 Módulo 16 — Regex - Regular Expressions
-- 📖 Aula 8 de 9  |  LIKE - Filtrando caracteres especiais
-- ============================================================

/*
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📚 CONCEITO — Identificando caracteres especiais com LIKE
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  Combinando o curinga % com um conjunto negado [^A-z0-9], podemos
  identificar textos que contenham QUALQUER caractere que não seja
  uma letra (A-z) nem um número (0-9) — ou seja, caracteres
  especiais como #, @, !, etc.

  O padrão '%[^A-z0-9]%' varre a string inteira em busca de pelo
  menos um caractere fora desse intervalo alfanumérico.
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
*/

-- ────────────────────────────────────────────────────────────
-- 🏋️ Exemplo prático
-- ────────────────────────────────────────────────────────────

USE BD_Collation

CREATE TABLE Textos(
   ID INT,
   Texto VARCHAR(100) COLLATE SQL_Latin1_General_CP1_CS_AS
)

INSERT INTO Textos(ID, Texto)
VALUES
   (1, 'Marcos'), (2, 'Excel'), (3, 'leandro'), (4, 'K'), (5, 'X7'),
   (6, 'l9'), (7, '#M'), (8, '@9'), (9, 'M'), (10, 'RT')

-- 1️⃣  Identificando textos que contêm algum caractere especial
SELECT *
FROM Textos
WHERE Texto LIKE '%[^A-z0-9]%'
