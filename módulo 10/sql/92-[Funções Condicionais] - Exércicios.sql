-- ==============================================================================
-- 🔤 [SQL Server] Detalhamento do Módulo 10 - Exercícios
-- ==============================================================================
-- Introdução: Detalhamento de cada questão para a resolução dos exercícios.
-- ==============================================================================


/* Todas as Bases de Dados são fictícias e eliminadas após a resolução dos exércicios*/

-- ==============================================================================
-- 📋 Exercício 1: Aplicação de Desconto por Classe
-- ==============================================================================
-- • Enunciado: O setor de vendas decidiu aplicar descontos aos produtos de acordo com a sua classe.
-- • Regras: Economy -> 5%, Regular -> 7%, Deluxe -> 9%.
-- • Requisitos:
--   a) Retornar ProductKey, ProductName, e outras duas colunas que deverão retornar o % de Desconto e UnitPrice com desconto.
--   b) Fazer uma adaptação no código para que os percentuais de desconto de 5%, 7% e 9% sejam facilmente modificados utilizando variáveis.
--
-- Responda Aqui: 👇






-- ==============================================================================
-- 📋 Exercício 2: Controle de Produtos por Marca
-- ==============================================================================
-- • Enunciado: Análise da quantidade de produtos por Marca.
-- • Regras de Categoria:
--   - CATEGORIA A: Mais de 500 produtos
--   - CATEGORIA B: Entre 100 e 500 produtos
--   - CATEGORIA C: Menos de 100 produtos
-- • Requisitos: Retornar uma tabela com um agrupamento de Total de Produtos por Marca, além da coluna de Categoria, conforme a regra.
--
-- Responda Aqui: 👇






-- ==============================================================================
-- 📋 Exercício 3: Categorização de Lojas
-- ==============================================================================
-- • Enunciado: Criar uma categorização de cada loja da empresa considerando a quantidade de funcionários de cada uma.
-- • Regras:
--   - EmployeeCount >= 50: 'Acima de 50 funcionários'
--   - EmployeeCount >= 40: 'Entre 40 e 50 funcionários'
--   - EmployeeCount >= 30: 'Entre 30 e 40 funcionários'
--   - EmployeeCount >= 20: 'Entre 20 e 30 funcionários'
--   - EmployeeCount >= 40: 'Entre 10 e 20 funcionários'
--   - Caso contrário: 'Abaixo de 10 funcionários'.
-- • Requisitos: Fazer uma consulta à tabela DimStore que retorne StoreName, EmployeeCount e a coluna de categoria seguindo as regras.
--
-- Responda Aqui: 👇







-- ==============================================================================
-- 📋 Exercício 4: Logística - Distribuição de Peso por Subcategoria
-- ==============================================================================
-- • Enunciado: Logística de transporte de carga dos produtos que estão no depósito de Seattle para o de Sunnyside, sabendo que existem 100 exemplares de cada subcategoria.
-- • Regras de Rota:
--   - Rota 1: As subcategorias que tiverem uma soma total menor que 1000 kg deverão ser transportadas pela Rota 1.
--   - Rota 2: As subcategorias que tiverem uma soma total maior ou igual a 1000 kg deverão ser transportadas pela Rota 2.
-- • Requisitos: 
--   - A consulta deve ter 3 colunas: Nome da Subcategoria, Peso Total e Rota.
--   - Descobrir o peso médio de cada subcategoria e multiplicar a média por 100 para descobrir o peso total aproximado.
--   - A resposta final deverá conter um JOIN e um GROUP BY.
--
-- Responda Aqui: 👇








-- ==============================================================================
-- 📋 Exercício 5: Campanhas de Marketing
-- ==============================================================================
-- • Enunciado: Campanhas de sorteio entre os clientes para 2021.
-- • Regras de Marketing:
--   - 'Sorteio Mãe do Ano': Nessa categoria vão participar todas as mulheres com filhos.
--   - 'Sorteio Pai do Ano': Nessa categoria vão participar todos os pais com filhos.
--   - 'Caminhão de Prêmios': Nessa categoria vão participar todos os demais clientes (homens e mulheres sem filhos).
-- • Requisitos: Retornar 4 colunas da tabela DimCustomer: FirstName (Nome), Gender (Sexo), TotalChildren (Qtd. Filhos), EmailAddress (E-mail), além da Ação de Marketing.
--
-- Responda Aqui: 👇









-- ==============================================================================
-- 📋 Exercício 6: Maior Tempo de Atividade da Loja (em dias)
-- ==============================================================================
-- • Enunciado: Descobrir qual é a loja que possui o maior tempo de atividade (em dias).
-- • Requisitos: 
--   - Fazer consulta na tabela DimStore.
--   - Utilizar a coluna OpenDate como referência para esse cálculo.
--   - Atenção: lembrar que existem lojas que foram fechadas, necessitando verificar se existe data de fechamento.
--
-- Responda Aqui: 👇







