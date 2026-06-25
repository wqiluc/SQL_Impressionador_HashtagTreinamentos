-- ==============================================================================
-- 🗄️ [SQL Server] CRUD - Módulo 12
-- 📘 Aula 14 de 21 - ALTER TABLE
-- ==============================================================================
-- 🎯 Objetivo: Modificar a estrutura de uma tabela existente usando ALTER TABLE.
--
-- 📌 As três operações principais:
--
--   ➕ ADD    → adiciona uma ou mais colunas
--        ALTER TABLE <tabela> ADD <coluna> <tipo> [, <coluna2> <tipo2>];
--
--   ✏️  ALTER COLUMN → altera o tipo de dado de uma coluna existente
--        ALTER TABLE <tabela> ALTER COLUMN <coluna> <novo_tipo>;
--
--   🗑️  DROP COLUMN → remove uma ou mais colunas
--        ALTER TABLE <tabela> DROP COLUMN <coluna> [, <coluna2>];
--
-- 💡 Dica: ALTER COLUMN pode falhar se a conversão de tipo for incompatível com
--     os dados já armazenados (ex.: FLOAT → INT quando há decimais).
-- ==============================================================================

USE BDImpressionador;

-- 📊 Estado inicial da tabela (criada na Aula 13)
SELECT * FROM Funcionarios;

-- ─────────────────────────────────────────────────────────────────────────────
-- ➕ 1. Adicionando colunas: cargo e bonus
-- ─────────────────────────────────────────────────────────────────────────────

ALTER TABLE Funcionarios
ADD cargo VARCHAR(100), bonus DECIMAL(10, 2);

SELECT * FROM Funcionarios;   -- novas colunas aparecem com NULL

-- ✏️ Atualizando o cargo de Lucas (id = 1)
UPDATE Funcionarios
SET cargo = 'Analista'
WHERE id_funcionario = 1;

SELECT * FROM Funcionarios;

-- ─────────────────────────────────────────────────────────────────────────────
-- ✏️  2. Alterando o tipo da coluna salario: FLOAT → INT
-- ─────────────────────────────────────────────────────────────────────────────

ALTER TABLE Funcionarios
ALTER COLUMN salario INT;

SELECT * FROM Funcionarios;

-- ─────────────────────────────────────────────────────────────────────────────
-- 🗑️  3. Removendo as colunas cargo e bonus
-- ─────────────────────────────────────────────────────────────────────────────

ALTER TABLE Funcionarios
DROP COLUMN cargo, bonus;

-- ✅ Estrutura final da tabela
SELECT * FROM Funcionarios;