-- ==============================================================================
-- [SQL Server] Views - Módulo 11 🖼️
-- Exercícios
-- ==============================================================================

-- ==============================================================================
-- Exercício 1: Criando Views básicas
-- ==============================================================================
-- • Enunciado:
--   a) A partir da tabela DimProduct, crie uma View contendo ProductName, ColorName,
--      UnitPrice e UnitCost. Chame essa View de vwProdutos.
--
--   b) A partir da tabela DimEmployee, crie uma View mostrando FirstName, BirthDate
--      e DepartmentName. Chame essa View de vwFuncionarios.
--
--   c) A partir da tabela DimStore, crie uma View mostrando StoreKey, StoreName e
--      OpenDate. Chame essa View de vwLojas.
--
-- Responda Aqui: 👇

-- a)
GO

CREATE VIEW vwProdutos AS
SELECT
    ProductName AS 'Nome do Produto',
    ColorName AS 'Cor',
    UnitPrice AS 'Preço Unitário',
    UnitCost AS 'Custo Unitário'
FROM
    DimProduct;

GO

SELECT * FROM vwProdutos

-- b)
GO

CREATE VIEW vwFuncionarios AS
SELECT
    FirstName AS 'Nome',
    BirthDate AS 'Data de Nascimento',
    DepartmentName AS 'Departamento'
FROM
    DimEmployee;

GO

SELECT * FROM vwFuncionarios;

-- c)
GO

CREATE VIEW vwLojas AS
SELECT
    StoreKey AS 'ID da Loja',
    StoreName AS 'Nome da Loja',
    OpenDate AS 'Data de Abertura'
FROM
    DimStore;

GO

SELECT * FROM vwLojas;

-- ==============================================================================
-- Exercício 2: View com transformações de colunas
-- ==============================================================================
-- • Enunciado: Crie uma View contendo as informações de:
--   - Nome Completo (FirstName + LastName)
--   - Gênero (por extenso: 'Masculino' / 'Feminino')
--   - E-mail
--   - Renda Anual (formatada com R$)
--   Utilize a tabela DimCustomer. Chame essa View de vwClientes.
--
-- Responda Aqui: 👇

GO

CREATE VIEW vwClientes AS
SELECT
    FirstName + ' ' + LastName AS 'Nome Completo',
    CASE
        WHEN 
            Gender = 'M' 
        THEN 
            'Masculino'
        WHEN 
            Gender = 'F' 
        THEN 
            'Feminino'
        ELSE 
            'Não Informado'
    END AS 'Gênero',
    EmailAddress AS 'E-mail',
    'R$ ' + CONVERT(VARCHAR, FORMAT(YearlyIncome, 'N2')) AS 'Renda Anual'
FROM
    DimCustomer;

GO

SELECT * FROM vwClientes;

-- ==============================================================================
-- Exercício 3: Views com filtros (WHERE)
-- ==============================================================================
-- • Enunciado:
--   a) A partir da tabela DimStore, crie uma View que considera apenas as lojas
--      ativas. Faça um SELECT de todas as colunas. Chame de vwLojasAtivas.
--
--   b) A partir da tabela DimEmployee, crie uma View que considera apenas os
--      funcionários da área de Marketing. SELECT de FirstName, EmailAddress e
--      DepartmentName. Chame de vwFuncionariosMkt.
--
--   c) Crie uma View que considera apenas os produtos das marcas Contoso e Litware,
--      e somente os de cor Silver. SELECT de todas as colunas da DimProduct.
--      Chame de vwContosoLitwareSilver.
--
-- Responda Aqui: 👇

-- a)
GO

CREATE VIEW vwLojasAtivas AS
SELECT DISTINCT 
    *
FROM
    DimStore
WHERE 
    Status = 'On';

GO

SELECT * FROM vwLojasAtivas;

-- b)
GO

CREATE VIEW vwFuncionariosMkt AS
SELECT
    FirstName AS 'Nome',
    EmailAddress AS 'E-mail',
    DepartmentName AS 'Departamento'
FROM
    DimEmployee
WHERE 
    DepartmentName = 'Marketing';

GO

SELECT * FROM vwFuncionariosMkt

-- c)
GO

CREATE VIEW vwContosoLitwareSilver AS
SELECT *
FROM
    DimProduct
WHERE
    BrandName IN ('Contoso', 'Litware')
AND 
    ColorName = 'Silver';

GO

SELECT * FROM vwContosoLitwareSilver;

-- ==============================================================================
-- Exercício 4: View com JOIN e GROUP BY
-- ==============================================================================
-- • Enunciado: Crie uma View que seja o resultado de um agrupamento da tabela
--   FactSales, considerando a SalesQuantity (Quantidade Total Vendida) por Nome
--   do Produto. Use um JOIN entre FactSales e DimProduct.
--   Chame de vwTotalVendidoProdutos.
--
-- Responda Aqui: 👇

GO

CREATE VIEW vwTotalVendidoProdutos AS
SELECT
    Produto.ProductName AS 'Nome do Produto',
    SUM(Vendas.SalesQuantity) AS 'Quantidade Total Vendida'
FROM
    FactSales AS "Vendas"
INNER JOIN
    DimProduct AS "Produto"
        ON Vendas.ProductKey = Produto.ProductKey
GROUP BY
    Produto.ProductName;

GO

SELECT * FROM vwTotalVendidoProdutos;

-- ==============================================================================
-- Exercício 5: Alterando as Views da Questão 1 (ALTER VIEW)
-- ==============================================================================
-- • Enunciado:
--   a) Na View vwProdutos (questão 1a), adicione a coluna BrandName.
--   b) Na View vwFuncionarios (questão 1b), filtre apenas funcionários do sexo feminino.
--   c) Na View vwLojas (questão 1c), filtre apenas as lojas ativas.
--
-- Responda Aqui: 👇

-- a) Adiciona BrandName na vwProdutos

ALTER VIEW vwProdutos AS
SELECT
    ProductName AS 'Nome do Produto',
    ColorName AS 'Cor',
    UnitPrice AS 'Preço Unitário',
    UnitCost AS 'Custo Unitário',
    BrandName AS 'Marca'
FROM
    DimProduct;

GO

SELECT * FROM vwProdutos;

-- b) Filtra apenas funcionárias do sexo feminino na vwFuncionarios

ALTER VIEW vwFuncionarios AS
SELECT
    FirstName AS 'Nome',
    BirthDate AS 'Data de Nascimento',
    DepartmentName AS 'Departamento'
FROM
    DimEmployee
WHERE Gender = 'F';

GO

SELECT * FROM vwFuncionarios;

-- c) Filtra apenas lojas ativas na vwLojas

ALTER VIEW vwLojas AS
SELECT
    StoreKey AS 'ID da Loja',
    StoreName AS 'Nome da Loja',
    OpenDate AS 'Data de Abertura'
FROM
    DimStore
WHERE Status = 'On';

GO

SELECT * FROM vwLojas;

-- ==============================================================================
-- Exercício 6: Agrupamento, Alteração e Exclusão de View
-- ==============================================================================
-- • Enunciado:
--   a) Crie uma View que seja o resultado de um agrupamento da tabela DimProduct.
--      O resultado deve mostrar o total de produtos por marca.
--      Chame de vw_6a.
--
--   b) Altere a vw_6a adicionando o peso total por marca.
--      Sua View final deve ter 3 colunas: Nome da Marca, Total de Produtos e Peso Total.
--
--   c) Exclua a View vw_6a.
--
-- Responda Aqui: 👇

-- a)

GO

CREATE VIEW vw_6a AS
SELECT
    BrandName AS 'Marca',
    COUNT(ProductKey) AS 'Total de Produtos'
FROM
    DimProduct
GROUP BY
    BrandName;

GO

SELECT * FROM vw_6a;

-- b) Adiciona coluna de Peso Total

ALTER VIEW vw_6a AS
SELECT
    BrandName AS 'Marca',
    COUNT(ProductKey) AS 'Total de Produtos',
    SUM(UnitWeight) AS 'Peso Total'
FROM
    DimProduct
GROUP BY
    BrandName;

GO

SELECT * FROM vw_6a;

-- c)

DROP VIEW vw_6a;