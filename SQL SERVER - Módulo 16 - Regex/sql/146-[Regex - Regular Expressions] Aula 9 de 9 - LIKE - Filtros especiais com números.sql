-- ============================================================
-- 🗄️  SQL Server  |  📦 Módulo 16 — Regex - Regular Expressions
-- 📖 Aula 9 de 9  |  LIKE - Filtros especiais com números
-- ============================================================

/*
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📚 CONCEITO — Usando LIKE em colunas numéricas
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  O LIKE também funciona em colunas numéricas (como DECIMAL), já
  que o SQL Server converte implicitamente o valor para texto antes
  de comparar com o padrão.

  Isso permite filtrar números por características da sua
  representação em texto — como quantidade de dígitos antes ou
  depois da vírgula/ponto decimal, ou um dígito específico em uma
  posição exata.
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
*/

-- ────────────────────────────────────────────────────────────
-- 🏋️ Exemplo prático
-- ────────────────────────────────────────────────────────────

USE BD_Collation

CREATE TABLE Numeros(
   Numero DECIMAL(20, 2)
)

INSERT INTO Numeros(Numero)
VALUES
   (50), (30.23), (9), (100.54), (15.9), (6.5), (10), (501.76), (1000.56), (31)

-- 1️⃣  Retornando os números que possuem 2 dígitos na parte inteira
SELECT *
FROM Numeros
WHERE Numero LIKE '[0-9][0-9].[0][0]'

-- 2️⃣  Retornando números que:
--     a) Possuem 3 dígitos na parte inteira, sendo o 1º dígito igual a 5
--     b) O 1º dígito da parte decimal seja 7
--     c) O 2º dígito da parte decimal seja um número entre 0 e 9
SELECT *
FROM Numeros
WHERE Numero LIKE '[5]__.[7][0-9]'
