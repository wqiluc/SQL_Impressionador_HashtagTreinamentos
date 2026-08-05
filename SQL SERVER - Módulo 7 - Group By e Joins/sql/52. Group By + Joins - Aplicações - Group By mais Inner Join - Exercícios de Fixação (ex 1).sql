-- Group by + Join (Exemplo 1)

-- 1.a) Crie um agrupamento mostrando o total de vendas (SalesQuantity) por Ano(CalendarYear);
-- 1.b) Considere APENAS o mês de Janeiro(January) (CalendarMonthLabel);
-- 1.c) Na tabela resultante, mostre apenas os meses que obtiveram um total igual ou maior a: R$120.000,00


/* Resposta: */

login mysql;
show databases;
use mini_ecommerce;
show tables;

SELECT * FROM FactSales;

SELECT
    D.CalendarYear as "Ano",
    SUM(F.SalesQuantity) as "QTD. de Vendas"
FROM 
    FactSales as F
INNER JOIN 
    DimDate as D 
    ON F.Datekey = D.Datekey
WHERE
    D.CalendarMonthLabel = 'January'
GROUP BY
    D.CalendarYear
HAVING
    SUM(F.SalesQuantity * F.UnitPrice) >= 120000
ORDER BY
    "QTD. de Vendas" DESC;