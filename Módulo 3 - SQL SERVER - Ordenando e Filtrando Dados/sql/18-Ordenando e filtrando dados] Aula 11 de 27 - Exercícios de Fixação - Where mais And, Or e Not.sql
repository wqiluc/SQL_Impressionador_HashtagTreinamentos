-- [MySQL] [Ordenando e filtrando dados] Aula 11 de 27: 
-- Exercícios de Fixação - WHERE com AND, OR e NOT

-- =====================================================
-- 1. Selecione clientes do estado 'SP' E que se cadastraram após 01/01/2024
-- =====================================================

SELECT DISTINCT
    nome_cliente as "Nome do Cliente",
    estado_cliente as "Estado do Cliente"
FROM 
    clientes
WHERE 
    estado_cliente = 'SP'
AND 
    data_cadastro_cliente > '2024-01-01'
LIMIT
    10;

-- =====================================================
-- 2. Selecione produtos com "Notebook" no nome, da categoria 2 (Notebooks) E preço maior ou igual a 1000
-- =====================================================

SELECT DISTINCT
    nome_produto as "Nome do Produto",
    id_produto as "ID do Produto",
    id_categoria as "ID da Categoria"
FROM 
    produtos
WHERE 
    nome_produto LIKE '%Notebook%'
AND 
    id_categoria = 2
AND
    preco_produto >= 1000
LIMIT
    100;

-- =====================================================
-- 3. Selecione produtos com "Mouse" OU "Teclado" no nome OU que pertencem à categoria 3 (Periféricos)
-- =====================================================

SELECT DISTINCT
    nome_produto as "Produto",
    id_produto as "ID - Produto",
    id_categoria as "ID - Categoria"
FROM 
    produtos
WHERE 
    nome_produto LIKE '%Mouse%'
OR 
    nome_produto LIKE '%Teclado%'
OR 
    id_categoria = 3
LIMIT
    100;

-- =====================================================
-- 4. Selecione clientes da cidade "São Paulo" mas que NÃO estão no estado "RJ"
-- =====================================================

SELECT DISTINCT
    nome_cliente as "Nome",
    cidade_cliente as "Cidade",
    estado_cliente as "Estado"
FROM 
    clientes
WHERE 
    cidade_cliente = 'São Paulo'
AND NOT 
    estado_cliente = 'RJ'
LIMIT
    100;