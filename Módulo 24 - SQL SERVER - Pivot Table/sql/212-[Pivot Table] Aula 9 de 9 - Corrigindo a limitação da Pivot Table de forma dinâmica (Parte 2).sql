-- ============================================================
-- 🗄️  SQL Server  |  📦 Módulo 24 — Pivot Table
-- 📖 Aula 9 de 9  |  Corrigindo a limitação da Pivot Table de forma dinâmica (Parte 2)
-- ============================================================

/*
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📚 CONCEITO — Montando e executando o SQL dinâmico
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  Com a lista de colunas já pronta (Parte 1), o passo final é:

  1. Montar o texto COMPLETO da consulta PIVOT como uma string,
     usando a lista de colunas dinâmica no lugar da lista fixa
  2. Executar essa string com sp_executesql

  Assim, se amanhã surgir um Q6, a mesma consulta já se adapta
  sozinha, sem precisar editar o código manualmente.
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
*/

USE BD_PivotTable;

-- ────────────────────────────────────────────────────────────
-- 🏋️ Exemplo prático
-- ────────────────────────────────────────────────────────────

DECLARE @ListaColunas NVARCHAR(MAX)
DECLARE @SQLDinamico NVARCHAR(MAX)

-- 1️⃣  Lista de colunas dinâmica (igual à Parte 1)
SELECT @ListaColunas = STRING_AGG(QUOTENAME(Trimestre), ',')
   WITHIN GROUP (ORDER BY Trimestre)
FROM (SELECT DISTINCT Trimestre AS "Trimestre" FROM Vendas);

-- 2️⃣  Montando o texto da consulta PIVOT usando a lista dinâmica
SET @SQLDinamico = N'
SELECT Loja, ' + @ListaColunas + N'
FROM 
(
   SELECT Loja, Trimestre, ValorVenda
   FROM Vendas
) AS Origem
PIVOT 
(
   SUM(ValorVenda)
   FOR Trimestre IN (' + @ListaColunas + N')
) AS TabelaPivotada
ORDER BY Loja'

-- Conferindo o texto gerado antes de executar
PRINT @SQLDinamico;

-- 3️⃣  Executando o SQL dinâmico
EXEC sp_executesql @SQLDinamico;

-- Agora Q5 aparece automaticamente como coluna, sem alterar a query