-- ============================================================
-- 🗄️  SQL Server  |  📦 Módulo 16 — Regex - Regular Expressions
-- 📖 Aula 3 de 9  |  COLLATE - Exemplo
-- ============================================================

/*
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📚 CONCEITO — COLLATE Case Sensitive na prática
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  Ao criar uma coluna com um COLLATION *_CS_AS (Case Sensitive), o
  SQL Server passa a diferenciar maiúsculas de minúsculas nas
  comparações de texto — ou seja, 'Marcela' e 'marcela' deixam de
  ser consideradas o mesmo valor.

  Isso é útil sempre que a caixa do texto (maiúscula ou minúscula)
  carrega significado, e queremos que um filtro encontre apenas o
  valor exato, sem confundi-lo com variações de grafia.
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
*/

-- ────────────────────────────────────────────────────────────
-- 🏋️ Exemplo prático
-- ────────────────────────────────────────────────────────────

CREATE DATABASE BD_Collation
COLLATE SQL_Latin1_General_CP1_CI_AS

CREATE TABLE Tabela(
   ID INT,
   Nome VARCHAR(100) COLLATE SQL_Latin1_General_CP1_CS_AS
)

INSERT INTO Tabela(ID, Nome)
VALUES
   (1, 'Matheus'), (2, 'Marcela'), (3, 'marcos'), (4, 'MAuricio'), (5, 'Marta'),
   (6, 'Miranda'), (7, 'Melissa'), (8, 'Lucas'), (9, 'luisa'), (10, 'Pedro')

-- 1️⃣  Como a coluna Nome é Case Sensitive, só retorna o valor exato 'Marcela'
SELECT * FROM Tabela
WHERE Nome = 'Marcela'
