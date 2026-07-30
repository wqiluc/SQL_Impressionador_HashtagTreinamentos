-- ============================================================
-- 🗄️  SQL Server  |  📦 Módulo 15 — Window Functions
-- 📖 Aula 6 de 14  |  Cálculo de Soma Móvel e Média Móvel
-- ============================================================

/*
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📚 CONCEITO — Soma Móvel e Média Móvel (ROWS BETWEEN)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  Até agora a janela de cálculo era sempre "fixa": a tabela
  inteira (OVER()) ou uma partição inteira (PARTITION BY). A
  cláusula ROWS BETWEEN permite ir além, definindo um "recorte"
  de linhas que se move junto com a linha atual — daí o nome
  soma/média MÓVEL.

  A sintaxe completa fica:
      FUNÇÃO() OVER([PARTITION BY coluna] ORDER BY coluna
                     ROWS BETWEEN <início> AND <fim>)

  O ORDER BY aqui não serve para classificar (como no RANK), e
  sim para definir a SEQUÊNCIA das linhas dentro da qual o
  "recorte" se desloca.

  Pontos de referência do ROWS BETWEEN:
      UNBOUNDED PRECEDING → desde a primeira linha da partição
      N PRECEDING         → N linhas antes da atual
      CURRENT ROW          → a própria linha atual
      N FOLLOWING          → N linhas depois da atual
      UNBOUNDED FOLLOWING  → até a última linha da partição

  Exemplos de combinação:
      ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
          → soma/média ACUMULADA (running total) até a linha atual

      ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
          → soma/média dos últimos 3 registros (atual + 2 anteriores)

      ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING
          → média "centrada", usando o vizinho anterior e o seguinte
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
*/

-- ────────────────────────────────────────────────────────────
-- 🏋️ Exemplo prático
-- ────────────────────────────────────────────────────────────

USE WF

-- 1️⃣  Soma acumulada (running total) de Qtd_Vendida, ordenado por ID_Loja

SELECT DISTINCT
    ID_Loja AS "ID da Loja",
    Nome_Loja AS "Nome da Loja",
    Regiao as "Região",
    Qtd_Vendida as "QTD. Vendida",
    SUM(Qtd_Vendida) OVER(ORDER BY ID_Loja ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS 'Soma Acumulada'
FROM
    Lojas
ORDER BY
    ID_Loja;

-- 2️⃣  Soma acumulada por região — PARTITION BY reinicia o acumulado a cada Regiao

SELECT DISTINCT
    ID_Loja AS "ID da Loja",
    Nome_Loja AS "Nome da Loja",
    Regiao as "Região",
    Qtd_Vendida as "QTD. Vendida",
    SUM(Qtd_Vendida) OVER(PARTITION BY Regiao ORDER BY ID_Loja ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS 'Soma Acumulada na Região'
FROM
    Lojas
ORDER BY
    Regiao, ID_Loja;

-- 3️⃣  Média móvel dos últimos 3 registros (atual + 2 anteriores)

SELECT DISTINCT
    ID_Loja AS "ID da Loja",
    Nome_Loja AS "Nome da Loja",
    Regiao as "Região",
    Qtd_Vendida as "QTD. Vendida",
    AVG(Qtd_Vendida) OVER(ORDER BY ID_Loja ROWS BETWEEN 2 PRECEDING AND CURRENT ROW) AS 'Média Móvel (3 lojas)'
FROM
    Lojas
ORDER BY
    ID_Loja;

-- 4️⃣  Média móvel "centrada" — vizinho anterior, atual e vizinho seguinte

SELECT DISTINCT
    ID_Loja AS "ID da Loja",
    Nome_Loja AS "Nome da Loja",
    Regiao as "Região",
    Qtd_Vendida as "QTD. Vendida",
    AVG(Qtd_Vendida) OVER(ORDER BY ID_Loja ROWS BETWEEN 1 PRECEDING AND 1 FOLLOWING) AS 'Média Móvel Centrada'
FROM
    Lojas
ORDER BY
    ID_Loja;

-- 5️⃣  Comparando soma acumulada com o total geral da janela inteira

SELECT DISTINCT
    ID_Loja AS "ID da Loja",
    Nome_Loja AS "Nome da Loja",
    Regiao as "Região",
    Qtd_Vendida as "QTD. Vendida",
    SUM(Qtd_Vendida) OVER(ORDER BY ID_Loja ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS 'Soma Acumulada',
    SUM(Qtd_Vendida) OVER() AS 'Total Geral'
FROM
    Lojas
ORDER BY
    ID_Loja;