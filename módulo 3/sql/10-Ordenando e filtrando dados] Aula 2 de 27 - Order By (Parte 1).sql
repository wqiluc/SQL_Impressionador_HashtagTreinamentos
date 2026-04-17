-- [MySQL] [Ordenando e filtrando dados] Aula 2 de 27: 
-- Order By (Produtos)

-- Selecionando os 10 produtos mais caros da tabela produtos
-- Ordenando pela coluna preco_produto de forma decrescente

-- [MySQL] [Ordenando e filtrando dados] Aula: Order By (Produtos)

-- Selecionando os 10 produtos mais caros da tabela produtos
-- Ordenando pela coluna preco_produto de forma decrescente

SELECT 
    *
from 
    produtos
order by 
    preco_produto 
desc limit 
    10;
