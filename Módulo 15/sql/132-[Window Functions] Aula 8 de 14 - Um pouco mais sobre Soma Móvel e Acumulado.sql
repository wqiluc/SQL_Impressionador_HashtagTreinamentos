-- ============================================================
-- 🗄️  SQL Server  |  📦 Módulo 15 — Window Functions
-- 📖 Aula 8 de 14  |  Um pouco mais sobre Soma Móvel e Acumulado
-- ============================================================

/*
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📚 CONCEITO — Variações do frame: DESC, FOLLOWING e ROWS x RANGE
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  As Aulas 6 e 7 fixaram o "início" do frame em UNBOUNDED PRECEDING
  (do começo até a linha atual). Mas o frame pode se mover em
  qualquer direção, dependendo do que se quer responder:

  • ORDER BY ... DESC           → o "acumulado" passa a somar da
                                  ÚLTIMA linha até a atual, ou seja,
                                  mostra "quanto ainda falta somar".

  • CURRENT ROW AND N FOLLOWING → olha para FRENTE em vez de para
                                  trás (soma/média dos próximos
                                  registros a partir do atual).

  • CURRENT ROW AND UNBOUNDED
    FOLLOWING                  → soma tudo da linha atual até o
                                  fim da partição (o "restante").

  Outro detalhe importante: por padrão, quando só se usa ORDER BY
  (sem ROWS BETWEEN explícito), o SQL Server usa RANGE, não ROWS.
  A diferença só aparece quando há EMPATE no ORDER BY:

  • ROWS  → cada linha é tratada individualmente, na ordem física
            do resultado, mesmo que tenha o mesmo valor de outra.

  • RANGE → linhas empatadas no ORDER BY são tratadas como um único
            "grupo de pares" (peer group) e recebem o MESMO valor
            acumulado — como no RANK() (Aula 4), que também iguala
            posições empatadas.
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
*/

-- ────────────────────────────────────────────────────────────
-- 🏋️ Exemplo prático
-- ────────────────────────────────────────────────────────────

USE WF;

-- 1️⃣  Acumulado em ordem decrescente — "quanto falta somar" a partir da linha atual

SELECT DISTINCT
    ID_Loja AS "ID da Loja",
    Nome_Loja AS "Nome da Loja",
    Regiao as "Região",
    Qtd_Vendida as "QTD. Vendida",
    SUM(Qtd_Vendida) OVER(ORDER BY ID_Loja DESC) AS 'Acumulado (do fim para o início)'
FROM
    Lojas
ORDER BY
    ID_Loja;

-- 2️⃣  Soma olhando para frente — ROWS BETWEEN CURRENT ROW AND 2 FOLLOWING

SELECT DISTINCT
    ID_Loja AS "ID da Loja",
    Nome_Loja AS "Nome da Loja",
    Regiao as "Região",
    Qtd_Vendida as "QTD. Vendida",
    SUM(Qtd_Vendida) OVER(ORDER BY ID_Loja ROWS BETWEEN CURRENT ROW AND 2 FOLLOWING) AS 'Soma da Atual + 2 Próximas'
FROM
    Lojas
ORDER BY
    ID_Loja;

-- 3️⃣  "Restante a somar" — da linha atual até o fim da partição

SELECT DISTINCT
    ID_Loja AS "ID da Loja",
    Nome_Loja AS "Nome da Loja",
    Regiao as "Região",
    Qtd_Vendida as "QTD. Vendida",
    SUM(Qtd_Vendida) OVER(ORDER BY ID_Loja ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING) AS 'Restante a Somar'
FROM
    Lojas
ORDER BY
    ID_Loja;

-- 4️⃣  Média móvel por região — ROWS BETWEEN combinado com PARTITION BY

SELECT DISTINCT
    ID_Loja AS "ID da Loja",
    Nome_Loja AS "Nome da Loja",
    Regiao as "Região",
    Qtd_Vendida as "QTD. Vendida",
    AVG(Qtd_Vendida) OVER(PARTITION BY Regiao ORDER BY ID_Loja ROWS BETWEEN 1 PRECEDING AND CURRENT ROW) AS 'Média Móvel na Região (2 lojas)'
FROM
    Lojas
ORDER BY
    Regiao, ID_Loja;

-- 5️⃣  ROWS x RANGE — o empate em Qtd_Vendida (1800, lojas 1 e 4) muda o resultado

SELECT DISTINCT
    ID_Loja AS "ID da Loja",
    Nome_Loja AS "Nome da Loja",
    Regiao as "Região",
    Qtd_Vendida as "QTD. Vendida",
    SUM(Qtd_Vendida) OVER(ORDER BY Qtd_Vendida DESC ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS 'Acumulado com ROWS',
    SUM(Qtd_Vendida) OVER(ORDER BY Qtd_Vendida DESC RANGE BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) AS 'Acumulado com RANGE'
FROM
    Lojas
ORDER BY
    Qtd_Vendida DESC;