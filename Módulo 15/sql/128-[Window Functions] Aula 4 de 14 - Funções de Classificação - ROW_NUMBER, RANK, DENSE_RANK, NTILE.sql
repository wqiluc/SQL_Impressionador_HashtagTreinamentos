-- ============================================================
-- 🗄️  SQL Server  |  📦 Módulo 15 — Window Functions
-- 📖 Aula 4 de 14  |  Funções de Classificação - ROW_NUMBER, RANK, DENSE_RANK, NTILE
-- ============================================================

/*
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📚 CONCEITO — Funções de Classificação
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  Diferente das funções de agregação (Aula 2), as funções de
  classificação não somam nem calculam médias — elas atribuem uma
  posição a cada linha dentro da janela, sempre com base num
  ORDER BY dentro do OVER().

  ROW_NUMBER()  → numera as linhas de forma sequencial e única
                  (1, 2, 3, 4...), mesmo quando há empate de valor.

  RANK()        → numera as linhas considerando empates: linhas
                  com o mesmo valor recebem a mesma posição, e a
                  próxima posição "pula" o número de linhas
                  empatadas (1, 2, 2, 4...).

  DENSE_RANK()  → igual ao RANK(), mas SEM pular números após um
                  empate (1, 2, 2, 3...).

  NTILE(n)      → distribui as linhas em "n" grupos de tamanho o
                  mais parecido possível, numerando cada grupo de
                  1 a n (útil para criar quartis, decis etc.).

  Todas usam a sintaxe:
      FUNÇÃO() OVER([PARTITION BY coluna] ORDER BY coluna)

  Aqui o ORDER BY dentro do OVER() é obrigatório — é ele que
  define o critério de classificação (diferente das funções de
  agregação, em que o ORDER BY é opcional).
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
*/

-- ────────────────────────────────────────────────────────────
-- 🏋️ Exemplo prático
-- ────────────────────────────────────────────────────────────

USE WF

-- 1️⃣  ROW_NUMBER() — numeração sequencial única por Qtd_Vendida

SELECT
    ID_Loja,
    Nome_Loja,
    Regiao,
    Qtd_Vendida,
    ROW_NUMBER() OVER(ORDER BY Qtd_Vendida DESC) AS 'Posição'
FROM
    Lojas
ORDER BY
    Qtd_Vendida DESC;

-- 2️⃣  RANK() — empate em Qtd_Vendida (ID_Loja 1 e 4, ambos 1800)
--     recebem a mesma posição, e a posição seguinte pula um número

SELECT
    ID_Loja,
    Nome_Loja,
    Regiao,
    Qtd_Vendida,
    RANK() OVER(ORDER BY Qtd_Vendida DESC) AS 'Posição'
FROM
    Lojas
ORDER BY
    Qtd_Vendida DESC;

-- 3️⃣  DENSE_RANK() — mesmo empate, mas sem pular número na sequência

SELECT
    ID_Loja,
    Nome_Loja,
    Regiao,
    Qtd_Vendida,
    DENSE_RANK() OVER(ORDER BY Qtd_Vendida DESC) AS 'Posição'
FROM
    Lojas
ORDER BY
    Qtd_Vendida DESC;

-- 4️⃣  Comparando as três lado a lado — diferença fica clara no empate

SELECT
    ID_Loja,
    Nome_Loja,
    Regiao,
    Qtd_Vendida,
    ROW_NUMBER() OVER(ORDER BY Qtd_Vendida DESC) AS 'ROW_NUMBER',
    RANK()       OVER(ORDER BY Qtd_Vendida DESC) AS 'RANK',
    DENSE_RANK() OVER(ORDER BY Qtd_Vendida DESC) AS 'DENSE_RANK'
FROM
    Lojas
ORDER BY
    Qtd_Vendida DESC;

-- 5️⃣  Classificação dentro de cada região — PARTITION BY + ORDER BY

SELECT
    ID_Loja,
    Nome_Loja,
    Regiao,
    Qtd_Vendida,
    RANK() OVER(PARTITION BY Regiao ORDER BY Qtd_Vendida DESC) AS 'Posição na Região'
FROM
    Lojas
ORDER BY
    Regiao, Qtd_Vendida DESC;

-- 6️⃣  NTILE(4) — dividindo as 13 lojas em 4 grupos por volume de vendas

SELECT
    ID_Loja,
    Nome_Loja,
    Regiao,
    Qtd_Vendida,
    NTILE(4) OVER(ORDER BY Qtd_Vendida DESC) AS 'Grupo'
FROM
    Lojas
ORDER BY
    Qtd_Vendida DESC;