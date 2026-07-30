-- ============================================================
-- 🗄️  SQL Server  |  📦 Módulo 15 — Window Functions
-- 📖 Aula 14 de 14  |  Funções de Offset (Deslocamento) - FIRST_VALUE e LAST_VALUE
-- ============================================================

/*
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📚 CONCEITO — FIRST_VALUE e LAST_VALUE
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  Assim como LAG e LEAD (Aula 9), FIRST_VALUE e LAST_VALUE também
  são funções de OFFSET — trazem o valor de OUTRA linha para
  dentro da linha atual, com base na ordem definida pelo OVER().

  FIRST_VALUE(coluna) → traz o valor da coluna na PRIMEIRA linha
                         da janela (partição + ordenação).

  LAST_VALUE(coluna)  → traz o valor da coluna na ÚLTIMA linha
                         da janela (partição + ordenação).

  Sintaxe:
      FIRST_VALUE(coluna) OVER([PARTITION BY coluna] ORDER BY coluna)
      LAST_VALUE(coluna)  OVER([PARTITION BY coluna] ORDER BY coluna)

  ⚠️ PEGADINHA DO LAST_VALUE
  Por padrão, quando existe ORDER BY dentro do OVER(), o SQL Server
  usa o frame RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW.
  Ou seja, para o LAST_VALUE a "última linha" considerada é sempre
  a LINHA ATUAL — e não a última linha da partição inteira!

  Para o LAST_VALUE realmente trazer a última linha da partição,
  é preciso redefinir o frame explicitamente:
      ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING

  O FIRST_VALUE não sofre esse problema, pois a primeira linha do
  frame padrão já coincide com a primeira linha da partição.
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
*/

-- ────────────────────────────────────────────────────────────
-- 🏋️ Exemplo prático
-- ────────────────────────────────────────────────────────────

USE WF;

-- 1️⃣  FIRST_VALUE() — menor... na verdade, a Qtd_Vendida da 1ª loja
--     na ordem de Qtd_Vendida DESC (ou seja, a maior venda)

SELECT DISTINCT
    ID_Loja AS "ID da Loja",
    Nome_Loja AS "Nome da Loja",
    Regiao as "Região",
    Qtd_Vendida as "QTD. Vendida",
    FIRST_VALUE(Qtd_Vendida) OVER(ORDER BY Qtd_Vendida DESC) AS 'Maior Venda Geral'
FROM
    Lojas
ORDER BY
    Qtd_Vendida DESC;

-- 2️⃣  LAST_VALUE() SEM ajustar o frame — resultado errado!
--     Cada linha traz a si mesma, pois o frame padrão vai até a linha atual

SELECT DISTINCT
    ID_Loja AS "ID da Loja",
    Nome_Loja AS "Nome da Loja",
    Regiao as "Região",
    Qtd_Vendida as "QTD. Vendida",
    LAST_VALUE(Qtd_Vendida) OVER(ORDER BY Qtd_Vendida DESC) AS 'Menor Venda Geral (errado)'
FROM
    Lojas
ORDER BY
    Qtd_Vendida DESC;

-- 3️⃣  LAST_VALUE() com o frame corrigido — agora sim, traz a menor
--     venda da lista inteira em todas as linhas

SELECT DISTINCT
    ID_Loja AS "ID da Loja",
    Nome_Loja AS "Nome da Loja",
    Regiao as "Região",
    Qtd_Vendida as "QTD. Vendida",
    LAST_VALUE(Qtd_Vendida) OVER(
        ORDER BY Qtd_Vendida DESC
        ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
    ) AS 'Menor Venda Geral'
FROM
    Lojas
ORDER BY
    Qtd_Vendida DESC;

-- 4️⃣  FIRST_VALUE() e LAST_VALUE() lado a lado — maior e menor venda
--     de cada linha, sempre em relação ao total geral

SELECT DISTINCT
    ID_Loja AS "ID da Loja",
    Nome_Loja AS "Nome da Loja",
    Regiao as "Região",
    Qtd_Vendida as "QTD. Vendida",
    FIRST_VALUE(Qtd_Vendida) OVER(ORDER BY Qtd_Vendida DESC) AS 'Maior Venda',
    LAST_VALUE(Qtd_Vendida) OVER(
        ORDER BY Qtd_Vendida DESC
        ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
    ) AS 'Menor Venda'
FROM
    Lojas
ORDER BY
    Qtd_Vendida DESC;

-- 5️⃣  FIRST_VALUE() e LAST_VALUE() dentro de cada região — PARTITION BY
--     reinicia a busca, trazendo a maior e a menor venda de cada região

SELECT DISTINCT
    ID_Loja AS "ID da Loja",
    Nome_Loja AS "Nome da Loja",
    Regiao as "Região",
    Qtd_Vendida as "QTD. Vendida",
    FIRST_VALUE(Qtd_Vendida) OVER(
        PARTITION BY Regiao ORDER BY Qtd_Vendida DESC
    ) AS 'Maior Venda na Região',
    LAST_VALUE(Qtd_Vendida) OVER(
        PARTITION BY Regiao ORDER BY Qtd_Vendida DESC
        ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
    ) AS 'Menor Venda na Região'
FROM
    Lojas
ORDER BY
    Regiao, Qtd_Vendida DESC;

-- 6️⃣  Calculando a diferença de cada loja em relação à maior venda
--     da sua região

SELECT DISTINCT
    ID_Loja AS "ID da Loja",
    Nome_Loja AS "Nome da Loja",
    Regiao as "Região",
    Qtd_Vendida as "QTD. Vendida",
    FIRST_VALUE(Qtd_Vendida) OVER(
        PARTITION BY Regiao ORDER BY Qtd_Vendida DESC
    ) AS 'Maior Venda na Região',
    FIRST_VALUE(Qtd_Vendida) OVER(
        PARTITION BY Regiao ORDER BY Qtd_Vendida DESC
    ) - Qtd_Vendida AS 'Diferença para a Líder'
FROM
    Lojas
ORDER BY
    Regiao, Qtd_Vendida DESC;
