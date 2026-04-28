/*
================================================================================
 🚀 [SQL Server] Variáveis em Consultas (Parte 2)
 📚 Aula 12 de 23: Otimizando Consultas com UNION e Filtros Dinâmicos
================================================================================

 Objetivo: Filtrar dados de duas tabelas diferentes (DimCustomer e DimEmployee)
 usando uma única variável. Isso mantém seu código limpo e fácil de atualizar.
*/

-- 1️⃣ DECLARAÇÃO DA VARIÁVEL
-- DICA: Use o formato YYYYMMDD (ISO) para evitar erros de idioma no SQL Server.
DECLARE 
    @varData DATETIME = '19800101'; 

-- 2️⃣ CONSULTA UNIFICADA (UNION)
-- O 'UNION' combina os resultados das duas consultas.
SELECT 
    FirstName AS 'Nome',
    LastName AS 'Sobrenome',
    BirthDate AS 'Nascimento',
    'Cliente' AS 'Tipo'
FROM    
    DimCustomer
WHERE BirthDate >= @varData

UNION

SELECT 
    FirstName AS 'Nome',
    LastName AS 'Sobrenome',
    BirthDate AS 'Nascimento',
    'Funcionário' AS 'Tipo'
FROM    
    DimEmployee
WHERE 
	BirthDate >= @varData
ORDER BY 
	Nascimento; -- O 'ORDER BY' ordena o resultado final de ambas as tabelas

/* =============================================================================
 💡 Por que isso é uma "Aula de Otimização"?
 
 1. Centralização: O valor da data está em um único lugar. Se amanhã seu gestor
    pedir para filtrar pessoas nascidas a partir de 1990, você altera apenas
    o valor da variável e o script todo responde;
 2. Menos Erros: Evita o risco de você atualizar a data na consulta do 
    'Cliente' e esquecer de atualizar na do 'Funcionário'; e
 3. Manutenibilidade: Scripts com variáveis são muito mais profissionais e
    fáceis de ler.
================================================================================
*/