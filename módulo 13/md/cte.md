<h1 align="center">
  🧩 CTE — Common Table Expression <br>
  <img src="https://img.shields.io/badge/-WITH%20..%20AS-22c55e?style=flat-square"/>
</h1>

<p align="center">
  <img src="https://img.shields.io/badge/-SQL%20Server-111827?style=flat-square&logo=microsoftsqlserver&logoColor=white"/>
  <img src="https://img.shields.io/badge/Módulo-13-4FC3F7?style=flat-square"/>
  <img src="https://img.shields.io/badge/Aulas-14%20a%2017-blueviolet?style=flat-square"/>
</p>

---

<h2 align="center">💡 O que é uma CTE? <br>
<img src="https://img.shields.io/badge/-Conceito-f59e0b?style=flat-square"/></h2>

<p align="center">
  Uma <strong>CTE</strong> (Common Table Expression) é uma <em>tabela temporária nomeada</em>,
  declarada no início de uma query com a cláusula <code>WITH</code>.<br>
  Ela existe apenas durante a execução do bloco e serve para tornar a query mais legível e organizada.
</p>

**Sintaxe básica:**

```sql
WITH nome_cte AS (
    SELECT ...
)
SELECT ... FROM nome_cte
```

---

<h2 align="center">🔄 CTE vs Subquery no FROM <br>
<img src="https://img.shields.io/badge/-Comparativo-475569?style=flat-square"/></h2>

| Abordagem | Legibilidade | Reutilizável |
|-----------|-------------|-------------|
| Subquery no `FROM` | ❌ Encadeada, difícil de ler | ❌ Não (inline) |
| CTE | ✅ Declarada antes, separada | ✅ Referenciável múltiplas vezes |

**Mesma lógica — as duas formas:**

```sql
-- Com Subquery no FROM (menos legível)
SELECT AVG(Total)
FROM (
    SELECT BrandName, COUNT(*) AS Total
    FROM DimProduct
    GROUP BY BrandName
) AS T

-- Com CTE (mais legível)
WITH cte AS (
    SELECT BrandName, COUNT(*) AS Total
    FROM DimProduct
    GROUP BY BrandName
)
SELECT AVG(Total)
FROM cte
```

---

<h2 align="center">🟢 CTE — Criando e consumindo <br>
<img src="https://img.shields.io/badge/-Aula%2014-22c55e?style=flat-square"/></h2>

**Exemplo:** Criar uma CTE com os produtos da marca Contoso e contar quantos existem.

```sql
WITH cte AS (
    SELECT
        ProductKey,
        ProductName,
        BrandName,
        ColorName,
        UnitPrice
    FROM   DimProduct
    WHERE  BrandName = 'Contoso'
)

SELECT COUNT(*)
FROM   cte
```

> 📌 Após o `WITH`, a CTE é usada exatamente como uma tabela — pode aplicar `WHERE`, `JOIN`, `GROUP BY`, etc.

---

<h2 align="center">📊 Agregação sobre agregação <br>
<img src="https://img.shields.io/badge/-Aula%2015-22c55e?style=flat-square"/></h2>

<p align="center">
  Um caso clássico: calcular a <strong>média dos totais por grupo</strong>.<br>
  Sem CTE, exigiria uma Subquery no <code>FROM</code>.
</p>

**Exemplo:** Qual é a média de produtos por marca?

```sql
WITH cte AS (
    -- Passo 1: total de produtos por marca
    SELECT
        BrandName,
        COUNT(*) AS Total
    FROM   DimProduct
    GROUP BY BrandName
)

-- Passo 2: média dos totais
SELECT AVG(Total)
FROM   cte
```

> 💡 A CTE permite "empilhar" agregações de forma clara — primeiro agrupa, depois calcula em cima.

---

<h2 align="center">🏷️ Nomeando colunas na assinatura da CTE <br>
<img src="https://img.shields.io/badge/-Aula%2016-22c55e?style=flat-square"/></h2>

<p align="center">
  Os nomes das colunas podem ser definidos diretamente na <strong>declaração da CTE</strong>,
  sem precisar de <code>AS</code> dentro do <code>SELECT</code>.
</p>

**Sintaxe:**

```sql
WITH nome_cte(Coluna1, Coluna2) AS (
    SELECT campo1, campo2 FROM ...
)
```

> 📌 O mapeamento é **posicional**: 1º campo do SELECT → `Coluna1`, 2º → `Coluna2`, etc.

**Exemplo:**

```sql
WITH cte(Marca, Total) AS (
    SELECT
        BrandName,
        COUNT(*)
    FROM   DimProduct
    GROUP BY BrandName
)

SELECT
    Marca,
    Total
FROM cte
ORDER BY Total DESC
```

| Quando usar | Benefício |
|-------------|-----------|
| Colunas sem alias (`COUNT(*)`, `SUM(x)`) | Evita alias duplicado (dentro e fora da CTE) |
| Renomear campos herdados | Mantém nomes limpos na query principal |

---

<h2 align="center">🔗 Múltiplas CTEs <br>
<img src="https://img.shields.io/badge/-Aula%2017-22c55e?style=flat-square"/></h2>

<p align="center">
  É possível declarar várias CTEs em sequência, separadas por <strong>vírgula</strong>.<br>
  A segunda CTE pode até <strong>referenciar a primeira</strong>.
</p>

**Sintaxe:**

```sql
WITH cte1 AS (
    SELECT ...
),
cte2 AS (
    SELECT ... FROM cte1   -- pode referenciar cte1
)
SELECT ... FROM cte1 JOIN cte2 ...
```

**Exemplo:** Top 100 vendas recentes de produtos Contoso.

```sql
WITH produtos_contoso AS (
    SELECT
        ProductKey,
        ProductName,
        BrandName
    FROM   DimProduct
    WHERE  BrandName = 'Contoso'
),
vendas_top100 AS (
    SELECT TOP(100)
        SalesKey,
        ProductKey,
        DateKey,
        SalesQuantity
    FROM   FactSales
    ORDER BY DateKey DESC
)

SELECT
    v.SalesKey,
    v.DateKey,
    v.SalesQuantity,
    p.ProductName,
    p.BrandName
FROM   vendas_top100 AS v
INNER JOIN produtos_contoso AS p
    ON v.ProductKey = p.ProductKey
ORDER BY v.DateKey DESC
```

> ⚠️ Apenas **um** `WITH` por bloco SQL — todas as CTEs ficam dentro dele, separadas por vírgula.

---

<h2 align="center">📋 Resumo das formas de CTE <br>
<img src="https://img.shields.io/badge/-Resumo-475569?style=flat-square"/></h2>

| Forma | Sintaxe | Quando usar |
|-------|---------|-------------|
| CTE simples | `WITH cte AS (SELECT ...)` | Legibilidade, reutilização |
| CTE com colunas nomeadas | `WITH cte(Col1, Col2) AS (...)` | Colunas sem alias, renomear campos |
| Múltiplas CTEs | `WITH cte1 AS (...), cte2 AS (...)` | Passos encadeados, JOINs entre CTEs |

---

<p align="center">
  <a href="subquery-avancado.md">⬅️ Anterior</a>
  &nbsp;&nbsp;|&nbsp;&nbsp;
  <a href="README.md">🏠 Índice</a>
</p>
