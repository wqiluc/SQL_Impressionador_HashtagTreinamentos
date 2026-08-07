-- ============================================================
-- 🗄️  SQL Server  |  📦 Módulo 24 — Pivot Table
-- 📖 Aula 8 de 9  |  Corrigindo a limitação da Pivot Table de forma dinâmica (Parte 1)
-- ============================================================

/*
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📚 CONCEITO — Montando a lista de colunas em tempo de execução
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  O primeiro passo do PIVOT dinâmico é descobrir, com uma
  consulta, TODOS os valores distintos que hoje existem na coluna
  que vai virar cabeçalho - e concatená-los em uma única string,
  já no formato esperado pelo IN(): [Q1],[Q2],[Q3],[Q4],[Q5]...

  A função STRING_AGG concatena os valores de várias linhas em uma
  única string, separados por um delimitador escolhido.
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
*/

USE BD_PivotTable;

-- ────────────────────────────────────────────────────────────
-- 🏋️ Exemplo prático
-- ────────────────────────────────────────────────────────────

-- Reinserindo o trimestre "novo" para simular o cenário dinâmico
INSERT INTO Vendas(Loja, Regiao, Vendedor, Trimestre, ValorVenda)
VALUES ('Loja Centro', 'Sudeste', 'Marcus', 'Q5', 5000)

DECLARE @ListaColunas NVARCHAR(MAX)

SELECT @ListaColunas = STRING_AGG(QUOTENAME(Trimestre), ',')
   WITHIN GROUP (ORDER BY Trimestre)
FROM (SELECT DISTINCT Trimestre AS "Trimestre" FROM Vendas);

-- Conferindo a lista de colunas montada dinamicamente
SELECT @ListaColunas AS ListaColunas;
-- Resultado: [Q1],[Q2],[Q3],[Q4],[Q5]

-- QUOTENAME() é o responsável por colocar cada valor entre
-- colchetes automaticamente, no formato que o PIVOT espera