-- [MySQL] [Ordenando e filtrando dados] Aula 5 de 27: Where (Pt. 2) - Filtrando colunas de texto
-- Podemos filtrar os dados nas nossas tabelas utilizando o comando WHERE


-- Exemplo 1: Quais produtos contêm 'notebook' no nome💻?

SELECT
    *
FROM 
    produtos 
WHERE 
    nome_produto LIKE '%Notebook%';

-- Exemplo 2: Quais produtos contêm 'Mouse' no nome⬆️?

SELECT 
    *
FROM 
    produtos
WHERE 
    nome_produto LIKE '%Mouse%';