<h1 align="center">
  ➕ Como criar uma Tabela <br>
  <img src="https://img.shields.io/badge/-INSERT%20INTO-22c55e?style=flat-square"/>
</h1>

<h3 align="center">Ponto 2 — Novo registro = nova linha <br>
<img src="https://img.shields.io/badge/-Ponto%202-22c55e?style=flat-square"/></h3>

<p align="center">
  <img src="https://img.shields.io/badge/-SQL%20Server-111827?style=flat-square&logo=microsoftsqlserver&logoColor=white"/>
  <img src="https://img.shields.io/badge/Módulo-12-4FC3F7?style=flat-square"/>
  <img src="https://img.shields.io/badge/Slide-crud2.jpeg-blueviolet?style=flat-square&logo=googleslides&logoColor=white"/>
  <img src="https://img.shields.io/badge/Comando-INSERT%20INTO-22c55e?style=flat-square&logo=addthis&logoColor=white"/>
</p>

---

<h2 align="center">💡 Conceito <br>
<img src="https://img.shields.io/badge/-Conceito-f59e0b?style=flat-square"/></h2>

<p align="center">
  Em uma tabela relacional, <strong>cada linha representa um registro único</strong> — um cliente, um produto, uma venda.<br>
  Para adicionar uma nova informação, sempre inserimos uma <strong>nova linha</strong>. As colunas nunca crescem.
</p>

> 📌 A imagem mostra a cliente **Jacqueline** (ID `11`) sendo adicionada como a 11ª linha de uma tabela que já tinha 10 registros.

---

<h2 align="center">🧠 Analogia — Planilha <br>
<img src="https://img.shields.io/badge/-Analogia-ec4899?style=flat-square"/></h2>

| Elemento | Na tabela SQL |
|----------|---------------|
| 📌 Colunas | Definem os campos (nome, data, renda...) |
| 📄 Linhas | Cada linha é um cliente diferente |
| ➕ Adicionar cliente | Adicionar uma linha no final |

---

<h2 align="center">💻 Código — INSERT INTO <br>
<img src="https://img.shields.io/badge/-SQL%20Server-111827?style=flat-square&logo=microsoftsqlserver&logoColor=white"/></h2>

**Inserindo um único registro (nova linha):**

```sql
INSERT INTO Clientes (CustomerKey, FirstName, BirthDate, YearlyIncome, UpdateDate)
VALUES (11, 'Jacqueline', '1970-03-22', 65000.00, '2009-10-01 00:00:00');
```

**Inserindo múltiplos registros a partir de outra tabela:**

```sql
INSERT INTO Clientes (CustomerKey, FirstName, BirthDate, YearlyIncome, UpdateDate)
SELECT CustomerKey, FirstName, BirthDate, YearlyIncome, UpdateDate
FROM   ContosoRetailDW.dbo.DimCustomer;
```

---

<h2 align="center">📌 Regra de ouro <br>
<img src="https://img.shields.io/badge/-Regra%20de%20Ouro-ef4444?style=flat-square"/></h2>

<p align="center">
  Uma coluna nunca "cresce" para acomodar novos dados.<br>
  Quem cresce é sempre a quantidade de <strong>linhas</strong>. 📈
</p>

---

<p align="center">
  <a href="crud1.md">⬅️ Anterior</a>
  &nbsp;&nbsp;|&nbsp;&nbsp;
  <a href="README.md">🏠 Índice</a>
  &nbsp;&nbsp;|&nbsp;&nbsp;
  <a href="crud3.md">Próximo ➡️</a>
</p>
