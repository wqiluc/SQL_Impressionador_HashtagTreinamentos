-- 📘 MÓDULO 4 — ORDENANDO E FILTRANDO DADOS (SQL Server)
-- Exercícios 1 ao 10 🖍️
-- Observação:
-- Este é um exercício conceitual
-- O banco de dados não está disponível
-- As consultas representam apenas a lógica em SQL
-- =========================================================

/* Todas as Bases de Dados são fictícias e eliminadas após a resolução dos exércicios*/

-- =========================================================
-- 🧠 EXERCÍCIO 1
-- TOP 100 vendas por valor total
-- =========================================================

-- Contexto:
-- Você é gerente da área de compras 🛒
-- Precisa gerar um relatório com as TOP 100 vendas
-- com base no valor total vendido (SalesAmount)
--
-- Dica:
-- Use ordenação decrescente e limite de linhas
--
-- ✍️ Resolução (SQL):

SELECT DISTINCT
    Saleskey as "ID - Venda",
    ProductKey as "Número-Série do produto",
    SalesAmount as "Valor da Venda (U$D):",
    Quantity as "Quantidade",
    SalesDate as "Data da Venda"
from 
    FactSales
limit 
    100;

-- =========================================================
-- 🧠 EXERCÍCIO 2
-- TOP 10 produtos com critério de desempate
-- =========================================================

-- Contexto:
-- Os 10 produtos com maior UnitPrice possuem o mesmo preço 💰
-- É necessário ordenar considerando critérios adicionais
--
-- Regras:
-- Ordenar por UnitPrice;  
-- Em caso de empate, usar Weight;  
-- Se ainda empatar, definir um terceiro critério (ex: ProductName ou ProductKey).
--
-- ✍️ Resolução (SQL):
--

SELECT DISTINCT
    ProductKey as "Número-Chave do Produto",
    ProductName as "Nome do Produto",
    UnitPrice AS "Preço Unitário (U$D)",
    Weight AS "Peso (kg)"
from DimProduct
ORDER BY 
    UnitPrice DESC,
    Weight DESC,
    ProductName DESC;

-- =========================================================
-- 🧠 EXERCÍCIO 3
-- Produtos da categoria A com peso acima de 100kg
-- =========================================================

-- Contexto:
-- Você trabalha na logística 🚚
-- Produtos da categoria A com peso acima de 100kg
-- devem ser transportados primeiro
--
-- Regras:
-- Retornar apenas Nome do Produto e Peso;  
-- Renomear as colunas;  
-- Ordenar do mais pesado para o mais leve.
--
-- ✍️ Resolução (SQL):
--

SELECT DISTINCT
    ProductName as "Nome do Produto",
    Weight as "Peso do Produto (Kg)"
FROM
    DimProduct
ORDER BY
    Weight DESC;

-- =========================================================
-- 🧠 EXERCÍCIO 4
-- Relatório de lojas da Contoso
-- =========================================================

-- Contexto:
-- Criar um relatório com informações das lojas 🏬
--
-- 4.a
-- Descobrir quantas lojas existem no total
-- Retornar: StoreName, OpenDate, EmployeeCount

SELECT DISTINCT
    StoreKey as "ID da Loja",
    StoreName as "Nome da Loja",
    OpenDate as "Data De Inauguração da Loja",
    EmployeeCount as "qtd de Empregados"
from DimStore;

-- 4.b
-- Renomear as colunas para nomes mais intuitivos

    StoreKey as "ID da Loja",
    StoreName as "Nome da Loja",
    OpenDate as "Data De Inauguração da Loja",
    EmployeeCount as "qtd de Empregados",
    Status as "Status de Atividade (Ativo ou Fechado)"

-- 4.c
-- Identificar quantas e quais lojas ainda estão ativas
--
-- ✍️ Resolução (SQL):
--

SELECT DISTINCT
    StoreKey AS "ID da Loja",
    StoreName AS "Nome da Loja",
    OpenDate AS "Data De Inauguração da Loja",
    EmployeeCount AS "qtd de Empregados",
    Status AS "Status de Atividade"
FROM 
    DimStore
WHERE 
    Status <> 'Closed';

-- =========================================================
-- 🧠 EXERCÍCIO 5
-- Produtos Home Theater com defeito
-- =========================================================

-- Contexto:
-- Produtos Home Theater da marca Litware 📺
-- Vendidos no dia 15/03/2009 apresentaram defeito
--
-- Objetivo:
-- Identificar os ID’s desses produtos
--
-- Dica:
-- Utilize filtros por categoria; marca; e data.
--
-- ✍️ Resolução (SQL):

SELECT DISTINCT
    ProductKey AS "ID do Produto",
    ProductName AS "Nome do Produto",
    BrandName AS "Nome da Marca do Produto",
    AvailableDate AS "Data de Disponibilidade"
FROM 
    DimProduct
WHERE 
    ProductName LIKE '%Home Theater%'
AND 
    BrandName = 'Litware'
AND 
    AvailableDate = '2009-03-15';
-- Trocar esses aparelhos defeituosos❌

-- =========================================================
-- 🧠 EXERCÍCIO 6
-- Lojas que não estão mais funcionando
-- =========================================================

-- Contexto:
-- Gerar relatório apenas com lojas inativas ❌
--
-- 6.a
-- Utilizar a coluna Status para filtrar
-- apenas lojas que não estão mais funcionando

SELECT DISTINCT
    StoreKey as "ID da Loja",
    StoreName as "Nome da loja",
    Status as 'Status da Loja'
FROM 
    DimStore
WHERE
    Status <> "Active";

-- 6.b
-- Caso a coluna Status não exista:
-- Pense em outra forma de identificar lojas inativas
-- (ex: data de fechamento ou ausência de data ativa)


-- =========================================================
-- 🧠 EXERCÍCIO 7
-- Classificação de lojas por quantidade de funcionários
-- =========================================================

-- Contexto:
-- Cada loja recebe máquinas de café ☕
-- conforme a quantidade de funcionários
--
-- Regras:
-- Categoria 1: 1 a 20 funcionários → 1 máquina;  
-- Categoria 2: 21 a 50 funcionários → 2 máquinas;  
-- Categoria 3: acima de 51 funcionários → 3 máquinas.
--
-- Objetivo:
-- Identificar quais lojas pertencem a cada categoria
--
-- ✍️ Resolução (SQL):
--

SELECT DISTINCT
    StoreKey AS "ID da Loja",
    StoreName AS "Nome da Loja",
    EmployeeCount AS "QTD de funcionários"
FROM 
    DimStore;

-- Loja 1 = 3 Máquinas ☕️
-- Loja 2 = 1 Máquina ☕️
-- Loja 3 = 2 Máquinas ☕️
-- Loja 4 = 2 Máquinas ☕️
-- Loja 5 = 1 Máquina ☕️
-- Loja 6 = 3 Máquinas ☕️

-- =========================================================
-- 🧠 EXERCÍCIO 8
-- Produtos LCD com desconto
-- =========================================================

-- Contexto:
-- Todas as TVs LCD terão desconto no próximo mês 📉
--
-- Objetivo:
-- Retornar ID; Nome; e Preço
-- de todos os produtos LCD existentes
--
-- ✍️ Resolução (SQL):
--

SELECT DISTINCT
    ProductKey as "ID - Produto",
    ProductName as "Nome do Produto",
    UnitPrice as "Preço Unitário do Produto (U$D)"
FROM 
    DimProduct
WHERE
    ProductName 
        LIKE "%TV LCD%"
ORDER BY
    UnitPrice DESC;

-- =========================================================
-- 🧠 EXERCÍCIO 9
-- Produtos por cor e marca
-- =========================================================

-- Contexto:
-- Criar uma lista de produtos com filtros específicos 🎨
--
-- Regras:
-- Cores permitidas: Green; Orange; Black; Silver; e Pink.  
-- Marcas permitidas: Contoso; Litware; e Fabrikam.
--
-- ✍️ Resolução (SQL):
--

SELECT DISTINCT
    ProductKey as "ID do Produto",
    ProductName as "Nome do Produto",
    BrandName as "Marca do Produto",
    Color as "Cor do Produto",
    Category as "Categoria do Produto"
FROM
    DimProduct
WHERE
    color in 
        ("Green", "Orange", "Black", "Silver", "Pink")
AND
    BrandName in 
            ("Contoso", "Litware", "Fabrikam."); 

-- =========================================================
-- 🧠 EXERCÍCIO 10
-- Produtos Contoso Silver com preço entre 10 e 30
-- =========================================================

-- Contexto:
-- Existem 16 produtos da marca Contoso
-- da cor Silver e com UnitPrice entre 10 e 30 💲
--
-- Objetivo:
-- Identificar esses produtos 🔍
-- Ordenar o resultado por UnitPrice em ordem decrescente
--
-- ✍️ Resolução (SQL):

SELECT DISTINCT
    ProductKey as "ID do Produto",
    ProductName as "Nome do Produto",
    BrandName as "Marca do Produto",
    Color as "Cor do Produto",
    UnitPrice as "Preço do Produto (U$D)"
FROM
    DimProduct
WHERE
    BrandName in ("Contoso")
    AND
    Color in ("Silver")
    AND
    (UnitPrice>=10 AND UnitPrice<=30)
ORDER BY
    UnitPrice DESC;