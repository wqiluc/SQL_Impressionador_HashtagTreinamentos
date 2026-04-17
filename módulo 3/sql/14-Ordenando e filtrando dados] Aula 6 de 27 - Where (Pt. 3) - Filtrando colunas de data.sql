-- [MySQL] [Ordenando e filtrando dados] Aula 5 de 27: Where (Pt. 3) - Filtrando colunas de data

-- Podemos filtrar os dados nas nossas tabelas utilizando o comando WHERE

-- Quais clientes se cadastraram após 31/12/2023?

SELECT DISTINCT 
    data_cadastro_cliente as "Data_de_Cadastro (2024 em diante)"
FROM 
    clientes
WHERE 
    data_cadastro_cliente > '2023-12-31'
ORDER BY 
    data_cadastro_cliente DESC;