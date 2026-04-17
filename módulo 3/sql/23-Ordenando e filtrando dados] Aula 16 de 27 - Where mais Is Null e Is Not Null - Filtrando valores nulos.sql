-- [MySQL] Ordenando e filtrando dados
-- Aula 16 de 27: WHERE com IS NULL e IS NOT NULL - Filtrando valores nulos

-- =====================================================
-- 1. Selecione os clientes que NÃO possuem e-mail cadastrado
-- (valores nulos)
-- =====================================================

SELECT DISTINCT
    id_cliente AS ID_Cliente,
    nome_cliente AS Nome_Cliente,
    email_cliente as Email_Cliente
FROM 
    clientes
WHERE 
    email_cliente IS NULL;

-- =====================================================
-- 2. Selecione os clientes que POSSUEM e-mail cadastrado
-- (valores não nulos)
-- =====================================================

SELECT DISTINCT
    id_cliente  AS ID_Cliente,
    nome_cliente AS Nome_Cliente,
    email_cliente AS Email_Cliente
FROM 
    clientes
WHERE 
email_cliente IS NOT NULL;