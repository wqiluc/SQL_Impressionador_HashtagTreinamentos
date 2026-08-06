/*
================================================================================
 📥 [SQL Server] Variáveis
 📚 Aula 15 de 23: Armazenando resultados de uma consulta em variáveis
================================================================================

 Objetivo: Atribuir valores de diferentes colunas de uma consulta para 
 variáveis distintas em um único comando SELECT.

 ⚠️ Ponto Crítico: O uso do: "TOP(1)" é OBRIGATÓRIO aqui. Sem ele, o SQL 
 tentaria atribuir todos os valores da tabela para as variáveis, e no final, 
 elas só guardariam o valor da última linha processada (o que não é confiável).
*/

-- 1️⃣ DECLARAÇÃO DAS VARIÁVEIS:
DECLARE 
	@ProdutoMaisVendido INT;
DECLARE 
	@TotalMaisVendido INT;

-- 2️⃣ ATRIBUIÇÃO VIA SELECT (Múltipla):
-- Note que estamos preenchendo as duas variáveis na mesma consulta.
SELECT
    @ProdutoMaisVendido = ProductKey,
    @TotalMaisVendido = SalesQuantity
FROM
    FactSales
ORDER BY 
    SalesQuantity DESC
LIMIT 1; -- Ordenamos para garantir que o "mais vendido" seja o topo

-- 3️⃣ VERIFICAÇÃO (PRINT):
-- Usamos o PRINT apenas para conferir se as variáveis capturaram os dados corretamente.
PRINT("ID do produto mais vendido: " + CAST(@ProdutoMaisVendido AS VARCHAR(10))); 
PRINT("Quantidade total vendida: ") + CAST(@TotalMaisVendido AS VARCHAR(10));

-- 4️⃣ UTILIZAÇÃO DO RESULTADO EM OUTRA CONSULTA:
-- Agora usamos a variável capturada para filtrar uma segunda tabela, 
-- buscando o nome amigável do produto.
SELECT
    ProductKey,
    ProductName
FROM
    DimProduct
WHERE 
    ProductKey = @varProdutoMaisVendido;

/* =============================================================================
 💡 Por que este fluxo é tão usado?
 
 1. Performance 🚀: Você busca o ID do produto uma única vez. Se você fizesse 
    consultas separadas, o banco teria que ler a tabela FactSales duas vezes.
 
 2. Dinamismo 🏹: O script acima funciona independentemente de qual produto for
    o campeão de vendas. Se o ranking mudar amanhã, o seu script continua 
    correto sem precisar de nenhuma alteração.
 
 3. Modularidade 🏛️: Você separa a "lógica de cálculo" (descobrir quem vendeu mais)
    da "lógica de exibição" (trazer o nome do produto).
================================================================================
*/