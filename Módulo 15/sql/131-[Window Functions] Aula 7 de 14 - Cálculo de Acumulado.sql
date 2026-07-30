-- ============================================================
-- 🗄️  SQL Server  |  📦 Módulo 15 — Window Functions
-- 📖 Aula 7 de 14  |  Cálculo de Acumulado
-- ============================================================

/*
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📚 CONCEITO — O frame padrão do OVER(ORDER BY ...)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  Na Aula 6, o acumulado foi construído explicitando o frame com
  ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW. Mas isso não é
  obrigatório: quando o OVER() tem um ORDER BY e NENHUM ROWS/RANGE
  é informado, o SQL Server assume esse frame por padrão.

  Ou seja, estas duas expressões são equivalentes:
      SUM(Qtd_Vendida) OVER(ORDER BY ID_Loja)
      SUM(Qtd_Vendida) OVER(ORDER BY ID_Loja
                             ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW)

  Isso vale para qualquer função agregada (SUM, COUNT, AVG, MIN,
  MAX): basta adicionar um ORDER BY dentro do OVER() para que o
  resultado passe a ser ACUMULADO — cada linha soma a si mesma
  com todas as anteriores, segundo a ordem definida.

  Sem ORDER BY, a janela continua "cheia" (a partição inteira),
  e o valor se repete igual em todas as linhas — como visto nas
  Aulas 2 e 3.
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
*/

-- ────────────────────────────────────────────────────────────
-- 🏋️ Exemplo prático
-- ────────────────────────────────────────────────────────────

USE WF

-- 1️⃣  SUM OVER(ORDER BY ID_Loja) — acumulado "por padrão", sem ROWS BETWEEN

SELECT DISTINCT
    ID_Loja AS "ID da Loja",
    Nome_Loja AS "Nome da Loja",
    Regiao as "Região",
    Qtd_Vendida as "QTD. Vendida",
    SUM(Qtd_Vendida) OVER(ORDER BY ID_Loja) AS 'Soma Acumulada'
FROM
    Lojas
ORDER BY
    ID_Loja;

-- 2️⃣  Provando a equivalência — mesmo resultado, com e sem ROWS BETWEEN explícito

SELECT DISTINCT
    ID_Loja AS "ID da Loja",
    Nome_Loja AS "Nome da Loja",
    Regiao as "Região",
    Qtd_Vendida as "QTD. Vendida",
    SUM(Qtd_Vendida) OVER(ORDER BY ID_Loja) AS 'Acumulado (frame implícito)',
    SUM(Qtd_Vendida) OVER(ORDER BY ID_Loja ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS 'Acumulado (frame explícito)'
FROM
    Lojas
ORDER BY
    ID_Loja;

-- 3️⃣  Acumulado por região — PARTITION BY reinicia a soma a cada Regiao

SELECT DISTINCT
    ID_Loja AS "ID da Loja",
    Nome_Loja AS "Nome da Loja",
    Regiao as "Região",
    Qtd_Vendida as "QTD. Vendida",
    SUM(Qtd_Vendida) OVER(PARTITION BY Regiao ORDER BY ID_Loja) AS 'Soma Acumulada na Região'
FROM
    Lojas
ORDER BY
    Regiao, ID_Loja;

-- 4️⃣  COUNT acumulado — quantas lojas já foram somadas até a linha atual

SELECT DISTINCT
    ID_Loja AS "ID da Loja",
    Nome_Loja AS "Nome da Loja",
    Regiao as "Região",
    Qtd_Vendida as "QTD. Vendida",
    COUNT(*) OVER(ORDER BY ID_Loja) AS 'Qtd de Lojas Acumulada'
FROM
    Lojas
ORDER BY
    ID_Loja;

-- 5️⃣  Percentual acumulado — soma acumulada dividida pelo total geral da rede

SELECT DISTINCT
    ID_Loja AS "ID da Loja",
    Nome_Loja AS "Nome da Loja",
    Regiao as "Região",
    Qtd_Vendida as "QTD. Vendida",
    SUM(Qtd_Vendida) OVER(ORDER BY ID_Loja) AS 'Soma Acumulada',
    CONVERT(DECIMAL(5,2), SUM(Qtd_Vendida) OVER(ORDER BY ID_Loja) * 100.0 / SUM(Qtd_Vendida) OVER()) AS '% Acumulado'
FROM
    Lojas
ORDER BY
    ID_Loja;
