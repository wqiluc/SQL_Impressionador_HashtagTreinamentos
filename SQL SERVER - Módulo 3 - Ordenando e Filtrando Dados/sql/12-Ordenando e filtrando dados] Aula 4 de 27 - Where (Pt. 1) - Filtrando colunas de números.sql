-- [MySQL] [Ordenando e filtrando dados] Aula 4 de 27: Where (Pt. 1) - Filtrando colunas de números

-- Podemos filtrar os dados nas nossas tabelas utilizando o comando WHERE
-- Quantos produtos têm um preço maior ou igual a 1000?

select 
	nome_produto AS Produto,
	preco_produto as Preço
FROM 
	produtos
WHERE 
	preco_produto >= 1000;