/*
  =============================================================================
  📝 EXERCÍCIOS DE FIXAÇÃO: SQL SERVER (GROUP BY + JOINS)
  Banco de Dados: Fictício
  Objetivo: Praticar agrupamentos e relacionamentos entre tabelas.
  =============================================================================
*/

-- 🚀 [1. FACT SALES] --

-- a) Faça um resumo da quantidade vendida (Sales Quantity) de acordo com o nome do canal 
-- de vendas (ChannelName). Ordene a tabela final por SalesQuantity em ordem decrescente[cite: 5, 6].
-- RESPOSTA AQUI:


-- b) Faça um agrupamento mostrando a quantidade total vendida (Sales Quantity) e 
-- quantidade total devolvida (Return Quantity) de acordo com o nome das lojas (StoreName)[cite: 7].
-- RESPOSTA AQUI:


-- c) Faça um resumo do valor total vendido (Sales Amount) para cada mês 
-- (Calendar MonthLabel) e ano (CalendarYear)[cite: 8].
-- RESPOSTA AQUI:


-- 🎯 [2. ANÁLISE DE PRODUTOS] --

-- a) Descubra qual é a cor de produto que mais é vendida, considerando a 
-- coluna SalesQuantity[cite: 10, 11].
-- RESPOSTA AQUI:


-- b) Identifique quantas cores tiveram uma quantidade total vendida acima de 3.000.000[cite: 12].
-- RESPOSTA AQUI:


-- 🔗 [3. MULTI-JOIN: CATEGORIAS] --

-- Crie um agrupamento de quantidade vendida (SalesQuantity) por categoria do produto 
-- (ProductCategoryName). Obs: Será necessário mais de 1 INNER JOIN para relacionar 
-- FactSales e DimProductCategory[cite: 13, 14].
-- RESPOSTA AQUI:


-- 💻 [4. FACT ONLINE SALES - CLIENTE VIP] --

-- a) Consulte a tabela FactOnlineSales e descubra qual o nome completo do cliente 
-- que mais realizou compras online (baseado em Sales Quantity)[cite: 17, 18].
-- RESPOSTA AQUI:


-- b) Com base no cliente da letra 'a', descubra o top 10 produtos mais comprados 
-- por ele, considerando o nome do produto[cite: 19].
-- RESPOSTA AQUI:


-- 🚻 [5. COMPRAS POR SEXO] --

-- Faça um resumo mostrando o total de produtos comprados (Sales Quantity) 
-- de acordo com o sexo dos clientes[cite: 20].
-- RESPOSTA AQUI:


-- 💱 [6. FACT EXCHANGE RATE] --

-- Crie uma tabela resumo com a taxa de câmbio média de acordo com cada 
-- Currency Description. Filtre para mostrar apenas taxas entre 10 e 100[cite: 22, 23].
-- RESPOSTA AQUI:


-- 📊 [7. FACT STRATEGY PLAN] --

-- Calcule a SOMA TOTAL de AMOUNT referente à tabela FactStrategyPlan destinado 
-- aos cenários: 'Actual' e 'Budget'. Dica: Use a tabela DimScenario[cite: 25, 26].
-- RESPOSTA AQUI:


-- 📅 [8. PLANEJAMENTO POR ANO] --

-- Crie uma tabela resumo mostrando o resultado do planejamento estratégico por ano[cite: 27].
-- RESPOSTA AQUI:


-- 🏷️ [9. DIM PRODUCT / SUBCATEGORY] --

-- Agrupe a quantidade de produtos por ProductSubcategoryName. Considere 
-- apenas a marca 'Contoso' e a cor 'Silver'[cite: 29, 30].
-- RESPOSTA AQUI:


-- 🏗️ [10. AGRUPAMENTO DUPLO] --

-- Faça um agrupamento duplo de quantidade de produtos por BrandName e 
-- ProductSubcategoryName. Ordene o resultado pela coluna BrandName[cite: 31, 32].
-- RESPOSTA AQUI:

/* =============================================================================
   FIM DOS EXERCÍCIOS. BOM TRABALHO! 💻✨
   =============================================================================
*/