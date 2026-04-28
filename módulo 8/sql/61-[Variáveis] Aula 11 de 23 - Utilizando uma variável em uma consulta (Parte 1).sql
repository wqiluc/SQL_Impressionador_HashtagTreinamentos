/*
================================================================================
 🚀 [SQL Server] Variáveis em Consultas
 📚 Aula 11 de 23: Usando variáveis para cálculos dinâmicos
================================================================================

 Objetivo: Aplicar um desconto variável a todos os produtos de uma tabela.
 A grande vantagem aqui é a facilidade de manutenção: mudando o valor da 
 variável @Desconto, toda a consulta é atualizada automaticamente.
*/

-- 1️⃣ DECLARAÇÃO E ATRIBUIÇÃO
-- Definimos o desconto como 0.1 (que representa 10%)
DECLARE 
    @Preço FLOAT;
DECLARE 
    @Desconto FLOAT;
SET 
    @Preço = 100;
SET 
    @Desconto = 0.10; /* 10% de desconto*/

-- 2️⃣ CONSULTA DINÂMICA
SELECT DISTINCT 
    ProductKey AS 'ID',
    ProductName AS 'Nome do Produto',
    Preço AS 'Preço Original';
    
    -- O cálculo: Preço * (1 - 0.10) é o mesmo que calcular 90% do valor.
    -- Isso garante que, se o desconto mudar, o cálculo se ajusta sozinho.
    @Preço * (1 - @Desconto) AS 'Preço com Desconto'
FROM 
    DimProduct;

/* =============================================================================
 💡 Por que fazer assim?
 
 1. Flexibilidade: Imagine que você tenha esse cálculo em 50 relatórios diferentes.
    Se você usa variáveis, basta mudar o valor em um único local.
 2. Legibilidade: Ao bater o olho no `SELECT`, o leitor entende que existe uma
    lógica de desconto aplicada, em vez de ver apenas um "número mágico" (0.1)
    escondido no meio do código.
 3. Manutenibilidade: Menor risco de erro humano ao atualizar os valores.
================================================================================
*/