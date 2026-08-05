-- [MySQL] [Ordenando e filtrando dados] Aula 2 de 27: Order By (Parte 2)

-- Selecionando os 10 produtos mais caros da tabela produtos
-- Ordenando pelo preço do produto (preco_produto) de forma decrescente
-- E pelo estoque (estoque_produto) de forma decrescente

select
    nome_produto,
    preco_produto,
    estoque_produto
from 
	produtos
order by 
	preco_produto 
DESC, 
	estoque_produto 
DESC 
	limit 10;
