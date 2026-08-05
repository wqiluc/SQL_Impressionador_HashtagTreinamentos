-- ============================================================
-- 🗄️  SQL Server  |  📦 Módulo 16 — Regex - Regular Expressions
-- 📖 Aula 6 de 9  |  LIKE - Filtrando mais personalizado e caractere curinga
-- ============================================================

/*
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📚 CONCEITO — Combinando colchetes, curinga _ e curinga %
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  Podemos combinar diferentes curingas em um único padrão LIKE para
  criar filtros bem específicos:

  • [ ] define um conjunto de caracteres aceitos em uma posição
  • _   é um curinga que aceita qualquer caractere, mas só um
  • %   é um curinga que aceita qualquer quantidade de caracteres

  Por exemplo, o padrão '[Mm]_[Rr]%' retorna valores que:
  1. Começam com a letra 'M' ou 'm'
  2. Têm um 2º caractere qualquer (o '_' é o curinga de 1 posição)
  3. Têm um 3º caractere igual a 'R' ou 'r'
  4. Podem ter qualquer quantidade de caracteres depois do 3º
     (por conta do '%')
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

-- 1️⃣  Nomes que começam com 'M'/'m', têm um 2º caractere qualquer e um 3º 'R'/'r'
SELECT *
FROM Nomes
WHERE Nome LIKE '[Mm]_[Rr]%'
