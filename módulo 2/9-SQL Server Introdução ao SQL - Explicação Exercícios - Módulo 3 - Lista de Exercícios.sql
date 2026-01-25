-- =========================================================
-- [SQL Server] Introdução ao SQL
-- Módulo 3 – Lista de Exercícios
-- =========================================================
-- Instruções:
-- Utilize boas práticas de organização e comentários no código
-- Escreva as resoluções nos espaços indicados abaixo
-- =========================================================

-- =========================================================
-- EXERCÍCIO 1
-- Controle de dados de clientes e produtos
-- =========================================================

-- 1.a Verificar se existem exatamente 2.517 produtos cadastrados
-- Caso o número seja diferente, reportar ao gestor
--
-- Resolução:

show databases;
use contoso_ficticio;
show tables;
select * from pedidos;
-- 2157+ produtos ✅

-- 1.b Até o mês passado existiam 19.500 clientes na base
-- Verificar se esse número aumentou ou diminuiu
--
-- Resolução:
--

show databases;
select * from clientes;
-- esse número diminuiu (exemplo apenas ❌)

-- =========================================================
-- EXERCÍCIO 2
-- Ação de marketing para aniversariantes
-- =========================================================

-- Objetivo: Listar clientes com data de nascimento e contato

-- 2.a Selecionar as colunas:
-- CustomerKey, FirstName, EmailAddress, BirthDate
--
-- Resolução:

show databases;
use contoso_ficticio;
show tables;
select * from clientes;
select id_cliente, nome_cliente, email_cliente, data_cadastro_cliente from clientes;

-- 2.b Renomear as colunas utilizando alias (AS)
--
-- Resolução:
--

select DISTINCT
    id_cliente as ID_do_Cliente from clientes;
select DISTINCT
    nome_cliente as Nome_Cliente from clientes;
select DISTINCT
    email_cliente as Email_Cliente from clientes; 
select DISTINCT
    data_cadastro_cliente as Data_de_Cadastro_do_Cliente 
from 
    clientes;

-- =========================================================
-- EXERCÍCIO 3
-- Ação comemorativa de 10 anos da Contoso
-- =========================================================

-- 3.a Retornar os 100 primeiros clientes da história
-- Selecionar todas as colunas da tabela dimCustomer
--
-- Resolução:
--
--

show databases;
use contoso_ficticio;
show tables;
select * from clientes 
    limit 10;

-- 3.b Retornar os primeiros 20% dos clientes da história
-- Utilizando TOP PERCENT
--
-- Resolução:
--

SELECT 
    c.* 
FROM 
    clientes c JOIN (SELECT CEIL(COUNT(*) * 0.05) as "limite" from clientes) 
to ORDER BY 
    c.id_cliente 
LIMIT 
    t.limite;


-- 3.c Retornar apenas as 100 primeiras linhas
-- Selecionando somente:
-- FirstName, EmailAddress, BirthDate
--
-- Resolução:
--

show databases;
use 
    contoso_ficticio;
show 
    tables;
select 
    * 
from 
    clientes;

SELECT distinct 

-- 3.d Renomear as colunas anteriores para nomes em português
--
-- Resolução:
--

nome_cliente as "Nome_Cliente", 
email_cliente as "Email_Cliente", 
data_cadastro_cliente as "Data_de_Cadastro_do_Cliente"

-- =========================================================
-- EXERCÍCIO 4
-- Contato com fornecedores
-- =========================================================

-- Objetivo: Retornar apenas os nomes dos fornecedores
-- Renomeando a coluna resultante
--
-- Resolução:
--

show databases;
use contoso_ficticio;
show tables;
select 
    * 
from 
    vendedores;

select DISTINCT 
    id_vendedor as "Id_do_Vendedor", 
    nome as "Nome_do_Vendedor", 
    salario as "Salário_do_Vendedor" 
from 
    vendedores;

-- =========================================================
-- EXERCÍCIO 5
-- Investigação de produtos não vendidos
-- =========================================================

-- Objetivo: Verificar se existe algum produto registrado
-- que ainda não tenha sido vendido
-- Não é necessário identificar qual produto
--
-- Resolução:
--

show databases;
use 
    contoso_ficticio;
show 
    tables;
select 
    * 
from 
    historico_produtos;
select DISTINCT 
    estoque_produto as "Estoque_do_Produto"
from 
    produtos;

-- Todos os produtos estão cadastrados, e possuem, pelo menos; 1 venda ✅🛒🛍️