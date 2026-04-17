-- [MySQL] Ordenando e filtrando dados
-- Aula 15 de 27: WHERE com BETWEEN - Filtrando entre valores

-- O operador BETWEEN é utilizado para filtrar valores
-- que estejam dentro de um intervalo específico.
-- Ele pode ser aplicado tanto em COLUNAS DE DATA
-- quanto em COLUNAS NUMÉRICAS.
-- Importante: o BETWEEN inclui os valores dos limites inicial e final.

-- =====================================================
-- Exemplo 1: Filtrando datas 📈
--      Selecione todos os clientes que se cadastraram
--      entre 01/01/2024 e 31/03/2024
-- =====================================================

SELECT DISTINCT
    nome_cliente as "Cliente (Nome): ",
    id_cliente as "ID - Cliente",
    email_cliente as "E-mail do Cliente"
FROM 
    clientes
WHERE 
    data_cadastro_cliente 
        BETWEEN 
            '2024-01-01' 
        AND 
            '2024-03-31';

-- =====================================================
-- Exemplo 2: Filtrando valores numéricos
-- Selecione todos os produtos com preço
-- entre 500 e 1500
-- =====================================================

SELECT DISTINCT
    id_produto as "ID - Produto",
    nome_produto as "Nome do Produto",
    preco_produto as "Preço do Produto (R$)",
    estoque_produto as "Estoque do Produto: "
FROM 
    produtos
WHERE 
    preco_produto 
    BETWEEN  
        500 
    AND 
        1500;

-- =====================================================
-- Exemplo 3: BETWEEN combinado com ORDER BY 🖋️
-- Selecione os produtos com preço entre 800 e 5000
-- ordenando do mais caro para o mais barato
-- =====================================================
SELECT
    ID_Produto,
    Nome,
    Estoque_do_Produto
FROM (
    SELECT DISTINCT
        id_produto AS ID_Produto,
        nome_produto AS Nome,
        estoque_produto AS Estoque_do_Produto,
        preco_produto
    FROM 
        produtos
    WHERE 
        preco_produto 
        BETWEEN 
            800 
        AND 
            5000
) AS sub
ORDER BY preco_produto;
