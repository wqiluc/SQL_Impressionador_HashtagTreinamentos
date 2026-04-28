/*
================================================================================
 📥 [SQL Server] Variáveis
 📚 Aula 13 de 23: Armazenando o resultado de um SELECT em uma variável
================================================================================

 Objetivo: Capturar um único valor (scalar) de uma consulta e guardá-lo 
 em uma variável para uso posterior.
 
 ⚠️ Regra de Ouro: A subconsulta entre parênteses deve retornar APENAS UMA linha 
 e APENAS UMA coluna. Caso contrário, o SQL Server retornará um erro.
*/

-- 1️⃣ Exemplo 1: Contagem Total de Funcionários
-- Armazenamos o resultado da contagem diretamente na variável.
DECLARE 
   @varTotalFuncionarios INT;

SET 
   @varTotalFuncionarios = (SELECT COUNT(*) FROM DimEmployee);

SELECT DISTINCT 
   @varTotalFuncionarios AS 'Total_Funcionarios';


-- 2️⃣ Exemplo 2: Contagem de Lojas Inativas (Status = 'Off')
-- O uso de filtros (WHERE) na subconsulta é perfeitamente permitido.
DECLARE 
   @varLojasOff INT;

SET 
   @varLojasOff = (SELECT COUNT(*) FROM DimStore WHERE Status = 'Off');

SELECT DISTINCT
   @varLojasOff AS 'Lojas_Inativas';

/* =============================================================================
 💡 Dica de Especialista: O método do "SELECT atribuído"
 
 Além do SET, você também pode atribuir valores usando o próprio SELECT.
 Essa forma é muito comum em scripts profissionais:
*/

DECLARE @varTotalCusto FLOAT;

SELECT 
   @varTotalCusto = SUM(UnitPrice) 
FROM 
   DimProduct;

SELECT DISTINCT 
   @varTotalCusto AS 'Custo_Total_Produtos';

/* 🚀 Por que isso é importante?
 
 Imagine que você precisa calcular o faturamento total e depois decidir se o 
 valor é "ALTO" ou "BAIXO" para exibir em uma mensagem. Com a variável guardada, 
 você pode fazer um "IF" logo em seguida!
 
 Exemplo rápido:
 IF @varTotalFuncionarios > 100
    PRINT ("Empresa grande");
 ELSE
    PRINT ("Empresa pequena");
================================================================================
*/