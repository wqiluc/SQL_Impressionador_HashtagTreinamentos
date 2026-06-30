<h1 align="center">
  ⚡ Subquery Avançada <br>
  <img src="https://img.shields.io/badge/-SELECT%20%7C%20FROM%20%7C%20EXISTS%20%7C%20ANY%20%7C%20ALL-4f46e5?style=flat-square"/>
</h1>

<p align="center">
  <img src="https://img.shields.io/badge/-SQL%20Server-111827?style=flat-square&logo=microsoftsqlserver&logoColor=white"/>
  <img src="https://img.shields.io/badge/Módulo-13-4FC3F7?style=flat-square"/>
  <img src="https://img.shields.io/badge/Aulas-6%20a%2013-blueviolet?style=flat-square"/>
</p>

---

<h2 align="center">🔶 Subquery no SELECT — Nova coluna calculada <br>
<img src="https://img.shields.io/badge/-SELECT%20Correlacionado-8b5cf6?style=flat-square"/></h2>

<p align="center">
  Ao colocar uma Subquery dentro do <code>SELECT</code>, ela é executada <strong>uma vez por linha</strong> da query externa —<br>
  chamamos de <strong>Subquery correlacionada</strong>.
</p>

> ⚠️ A Subquery no `SELECT` deve retornar **exatamente um valor** (escalar). Mais de uma linha → erro.

**Exemplo:** Retornar todos os produtos com a quantidade total de vendas de cada um.

```sql
SELECT
    ProductKey,
    ProductName,
    (SELECT COUNT(ProductKey)
     FROM   FactSales
     WHERE  FactSales.ProductKey = DimProduct.ProductKey) AS 'Qtd. Vendas'
FROM
    DimProduct
```

> 📌 A correlação `FactSales.ProductKey = DimProduct.ProductKey` liga a Subquery à linha atual
> da query externa — por isso ela executa uma vez para cada produto.

---

<h2 align="center">🔵 Subquery no FROM — Derived Table <br>
<img src="https://img.shields.io/badge/-FROM%20Derived%20Table-06b6d4?style=flat-square"/></h2>

<p align="center">
  Uma Subquery no <code>FROM</code> cria uma <strong>tabela derivada</strong> — existe apenas durante a execução.<br>
  É obrigatório dar um <strong>alias</strong> a ela com <code>AS</code>.
</p>

**Exemplo:** Contar produtos da marca Contoso via derived table.

```sql
SELECT COUNT(*)
FROM 
(
    SELECT *
    FROM   DimProduct
    WHERE  BrandName = 'Contoso'
) AS T
```

| Abordagem | Quando usar |
|-----------|-------------|
| `WHERE BrandName = 'Contoso'` | Simples — filtro direto |
| Subquery no `FROM` | Quando precisa aninhar outra agregação em cima do resultado filtrado |

---

<h2 align="center">🟣 ANY, SOME e ALL <br>
<img src="https://img.shields.io/badge/-ANY%20%7C%20SOME%20%7C%20ALL-f59e0b?style=flat-square"/></h2>

<p align="center">
  Operadores que comparam um valor contra uma <strong>lista de valores</strong> retornada por uma Subquery.
</p>

<div align="center">

<img src="https://img.shields.io/badge/=ANY-igual%20ao%20IN-3b82f6?style=for-the-badge"/>
<img src="https://img.shields.io/badge/>ANY-maior%20que%20o%20mínimo-22c55e?style=for-the-badge"/>
<img src="https://img.shields.io/badge/<ANY-menor%20que%20o%20máximo-22c55e?style=for-the-badge"/>
<img src="https://img.shields.io/badge/>ALL-maior%20que%20o%20máximo-ef4444?style=for-the-badge"/>
<img src="https://img.shields.io/badge/<ALL-menor%20que%20o%20mínimo-ef4444?style=for-the-badge"/>

</div>

<br>

| Operador | Equivalente | Resultado |
|----------|-------------|-----------|
| `= ANY(lista)` | `IN (lista)` | Verdadeiro se igual a **algum** valor |
| `> ANY(lista)` | `> MIN(lista)` | Verdadeiro se maior que o **menor** valor |
| `< ANY(lista)` | `< MAX(lista)` | Verdadeiro se menor que o **maior** valor |
| `> ALL(lista)` | `> MAX(lista)` | Verdadeiro se maior que **todos** (maior que o máximo) |
| `< ALL(lista)` | `< MIN(lista)` | Verdadeiro se menor que **todos** (menor que o mínimo) |

> 📌 `SOME` é sinônimo exato de `ANY` — mesmo comportamento, existe apenas por conveniência.

**Exemplo:**

```sql
-- Funcionários com idade maior que TODOS os homens (> máximo dos homens)
SELECT * FROM funcionarios
WHERE idade > ALL (SELECT idade FROM funcionarios WHERE sexo = 'M')
```

---

<h2 align="center">🔴 EXISTS — Verificação de presença <br>
<img src="https://img.shields.io/badge/-EXISTS-ef4444?style=flat-square"/></h2>

<p align="center">
  <code>EXISTS</code> verifica se a Subquery retorna <strong>ao menos uma linha</strong>.<br>
  Retorna <code>TRUE</code> ou <code>FALSE</code> — o <em>valor</em> das linhas não importa, apenas a <em>existência</em>.
</p>

**Exemplo:** Produtos que possuem ao menos uma venda em 01/01/2007.

```sql
SELECT ProductKey, ProductName
FROM   DimProduct
WHERE  EXISTS (
    SELECT ProductKey
    FROM   FactSales
    WHERE  DateKey               = '01/01/2007'
      AND  FactSales.ProductKey  = DimProduct.ProductKey  -- correlação
)
```

| Operador | Diferença |
|----------|-----------|
| `IN` | Compara **valores** — carrega toda a lista na memória |
| `EXISTS` | Verifica **presença** — para assim que encontra a primeira linha (mais eficiente em listas grandes) |

---

<h2 align="center">🟢 Subquery Aninhada — Nested Subquery <br>
<img src="https://img.shields.io/badge/-Subquery%20Aninhada-22c55e?style=flat-square"/></h2>

<p align="center">
  É possível colocar uma Subquery dentro de outra Subquery — quantos níveis forem necessários.<br>
  A execução sempre ocorre <strong>de dentro para fora</strong>.
</p>

**Exemplo:** Clientes que ganham o segundo maior salário.

```sql
SELECT CustomerKey, FirstName, LastName, YearlyIncome
FROM   DimCustomer
WHERE  YearlyIncome = 
(
    -- Nível 2: maior salário abaixo do máximo absoluto
    SELECT MAX(YearlyIncome)
    FROM   DimCustomer
    WHERE  YearlyIncome < 
    (
        -- Nível 3: maior salário absoluto
        SELECT MAX(YearlyIncome)
        FROM   DimCustomer
        WHERE  CustomerType = 'Person'
    )
)
```

> 💡 Para encontrar o **N-ésimo maior** valor, aninhe N-1 níveis de `MAX ... WHERE < (MAX ...)`.

---

<h2 align="center">📊 Comparativo geral <br>
<img src="https://img.shields.io/badge/-Comparativo-475569?style=flat-square"/></h2>

| Técnica | Posição | Retorna | Típico uso |
|---------|---------|---------|------------|
| Subquery escalar | `WHERE =` | 1 valor | Filtrar por média, máximo, etc. |
| Subquery em lista | `WHERE IN` | N linhas | Filtrar por IDs de outra tabela |
| Subquery correlacionada | `SELECT` | 1 valor por linha | Coluna calculada dinamicamente |
| Derived table | `FROM` | Tabela | Agregar sobre resultado filtrado |
| `ANY / ALL` | `WHERE` | Booleano | Comparar contra min/max de lista |
| `EXISTS` | `WHERE` | Booleano | Verificar se existe relacionamento |
| Aninhada | Dentro de outra | Qualquer | Resolver em múltiplas etapas |

---

<p align="center">
  <a href="subquery.md">⬅️ Anterior</a>
  &nbsp;&nbsp;|&nbsp;&nbsp;
  <a href="README.md">🏠 Índice</a>
  &nbsp;&nbsp;|&nbsp;&nbsp;
  <a href="cte.md">Próximo ➡️</a>
</p>
