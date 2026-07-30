-- ============================================================
-- 🗄️  SQL Server  |  📦 Módulo 15 — Window Functions
-- 📖 Aula 11 de 14  |  Cálculo MoM (Month over Month) - Parte 2
-- ============================================================

/*
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📚 CONCEITO — MoM por grupo (PARTITION BY) e formatação do resultado
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  A Parte 1 calculou o MoM para uma única loja. Na prática, quase
  sempre existe mais de uma loja/produto/vendedor, e o LAG() não
  pode "vazar" o mês de dezembro de uma loja para o mês de janeiro
  de outra.

  A solução é a mesma de sempre: PARTITION BY. Ao particionar por
  ID_Loja, o LAG() busca o mês anterior DENTRO da própria loja,
  reiniciando a cada partição — exatamente como a soma acumulada
  reiniciava por Regiao (Aula 7).

  Para deixar o resultado pronto para leitura, dois complementos
  são úteis:
      CONVERT(DECIMAL(5,2), ...) → arredonda o percentual
      CASE WHEN ...              → rotula o mês como crescimento,
                                    queda ou estável

  Este exemplo expande a tabela da Parte 1 para duas lojas, cada
  uma com 12 meses de faturamento em 2025.
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
*/

-- ────────────────────────────────────────────────────────────
-- 🏋️ Exemplo prático
-- ────────────────────────────────────────────────────────────

USE WF;

-- 0️⃣  Criação da tabela Faturamento_Mensal_Lojas — 2 lojas, 12 meses cada

CREATE TABLE Faturamento_Mensal_Lojas(
   ID INT,
   ID_Loja INT,
   Nome_Loja VARCHAR(100),
   Ano INT,
   Mes INT,
   Faturamento FLOAT
)

INSERT INTO Faturamento_Mensal_Lojas(ID, ID_Loja, Nome_Loja, Ano, Mes, Faturamento)
VALUES
   (1, 1, 'Botafogo Praia&Mar', 2025, 1, 45000),
   (2, 1, 'Botafogo Praia&Mar', 2025, 2, 47500),
   (3, 1, 'Botafogo Praia&Mar', 2025, 3, 43200),
   (4, 1, 'Botafogo Praia&Mar', 2025, 4, 51000),
   (5, 1, 'Botafogo Praia&Mar', 2025, 5, 49800),
   (6, 1, 'Botafogo Praia&Mar', 2025, 6, 52300),
   (7, 1, 'Botafogo Praia&Mar', 2025, 7, 48700),
   (8, 1, 'Botafogo Praia&Mar', 2025, 8, 55600),
   (9, 1, 'Botafogo Praia&Mar', 2025, 9, 53100),
   (10, 1, 'Botafogo Praia&Mar', 2025, 10, 58900),
   (11, 1, 'Botafogo Praia&Mar', 2025, 11, 61200),
   (12, 1, 'Botafogo Praia&Mar', 2025, 12, 67500),
   (13, 9, 'Amazonas Prime', 2025, 1, 38000),
   (14, 9, 'Amazonas Prime', 2025, 2, 36500),
   (15, 9, 'Amazonas Prime', 2025, 3, 39900),
   (16, 9, 'Amazonas Prime', 2025, 4, 37200),
   (17, 9, 'Amazonas Prime', 2025, 5, 41000),
   (18, 9, 'Amazonas Prime', 2025, 6, 40100),
   (19, 9, 'Amazonas Prime', 2025, 7, 43500),
   (20, 9, 'Amazonas Prime', 2025, 8, 42800),
   (21, 9, 'Amazonas Prime', 2025, 9, 39700),
   (22, 9, 'Amazonas Prime', 2025, 10, 44200),
   (23, 9, 'Amazonas Prime', 2025, 11, 46000),
   (24, 9, 'Amazonas Prime', 2025, 12, 45300)

-- 1️⃣  LAG() sem PARTITION BY — errado! janeiro da Amazonas Prime "herda" dezembro da Botafogo

SELECT DISTINCT
    Nome_Loja as "Loja",
    Ano as "Ano",
    Mes as "Mês",
    Faturamento as "Faturamento",
    LAG(Faturamento) OVER(ORDER BY Ano, Mes) AS 'Faturamento do Mês Anterior (SEM partição)'
FROM
    Faturamento_Mensal_Lojas
ORDER BY
    ID_Loja, Ano, Mes;

-- 2️⃣  LAG() com PARTITION BY ID_Loja — cada loja reinicia sua própria comparação

SELECT DISTINCT
    Nome_Loja as "Loja",
    Ano as "Ano",
    Mes as "Mês",
    Faturamento as "Faturamento",
    LAG(Faturamento) OVER(PARTITION BY ID_Loja ORDER BY Ano, Mes) AS 'Faturamento do Mês Anterior'
FROM
    Faturamento_Mensal_Lojas
ORDER BY
    ID_Loja, Ano, Mes;

-- 3️⃣  MoM % por loja, já arredondado com CONVERT(DECIMAL(5,2), ...)

SELECT DISTINCT
    Nome_Loja as "Loja",
    Ano as "Ano",
    Mes as "Mês",
    Faturamento as "Faturamento",
    CONVERT(
        DECIMAL(5,2),
        (Faturamento - LAG(Faturamento) OVER(PARTITION BY ID_Loja ORDER BY Ano, Mes))
        / LAG(Faturamento) OVER(PARTITION BY ID_Loja ORDER BY Ano, Mes) * 100
    ) AS 'MoM %'
FROM
    Faturamento_Mensal_Lojas
ORDER BY
    ID_Loja, Ano, Mes;

-- 4️⃣  Relatório completo — MoM % arredondado + rótulo de Crescimento/Queda/Estável

SELECT DISTINCT
    Nome_Loja as "Loja",
    Ano as "Ano",
    Mes as "Mês",
    Faturamento as "Faturamento",
    CONVERT(
        DECIMAL(5,2),
        ISNULL(
            (Faturamento - LAG(Faturamento) OVER(PARTITION BY ID_Loja ORDER BY Ano, Mes))
            / LAG(Faturamento) OVER(PARTITION BY ID_Loja ORDER BY Ano, Mes) * 100,
        0)
    ) AS 'MoM %',
    CASE
        WHEN 
            LAG(Faturamento) OVER(PARTITION BY ID_Loja ORDER BY Ano, Mes) 
            IS NULL THEN 'Sem mês anterior'
        WHEN 
            Faturamento > LAG(Faturamento) 
            OVER(PARTITION BY ID_Loja ORDER BY Ano, Mes) THEN '📈 Crescimento'
        WHEN 
            Faturamento < LAG(Faturamento) 
            OVER(PARTITION BY ID_Loja ORDER BY Ano, Mes) 
            THEN 
                '📉 Queda'
        ELSE 
            'Estável'
    END AS 
        'Tendência'
FROM
    Faturamento_Mensal_Lojas
ORDER BY
    ID_Loja, Ano, Mes;