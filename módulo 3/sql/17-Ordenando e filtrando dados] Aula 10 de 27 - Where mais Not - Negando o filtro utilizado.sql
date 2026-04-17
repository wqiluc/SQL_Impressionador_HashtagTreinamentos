-- Aula 10: WHERE com NOT
-- Seleciona produtos que NÃO estão na categoria 2 (Notebooks)
-- E NÃO têm "Mouse" no nome
-- =====================================================

SELECT DISTINCT
    nome_produto as 'Produto',
    id_categoria as "ID pela Categoria"
FROM 
    produtos
WHERE NOT 
    id_categoria = 2
AND NOT 
    nome_produto LIKE '%Mouse%'
LIMIT
    100;