-- ============================================================
-- 🗄️  SQL Server  |  📦 Módulo 21 — Procedures
-- 📝 Exercícios
-- ============================================================

/*
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📚 ENUNCIADO
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Obs.: As Procedures dos exercícios 1 a 3 serão executadas nas tabelas
originais do banco de dados ContosoRetailDW.

1. Crie uma Procedure que resume o total de produtos por nome da
   categoria. Essa Procedure deve solicitar ao usuário qual marca deve
   ser considerada na análise.

2. Crie uma Procedure que lista os top N clientes de acordo com a data
   de primeira compra. O valor de N deve ser um parâmetro de entrada
   da sua Procedure.

3. Crie uma Procedure que recebe 2 argumentos: MÊS (de 1 a 12) e ANO
   (1996 a 2003). Sua Procedure deve listar todos os funcionários que
   foram contratados no mês/ano informado.

Obs.: Para os exercícios 4, 5 e 6, utilize os códigos abaixo.

DROP DATABASE AlugaFacil
CREATE DATABASE AlugaFacil
USE AlugaFacil

CREATE TABLE Carro(
   id_carro INT,
   placa    VARCHAR(100) NOT NULL,
   modelo   VARCHAR(100) NOT NULL,
   tipo     VARCHAR(100) NOT NULL,
   valor    FLOAT NOT NULL,
   CONSTRAINT carro_id_carro_pk PRIMARY KEY(id_carro)
)

INSERT INTO Carro(id_carro, placa, modelo, tipo, valor) VALUES
   (1, 'CRU-1111', 'Chevrolet Cruze', 'Sedan', 140000),
   (2, 'ARG-2222', 'Fiat Argo', 'Hatch', 80000),
   (3, 'COR-3333', 'Toyota Corolla', 'Sedan', 170000),
   (4, 'TIG-4444', 'Caoa Chery Tiggo', 'SUV', 190000)

4. Crie uma Procedure que insere uma nova linha na tabela Carro. Essa
   nova linha deve conter os seguintes dados:
   -- id = 5
   -- placa = GOL-5555
   -- modelo = Volkswagen Gol
   -- tipo = Hatch
   -- valor = 80000

5. Crie uma Procedure que altera o valor de venda de um carro. A
   Procedure deve receber como parâmetros o id_carro e o novo valor.

6. Crie uma Procedure que exclui um carro a partir do id informado.
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
*/

USE ContosoRetailDW;

SELECT * FROM DimProduct;
SELECT * FROM DimProductSubcategory;
SELECT * FROM DimProductCategory;

-- ==============================================================================
-- 🏋️ Exercício 1: Total de produtos por categoria, filtrando por marca
-- ==============================================================================

CREATE OR ALTER PROCEDURE sp_ResumoProdutosPorCategoria
   @Marca VARCHAR(50)
AS
BEGIN
   SELECT DISTINCT
      DimProductCategory.ProductCategoryName AS "Categoria",
      COUNT(*) AS "Total de Produtos"
   FROM DimProduct
   INNER JOIN 
        DimProductSubcategory
      ON 
        DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey
   INNER JOIN 
        DimProductCategory
      ON 
        DimProductSubcategory.ProductCategoryKey = DimProductCategory.ProductCategoryKey
   WHERE 
        DimProduct.BrandName = @Marca
   GROUP BY 
        DimProductCategory.ProductCategoryName
   ORDER BY 
        COUNT(*) DESC
END

-- Testando a procedure com uma marca específica
EXEC sp_ResumoProdutosPorCategoria @Marca = 'Contoso';

-- ==============================================================================
-- 🏋️ Exercício 2: Top N clientes por data de primeira compra
-- ==============================================================================

-- "Top" aqui considera os clientes mais antigos (os pioneiros, com a
-- DateFirstPurchase mais distante) - por isso a ordenação ASC
CREATE PROCEDURE sp_TopClientesPorPrimeiraCompra
   @N INT
AS
BEGIN
   SELECT TOP (@N)
      CustomerKey AS "Id do Cliente",
      FirstName AS "Primeiro Nome",
      LastName AS "Sobrenome",
      DateFirstPurchase AS "Data da Primeira Compra"
   FROM DimCustomer
   ORDER BY 
        DateFirstPurchase ASC
END

-- Testando a procedure com N = 10
EXEC sp_TopClientesPorPrimeiraCompra @N = 10;

-- ==============================================================================
-- 🏋️ Exercício 3: Funcionários contratados em um mês/ano informado
-- ==============================================================================

CREATE PROCEDURE sp_FuncionariosContratadosNoMesAno
   @Mes INT,
   @Ano INT
AS
BEGIN
   SELECT DISTINCT
      FirstName AS "Primeiro Nome",
      LastName AS "Sobrenome",
      HireDate AS "Data de Contratação"
   FROM DimEmployee
   WHERE 
    MONTH(HireDate) = @Mes AND 
    YEAR(HireDate) = @Ano
END

-- Testando a procedure com um mês/ano dentro do intervalo disponível na base
EXEC sp_FuncionariosContratadosNoMesAno @Mes = 3, @Ano = 1998;

-- ==============================================================================
-- 🔧 Setup para os exercícios 4, 5 e 6: banco AlugaFacil
-- ==============================================================================

DROP DATABASE IF EXISTS AlugaFacil;
CREATE DATABASE AlugaFacil;
USE AlugaFacil;

CREATE TABLE Carro
(
   id_carro INT,
   placa    VARCHAR(100) NOT NULL,
   modelo   VARCHAR(100) NOT NULL,
   tipo     VARCHAR(100) NOT NULL,
   valor    FLOAT NOT NULL,
   CONSTRAINT carro_id_carro_pk PRIMARY KEY(id_carro)
)

INSERT INTO Carro(id_carro, placa, modelo, tipo, valor) 
VALUES
   (1, 'CRU-1111', 'Chevrolet Cruze', 'Sedan', 140000),
   (2, 'ARG-2222', 'Fiat Argo', 'Hatch', 80000),
   (3, 'COR-3333', 'Toyota Corolla', 'Sedan', 170000),
   (4, 'TIG-4444', 'Caoa Chery Tiggo', 'SUV', 190000)

-- ==============================================================================
-- 🏋️ Exercício 4: Inserindo um carro novo
-- ==============================================================================

CREATE PROCEDURE sp_InserirCarro
   @id_carro INT,
   @placa    VARCHAR(100),
   @modelo   VARCHAR(100),
   @tipo     VARCHAR(100),
   @valor    FLOAT
AS
BEGIN
   INSERT INTO Carro(id_carro, placa, modelo, tipo, valor)
   VALUES (@id_carro, @placa, @modelo, @tipo, @valor)
END

-- Testando a procedure com os dados pedidos no enunciado
EXEC sp_InserirCarro
(
   @id_carro = 5,
   @placa    = 'GOL-5555',
   @modelo   = 'Volkswagen Gol',
   @tipo     = 'Hatch',
   @valor    = 80000
);

-- ==============================================================================
-- 🏋️ Exercício 5: Alterando o valor de venda de um carro
-- ==============================================================================

CREATE PROCEDURE sp_AlterarValorCarro
   @id_carro   INT,
   @novo_valor FLOAT
AS
BEGIN
   UPDATE Carro
   SET valor = @novo_valor
   WHERE id_carro = @id_carro
END

-- Testando a procedure: reduzindo o valor do carro recém-inserido (id 5)
EXEC sp_AlterarValorCarro @id_carro = 5, @novo_valor = 75000;

-- ==============================================================================
-- 🏋️ Exercício 6: Excluindo um carro
-- ==============================================================================

CREATE PROCEDURE sp_ExcluirCarro
   @id_carro INT
AS
BEGIN
   DELETE FROM Carro
   WHERE id_carro = @id_carro
END

-- Testando a procedure: excluindo o carro de id 5
EXEC sp_ExcluirCarro @id_carro = 5;