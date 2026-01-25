-- [MySQL] [Ordenando e filtrando dados] Aula 8 de 27: Where com AND - Filtrando com mais de uma condição

-- Quais produtos são "Notebook" e pertencem à categoria 2 (Notebooks)?

SELECT DISTINCT
    nome_produto as "Nome do Produto",
    id_categoria as "ID da Categoria"
FROM 
    produtos
WHERE 
    nome_produto LIKE '%Notebook%'
AND 
    id_categoria >= 2
LIMIT 
    10;