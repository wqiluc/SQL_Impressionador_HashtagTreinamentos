-- ==============================================================================
-- 🗄️ [SQL Server] CRUD - Módulo 12 🏗️
-- 📝 Exercícios - CREATE TABLE, INSERT, UPDATE, DELETE, ALTER TABLE
-- ==============================================================================
-- 📌 Banco de dados utilizado: BDImpressionador
-- 📌 Tabela de apoio:          ContosoRetailDW.dbo.DimProduct
-- ==============================================================================

USE BDImpressionador;

-- ==============================================================================
-- 🏋️ Exercício 1: CREATE TABLE + INSERT INTO (VALUES)
-- ==============================================================================
-- • Enunciado:
--   a) Crie uma tabela chamada Clientes com as colunas:
--        id_cliente    INT
--        nome_cliente  VARCHAR(150)
--        email_cliente VARCHAR(200)
--        cidade        VARCHAR(100)
--        saldo         DECIMAL(10,2)
--
--   b) Insira manualmente 5 clientes de exemplo na tabela.
--
--   c) Faça um SELECT para verificar os dados inseridos.
--
-- Responda Aqui: 👇

-- a) Criando a tabela Clientes

CREATE TABLE Clientes
(
    id_cliente    INT,
    nome_cliente  VARCHAR(150),
    email_cliente VARCHAR(200),
    cidade        VARCHAR(100),
    saldo         DECIMAL(10, 2)
);

-- b) Inserindo 5 clientes manualmente

INSERT INTO Clientes (id_cliente, nome_cliente, email_cliente, cidade, saldo)
VALUES
    (1, 'Ana Lima'       , 'ana.lima@email.com'       , 'São Paulo'      , 1500.00),
    (2, 'Bruno Souza'    , 'bruno.souza@email.com'    , 'Rio de Janeiro' , 3200.50),
    (3, 'Camila Ferreira', 'camila.ferreira@email.com', 'Belo Horizonte' ,  800.75),
    (4, 'Daniel Rocha'   , 'daniel.rocha@email.com'   , 'Curitiba'       , 5100.00),
    (5, 'Elisa Torres'   , 'elisa.torres@email.com'   , 'Porto Alegre'   , 2300.20);

-- c) Verificando os dados
SELECT * FROM Clientes;

-- ==============================================================================
-- 🏋️ Exercício 2: INSERT SELECT - Copiando dados de outra tabela
-- ==============================================================================
-- • Enunciado:
--   a) Crie uma tabela chamada Produtos com as colunas:
--        id_produto    INT
--        nome_produto  VARCHAR(200)
--        marca         VARCHAR(100)
--        preco         FLOAT
--
--   b) Popule a tabela Produtos copiando os dados de ContosoRetailDW.dbo.DimProduct:
--        ProductKey  → id_produto
--        ProductName → nome_produto
--        BrandName   → marca
--        UnitPrice   → preco
--
--   c) Quantos produtos foram inseridos? Verifique com COUNT(*).
--
-- Responda Aqui: 👇

-- a) Criando a tabela Produtos

CREATE TABLE Produtos
(
    id_produto   INT,
    nome_produto VARCHAR(200),
    marca        VARCHAR(100),
    preco        FLOAT
);

-- b) Inserindo dados a partir de DimProduct

INSERT INTO Produtos (id_produto, nome_produto, marca, preco)
SELECT
    ProductKey,
    ProductName,
    BrandName,
    UnitPrice
FROM
    ContosoRetailDW.dbo.DimProduct;

-- c) Contando os produtos inseridos
SELECT COUNT(*) AS 'Total de Produtos Inseridos' FROM Produtos;

-- Visão geral
SELECT * FROM Produtos;

-- ==============================================================================
-- 🏋️ Exercício 3: UPDATE - Atualizando registros
-- ==============================================================================
-- • Enunciado: Utilizando a tabela Clientes criada no Exercício 1:
--
--   a) Atualize o saldo de 'Ana Lima' para 2000.00.
--
--   b) Atualize a cidade de todos os clientes de 'São Paulo' para 'SP'.
--
--   c) Atualize o e-mail de Daniel Rocha (id_cliente = 4)
--      para 'daniel.novo@email.com'.
--
--   d) Faça um SELECT final para verificar todas as alterações.
--
-- Responda Aqui: 👇

-- a) Atualizando o saldo de Ana Lima
UPDATE Clientes
SET saldo = 2000.00
WHERE nome_cliente = 'Ana Lima';

-- b) Atualizando cidade de São Paulo → SP
UPDATE Clientes
SET cidade = 'SP'
WHERE cidade = 'São Paulo';

-- c) Atualizando e-mail de Daniel Rocha
UPDATE Clientes
SET email_cliente = 'daniel.novo@email.com'
WHERE id_cliente = 4;

-- d) Verificando todas as alterações
SELECT * FROM Clientes;

-- ==============================================================================
-- 🏋️ Exercício 4: DELETE - Removendo registros
-- ==============================================================================
-- • Enunciado: Utilizando a tabela Clientes:
--
--   a) Delete o cliente com id_cliente = 3 (Camila Ferreira).
--
--   b) Delete todos os clientes com saldo menor que 1000.00.
--
--   c) Faça um SELECT para confirmar que apenas os clientes corretos foram removidos.
--
-- Responda Aqui: 👇

-- a) Deletando Camila Ferreira (id = 3)
DELETE FROM Clientes
WHERE id_cliente = 3;

-- b) Deletando clientes com saldo < 1000
DELETE FROM Clientes
WHERE saldo < 1000.00;

-- c) Verificando os clientes restantes
SELECT * FROM Clientes;

-- ==============================================================================
-- 🏋️ Exercício 5: ALTER TABLE + DROP TABLE
-- ==============================================================================
-- • Enunciado: Utilizando a tabela Produtos criada no Exercício 2:
--
--   a) Adicione duas novas colunas: estoque INT e desconto DECIMAL(5,2).
--
--   b) Altere o tipo da coluna preco de FLOAT para DECIMAL(10,2).
--
--   c) Remova a coluna desconto.
--
--   d) Faça um SELECT para verificar a estrutura final da tabela.
--
--   e) Exclua definitivamente as tabelas Produtos e Clientes com DROP TABLE.
--
-- Responda Aqui: 👇

-- a) Adicionando colunas estoque e desconto
ALTER TABLE Produtos
ADD estoque INT, desconto DECIMAL(5, 2);

SELECT * FROM Produtos;

-- b) Alterando o tipo de preco para DECIMAL(10,2)
ALTER TABLE Produtos
ALTER COLUMN preco DECIMAL(10, 2);

SELECT * FROM Produtos;

-- c) Removendo a coluna desconto
ALTER TABLE Produtos
DROP COLUMN desconto;

-- d) Verificando a estrutura final
SELECT * FROM Produtos;

-- e) Excluindo as tabelas
DROP TABLE Produtos;
DROP TABLE Clientes;