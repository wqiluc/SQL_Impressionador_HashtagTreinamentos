-- ==============================================================================
-- 🗄️ [SQL Server] CRUD - Módulo 12
-- 📘 Aula 6 de 21 - CREATE TABLE - Criando a primeira tabela
-- ==============================================================================
-- 🎯 Objetivo: Aprender a criar uma tabela do zero usando CREATE TABLE.
--
-- 📌 Sintaxe:
--   CREATE TABLE <nome_tabela>
--   (
--       <coluna1> <tipo_de_dado>,
--       <coluna2> <tipo_de_dado>,
--       ...
--   );
--
-- 🔢 Tipos de dados mais comuns no SQL Server:
--   • INT            → números inteiros          (ex.: 1, 42, 1000)
--   • FLOAT          → números decimais          (ex.: 9.99, 3.14)
--   • DECIMAL(p, s)  → decimais com precisão     (ex.: DECIMAL(10,2) → 99999999.99)
--   • VARCHAR(n)     → texto de tamanho variável (ex.: 'Lucas', 'Produto A')
--   • CHAR(n)        → texto de tamanho fixo     (ex.: siglas, códigos)
--   • DATE           → data sem hora             (ex.: 2021-12-31)
--   • DATETIME       → data com hora             (ex.: 2021-12-31 23:59:59)
--   • BIT            → booleano 0 ou 1           (ex.: ativo/inativo)
--
-- 💡 Dica: Após criar a tabela, ela fica vazia. Use INSERT INTO para popular.
-- ==============================================================================

-- 🏦 Criando o banco de dados (execute apenas uma vez)

CREATE DATABASE BDImpressionador;

-- ⚠️ Obs: Se o BDImpressionador já existir, não execute a linha acima.

-- 🔌 Conectando ao banco de dados

USE BDImpressionador;

-- 🏗️ Criando a tabela Produtos ------------------------------------------------
-- • id_produto    → chave identificadora do produto   (INT)
-- • nome_produto  → nome descritivo do produto        (VARCHAR)
-- • data_validade → data de vencimento do produto     (DATETIME)
-- • preco_produto → preço de venda do produto         (FLOAT)

CREATE TABLE Produtos
(
    id_produto    INT,
    nome_produto  VARCHAR(200),
    data_validade DATETIME,
    preco_produto FLOAT
);

-- ✅ Verificando a tabela criada (deve retornar 0 linhas — ainda vazia)
SELECT * FROM Produtos;