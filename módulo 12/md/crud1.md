<h1 align="center">
  🧱 Como criar uma Tabela <br>
  <img src="https://img.shields.io/badge/-CREATE%20TABLE-c2410c?style=flat-square"/>
</h1>

<h3 align="center">Ponto 1 — Cada coluna tem um tipo de informação <br>
<img src="https://img.shields.io/badge/-Ponto%201-c2410c?style=flat-square"/></h3>

<p align="center">
  <img src="https://img.shields.io/badge/-SQL%20Server-111827?style=flat-square&logo=microsoftsqlserver&logoColor=white"/>
  <img src="https://img.shields.io/badge/Módulo-12-4FC3F7?style=flat-square"/>
  <img src="https://img.shields.io/badge/Slide-crud1.jpeg-blueviolet?style=flat-square&logo=googleslides&logoColor=white"/>
  <img src="https://img.shields.io/badge/Comando-CREATE%20TABLE-22c55e?style=flat-square&logo=addthis&logoColor=white"/>
</p>

---

<h2 align="center">💡 Conceito <br>
<img src="https://img.shields.io/badge/-Conceito-f59e0b?style=flat-square"/></h2>

<p align="center">
  Ao criar uma tabela no SQL Server, <strong>cada coluna armazena apenas um tipo de informação</strong>.<br>
  Essa restrição garante <strong>consistência, integridade e desempenho</strong> nas consultas.
</p>

- 🔢 A coluna de **ID** sempre terá números inteiros
- 🔤 A coluna de **Nome** sempre terá texto
- 📅 A coluna de **Data** sempre terá datas
- 💰 A coluna de **Salário** sempre terá valores numéricos

---

<h2 align="center">📋 Tabela da Aula — Clientes <br>
<img src="https://img.shields.io/badge/-Clientes-0ea5e9?style=flat-square"/></h2>

| Coluna | Tipo de informação |
|--------|-------------------|
| `CustomerKey` | 🔢 Número inteiro — ID único do cliente |
| `FirstName` | 🔤 Texto — nome do cliente |
| `BirthDate` | 📅 Data — data de nascimento |
| `YearlyIncome` | 💰 Decimal — renda anual |
| `UpdateDate` | 🕐 Data e hora — última atualização |

---

<h2 align="center">💻 Código <br>
<img src="https://img.shields.io/badge/-SQL%20Server-111827?style=flat-square&logo=microsoftsqlserver&logoColor=white"/></h2>

```sql
CREATE TABLE Clientes
(
    CustomerKey   INT,
    FirstName     VARCHAR(200),
    BirthDate     DATETIME,
    YearlyIncome  FLOAT,
    UpdateDate    DATETIME
);
```

---

<h2 align="center">⚠️ Por que isso importa? <br>
<img src="https://img.shields.io/badge/-Atenção-f59e0b?style=flat-square"/></h2>

<p align="center">
  Quando declaramos o tipo de uma coluna, o SQL Server <strong>recusa automaticamente</strong> qualquer valor incompatível.<br>
  Isso evita dados corrompidos <em>antes mesmo</em> de chegarem ao banco.
</p>

---

<p align="center">
  <a href="CRUD.md">⬅️ Anterior</a>
  &nbsp;&nbsp;|&nbsp;&nbsp;
  <a href="README.md">🏠 Índice</a>
  &nbsp;&nbsp;|&nbsp;&nbsp;
  <a href="crud2.md">Próximo ➡️</a>
</p>
