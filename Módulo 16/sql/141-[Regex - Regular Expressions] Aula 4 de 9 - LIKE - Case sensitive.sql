-- ============================================================
-- 🗄️  SQL Server  |  📦 Módulo 16 — Regex - Regular Expressions
-- 📖 Aula 4 de 9  |  LIKE - Case sensitive
-- ============================================================

/*
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📚 CONCEITO — LIKE combinado com COLLATE Case Sensitive
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  Quando uma coluna possui um COLLATION Case Sensitive (CS), o
  operador LIKE passa a diferenciar maiúsculas de minúsculas nos
  padrões de busca. Isso muda o comportamento de curingas como os
  colchetes [ ], que passam a respeitar a caixa de cada caractere
  informado.

  Podemos usar [M] para buscar apenas o 'M' maiúsculo, [m] para
  buscar apenas o 'm' minúsculo, ou combinar um intervalo como
  [M-m] para aceitar tanto a versão maiúscula quanto a minúscula
  de uma letra.
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
*/

-- ────────────────────────────────────────────────────────────
-- 🏋️ Exemplo prático
-- ────────────────────────────────────────────────────────────

CREATE TABLE Nomes(
   ID INT,
   Nome VARCHAR(100) COLLATE SQL_Latin1_General_CP1_CS_AS
)

INSERT INTO Nomes(ID, Nome)
VALUES
   (1, 'Matheus'), (2, 'Marcela'), (3, 'marcos'), (4, 'MAuricio'), (5, 'Marta'),
   (6, 'Miranda'), (7, 'Melissa'), (8, 'Lucas'), (9, 'luisa'), (10, 'Pedro')

-- 1️⃣  LIKE padrão como aprendemos até agora (não diferencia caixa no padrão)
SELECT *
FROM Nomes
WHERE Nome LIKE 'mar%'

-- 2️⃣  Retorna as linhas onde a 1ª letra seja 'm', a 2ª seja 'a' e a 3ª seja 'r'
SELECT *
FROM Nomes
WHERE Nome LIKE '[m][a][r]%'

-- 3️⃣  Retorna as linhas onde a 1ª letra seja 'M' (maiúsculo), a 2ª seja 'a' e a 3ª seja 'r'
SELECT *
FROM Nomes
WHERE Nome LIKE '[M][a][r]%'

-- 4️⃣  Retorna as linhas onde a 1ª letra seja 'M' ou 'm', e a 2ª seja 'A' ou 'a'
SELECT *
FROM Nomes
WHERE Nome LIKE '[M-m][A-a]%'
