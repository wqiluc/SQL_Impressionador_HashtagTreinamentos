<h1 align="center">
  🏷️ Como criar uma Tabela <br>
  <img src="https://img.shields.io/badge/-Tipos%20de%20Dados-f97316?style=flat-square"/>
</h1>

<h3 align="center">Ponto 3 — Tipos de dados por coluna <br>
<img src="https://img.shields.io/badge/-Ponto%203-f97316?style=flat-square"/></h3>

<p align="center">
  <img src="https://img.shields.io/badge/-SQL%20Server-111827?style=flat-square&logo=microsoftsqlserver&logoColor=white"/>
  <img src="https://img.shields.io/badge/Módulo-12-4FC3F7?style=flat-square"/>
  <img src="https://img.shields.io/badge/Slide-crud3.jpeg-blueviolet?style=flat-square&logo=googleslides&logoColor=white"/>
  <img src="https://img.shields.io/badge/Comando-CREATE%20TABLE-22c55e?style=flat-square&logo=addthis&logoColor=white"/>
</p>

---

<h2 align="center">💡 Conceito <br>
<img src="https://img.shields.io/badge/-Conceito-f59e0b?style=flat-square"/></h2>

<p align="center">
  Além de cada coluna guardar um único tipo de informação, o SQL Server exige que você declare<br>
  <strong>explicitamente</strong> qual é esse tipo ao criar a tabela.<br>
  A imagem destaca os quatro tipos mais comuns usados na tabela de clientes da aula.
</p>

---

<h2 align="center">🔢 Tipos destacados na imagem <br>
<img src="https://img.shields.io/badge/-Tipos%20SQL-3b82f6?style=flat-square"/></h2>

<div align="center">

<img src="https://img.shields.io/badge/INT-Inteiro-22c55e?style=for-the-badge"/>
<img src="https://img.shields.io/badge/VARCHAR-Texto-3b82f6?style=for-the-badge"/>
<img src="https://img.shields.io/badge/FLOAT-Decimal-f59e0b?style=for-the-badge"/>
<img src="https://img.shields.io/badge/DATETIME-Data%20%2B%20Hora-8b5cf6?style=for-the-badge"/>

</div>

<br>

| Tipo | Coluna | Descrição |
|------|--------|-----------|
| 🟢 `INT` | `CustomerKey` | Números inteiros — ideal para IDs e contadores |
| 🔵 `VARCHAR` | `FirstName` | Texto de tamanho variável — ideal para nomes e descrições |
| 🟡 `FLOAT` | `YearlyIncome` | Números decimais — ideal para rendas e preços |
| 🟣 `DATETIME` | `UpdateDate` | Data + hora — ideal para registrar quando algo aconteceu |

---

<h2 align="center">📚 Tabela de referência — todos os tipos <br>
<img src="https://img.shields.io/badge/-Referência-6366f1?style=flat-square"/></h2>

| Tipo | Exemplo | Quando usar |
|------|---------|-------------|
| `INT` | `42`, `1000` | IDs, quantidades inteiras |
| `FLOAT` | `9.99`, `3.14` | Preços, medidas, percentuais |
| `DECIMAL(p, s)` | `99999.99` | Valores financeiros com precisão exata ⚠️ |
| `VARCHAR(n)` | `'Lucas'`, `'Produto A'` | Nomes, descrições, textos variáveis |
| `CHAR(n)` | `'SP'`, `'BR'` | Siglas e códigos de tamanho fixo |
| `DATE` | `2021-12-31` | Somente data (sem hora) |
| `DATETIME` | `2021-12-31 23:59:59` | Data com hora |
| `BIT` | `0` ou `1` | Flags booleanas (ativo/inativo) |

---

<h2 align="center">💻 Código <br>
<img src="https://img.shields.io/badge/-SQL%20Server-111827?style=flat-square&logo=microsoftsqlserver&logoColor=white"/></h2>

```sql
CREATE TABLE Clientes
(
    CustomerKey   INT,           -- número inteiro
    FirstName     VARCHAR(200),  -- texto até 200 caracteres
    BirthDate     DATETIME,      -- data e hora
    YearlyIncome  FLOAT,         -- número decimal
    UpdateDate    DATETIME       -- data e hora
);
```

---

<h2 align="center">⚠️ Dica importante <br>
<img src="https://img.shields.io/badge/-Dica%20Importante-f59e0b?style=flat-square"/></h2>

<p align="center">
  Prefira <code>DECIMAL</code> a <code>FLOAT</code> para <strong>valores financeiros</strong>.<br>
  <code>FLOAT</code> pode acumular erros de arredondamento — <code>DECIMAL(10,2)</code> garante precisão exata. 💰
</p>

<p align="center">
  Alterar o tipo de uma coluna em uma tabela com milhões de registros é uma operação custosa.<br>
  <strong>Escolha o tipo certo desde o início.</strong>
</p>

---

<p align="center">
  <a href="crud2.md">⬅️ Anterior</a>
  &nbsp;&nbsp;|&nbsp;&nbsp;
  <a href="README.md">🏠 Índice</a>
</p>
