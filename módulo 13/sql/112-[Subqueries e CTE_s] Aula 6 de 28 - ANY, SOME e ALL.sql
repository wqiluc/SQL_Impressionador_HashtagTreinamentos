-- ============================================================
-- 🗄️  SQL Server  |  📦 Módulo 13 — Subqueries e CTEs
-- 📖 Aula 6 de 28  |  ANY, SOME e ALL
-- ============================================================

/*
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📚 CONCEITO — Operadores de comparação com listas
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  = ANY(lista)   → igual ao IN  → verdadeiro se igual a ALGUM valor
  > ANY(lista)   → maior que o MÍNIMO da lista
  < ANY(lista)   → menor que o MÁXIMO da lista
  > ALL(lista)   → maior que o MÁXIMO da lista
  < ALL(lista)   → menor que o MÍNIMO da lista

  SOME é sinônimo de ANY (mesmo comportamento).
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
*/

-- 🔧 Setup: criando tabela de exemplo
CREATE TABLE funcionarios 
(
    id_funcionario INT,
    nome           VARCHAR(50),
    idade          INT,
    sexo           VARCHAR(50)
)

INSERT INTO funcionarios (id_funcionario, nome, idade, sexo)
VALUES
    (1, 'Julia',  20, 'F'),
    (2, 'Daniel', 21, 'M'),
    (3, 'Amanda', 22, 'F'),
    (4, 'Pedro',  23, 'M'),
    (5, 'André',  24, 'M'),
    (6, 'Luisa',  25, 'F')

SELECT * FROM funcionarios;

-- ────────────────────────────────────────────────────────────
-- ❓ Desafio: selecionar os funcionários do sexo masculino
--    usando a coluna IDADE (não a coluna sexo)
-- ────────────────────────────────────────────────────────────

-- Idades dos homens: Daniel(21), Pedro(23), André(24)

-- Abordagem 1 — hardcoded (ruim)
SELECT * FROM funcionarios WHERE idade IN (21, 23, 24);

-- Abordagem 2 — com Subquery + IN ✅
SELECT * FROM funcionarios
WHERE 
  idade IN (SELECT idade FROM funcionarios WHERE sexo = 'M');

-- ────────────────────────────────────────────────────────────
-- 📌 = ANY  →  equivalente ao IN
-- ────────────────────────────────────────────────────────────
SELECT * FROM funcionarios
WHERE 
  idade = ANY (SELECT idade FROM funcionarios WHERE sexo = 'M');

-- ────────────────────────────────────────────────────────────
-- 📌 > ANY  →  maior que o MÍNIMO (21) → retorna idade > 21
-- ────────────────────────────────────────────────────────────
SELECT * FROM funcionarios
WHERE 
  idade > ANY (SELECT idade FROM funcionarios WHERE sexo = 'M');

-- ────────────────────────────────────────────────────────────
-- 📌 < ANY  →  menor que o MÁXIMO (24) → retorna idade < 24
-- ────────────────────────────────────────────────────────────
SELECT * FROM funcionarios
WHERE 
  idade < ANY (SELECT idade FROM funcionarios WHERE sexo = 'M');

-- ────────────────────────────────────────────────────────────
-- 📌 > ALL  →  maior que o MÁXIMO (24) → retorna idade > 24
-- ────────────────────────────────────────────────────────────
SELECT * FROM funcionarios
WHERE 
  idade > ALL (SELECT idade FROM funcionarios WHERE sexo = 'M');

-- ────────────────────────────────────────────────────────────
-- 📌 < ALL  →  menor que o MÍNIMO (21) → retorna idade < 21
-- ────────────────────────────────────────────────────────────
SELECT * FROM funcionarios
WHERE 
  idade < ALL (SELECT idade FROM funcionarios WHERE sexo = 'M');