-- ============================================================
-- 🗄️  SQL Server  |  📦 Módulo 16 — Regex - Regular Expressions
-- 📖 Aula 5 de 9  |  LIKE - Filtrando os primeiros caracteres + Case sensitive
-- ============================================================

/*
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📚 CONCEITO — Filtrando por posição e quantidade de caracteres
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  Além de combinar letras específicas dentro de colchetes [ ], como
  em [MEK] (que aceita 'M', 'E' ou 'K'), também podemos usar
  intervalos como [A-z] para representar "qualquer letra".

  Repetir esse padrão controla a quantidade exata de caracteres da
  string: [A-z] sozinho encontra valores com 1 caractere, [A-z][A-z]
  encontra valores com exatamente 2 caracteres, e assim por diante.
  Podemos ainda misturar classes diferentes, como [A-z][0-9], para
  exigir uma letra seguida de um número.
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

-- 1️⃣  Retornando textos que começam com a letra 'M', 'E' ou 'K'
SELECT *
FROM Textos
WHERE Texto LIKE '[MEK]%'

-- 2️⃣  Retornando textos que possuem apenas 1 caractere
SELECT *
FROM Textos
WHERE Texto LIKE '[A-z]'

-- 3️⃣  Retornando textos que possuem apenas 2 caracteres
SELECT *
FROM Textos
WHERE Texto LIKE '[A-z][A-z]'

-- 4️⃣  Retornando textos com 2 caracteres: o 1º uma letra, o 2º um número
SELECT *
FROM Textos
WHERE Texto LIKE '[A-z][0-9]'
