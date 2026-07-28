-- ============================================================
-- 🗄️  SQL Server  |  📦 Módulo 15 — Window Functions
-- 📖 Aula 2 de 14  |  Funções de Agregação - SUM, COUNT, AVG, MIN, MAX
-- ============================================================

/*
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📚 CONCEITO — Funções de Agregação como Window Functions
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  As mesmas funções agregadoras do GROUP BY (SUM, COUNT, AVG, MIN,
  MAX) podem ser usadas como funções de janela, bastando adicionar
  a instrução OVER() logo depois delas.

  A diferença em relação ao GROUP BY é que a janela NÃO colapsa as
  linhas: o cálculo agregado é repetido em todas as linhas
  originais, permitindo comparar cada registro com o total (ou com
  o total da sua partição).

  OVER()                    → janela = tabela inteira
  OVER(PARTITION BY coluna) → janela = subconjunto por valor da coluna
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
*/

-- ────────────────────────────────────────────────────────────
-- 🏋️ Exemplo prático
-- ────────────────────────────────────────────────────────────

USE WF

-- 1️⃣  SUM OVER() — total vendido pela rede, repetido em todas as linhas

SELECT DISTINCT
    ID_Loja,
    Nome_Loja,
    Regiao,
    Qtd_Vendida,
    SUM(Qtd_Vendida) OVER() AS 'Total Vendido'
FROM Lojas;

-- 2️⃣  SUM OVER(PARTITION BY Regiao) — total vendido por região

SELECT
    ID_Loja,
    Nome_Loja,
    Regiao,
    Qtd_Vendida,
    SUM(Qtd_Vendida) OVER(PARTITION BY Regiao) AS 'Total Vendido na Região'
FROM 
    Lojas
ORDER BY 
    ID_Loja;

-- 3️⃣  COUNT OVER(PARTITION BY Regiao) — quantidade de lojas por região

SELECT
    ID_Loja,
    Nome_Loja,
    Regiao,
    Qtd_Vendida,
    COUNT(*) OVER(PARTITION BY Regiao) AS 'Qtd de Lojas na Região'
FROM 
    Lojas
ORDER BY 
    ID_Loja;

-- 4️⃣  AVG OVER(PARTITION BY Regiao) — média vendida por região

SELECT
    ID_Loja,
    Nome_Loja,
    Regiao,
    Qtd_Vendida,
    AVG(Qtd_Vendida) OVER(PARTITION BY Regiao) AS 'Média Vendida na Região'
FROM 
    Lojas
ORDER BY 
    ID_Loja;

-- 5️⃣  MIN e MAX OVER(PARTITION BY Regiao) — menor e maior venda da região

SELECT
    ID_Loja,
    Nome_Loja,
    Regiao,
    Qtd_Vendida,
    MIN(Qtd_Vendida) OVER(PARTITION BY Regiao) AS 'Menor Venda na Região',
    MAX(Qtd_Vendida) OVER(PARTITION BY Regiao) AS 'Maior Venda na Região'
FROM 
    Lojas
ORDER BY 
    ID_Loja;

-- 6️⃣  Aplicação prática — % vendido por loja em relação à sua região

SELECT
    ID_Loja,
    Nome_Loja,
    Regiao,
    Qtd_Vendida,
    SUM(Qtd_Vendida) OVER(PARTITION BY Regiao) AS 'Total Vendido na Região',
    CONVERT(DECIMAL(5,2), Qtd_Vendida * 100.0 / SUM(Qtd_Vendida) OVER(PARTITION BY Regiao)) AS '% Vendido na Região'
FROM 
    Lojas
ORDER BY 
    Regiao AND ID_Loja;