/*
===========================================================
📘 MÓDULO 6 - LISTA DE EXERCÍCIOS
🔗 JOINS NO SQL SERVER
===========================================================



🎯 OBJETIVO:
Os JOINs permitem combinar informações de duas ou mais
tabelas através de uma coluna em comum (chave).

Tipos principais:
🔹 INNER JOIN → retorna apenas registros que existem nas duas tabelas🏆;
🔹 LEFT JOIN → retorna todos da tabela da esquerda + correspondências🏆;
🔹 CROSS JOIN → gera combinação total entre tabelas🏆.

Agora é sua vez!! 🚀
*/

/* Todas as Bases de Dados são fictícias e eliminadas após a resolução dos exércicios*/


/* ===========================================================
1️⃣ INNER JOIN - Produto e Subcategoria
===========================================================

🎯 Objetivo:
Trazer o nome da subcategoria (DimProductSubcategory)
para cada produto da tabela DimProduct.

🧠 Dica:
- Identifique a chave em comum entre as tabelas
- Use INNER JOIN
- Pense: todo produto tem subcategoria?

📌 Esperado:
Tabela com Produto + Nome da Subcategoria

=========================================================== */
/*
✍️ RESOLUÇÃO: */

SELECT
  *
FROM
  DimProduct;

SELECT 
  *
FROM
  DimProductSubcategory;

SELECT
  Dimproduct.ProductKey,
  Dimproduct.ProductName,
  DimProductSubcategory.ProductSubcategoryName
FROM
  DimProduct
INNER JOIN 
  DimProductSubcategory
    ON  Dimproduct.ProductKey = DimproductSubcategory.ProductCategoryKey
WHERE
  ProductSubcategoryName <> "Sem Produto";
      
/* ===========================================================
2️⃣ LEFT JOIN - Subcategoria e Categoria
===========================================================

🎯 Objetivo:
Descobrir qual coluna relaciona:
- DimProductSubcategory
- DimProductCategory

Utilize LEFT JOIN para complementar informações.

🧠 Dica:
- Qual chave conecta as duas?
- LEFT JOIN mantém todas as subcategorias,
  mesmo que alguma não tenha categoria.

📌 Esperado:
Subcategoria + Nome da Categoria

=========================================================== */

/*
✍️ RESOLUÇÃO: */ 

SELECT
  *
FROM
  DimProductCategory;

SELECT 
  *
FROM
  DimProductSubcategory;

SELECT DISTINCT
  DimProductCategory.ProductCategoryKey,
  DimProductSubcategory.ProductSubcategoryKey,
  DimproductCategory.ProductCategoryName,
  DimProductSubcategory.ProductSubcategoryName
FROM
  DimProductCategory
LEFT JOIN 
  DimProductSubcategory
  ON DimProductCategory.ProductCategoryKey = DimProductSubcategory.ProductSubcategoryKey;


/* ===========================================================
3️⃣ LEFT JOIN - Loja e Localização
===========================================================

🎯 Objetivo:
Para cada loja (DimStore), descobrir:
🌍 Continente
🏳️ País

Tabelas envolvidas:
- DimStore
- DimGeography

📌 Seu SELECT deve conter APENAS:
- StoreKey
- StoreName
- EmployeeCount
- ContinentName
- RegionCountryName

🧠 Dica:
- Qual chave liga loja à geografia?
- Use LEFT JOIN

=========================================================== */

/*
✍️ RESOLUÇÃO: */ 

SELECT * FROM DimStore;
SELECT * FROM DimGeography;

SELECT
  DimStore.StoreKey,
  DimStore.StoreName,
  DimStore.GeographyKey,
  DimGeography.ContinentName,
  DimGeography.RegionCountryName
FROM
  DimStore
LEFT JOIN DimGeography
  on DimStore.GeographyKey = DimGeography.GeographyKey
LIMIT 2;

/* ===========================================================
4️⃣ JOIN Encadeado - Produto até Categoria
===========================================================

🎯 Objetivo:
Complementar DimProduct com:
📄 ProductCategoryDescription

⚠️ Atenção:
Produto NÃO liga direto com Categoria.
Você precisará passar por Subcategoria.

🧠 Estrutura mental:
Produto → Subcategoria → Categoria

📌 Retorne apenas 5 colunas relevantes.

=========================================================== */

/*
✍️ RESOLUÇÃO: */

SELECT * from DimProduct;
SELECT * FROM DimProductCategory;
SELECT * FROM DimProductSubcategory;

SELECT
  DimProduct.ProductKey,
  DimProductCategory.ProductCategoryKey,
  DimProductSubcategory.ProductSubcategoryKey,
  DimProduct.ProductName,
  DimProductSubcategory.ProductSubcategoryName,
  DimProductCategory.ProductCategoryDescription
FROM
  DimProduct
INNER JOIN /*Junt DimProduct com DimProductSubCategory*/
  DimProductSubcategory
    ON 
      DimProduct.ProductSubcategoryKey = DimProductSubcategory.ProductSubcategoryKey
INNER JOIN  /*Junt DimProductCategory com DimProductSubcategory*/
  DimProductCategory
    ON 
      DimProductSubcategory.ProductCategoryKey = DimProductCategory.ProductCategoryKey;

/* ===========================================================
5️⃣ a) Explorando FactStrategyPlan
===========================================================

🎯 Objetivo:
Visualizar as 100 primeiras linhas da tabela.

🧠 Dica:
Use TOP 100 para analisar a estrutura.

📌 Pergunte-se:
- Quais são as chaves?
- Quais colunas parecem estrangeiras?

=========================================================== */

/*
✍️ RESOLUÇÃO: */ 

SELECT DISTINCT
  StrategyPlanKey as "ID",
  DateKey as "Data",
  AccountKey as "Chave da Conta",
  ScenarioKey as "Cenário da Conta",
  Amount as "QTD. U$D CONTA (value)"
FROM 
  FactStrategyPlan
LIMIT
  100;

/*Chave Principal =  StrategyPlanKey, AccountKey e ScenarioKey
Chaves Estrangeiras/Secundárias =DateKey e Amount*/

/* ===========================================================
5️⃣ b) INNER JOIN - AccountName
===========================================================

🎯 Objetivo:
Trazer AccountName para cada AccountKey.

Tabelas:
- FactStrategyPlan
- DimAccount

📌 O SELECT final deve conter:
- StrategyPlanKey
- DateKey
- AccountName
- Amount

🧠 Dica:
Fact table sempre aponta para dimensão.

=========================================================== */

/*
✍️ RESOLUÇÃO: */ 


SELECT * FROM FactStrategyPlan;
SELECT * FROM DimAccount;

SELECT
  FactStrategyPlan.StrategyPlanKey,
  FactStrategyPlan.DateKey,
  DimAccount.AccountKey,
  FactStrategyPlan.Amount
FROM 
  FactStrategyPlan
INNER JOIN DimAccount ON
    FactStrategyPlan.AccountKey = DimAccount.AccountKey;

/* ===========================================================
6️⃣ INNER JOIN - ScenarioName
===========================================================

🎯 Objetivo:
Trazer o nome do cenário (ScenarioName)
para cada ScenarioKey.

📊 Cenários possíveis:
- Real
- Orçado
- Previsão

📌 Retornar:
- StrategyPlanKey
- DateKey
- ScenarioName
- Amount

🧠 Pergunta:
Qual tabela guarda o nome do cenário?

=========================================================== */

/*
✍️ RESOLUÇÃO: */ 

SELECT * FROM DimScenario;
SELECT * FROM FactStrategyPlan;

SELECT
  DimScenario.ScenarioKey,
  DimScenario.ScenarioName,
  FactStrategyPlan.DateKey,
  FactStrategyPlan.ScenarioKey,
  FactStrategyPlan.Amount
FROM
  DimScenario
INNER JOIN FactStrategyPlan ON
  DimScenario.ScenarioKey = FactStrategyPlan.StrategyPlanKey
ORDER BY
  Amount ASC;

/* ===========================================================
7️⃣ Subcategorias sem Produtos
===========================================================

🎯 Objetivo:
Identificar subcategorias que NÃO possuem
nenhum produto associado.

🧠 Dica poderosa:
- Use LEFT JOIN
- Depois filtre onde a tabela da direita é NULL

📌 Pergunta lógica:
Se não existe produto, o que ficará NULL?

=========================================================== */

/*
✍️ RESOLUÇÃO:*/ 


SELECT * FROM DimProduct;
SELECT * FROM DimProductSubcategory;

SELECT 
  DimProduct.ProductKey,
  DimProduct.ProductName,
  DimProductSubcategory.ProductSubcategoryKey,
  DimProductSubcategory.ProductSubcategoryName
FROM
  DimProduct
LEFT JOIN DimProductSubcategory ON
  DimProduct.ProductKey = DimProductSubcategory.ProductSubcategoryKey;

/* ===========================================================
8️⃣ CROSS JOIN - Marca x Canal
===========================================================

🎯 Objetivo:
Gerar combinação entre:
🏷️ Marca
📺 Canal de Venda

Apenas para as marcas:
- Contoso
- Fabrikam
- Litware

🧠 Conceito:
CROSS JOIN gera todas as combinações possíveis.

📌 Pergunta:
Quantos canais existem?
Quantas combinações serão geradas?

=========================================================== */

/*
✍️ RESOLUÇÃO: */

SELECT * FROM DimProduct;
SELECT * FROM DimChannel;

SELECT 
  DimProduct.ProductKey,
  DimChannel.ChannelKey,
  DimProductSubcategory.ProductSubcategoryKey,
  DimProduct.ProductName,
  DimProductSubcategory.ProductSubcategoryName,
  DimProduct.BrandName
FROM
  DimProduct
CROSS JOIN DimChannel ON
  DimProduct.ProductKey = DimChannel.ChannelKey
CROSS JOIN DimProductSubcategory ON
  DimProductSubcategory.ProductSubcategoryKey = DimChannel.ChannelKey;

/* ===========================================================
9️⃣ JOIN com Filtro - Vendas Online com Desconto
===========================================================

🎯 Objetivo:
Relacionar:
- FactOnlineSales
- DimPromotion

📌 Retornar:
- OnlineSalesKey
- DateKey
- PromotionName
- SalesAmount

⚠️ Regras:
- Considerar apenas produtos com desconto
  (PromotionName <> 'No Discount')
- Ordenar por DateKey crescente

🧠 Pense:
Qual coluna conecta vendas e promoção?

=========================================================== */

/*
✍️ RESOLUÇÃO:*/

SELECT * FROM FactOnlineSales;
SELECT * FROM DimPromotion;

SELECT 
  FactOnlineSales.OnlineSalesKey,
  FactOnlineSales.DateKey,
  FactOnlineSales.SalesAmount,
  DimPromotion.PromotionKey,
  DimPromotion.PromotionName
FROM
  FactOnlineSales
INNER JOIN DimPromotion ON
   FactOnlineSales.OnlineSalesKey = DimPromotion.PromotionKey
WHERE
  PromotionName <> "No Discount"
ORDER BY
  SalesAmount ASC;

/* ===========================================================
🔟 JOIN Múltiplo - Fato + 3 Dimensões
===========================================================

🎯 Objetivo:
Recriar JOIN entre:
- FactSales
- DimChannel
- DimStore
- DimProduct

📌 Classificar:
SalesAmount em ordem DECRESCENTE.

🧠 Estrutura típica de Data Warehouse:
Fato no centro
Dimensões ao redor

⭐ Esse exercício testa:
- múltiplos JOINs
- entendimento de chave estrangeira
- ordenação

=========================================================== */

/*
✍️ RESOLUÇÃO:*/ 

SELECT * FROM FactSales;
SELECT * FROM DimChannel;

SELECT 
    fs.SalesKey,
    fs.SalesAmount,
    dc.ChannelName,
    ds.StoreName,
    dp.ProductName
FROM 
  FactSales fs
INNER JOIN DimChannel dc ON 
  fs.ChannelKey = dc.ChannelKey
INNER JOIN DimStore ds ON 
  fs.StoreKey = ds.StoreKey
INNER JOIN DimProduct dp ON 
  fs.ProductKey = dp.ProductKey;