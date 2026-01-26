-- [MySQL] [Ordenando e filtrando dados]
-- Aula 12 de 27: Cuidados ao combinar os operadores AND e OR

-- Podemos filtrar os dados nas nossas tabelas utilizando o comando WHERE

-- Exemplo:
-- Selecione todos os produtos cujo nome contenha "Mouse" OU "Teclado",
-- MAS que obrigatoriamente pertençam à categoria 3 (Periféricos)

SELECT DISTINCT
    nome_produto as "Nome",
    id_categoria as "ID - Categoria (3)"
FROM 
    produtos
WHERE 
    (nome_produto LIKE '%Mouse%' 
        OR 
        nome_produto LIKE '%Teclado%')
AND 
    id_categoria = 3
LIMIT
    100;