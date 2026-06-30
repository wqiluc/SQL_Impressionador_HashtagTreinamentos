<h1 align="center">
  🔍 O que é uma Subquery? <br>
  <img src="https://img.shields.io/badge/-Subquery-4f46e5?style=flat-square"/>
</h1>

<p align="center">
  <img src="https://img.shields.io/badge/-SQL%20Server-111827?style=flat-square&logo=microsoftsqlserver&logoColor=white"/>
  <img src="https://img.shields.io/badge/Módulo-13-4FC3F7?style=flat-square"/>
  <img src="https://img.shields.io/badge/Aulas-2%20a%205-blueviolet?style=flat-square"/>
</p>

---

<h2 align="center">💡 Conceito <br>
<img src="https://img.shields.io/badge/-Conceito-f59e0b?style=flat-square"/></h2>

<p align="center">
  Uma <strong>Subquery</strong> (Subconsulta ou SubSELECT) é uma consulta escrita <em>dentro</em> de outra consulta.<br>
  O resultado da Subquery é usado como entrada pela query externa — de forma <strong>dinâmica</strong>, sem precisar fixar valores.
</p>

> 🎯 **Por que usar?** Se você quer filtrar produtos acima da média de preço, a média muda toda vez que os dados mudam. Uma Subquery calcula esse valor automaticamente a cada execução.

---

<h2 align="center">📌 Os 4 lugares onde uma Subquery pode aparecer <br>
<img src="https://img.shields.io/badge/-4%20Situações-7c3aed?style=flat-square"/></h2>

<div align="center">

<img src="https://img.shields.io/badge/WHERE-Filtro%20escalar-3b82f6?style=for-the-badge"/>
<img src="https://img.shields.io/badge/WHERE%20IN-Filtro%20em%20lista-3b82f6?style=for-the-badge"/>
<img src="https://img.shields.io/badge/SELECT-Nova%20coluna-8b5cf6?style=for-the-badge"/>
<img src="https://img.shields.io/badge/FROM-Tabela%20derivada-06b6d4?style=for-the-badge"/>

</div>

<br>

| Posição | Tipo de retorno | Descrição |
|---------|----------------|-----------|
| `WHERE col = (SELECT ...)` | 🔢 Valor único (escalar) | A Subquery retorna um único número ou texto |
| `WHERE col IN (SELECT ...)` | 📋 Lista de valores | A Subquery retorna várias linhas de uma coluna |
| `SELECT (SELECT ...) AS col` | 🔢 Valor único por linha | Subquery correlacionada — executa uma vez por linha |
| `FROM (SELECT ...) AS T` | 🗂️ Tabela completa | A Subquery vira uma tabela temporária (derived table) |

---

<h2 align="center">🔷 WHERE — Filtro escalar (valor único) <br>
<img src="https://img.shields.io/badge/-Exemplo%201-3b82f6?style=flat-square"/></h2>

**Exemplo:** Produtos com custo acima da média.

```sql
SELECT *
FROM   DimProduct
WHERE  UnitCost >= (SELECT AVG(UnitCost) FROM DimProduct)
```

> 📌 A Subquery `(SELECT AVG(UnitCost) FROM DimProduct)` retorna um único número.
> O operador `=` (ou `>=`, `>`, etc.) compara linha a linha com esse valor.

---

<h2 align="center">🔷 WHERE — Filtro por categoria cruzada <br>
<img src="https://img.shields.io/badge/-Exemplo%202-3b82f6?style=flat-square"/></h2>

**Exemplo:** Produtos da subcategoria 'Televisions' — o ID da subcategoria está em outra tabela.

```sql
SELECT *
FROM   DimProduct
WHERE  ProductSubcategoryKey =
           (SELECT ProductSubcategoryKey
            FROM   DimProductSubcategory
            WHERE  ProductSubcategoryName = 'Televisions')
```

> 📌 Quando o filtro depende de uma informação que está em **outra tabela**, a Subquery busca
> esse valor intermediário sem precisar fazer um JOIN.

---

<h2 align="center">🔷 WHERE IN — Filtro em lista <br>
<img src="https://img.shields.io/badge/-Exemplo%203-3b82f6?style=flat-square"/></h2>

**Exemplo:** Vendas de lojas com 100 ou mais funcionários — podem ser várias lojas.

```sql
SELECT *
FROM   FactSales
WHERE  StoreKey IN (
           SELECT StoreKey
           FROM   DimStore
           WHERE  EmployeeCount >= 100
       )
```

> 📌 Quando a Subquery retorna **múltiplos valores**, usamos `IN` — nunca `=`.
> O `=` exigiria exatamente um resultado; mais de um causaria erro.

---

<h2 align="center">⚠️ Escalar vs Lista <br>
<img src="https://img.shields.io/badge/-Atenção-ef4444?style=flat-square"/></h2>

| Situação | Operador correto |
|----------|-----------------|
| Subquery retorna **1 valor** | `=`, `>`, `<`, `>=`, `<=` |
| Subquery retorna **vários valores** | `IN`, `= ANY`, `> ANY`, `> ALL` |
| Subquery retorna **várias colunas** | ❌ Inválido — Subquery deve retornar 1 coluna |

---

<p align="center">
  <a href="README.md">🏠 Índice</a>
  &nbsp;&nbsp;|&nbsp;&nbsp;
  <a href="subquery-avancado.md">Próximo ➡️</a>
</p>
