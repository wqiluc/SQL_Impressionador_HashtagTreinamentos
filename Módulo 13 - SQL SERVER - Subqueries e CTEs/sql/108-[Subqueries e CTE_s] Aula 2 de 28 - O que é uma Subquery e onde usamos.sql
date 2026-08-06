-- ============================================================
-- 🗄️  SQL Server  |  📦 Módulo 13 — Subqueries e CTEs
-- 📖 Aula 2 de 28  |  O que é uma Subquery e onde usamos
-- ============================================================

/*
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
🔍 1. O QUE É UMA SUBQUERY?
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

Uma Subconsulta (Subquery / SubSELECT) é uma consulta escrita
dentro de outra consulta. Com ela, usamos o resultado de um
SELECT como entrada para outro SELECT.

Exemplo motivador:
  → Quero selecionar os produtos com Preço maior do que a média.
  → A média muda conforme os dados — não posso fixar um número!
  → Solução: calcular a média dinamicamente com uma Subquery.


━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📌 2. ONDE USAMOS UMA SUBQUERY? (4 situações)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

1️⃣  Junto com WHERE — filtro escalar (valor único)
────────────────────────────────────────────────
    SELECT Coluna1, Coluna2
    FROM   Tabela
    WHERE  Coluna1 = (SELECT ...)

2️⃣  Junto com WHERE — filtro em lista (vários valores)
────────────────────────────────────────────────────
    SELECT Coluna1, Coluna2
    FROM   Tabela
    WHERE  Coluna1 IN (SELECT ...)

3️⃣  Junto com SELECT — como nova coluna calculada
──────────────────────────────────────────────────
    SELECT
        Coluna1,
        Coluna2,
        (SELECT ...) AS NovaColuna
    FROM Tabela

4️⃣  Junto com FROM — como tabela temporária (derived table)
────────────────────────────────────────────────────────────
    SELECT Coluna1, Coluna2
    FROM   (SELECT ...) AS T


━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
💡 EXEMPLO ILUSTRATIVO
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

-- Passo 1: descobrir a média de Preço
SELECT AVG(Preço) FROM Produtos    -- resultado: 10.5

-- Passo 2: filtrar produtos acima da média (hardcoded — ruim!)
SELECT * FROM Produtos WHERE Preço > 10.5

-- Passo 3: combinar em uma única query com Subquery ✅
SELECT *
FROM   Produtos
WHERE  Preço > (SELECT AVG(Preço) FROM Produtos)

━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
*/
