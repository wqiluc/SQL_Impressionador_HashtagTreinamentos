-- ============================================================
-- 🗄️  SQL Server  |  📦 Módulo 24 — Pivot Table
-- 📖 Aula 7 de 9  |  Limitações de uma Pivot Table
-- ============================================================

/*
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📚 CONCEITO — A lista de colunas do PIVOT é ESTÁTICA
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  A grande limitação do PIVOT: os valores dentro do FOR ... IN
  (...) precisam ser conhecidos e escritos manualmente no momento
  em que a query é escrita.

  Se surgir um valor novo na coluna (ex.: um novo Trimestre, 'Q5'
  de um ano diferente, ou um novo Vendedor) e a lista do IN() não
  for atualizada, esse valor é simplesmente IGNORADO pelo PIVOT -
  sem erro, sem aviso.

  Essa limitação é resolvida com SQL DINÂMICO, montando a lista de
  colunas em tempo de execução - assunto das próximas duas aulas.
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
*/

USE BD_PivotTable;

-- ────────────────────────────────────────────────────────────
-- 🏋️ Exemplo prático
-- ────────────────────────────────────────────────────────────

-- Inserindo vendas de um trimestre que NÃO está no IN() do PIVOT
INSERT INTO Vendas(Loja, Regiao, Vendedor, Trimestre, ValorVenda)
VALUES ('Loja Centro', 'Sudeste', 'Marcus', 'Q5', 5000)

-- O PIVOT abaixo continua igual - Q5 simplesmente não aparece em
-- lugar nenhum, nem soma no total de nenhuma coluna existente
SELECT Loja, [Q1], [Q2], [Q3], [Q4]
FROM 
(
   SELECT Loja, Trimestre, ValorVenda
   FROM Vendas
) AS Origem
PIVOT 
(
   SUM(ValorVenda)
   FOR Trimestre IN ([Q1], [Q2], [Q3], [Q4])
) AS TabelaPivotada

-- Removendo o dado de teste
DELETE FROM Vendas WHERE Trimestre = 'Q5';