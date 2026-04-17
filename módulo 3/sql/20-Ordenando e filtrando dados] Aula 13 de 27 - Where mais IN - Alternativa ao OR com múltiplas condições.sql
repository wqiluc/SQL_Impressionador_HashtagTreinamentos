-- [MySQL] [Ordenando e filtrando dados]
-- Aula 13 de 27: WHERE com IN - Alternativa ao OR com múltiplas condições

-- Podemos utilizar o operador IN como alternativa aos múltiplos OR

-- Exemplo:
-- Selecione os produtos que pertencem a qualquer uma destas categorias:
-- 1 (Monitores);
--2 (Notebooks); ou 
-- 3 (Periféricos).

SELECT DISTINCT
    nome_produto as "Nome",
    id_produto as "ID - Produto",
    id_categoria as "ID - Categoria"
FROM 
    produtos
WHERE 
    id_categoria IN 
                    (1, 2, 3)
LIMIT
    100;