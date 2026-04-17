-- Log in no banco de dados: 'contoso_ficticio'
show databases;
select contoso_ficticio;
show tables;
select * from clientes,vendedores;
select nome_cliente from clientes;
select email_cliente from clientes;
select data_cadastro_cliente from clientes;
exit
-- Log in no banco de dados: 'contoso_ficticio'
show databases;
use contoso_ficticio;
show tables;
select * from pagamentos,pedidos,itens_pedido;
select * from pagamentos;
select * from pedidos;
select * from itens_pedido;
select forma_pagamento from pagamentos;
select valor from pagamentos;
select data_pedido from pedidos;
create table resumo_pagamentos AS
SELECT 
    p.forma_pagamento,
    p.valor,
    pe.data_pedido
FROM pagamentos p
JOIN pedidos pe 
ON p.id_pedido = pe.id_pedido;
show databases;
use contoso_ficticio;
show tables;