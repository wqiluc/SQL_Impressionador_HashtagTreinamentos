-- ============================================================
-- 🗄️  SQL Server  |  📦 Módulo 15 — Window Functions
-- 📖 Aula 10 de 14  |  Cálculo MoM (Month over Month) - Parte 1
-- ============================================================

/*
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📚 CONCEITO — MoM (Month over Month)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  MoM (Month over Month) é a variação de uma métrica de um mês em
  relação ao mês IMEDIATAMENTE ANTERIOR — a forma mais comum de
  acompanhar tendência de curto prazo (crescendo? caindo? estável?).

  A fórmula é sempre a mesma:
      MoM % = (Mês Atual − Mês Anterior) / Mês Anterior * 100

  O "Mês Anterior" é exatamente o que o LAG() (Aula 9) resolve: ele
  traz, para a linha do mês atual, o valor do mês que veio antes —
  bastando um ORDER BY cronológico dentro do OVER().

  Como a tabela Lojas não tem uma dimensão de tempo, este exemplo
  usa uma nova tabela, Faturamento_Mensal, com o faturamento de uma
  loja ao longo dos 12 meses de 2025.
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
*/

-- ────────────────────────────────────────────────────────────
-- 🏋️ Exemplo prático
-- ────────────────────────────────────────────────────────────

USE WF;

-- 0️⃣  Criação da tabela Faturamento_Mensal — 12 meses de 2025

CREATE TABLE Faturamento_Mensal(
   ID INT,
   Ano INT,
   Mes INT,
   Faturamento FLOAT
)

INSERT INTO Faturamento_Mensal(ID, Ano, Mes, Faturamento)
VALUES
   (1, 2025, 1, 45000),
   (2, 2025, 2, 47500),
   (3, 2025, 3, 43200),
   (4, 2025, 4, 51000),
   (5, 2025, 5, 49800),
   (6, 2025, 6, 52300),
   (7, 2025, 7, 48700),
   (8, 2025, 8, 55600),
   (9, 2025, 9, 53100),
   (10, 2025, 10, 58900),
   (11, 2025, 11, 61200),
   (12, 2025, 12, 67500)

-- 1️⃣  LAG() — trazendo o faturamento do mês anterior para a linha atual

SELECT DISTINCT
    Ano as "Ano",
    Mes as "Mês",
    Faturamento as "Faturamento",
    LAG(Faturamento) OVER(ORDER BY Ano, Mes) AS 'Faturamento do Mês Anterior'
FROM
    Faturamento_Mensal
ORDER BY
    Ano, Mes;

-- 2️⃣  Variação absoluta — quanto o faturamento subiu ou caiu em relação ao mês anterior

SELECT DISTINCT
    Ano as "Ano",
    Mes as "Mês",
    Faturamento as "Faturamento",
    LAG(Faturamento) OVER(ORDER BY Ano, Mes) AS 'Faturamento do Mês Anterior',
    Faturamento - LAG(Faturamento) OVER(ORDER BY Ano, Mes) AS 'Variação Absoluta'
FROM
    Faturamento_Mensal
ORDER BY
    Ano, Mes;

-- 3️⃣  MoM % — a fórmula completa: (Atual - Anterior) / Anterior * 100

SELECT DISTINCT
    Ano as "Ano",
    Mes as "Mês",
    Faturamento as "Faturamento",
    LAG(Faturamento) OVER(ORDER BY Ano, Mes) AS 'Faturamento do Mês Anterior',
    (Faturamento - LAG(Faturamento) OVER(ORDER BY Ano, Mes)) / LAG(Faturamento) OVER(ORDER BY Ano, Mes) * 100 AS 'MoM %'
FROM
    Faturamento_Mensal
ORDER BY
    Ano, Mes;

-- 4️⃣  Tratando o primeiro mês — sem mês anterior, o MoM vira NULL (não há divisão possível)

SELECT DISTINCT
    Ano as "Ano",
    Mes as "Mês",
    Faturamento as "Faturamento",
    LAG(Faturamento) OVER(ORDER BY Ano, Mes) AS 'Faturamento do Mês Anterior',
    ISNULL((Faturamento - LAG(Faturamento) OVER(ORDER BY Ano, Mes)) / LAG(Faturamento) OVER(ORDER BY Ano, Mes) * 100, 0) AS 'MoM %'
FROM
    Faturamento_Mensal
ORDER BY
    Ano, Mes;
