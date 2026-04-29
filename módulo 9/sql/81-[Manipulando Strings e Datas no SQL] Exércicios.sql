/*
================================================================================
 📝 [SQL Server] MÓDULO 9: EXERCÍCIOS DE FIXAÇÃO
 📊 Manipulação de Strings e Datas
================================================================================

/* Todas as Bases de Dados são fictícias e eliminadas após a resolução dos exércicios*/


/*
--------------------------------------------------------------------------------
 🛒 EXERCÍCIO 1: ANÁLISE DE PRODUTOS (DimProduct)
--------------------------------------------------------------------------------
 O gestor precisa de um relatório para gráficos diários, onde nomes muito 
 longos podem prejudicar a visualização.

 a) Liste todos os produtos com: (1) Nome do produto e (2) Quantidade de 
    caracteres. Ordene do maior para o menor.
 b) Qual é a média de caracteres dos nomes dos produtos?
 c) Verifique se há informações redundantes nos nomes que permitam reduzir 
    seu tamanho (Dica: Use REPLACE).
 d) Qual a nova média de caracteres após a redução?

 -- Responda Aqui: 👇
*/





/*
--------------------------------------------------------------------------------
 🏷️ EXERCÍCIO 2: MÁSCARA DE CÓDIGOS (DimProduct)
--------------------------------------------------------------------------------
 O setor de controle alterou a identificação da coluna StyleName.
 Em vez de números (0-9), agora usaremos letras (A-J).

 Mapeamento: 0->A, 1->B, 2->C, 3->D, 4->E, 5->F, 6->G, 7->H, 8->I, 9->J
 
 💡 Dica: Utilize a função TRANSLATE para fazer isso de forma rápida!

 -- Responda Aqui: 👇
*/




/*
--------------------------------------------------------------------------------
 🔑 EXERCÍCIO 3: SISTEMA DE LOGIN E SENHA (DimEmployee)
--------------------------------------------------------------------------------
 O TI está criando um sistema de acompanhamento individual e precisa de 
 sua ajuda para gerar as credenciais de acesso:
 
 - Login: Será o ID do e-mail (tudo o que vem antes do @).
 - Senha: Será o FirstName (em MAIÚSCULA) + o dia do ano em que nasceu.
   Exemplo: mark0@contoso.com (Nasc: 15/01) -> Login: mark0 | Senha: MARK15

 Retorne uma tabela com: Nome Completo (First + Last), E-mail, ID do e-mail e Senha.

 -- Responda Aqui: 👇
*/




/*
--------------------------------------------------------------------------------
 🎁 EXERCÍCIO 4: RECONHECIMENTO DE CLIENTES (DimCustomer)
--------------------------------------------------------------------------------
 O Marketing quer presentear os clientes "pioneiros" que fizeram sua primeira 
 compra no ano de 2001.
 
 - Use a coluna: DateFirstPurchase.
 - Retorne: FirstName, EmailAddress, AddressLine1 e DateFirstPurchase.
 - Filtro: Considere apenas clientes que compraram no ano de 2001.

 -- Responda Aqui: 👇
*/





/*
--------------------------------------------------------------------------------
 📅 EXERCÍCIO 5: RELATÓRIO DE RH (DimEmployee)
--------------------------------------------------------------------------------
 O RH precisa automatizar um relatório e solicita as datas de contratação 
 (HireDate) de forma decomposta.

 Retorne: FirstName, EmailAddress, HireDate e colunas separadas para:
 - Dia de contratação.
 - Mês de contratação (O NOME do mês por extenso, não o número).
 - Ano de contratação.

 -- Responda Aqui: 👇
*/





/*
--------------------------------------------------------------------------------
 🏪 EXERCÍCIO 6: TEMPO DE ATIVIDADE (DimStore)
--------------------------------------------------------------------------------
 Descubra qual é a loja que possui o maior tempo de atividade em dias.
 
 - Referência: Coluna OpenDate.
 - Objetivo: Calcular a diferença em dias entre a abertura e a data atual.

 -- Responda Aqui: 👇
*/



