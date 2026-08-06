-- =========================================================
-- 📘 [SQL Server] FUNÇÕES DE AGREGAÇÃO
-- MÓDULO 5 — LISTA DE EXERCÍCIOS
-- =========================================================
-- Instruções:
-- • Utilize boas práticas de organização
-- • Escreva suas resoluções nos espaços indicados
-- • O foco é demonstrar o raciocínio em SQL
-- =========================================================

/* Todas as Bases de Dados são fictícias e eliminadas após a resolução dos exércicios*/

-- =========================================================
-- 🧠 EXERCÍCIO 1
-- Análise de vendas e devoluções por canal
-- =========================================================
-- Contexto:
-- O gerente comercial solicitou uma análise da:
-- • Quantidade Vendida 🛒
-- • Quantidade Devolvida 🔄
--
-- Canal analisado:
-- • Store (canal de venda mais importante da empresa)
--
-- Regras:
-- • Utilize funções de agregação
-- • Considere a tabela FactSales
--
-- ✍️ Resolução (SQL):

SELECT DISTINCT
    SalesQuantity as "SUM. Vendas (padrão)",
    ReturnQuantity as "SUM. Retornada (padrão)",
    SalesChannel as "Canal de Vendas"
FROM
    FactSales
WHERE 
    SalesChannel = "Store";

SELECT DISTINCT
    SUM(SalesQuantity) as "SUM. Vendas",
    SUM(ReturnQuantity) as "SUM. Retornada",
    SalesChannel as "Canal de Vendas"
FROM
    FactSales
WHERE 
    SalesChannel = "Store"
ORDER BY
    SalesChannel;

-- =========================================================
-- 🧠 EXERCÍCIO 2
-- Média salarial de clientes por ocupação
-- =========================================================
-- Contexto:
-- O setor de Marketing precisa avaliar a
-- média salarial dos clientes 👥
--
-- Filtro obrigatório🚿:
-- • Apenas clientes com ocupação "Professional"
--
-- Regras:
-- • Utilize a função AVG🗽;
-- • Considere a tabela DimCustomer;
--
-- ✍️ Resolução (SQL):

SELECT DISTINCT
    CustomerKey as "ID - CLIENTE",
    FirstName as "Primeiro nome do Cliente",
    LastName as "Último Nome do Cliente",
    Occupation as "Cargo do Cliente",
    AVG(YearlyIncome) as "Média Salarial dos Clientes"
FROM 
    DimCustomer
WHERE
    Occupation = "Professional"
GROUP BY
    CustomerKey,
    FirstName,
    LastName,
    Occupation
ORDER BY
    AVG(YearlyIncome) ASC;

-- =========================================================
-- 🧠 EXERCÍCIO 3
-- Análise de funcionários das lojas
-- =========================================================
-- Contexto:
-- O gerente solicitou uma análise da quantidade
-- de funcionários das lojas 🏬
--
-- Informações solicitadas:
-- a) Quantidade de funcionários da loja com MAIS funcionários ⬆️
-- b) Nome dessa loja
-- c) Quantidade de funcionários da loja com MENOS funcionários ⬇️
-- d) Nome dessa loja
--
-- Dica:
-- • Utilize funções MAX e MIN
-- • A tabela DimStore será necessária
--
-- ✍️ Resolução (SQL):

SELECT
    StoreKey AS "ID - Loja",
    StoreName AS "Nome da Loja",
    EmployeeCount AS "Qtd. Funcionários"
FROM DimStore
WHERE 
    EmployeeCount = (SELECT MIN(EmployeeCount) FROM DimStore)
    OR
    EmployeeCount = (SELECT MAX(EmployeeCount) FROM DimStore)
ORDER BY
    EmployeeCount ASC;

-- =========================================================
-- 🧠 EXERCÍCIO 4
-- Análise de funcionários por sexo
-- =========================================================
-- Contexto:
-- A área de RH precisa de informações
-- sobre os colaboradores da empresa 🧑‍💼👩‍💼
--
-- 4.a
-- Descobrir a quantidade total de funcionários:
-- • Sexo Masculino ♂️
-- • Sexo Feminino ♀️

SELECT DISTINCT
    COUNT(Gender = "Male") as "Genero Masculino",
    COUNT(Gender = "Female") as "Genero Feminino"
FROM
    DimCustomer;

-- 4.b
-- Descobrir quem são:
-- • O funcionário mais antigo
-- • A funcionária mais antiga

SELECT DISTINCT
    CustomerKey AS "ID - Funcionário mais antigo",
    FirstName AS "Nome do Funcionário mais antigo",
    HireDate AS "Data de Contratação"
FROM DimCustomer
WHERE
    Gender = 'Male'
    AND
    HireDate BETWEEN '2010-01-01' AND '2020-12-31'
ORDER BY 
    HireDate ASC
LIMIT 
    1;


SELECT DISTINCT
    CustomerKey AS "ID - Funcionária mais antiga",
    FirstName AS "Nome do Funcionária mais antiga",
    HireDate AS "Data de Contratação"
FROM 
    DimCustomer
WHERE
    Gender = 'FeMale'
    AND
    HireDate BETWEEN '2010-01-01' AND '2020-12-31'
ORDER BY 
    HireDate ASC
LIMIT 
    1;

-- Informações necessárias:
-- • Nome
-- • E-mail
-- • Data de Contratação
--
-- ✍️ Resolução (SQL):


SELECT DISTINCT
    FirstName AS "Nome do Funcionário(a) mais antigo(a)",
    LastName as "Último nome do Funcionário(a) mais antigo(a)",
    EmailAdress as "Endereço de E-mail do funcionário(a)"
    HireDate AS "Data de Contratação do Funcionário (a) mais antigo(a)"


-- =========================================================
-- 🧠 EXERCÍCIO 5
-- Análise de diversidade de produtos
-- =========================================================
-- Contexto:
-- Você precisa realizar uma análise geral
-- dos produtos cadastrados 📦
--
-- Informações solicitadas:
-- a) Quantidade DISTINTA de cores 🎨
-- b) Quantidade DISTINTA de marcas 🏷️
-- c) Quantidade DISTINTA de classes de produto 🧩
--
-- Observação:
-- • Todas essas informações podem ser obtidas
--   em UMA ÚNICA consulta
--
-- ✍️ Resolução (SQL):

SELECT
    COUNT(DISTINCT Color) AS "Qtd. Cores Distintas ",
    COUNT(DISTINCT BrandName) AS "Qtd. Marcas Distintas ",
    COUNT(DISTINCT ProductClass) AS "Qtd. Classes Distintas "
FROM
    DimProduct;