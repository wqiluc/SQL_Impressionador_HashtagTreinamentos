-- ============================================================
-- 🗄️  SQL Server  |  📦 Módulo 13 — Subqueries e CTEs
-- 📖 Aulas 7 e 8 de 28  |  EXISTS
-- ============================================================

/*
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📚 CONCEITO — EXISTS
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

EXISTS verifica se a Subquery retorna ao menos uma linha.
Retorna TRUE/FALSE —> não importa o valor, apenas a existência.

Diferença em relação ao IN:
  • IN → compara valores
  • EXISTS → verifica presença (é correlacionado com a query externa)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
*/

-- 📊 Referência: total de produtos na tabela
SELECT COUNT(*) FROM DimProduct; -- 2517 produtos no total

-- ────────────────────────────────────────────────────────────
-- ❓ Exemplo: Retornar todos os produtos (ID + Nome) que
--    possuem ao menos uma venda registrada em 01/01/2007.
-- ────────────────────────────────────────────────────────────

-- ✅ Solução com EXISTS (correlacionado — une as duas tabelas)
SELECT ProductKey, ProductName FROM DimProduct
WHERE EXISTS 
(
    SELECT ProductKey
    FROM FactSales
    WHERE  
        DateKey = '01/01/2007'
    AND 
        FactSales.ProductKey = DimProduct.ProductKey   
        -- correlação = chave estrangeira e chave primária
);

-- ────────────────────────────────────────────────────────────
-- 🔄 Solução alternativa com = ANY (sem correlação)
-- ────────────────────────────────────────────────────────────
SELECT ProductKey, ProductName FROM DimProduct
WHERE ProductKey = ANY 
(
    SELECT ProductKey
    FROM FactSales
    WHERE DateKey = '01/01/2007'
);

-- 💡 Ambas retornam o mesmo resultado neste caso,
--    mas EXISTS tende a ser mais eficiente em tabelas grandes.