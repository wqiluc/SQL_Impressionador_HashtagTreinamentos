<h1 align="center">
  🔃 Pivot Table <br>
  <img src="../img/" alt="PIVOT TABLES" width="500"> <br>
  <img src="https://img.shields.io/badge/-PIVOT%20..%20SQL%20Din%C3%A2mico-14b8a6?style=flat-square"/>
</h1>

<p align="center">
  <img src="https://img.shields.io/badge/-SQL%20Server-111827?style=flat-square&logo=microsoftsqlserver&logoColor=white"/>
  <img src="https://img.shields.io/badge/Módulo-24-4FC3F7?style=flat-square"/>
  <img src="https://img.shields.io/badge/Slide-Módulo%2025-blueviolet?style=flat-square"/>
</p>

> 📌 Seguindo o padrão dos módulos anteriores, nos slides de abertura o instrutor deve numerar este
> conteúdo como **"Módulo 25"**, correspondendo à pasta `Módulo 24` deste repositório. Esta é a
> última parada do curso de **SQL Server** antes dos projetos e do checkpoint 2.

> 🖼️ Este módulo ainda não tem screenshots das aulas na pasta `img/` — assim que forem adicionados,
> as tags `<img>` correspondentes entram nas seções abaixo.

<h2 align="center">💡 O que são Pivot Tables? <br>
<img src="https://img.shields.io/badge/-Conceito-f59e0b?style=flat-square"/></h2>

**Para que servem:**

- Um `GROUP BY` tradicional devolve os resultados "empilhados" — uma linha por combinação de grupo;
- O **`PIVOT`** transforma **valores de uma coluna** em **novas colunas**, aplicando uma função de
  agregação — deixando os dados "deitados", mais fáceis de ler (ou exportar para Excel).

```sql
-- "Empilhado" (GROUP BY)
SELECT Loja, Trimestre, SUM(ValorVenda) AS TotalVendido
FROM Vendas
GROUP BY Loja, Trimestre

-- "Deitado" (o que o PIVOT automatiza)
SELECT
    Loja,
    SUM(CASE WHEN Trimestre = 'Q1' THEN ValorVenda END) AS Q1,
    SUM(CASE WHEN Trimestre = 'Q2' THEN ValorVenda END) AS Q2
FROM Vendas
GROUP BY Loja
```

<h2 align="center">🏗️ Criando uma Pivot Table <br>
<img src="https://img.shields.io/badge/-PIVOT-8b5cf6?style=flat-square"/></h2>

```sql
SELECT Loja, [Q1], [Q2], [Q3], [Q4]
FROM (
    SELECT Loja, Trimestre, ValorVenda
    FROM Vendas
) AS Origem
PIVOT (
    SUM(ValorVenda)
    FOR Trimestre IN ([Q1], [Q2], [Q3], [Q4])
) AS TabelaPivotada
```

| Parte | Papel |
|-------|-------|
| Subquery `Origem` | Só as colunas necessárias: grupo(s) de linha, coluna a virar cabeçalho, coluna de valor |
| Função de agregação (`SUM`, `COUNT`, `AVG`...) | Como os valores repetidos de cada célula são resumidos |
| `FOR coluna IN ([v1], [v2], ...)` | Qual coluna vira cabeçalho e quais valores dela viram novas colunas |

<h2 align="center">📐 Grupos de linha e ordenação <br>
<img src="https://img.shields.io/badge/-Linhas%20e%20Colunas-3b82f6?style=flat-square"/></h2>

Qualquer coluna extra na subquery `Origem` que **não** seja a coluna do `FOR` vira automaticamente um
grupo de linha — dá para ir detalhando cada vez mais (Regiao, Loja, Vendedor...):

```sql
SELECT Regiao, Loja, Vendedor, [Q1], [Q2], [Q3], [Q4]
FROM (
    SELECT Loja, Regiao, Vendedor, Trimestre, ValorVenda
    FROM Vendas
) AS Origem
PIVOT (
    SUM(ValorVenda)
    FOR Trimestre IN ([Q1], [Q2], [Q3], [Q4])
) AS TabelaPivotada
ORDER BY Regiao, Loja, Vendedor
```

- A **ordem das linhas** é controlada por `ORDER BY`, como em qualquer `SELECT`;
- A **ordem das colunas** é controlada pela ordem dos valores dentro do `FOR ... IN (...)`.

<h2 align="center">⚠️ Limitações de uma Pivot Table <br>
<img src="https://img.shields.io/badge/-Limita%C3%A7%C3%A3o-ef4444?style=flat-square"/></h2>

A lista de valores do `IN (...)` é **estática** — precisa ser conhecida e escrita manualmente. Se
surgir um valor novo (ex.: um `Q5`) e a lista não for atualizada, esse valor é **silenciosamente
ignorado** pelo `PIVOT`, sem erro e sem aviso.

<h2 align="center">🔄 Corrigindo com SQL Dinâmico <br>
<img src="https://img.shields.io/badge/-sp_executesql-475569?style=flat-square"/></h2>

**Parte 1 — montar a lista de colunas em tempo de execução:**

```sql
DECLARE @ListaColunas NVARCHAR(MAX)

SELECT @ListaColunas = STRING_AGG(QUOTENAME(Trimestre), ',')
    WITHIN GROUP (ORDER BY Trimestre)
FROM (SELECT DISTINCT Trimestre FROM Vendas) AS Trimestres
-- Resultado: [Q1],[Q2],[Q3],[Q4],[Q5]
```

**Parte 2 — montar o texto da consulta e executar dinamicamente:**

```sql
DECLARE @SQLDinamico NVARCHAR(MAX)

SET @SQLDinamico = N'
SELECT Loja, ' + @ListaColunas + N'
FROM (SELECT Loja, Trimestre, ValorVenda FROM Vendas) AS Origem
PIVOT (SUM(ValorVenda) FOR Trimestre IN (' + @ListaColunas + N')) AS TabelaPivotada
ORDER BY Loja'

EXEC sp_executesql @SQLDinamico
```

| Função | O que faz |
|--------|-----------|
| `STRING_AGG(expressao, separador)` | Concatena os valores de várias linhas em uma única string |
| `QUOTENAME(valor)` | Coloca o valor entre colchetes, no formato esperado pelo `IN()` |
| `sp_executesql @sql` | Executa uma string como um comando T-SQL |

<h2 align="center">📋 Resumo <br>
<img src="https://img.shields.io/badge/-Resumo-475569?style=flat-square"/></h2>

| Sintaxe | O que faz |
|---------|-----------|
| `PIVOT (AGREGACAO(coluna_valor) FOR coluna IN ([v1],[v2],...)) AS alias` | Transforma valores de uma coluna em novas colunas |
| Colunas extras na subquery `Origem` (fora do `FOR`) | Viram grupos de linha |
| `ORDER BY` | Controla a ordem das linhas |
| Ordem dentro do `IN (...)` | Controla a ordem das colunas |
| `STRING_AGG` + `QUOTENAME` + `sp_executesql` | Constrói e executa um PIVOT com colunas dinâmicas |

<h2 align="center">🗄️ Conteúdo do Módulo <br>
<img src="https://img.shields.io/badge/-Tópicos-475569?style=flat-square"/></h2>

| Tópico | Status |
|--------|--------|
| O que são Pivot Tables | ✅ Concluído |
| Criando uma Pivot Table | ✅ Concluído |
| Adicionando grupos de linha | ✅ Concluído |
| Ordenando linhas e colunas | ✅ Concluído |
| Adicionando mais linhas aos grupos | ✅ Concluído |
| Limitações de uma Pivot Table | ✅ Concluído |
| Corrigindo a limitação de forma dinâmica (STRING_AGG, QUOTENAME, sp_executesql) | ✅ Concluído |
