/*
================================================================================
 📝 [SQL Server] Variáveis
 📚 Aula 16 de 23: Acumulando valores em uma variável (String Aggregation)
================================================================================

 Objetivo: Criar uma lista única de texto concatenando valores de várias linhas 
 em uma única variável.
*/

-- 1️⃣ INICIALIZAÇÃO
-- Usamos VARCHAR(MAX) para garantir que a variável suporte textos longos.
DECLARE 
    @ListaNomes VARCHAR(MAX);
SET 
    @ListaNomes = "";

-- 2️⃣ O PADRÃO ACUMULADOR
-- A mágica acontece aqui: @ListaNomes = @ListaNomes + ...
-- O SQL guarda o valor atual da variável e concatena o novo valor da linha.
SELECT DISTINCT
    @ListaNomes = @ListaNomes + FirstName + ', ' + CHAR(10)
FROM
    DimEmployee
WHERE 
    DepartmentName = 'Marketing';

-- 3️⃣ LIMPEZA FINAL
-- Como sempre adicionamos ', ' + CHAR(10) ao final, a última linha ficará com 
-- caracteres sobrando. Usamos LEFT para remover os 3 últimos caracteres.
PRINT LEFT(@ListaNomes, DATALENGTH(@ListaNomes) - 3);


/* =============================================================================
 💡 Dica de Especialista (Modernização):
 
 Se você estiver usando SQL Server 2017 ou superior, existe uma função 
 nativa feita exatamente para isso, que é muito mais performática e simples:
 
 O STRING_AGG!
 
 Exemplo com STRING_AGG:
 SELECT DISTINCT 
    STRING_AGG(FirstName, ', ') AS ListaFuncionarios
 FROM 
    DimEmployee
 WHERE 
    DepartmentName = 'Marketing';
 
 O resultado é o mesmo, mas o código fica muito mais limpo e rápido.
================================================================================
*/