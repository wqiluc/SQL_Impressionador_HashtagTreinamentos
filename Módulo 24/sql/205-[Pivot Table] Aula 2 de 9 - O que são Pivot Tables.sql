-- ============================================================
-- 🗄️  SQL Server  |  📦 Módulo 24 — Pivot Table
-- 📖 Aula 2 de 9  |  O que são Pivot Tables
-- ============================================================

/*
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📚 CONCEITO — Comparando GROUP BY "empilhado" com PIVOT "deitado"
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  Sintaxe geral do PIVOT:

     SELECT colunas_de_grupo, [valor1], [valor2], ...
     FROM (SELECT colunas_necessárias FROM tabela) AS Origem
     PIVOT (
        FUNÇÃO_AGREGADORA(coluna_de_valor)
        FOR coluna_a_transformar_em_colunas IN ([valor1], [valor2], ...)
     ) AS TabelaPivotada

  Repare que o PIVOT sempre trabalha em cima de uma SUBQUERY
  (aqui chamada de "Origem"), e que os valores que vão virar
  coluna precisam ser listados manualmente entre colchetes, dentro
  do IN().
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
*/

USE BD_PivotTable

-- ────────────────────────────────────────────────────────────
-- 🏋️ Exemplo prático
-- ────────────────────────────────────────────────────────────

-- 1️⃣  A forma "empilhada", com GROUP BY (uma linha por Loja + Trimestre)
SELECT Loja, Trimestre, SUM(ValorVenda) AS TotalVendido
FROM Vendas
GROUP BY Loja, Trimestre
ORDER BY Loja, Trimestre

-- 2️⃣  A mesma informação, "deitada": uma linha por Loja, uma
--     coluna por Trimestre (prévia do que o PIVOT vai fazer)
SELECT
   Loja,
   SUM(CASE WHEN Trimestre = 'Q1' THEN ValorVenda END) AS Q1,
   SUM(CASE WHEN Trimestre = 'Q2' THEN ValorVenda END) AS Q2,
   SUM(CASE WHEN Trimestre = 'Q3' THEN ValorVenda END) AS Q3,
   SUM(CASE WHEN Trimestre = 'Q4' THEN ValorVenda END) AS Q4
FROM Vendas
GROUP BY Loja

-- O PIVOT faz exatamente isso (linha 2), só que com uma sintaxe
-- própria, mais direta - vista na próxima aula
