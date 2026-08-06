-- ============================================================
-- 🗄️  SQL Server  |  📦 Módulo 15 — Window Functions
-- 📖 Aula 3 de 14  |  Calculando percentual de participação
-- ============================================================

/*
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📚 CONCEITO — % de participação com Window Functions
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  Agora que SUM() OVER() já traz o total geral ao lado de cada
  linha (Aula 2), o próximo passo natural é calcular o quanto
  cada loja representa desse total:

      % participação = Qtd_Vendida / Total Geral * 100

  Como o total geral (SUM(Qtd_Vendida) OVER()) fica disponível em
  toda linha, basta dividir a própria Qtd_Vendida por ele — sem
  precisar de subquery nem de GROUP BY.

  Nesta Parte 1, o cálculo é feito em relação ao total da REDE
  INTEIRA (OVER() sem PARTITION BY). A versão por região
  (PARTITION BY Regiao) fica para a Parte 2.
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
*/

-- ────────────────────────────────────────────────────────────
-- 🏋️ Exemplo prático
-- ────────────────────────────────────────────────────────────

USE WF

-- 1️⃣  Ponto de partida — total geral vendido pela rede (Aula 2)

SELECT DISTINCT
    SUM(Qtd_Vendida) OVER() AS 'Total Vendido'
FROM Lojas;

-- 2️⃣  % de participação — Qtd_Vendida dividida pelo total geral

SELECT
    ID_Loja,
    Nome_Loja,
    Regiao,
    Qtd_Vendida,
    SUM(Qtd_Vendida) OVER() AS 'Total Vendido',
    Qtd_Vendida * 100.0 / SUM(Qtd_Vendida) OVER() AS '% Participação'
FROM
    Lojas
ORDER BY
    ID_Loja;

-- 3️⃣  Formatando o percentual — CONVERT(DECIMAL(5,2), ...)

SELECT
    ID_Loja,
    Nome_Loja,
    Regiao,
    Qtd_Vendida,
    SUM(Qtd_Vendida) OVER() AS 'Total Vendido',
    CONVERT(DECIMAL(5,2), Qtd_Vendida * 100.0 / SUM(Qtd_Vendida) OVER()) AS '% Participação'
FROM
    Lojas
ORDER BY
    ID_Loja;