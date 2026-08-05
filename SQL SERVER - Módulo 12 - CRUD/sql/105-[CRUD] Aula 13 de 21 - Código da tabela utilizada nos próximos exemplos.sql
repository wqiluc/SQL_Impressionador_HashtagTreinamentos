-- ==============================================================================
-- 🗄️ [SQL Server] CRUD - Módulo 12
-- 📘 Aula 13 de 21 - Código da tabela utilizada nos próximos exemplos
-- ==============================================================================
-- 🎯 Objetivo: Criar e popular a tabela Funcionarios que será usada nas
--              aulas seguintes de ALTER TABLE.
--
-- 👷 Estrutura da tabela:
--   id_funcionario   INT          → identificador único
--   nome_funcionario VARCHAR(100) → nome do funcionário
--   salario          FLOAT        → salário mensal
--   data_nascimento  DATE         → data de nascimento
-- ==============================================================================

USE BDImpressionador;

-- 🏗️ Criando a tabela Funcionarios --------------------------------------------

CREATE TABLE Funcionarios
(
    id_funcionario   INT,
    nome_funcionario VARCHAR(100),
    salario          FLOAT,
    data_nascimento  DATE
);

-- 📝 Inserindo 10 funcionários de exemplo ------------------------------------

INSERT INTO Funcionarios (id_funcionario, nome_funcionario, salario, data_nascimento)
VALUES
    (1,  'Lucas'   , 1500, '1990-03-20'),
    (2,  'Andressa', 2300, '1988-12-07'),
    (3,  'Felipe'  , 4000, '1993-02-13'),
    (4,  'Marcelo' , 7100, '1993-04-10'),
    (5,  'Carla'   , 3200, '1986-09-02'),
    (6,  'Juliana' , 5500, '1989-01-21'),
    (7,  'Mateus'  , 1900, '1993-11-02'),
    (8,  'Sandra'  , 3900, '1990-05-09'),
    (9,  'André'   , 1000, '1994-03-13'),
    (10, 'Julio'   , 4700, '1992-07-05');

-- ✅ Verificando os dados inseridos
SELECT * FROM Funcionarios;