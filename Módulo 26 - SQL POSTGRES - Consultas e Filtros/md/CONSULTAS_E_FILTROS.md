<h1 align="center">
  🔍 Consultas e Filtros no PostgreSQL <br>
  <img src="https://img.shields.io/badge/-Virando%20a%20Chave%20%E2%80%94%20SQL%20Server%20%E2%86%92%20PostgreSQL-orange?style=flat-square"/>
</h1>

<p align="center">
  <img src="https://img.shields.io/badge/-PostgresSQL-336791?style=flat-square&logo=postgresql&logoColor=white"/>
  <img src="https://img.shields.io/badge/Módulo-26-4FC3F7?style=flat-square"/>
  <img src="https://img.shields.io/badge/Banco-Northwind-16a34a?style=flat-square"/>
</p>

> 📌 Este módulo dá continuidade ao [Módulo 25](../../Módulo%2025%20-%20SQL%20POSTGRES%20-%20Introdução/md/INTRODUCAO_POSTGRES.md),
> agora aplicando no PostgreSQL os fundamentos de **consulta** (`SELECT`) e **filtragem** (`WHERE`) de
> dados, sempre usando o banco **Northwind** como base de exercícios.

<h2 align="center">📂 Scripts do módulo <br>
<img src="https://img.shields.io/badge/-sql%2F-475569?style=flat-square"/></h2>

Os scripts estão numerados por aula na pasta [`sql/`](../sql/), seguindo o mesmo padrão do Módulo 25:

| # | Arquivo | Tópico |
|---|---------|--------|
| 217 | `Aula 1 de 5 - SELECT FROM.sql` | Selecionando dados das tabelas |
| 218 | `Aula 2 de 5 - Comentários no PostgreSQL.sql` | Comentários de 1 linha e de múltiplas linhas |
| 219 | `Aula 3 de 5 - SELECT AS (Aliasing).sql` | Renomeando colunas e tabelas com `AS` |
| 220 | `Aula 4 de 5 - SELECT LIMIT.sql` | Limitando a quantidade de linhas retornadas |
| 221 | `Aula 5 de 5 - SELECT DISTINCT.sql` | Selecionando valores distintos de uma coluna |
| 222 | `Aula 1 de 5 - WHERE (Filtros).sql` | Criando filtros nas consultas |
| 223 | `Aula 2 de 5 - WHERE AND e OR.sql` | Combinando múltiplas condições |
| 224 | `Aula 3 de 5 - WHERE LIKE.sql` | Filtros especiais de texto |
| 225 | `Aula 4 de 5 - WHERE IN.sql` | Alternativa ao uso de múltiplos `OR` |
| 226 | `Aula 5 de 5 - WHERE BETWEEN.sql` | Alternativa ao `AND` para filtrar intervalos |

---

<h2 align="center">🧱 Parte 1 — Criando queries básicas <br>
<img src="https://img.shields.io/badge/-SELECT-3b82f6?style=flat-square"/></h2>

### 1️⃣ `SELECT FROM` — Selecionando dados das tabelas

- `SELECT` define **quais colunas** serão retornadas; `FROM` define **de qual tabela**;
- `SELECT *` retorna **todas as colunas** da tabela — útil para explorar dados, mas evitado em produção (traz colunas desnecessárias e pode quebrar se a tabela mudar);
- É possível selecionar uma única coluna, várias colunas específicas, ou formatar a query em múltiplas linhas para facilitar a leitura quando há muitas colunas.

```sql
-- Todas as colunas
SELECT * FROM categories;

-- Uma única coluna
SELECT first_name FROM employees;

-- Várias colunas específicas
SELECT product_id, product_name, unit_price FROM products;

-- Formatação em múltiplas linhas (boa prática para queries maiores)
SELECT
    product_id,
    product_name,
    unit_price
FROM products;
```

> 💡 Assim como no SQL Server, a ordem lógica de leitura de um `SELECT` é `FROM` → `WHERE` → `SELECT`,
> mesmo o `SELECT` sendo escrito primeiro na sintaxe.

### 2️⃣ Comentários no PostgreSQL

- `--` inicia um comentário de **uma linha** (idêntico ao SQL Server);
- `/* ... */` cria um comentário de **múltiplas linhas** — útil para "desativar" um trecho de código temporariamente sem apagá-lo.

```sql
-- Este é um comentário de 1 linha
SELECT * FROM orders;

/*
Este é um comentário
de múltiplas linhas.

SELECT * FROM products
*/
```

### 3️⃣ `SELECT AS` — Aliasing (renomeando colunas e tabelas)

- `AS` cria um **apelido (alias)** para uma coluna ou tabela, alterando apenas o nome de exibição do resultado — a tabela original não é modificada;
- Aliases de tabela (ex.: `products AS p`) permitem referenciar colunas de forma mais curta (`p.product_id`), o que se torna essencial mais adiante em `JOIN`s;
- No PostgreSQL, se o alias tiver espaços ou letras maiúsculas que devem ser preservadas, é necessário usar aspas duplas (`AS "Nome Completo"`).

```sql
SELECT
    p.product_id AS ID_Produto,
    p.product_name AS Nome_Produto,
    p.unit_price AS Preco_Unitario
FROM products AS p;
```

### 4️⃣ `SELECT LIMIT` — Limitando a quantidade de linhas

- `LIMIT n` restringe o resultado às `n` primeiras linhas retornadas pela query;
- Equivale ao `TOP n` do SQL Server, mas com uma diferença importante de sintaxe: `LIMIT` vem **depois** do `FROM`/`WHERE`, no final da query, e não logo após o `SELECT`.

```sql
SELECT * FROM orders LIMIT 10;
```

| SQL Server 🔄 | PostgreSQL 🐘 |
|---|---|
| `SELECT TOP 10 * FROM orders;` | `SELECT * FROM orders LIMIT 10;` |

### 5️⃣ `SELECT DISTINCT` — Selecionando valores distintos

- `DISTINCT` remove **linhas duplicadas** do resultado, retornando apenas os valores únicos de uma coluna (ou combinação de colunas);
- Muito usado para responder perguntas como "quais são as categorias/profissões/países que aparecem na tabela?", sem se importar com quantas vezes cada valor se repete.

```sql
SELECT DISTINCT
    contact_title
FROM customers;
```

---

<h2 align="center">🎯 Parte 2 — Filtros no Postgres <br>
<img src="https://img.shields.io/badge/-WHERE-ef4444?style=flat-square"/></h2>

### 1️⃣ `WHERE` — Criando filtros nas consultas

- `WHERE` filtra as linhas retornadas com base em uma condição booleana;
- ⚠️ **O PostgreSQL é case-sensitive** para comparação de strings por padrão — `'France' ≠ 'france'` — diferente do SQL Server, que por padrão é case-insensitive;
- Operadores de comparação (`=`, `>=`, `<=`, `>`, `<`, `<>`) funcionam da mesma forma que em outros SGBDs.

```sql
-- Clientes com contact_title = 'Owner'
SELECT * FROM customers
WHERE contact_title = 'Owner';

-- Clientes do país France
SELECT * FROM customers
WHERE country = 'France';

-- Produtos sem estoque
SELECT * FROM products
WHERE units_in_stock = 0;

-- Produtos com preço >= 50, ordenados do mais caro para o mais barato
SELECT * FROM products
WHERE unit_price >= 50
ORDER BY unit_price DESC;

-- Pedidos feitos a partir de 01/01/1998
SELECT * FROM orders
WHERE order_date >= '1998-01-01';
```

### 2️⃣ `WHERE` + `AND` / `OR` — Combinando múltiplas condições

- `AND`: a linha só é retornada se **todas** as condições forem verdadeiras;
- `OR`: a linha é retornada se **pelo menos uma** das condições for verdadeira;
- Quando `AND` e `OR` são combinados na mesma query, é recomendado usar parênteses para deixar explícita a ordem de avaliação (o PostgreSQL avalia `AND` antes de `OR` por padrão).

```sql
-- Clientes com contact_title = 'Owner' E do país France
SELECT * FROM customers
WHERE contact_title = 'Owner' AND country = 'France';

-- Clientes do México OU da França
SELECT * FROM customers
WHERE country = 'Mexico' OR country = 'France';
```

### 3️⃣ `WHERE` + `LIKE` — Filtros especiais de texto

- `LIKE` permite buscas por **padrões de texto**, usando os curingas `%` (qualquer sequência de caracteres, inclusive vazia) e `_` (exatamente um caractere);
- `'%boxes%'` busca o texto `boxes` em qualquer posição da coluna; `'boxes%'` buscaria apenas valores que **começam** com `boxes`;
- No PostgreSQL existe também o operador `ILIKE`, que faz a mesma busca ignorando maiúsculas/minúsculas (não existe em `LIKE` puro, por causa do case-sensitivity do banco).

```sql
-- Produtos medidos em boxes
SELECT * FROM products
WHERE quantity_per_unit LIKE '%boxes%';

-- Produtos medidos em ml
SELECT * FROM products
WHERE quantity_per_unit LIKE '%ml%';
```

### 4️⃣ `WHERE` + `IN` — Alternativa ao uso de múltiplos `OR`

- `IN` verifica se um valor está presente em uma **lista** de valores, substituindo várias comparações `OR` encadeadas pela mesma coluna;
- Deixa a query mais curta e mais legível quando há 3 ou mais valores a comparar.

```sql
-- Com OR
SELECT * FROM customers
WHERE country = 'Mexico' OR country = 'UK' OR country = 'Canada';

-- Com IN (equivalente, mais legível)
SELECT * FROM customers
WHERE country IN ('Mexico', 'UK', 'Canada');
```

### 5️⃣ `WHERE` + `BETWEEN` — Alternativa ao `AND` para intervalos

- `BETWEEN x AND y` verifica se um valor está dentro de um intervalo, **incluindo os limites** (`x` e `y` são inclusivos);
- Substitui a combinação `coluna >= x AND coluna <= y`, funcionando tanto para números quanto para datas.

```sql
-- Produtos com preço entre 50 e 100 — com AND
SELECT * FROM products
WHERE unit_price >= 50 AND unit_price <= 100;

-- Produtos com preço entre 50 e 100 — com BETWEEN (equivalente)
SELECT * FROM products
WHERE unit_price BETWEEN 50 AND 100;

-- Pedidos feitos em 1997 — com AND
SELECT * FROM orders
WHERE order_date >= '1997-01-01' AND order_date <= '1997-12-31';

-- Pedidos feitos em 1997 — com BETWEEN (equivalente)
SELECT * FROM orders
WHERE order_date BETWEEN '1997-01-01' AND '1997-12-31';
```

---

<h2 align="center">🗄️ Conteúdo do Módulo <br>
<img src="https://img.shields.io/badge/-Tópicos-475569?style=flat-square"/></h2>

| Tópico | Status |
|--------|--------|
| `SELECT FROM` — Selecionando dados das tabelas | ✅ Concluído |
| Comentários no PostgreSQL (`--` e `/* */`) | ✅ Concluído |
| `SELECT AS` — Aliasing de colunas e tabelas | ✅ Concluído |
| `SELECT LIMIT` — Limitando a quantidade de linhas | ✅ Concluído |
| `SELECT DISTINCT` — Valores distintos de uma coluna | ✅ Concluído |
| `WHERE` — Criando filtros nas consultas | ✅ Concluído |
| `WHERE` + `AND` / `OR` — Múltiplas condições | ✅ Concluído |
| `WHERE` + `LIKE` — Filtros especiais de texto | ✅ Concluído |
| `WHERE` + `IN` — Alternativa a múltiplos `OR` | ✅ Concluído |
| `WHERE` + `BETWEEN` — Alternativa ao `AND` para intervalos | ✅ Concluído |
