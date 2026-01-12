-- Log in no banco de dados: 'contoso_ficticio'
show databases;
use contoso_ficticio;
show tables;

select 
    *
from resumo_pagamentos

show databases;
use contoso_ficticio;
show tables;

select 
* from
    resumo_pagamentos,
    vendedores,
    clientes;
exit
-- Log out do banco de dados: 'contoso_ficticio'