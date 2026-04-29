/*
================================================================================
 🎨 [SQL Server] Manipulando Strings e Datas
 📚 Aula 09 de 23: A Função Versátil FORMAT
================================================================================

 A função FORMAT permite converter valores de data, hora e números em strings 
 formatadas de acordo com um padrão específico e até mesmo um idioma (cultura).

--------------------------------------------------------------------------------
 1️⃣ Formatação de Datas
--------------------------------------------------------------------------------
 Você pode definir exatamente como quer exibir o dia, mês e ano.
 
 - dd: Dia com dois dígitos.
 - MMMM: Nome do mês por extenso.
 - yyyy: Ano com quatro dígitos.
 - 'pt-BR': Define o idioma para português (ex: "Janeiro" em vez de "January").

--------------------------------------------------------------------------------
 2️⃣ Formatação Numérica e Moeda
--------------------------------------------------------------------------------
 Permite incluir símbolos monetários, definir casas decimais e preencher 
 números com zeros à esquerda.
 
 - #: Representa um número opcional (não exibe se for zero à esquerda).
 - 0: Representa um número obrigatório (exibe zero se a posição estiver vazia).

--------------------------------------------------------------------------------
 💻 Exemplos Práticos: Testes Rápidos
--------------------------------------------------------------------------------
*/

-- Testando Datas e Idiomas
SELECT DISTINCT
    GETDATE() AS 'Data do Sistema',
    FORMAT(GETDATE(), 'dd/MMMM/yyyy', 'pt-br') AS 'Data Formatada';

-- Testando Máscaras Numéricas (Preenchimento com zeros)
SELECT DISTINCT
    50123 AS 'Número Original',
    FORMAT(5123, '000000.00') AS 'Número Formatado';

-- Testando Formatação de Moeda Customizada
SELECT DISTINCT
    3670.5 AS 'Moeda_Original',
    FORMAT(5670.5, 'R$####.00') AS 'Moeda Formatada';

/*
--------------------------------------------------------------------------------
 💻 Exemplo Prático (DimCustomer)
--------------------------------------------------------------------------------
 Aplicando formatação profissional em colunas de cadastro e finanças.
*/

SELECT DISTINCT
    FirstName AS 'Nome',
    BirthDate AS 'Data de Nascimento',
    FORMAT(BirthDate, 'dd/MMMM/yyyy', 'pt-BR') AS 'Data Formatada',
    YearlyIncome AS 'Renda Anual (R$/ano)',
    FORMAT(YearlyIncome, 'C', 'pt-BR') AS 'Renda Anual Formatada' -- 'C' usa a moeda local
FROM
    DimCustomer;

/*
================================================================================
 ⚠️ Atenção / Performance:
    A função FORMAT é extremamente poderosa e flexível, mas em grandes volumes 
    de dados (milhões de linhas), ela pode ser mais lenta que as funções 
    CAST ou CONVERT. Use-a estrategicamente em relatórios finais!
================================================================================
*/