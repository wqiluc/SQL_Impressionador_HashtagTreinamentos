-- ============================================================
-- 🗄️  SQL Server  |  📦 Módulo 16 — Regex - Regular Expressions
-- 📖 Aula 7 de 9  |  LIKE - Utilizando o operador de negação
-- ============================================================

/*
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📚 CONCEITO — Negação dentro de colchetes: [^...]
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  Colocar o símbolo ^ logo no início de um conjunto entre colchetes
  inverte a lógica do filtro: em vez de aceitar apenas os
  caracteres listados, o padrão passa a aceitar qualquer caractere
  QUE NÃO ESTEJA na lista.

  Por exemplo, '[^Ll]%' retorna valores cujo primeiro caractere NÃO
  seja 'L' nem 'l'. Esse operador de negação pode ser combinado com
  outros curingas, como o '_', para negar apenas uma posição
  específica dentro do padrão.
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

-- 1️⃣  Retorna nomes que não começam com as letras 'L' ou 'l'
SELECT *
FROM Nomes
WHERE Nome LIKE '[^Ll]%'

-- 2️⃣  Retorna nomes cujo 2º caractere não seja 'E' ou 'e'
SELECT *
FROM Nomes
WHERE Nome LIKE '_[^Ee]%'
