-- [MySQL] [Ordenando e filtrando dados]
-- Aula 14 de 27: WHERE com LIKE - Filtro especial para textos

-- =====================================================
-- 1. Selecione todos os produtos que possuem o texto "Notebook"
-- contido no nome do produto
-- =====================================================

SELECT DISTINCT
    id_produto as "ID - Produto",
    nome_produto as "Nome do Produto: ",
    estoque_produto as "Estoque do Produto: " 
FROM 
    produtos
WHERE 
    nome_produto LIKE '%Notebook%';

-- =====================================================
-- 2. Selecione todos os produtos cujo nome COMEÇA com "Monitor"
-- =====================================================

SELECT DISTINCT
    nome_produto as "Nome",
    preco_produto as "Preço: R$",
    id_produto as "ID - Produto"
FROM 
    produtos
WHERE 
    nome_produto LIKE '%Monitor%';

-- =====================================================
-- 3. Selecione todos os produtos cujo nome TERMINA com "HP"
-- =====================================================

SELECT DISTINCT
    nome_produto as "Nome",
    preco_produto as "Preço: R$",
    id_produto as "ID - Produto"
FROM 
    produtos
WHERE 
    nome_produto LIKE '%HP%';