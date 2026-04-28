/*
================================================================================
 💬 [SQL Server] Comando PRINT
 📚 Aula 14 de 23: Exibindo mensagens no console (terminal integrado 🕹️)
================================================================================

 O comando PRINT exibe uma string de texto na aba de "Mensagens" do seu editor.
 
 ⚠️ Regra de Ouro: O comando PRINT aceita apenas caracteres (VARCHAR/NVARCHAR).
 Por isso, ao imprimir valores numéricos, é obrigatório convertê-los usando 
 CAST ou CONVERT.
*/

-- 1️⃣ DECLARAÇÃO E ATRIBUIÇÃO
-- Usamos subconsultas para capturar a contagem de lojas com status 'On' e 'Off'
DECLARE 
    @varLojasOn INT;
DECLARE 
    @varLojasOff INT;

SET 
    @varLojasOn = (SELECT COUNT(*) FROM DimStore WHERE Status = 'On');
SET 
    @varLojasOff = (SELECT COUNT(*) FROM DimStore WHERE Status = 'Off');

-- 2️⃣ VISUALIZAÇÃO EM TABELA
-- O SELECT ainda é a melhor forma de visualizar os dados estruturados
SELECT DISTINCT 
    @varLojasOn AS 'Lojas Abertas', 
    @varLojasOff AS 'Lojas Fechadas';

-- 3️⃣ VISUALIZAÇÃO EM MENSAGEM (PRINT)
-- Aqui realizamos o CAST, transformando INT em VARCHAR para concatenar com o texto.
PRINT 
    "O total de lojas abertas é de: " + CAST(@varLojasOn AS VARCHAR(30));
PRINT 
    "O total de lojas fechadas é de: " + CAST(@varLojasOff AS VARCHAR(30));


/* =============================================================================
 💡 Diferença entre SELECT e PRINT:
 
 - SELECT✅: Gera uma "Tabela de Resultados". Ótimo para extrair dados 
   que serão usados em relatórios ou pelo usuário final.
 
 - PRINT🖨️: Gera uma "Mensagem de Texto". Ótimo para logar o progresso de um script, 
   verificar valores de variáveis durante a depuração (debug) ou dar feedback 
   amigável ao desenvolvedor.
================================================================================
*/