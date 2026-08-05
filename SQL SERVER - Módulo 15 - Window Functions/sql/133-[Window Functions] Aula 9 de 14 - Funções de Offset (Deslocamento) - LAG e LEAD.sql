-- ============================================================
-- 🗄️  SQL Server  |  📦 Módulo 15 — Window Functions
-- 📖 Aula 9 de 14  |  Funções de Offset (Deslocamento) - LAG e LEAD
-- ============================================================

/*
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📚 CONCEITO — Funções de Deslocamento (Offset)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  Diferente das funções de agregação e de classificação, as
  funções de OFFSET não calculam nada em cima de várias linhas —
  elas simplesmente TRAZEM o valor de uma OUTRA linha para dentro
  da linha atual, com base na ordem definida pelo OVER().

  LAG(coluna, deslocamento, valor_padrão)
      → traz o valor da coluna de uma linha ANTERIOR.

  LEAD(coluna, deslocamento, valor_padrão)
      → traz o valor da coluna de uma linha POSTERIOR.

  Os três argumentos:
      coluna         → qual coluna buscar na outra linha
      deslocamento   → quantas linhas antes/depois (padrão = 1)
      valor_padrão   → o que retornar quando não existe linha
                       anterior/posterior (padrão = NULL)

  Sintaxe:
      LAG(coluna [, deslocamento [, padrão]]) OVER([PARTITION BY coluna] ORDER BY coluna)
      LEAD(coluna [, deslocamento [, padrão]]) OVER([PARTITION BY coluna] ORDER BY coluna)

  Assim como no RANK, o ORDER BY dentro do OVER() é obrigatório —
  é ele que define qual linha é "anterior" e qual é "posterior".

  Uso mais comum: comparar a linha atual com a anterior/próxima
  (ex.: variação de vendas de uma loja para a próxima, ranking
  anterior, etc.).
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
*/

-- ────────────────────────────────────────────────────────────
-- 🏋️ Exemplo prático
-- ────────────────────────────────────────────────────────────

USE WF;

-- 1️⃣  LAG() — Qtd_Vendida da loja anterior, na ordem de ID_Loja

SELECT DISTINCT
    ID_Loja AS "ID da Loja",
    Nome_Loja AS "Nome da Loja",
    Regiao as "Região",
    Qtd_Vendida as "QTD. Vendida",
    LAG(Qtd_Vendida) OVER(ORDER BY ID_Loja) AS 'Vendida na Loja Anterior'
FROM
    Lojas
ORDER BY
    ID_Loja;

-- 2️⃣  LEAD() — Qtd_Vendida da próxima loja, na ordem de ID_Loja

SELECT DISTINCT
    ID_Loja AS "ID da Loja",
    Nome_Loja AS "Nome da Loja",
    Regiao as "Região",
    Qtd_Vendida as "QTD. Vendida",
    LEAD(Qtd_Vendida) OVER(ORDER BY ID_Loja) AS 'Vendida na Próxima Loja'
FROM
    Lojas
ORDER BY
    ID_Loja;

-- 3️⃣  LAG() com valor padrão — troca o NULL da primeira linha por 0

SELECT DISTINCT
    ID_Loja AS "ID da Loja",
    Nome_Loja AS "Nome da Loja",
    Regiao as "Região",
    Qtd_Vendida as "QTD. Vendida",
    LAG(Qtd_Vendida, 1, 0) OVER(ORDER BY ID_Loja) AS 'Vendida na Loja Anterior'
FROM
    Lojas
ORDER BY
    ID_Loja;

-- 4️⃣  Calculando a variação em relação à loja anterior

SELECT DISTINCT
    ID_Loja AS "ID da Loja",
    Nome_Loja AS "Nome da Loja",
    Regiao as "Região",
    Qtd_Vendida as "QTD. Vendida",
    LAG(Qtd_Vendida) OVER(ORDER BY ID_Loja) AS 'Vendida na Loja Anterior',
    Qtd_Vendida - LAG(Qtd_Vendida) OVER(ORDER BY ID_Loja) AS 'Variação'
FROM
    Lojas
ORDER BY
    ID_Loja;

-- 5️⃣  LAG() e LEAD() dentro de cada região — PARTITION BY reinicia a comparação

SELECT DISTINCT
    ID_Loja AS "ID da Loja",
    Nome_Loja AS "Nome da Loja",
    Regiao as "Região",
    Qtd_Vendida as "QTD. Vendida",
    LAG(Qtd_Vendida) OVER(PARTITION BY Regiao ORDER BY ID_Loja) AS 'Anterior na Região',
    LEAD(Qtd_Vendida) OVER(PARTITION BY Regiao ORDER BY ID_Loja) AS 'Próxima na Região'
FROM
    Lojas
ORDER BY
    Regiao, ID_Loja;

-- 6️⃣  Comparando LAG e LEAD lado a lado, com deslocamento de 2 linhas

SELECT DISTINCT
    ID_Loja AS "ID da Loja",
    Nome_Loja AS "Nome da Loja",
    Regiao as "Região",
    Qtd_Vendida as "QTD. Vendida",
    LAG(Qtd_Vendida, 2) OVER(ORDER BY ID_Loja) AS '2 Lojas Antes',
    LEAD(Qtd_Vendida, 2) OVER(ORDER BY ID_Loja) AS '2 Lojas Depois'
FROM
    Lojas
ORDER BY
    ID_Loja;