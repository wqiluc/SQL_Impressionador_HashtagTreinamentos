-- [MySQL] [Ordenando e filtrando dados] Aula 9 de 27: Where com OR - 
-- Filtrando com mais de uma condição

-- Quais produtos são "Notebook" OU pertencem à categoria 3 (Periféricos)?

SELECT DISTINCT
    nome_produto as "Nome do Produto",
    id_categoria as "ID Categoria"
FROM 
    produtos
WHERE 
    nome_produto LIKE '%Notebook%'
OR 
    id_categoria >= 3
LIMIT 
    100;