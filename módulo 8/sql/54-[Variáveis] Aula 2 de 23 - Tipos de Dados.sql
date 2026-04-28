/*
================================================================================
 📊 [SQL Server] Variáveis e Tipos de Dados
 📚 Aula 02 de 23: Guia de Referência
================================================================================

 O tipo de dado é a maneira como o SQL consegue diferenciar cada valor dentro
 de um banco de dados. Abaixo, um resumo completo para consulta:

--------------------------------------------------------------------------------
 1️⃣ INTEIRO (INT)
--------------------------------------------------------------------------------
 Descrição: Para números inteiros (sem casas decimais).
 Exemplos: 1, 100, 569
 Exemplo de uso:
 -- DECLARE @Numero INT = 569;
 -- PRINT @Numero;

--------------------------------------------------------------------------------
 2️⃣ DECIMAL (FLOAT / DECIMAL)
--------------------------------------------------------------------------------
 Descrição: Para números com casas decimais.
 
 - FLOAT: Para precisão aproximada (usado em cálculos científicos).
 - DECIMAL(N, M): Para precisão exata (usado em finanças).
   N = Quantidade total de dígitos.
   M = Quantidade de casas decimais.

 Exemplos: 10.33, 90.91, 410.787
 Exemplo de uso:
 -- DECLARE @Valor DECIMAL(10, 2) = 410.78; 
 -- PRINT @Valor;

--------------------------------------------------------------------------------
 3️⃣ TEXTO / STRING (VARCHAR)
--------------------------------------------------------------------------------
 Descrição: Para armazenar sequências de caracteres.
 N = Número máximo de caracteres que o campo pode ter.

 Exemplos: 'Carla', 'Motorola', 'Pastel', '44'
 Exemplo de uso:
 -- DECLARE @Texto VARCHAR(50) = 'Exemplo de texto';
 -- PRINT @Texto;

--------------------------------------------------------------------------------
 4️⃣ DATA / HORA (DATE / DATETIME)
--------------------------------------------------------------------------------
 Descrição:
 - DATE: Armazena apenas a data (Ano, Mês, Dia).
 - DATETIME: Armazena data e hora (Ano, Mês, Dia, Hora, Minuto, Segundo).

 Exemplos: '2021-01-01', '2021-03-23'
 Exemplo de uso:
 -- DECLARE @Data DATE = '2026-04-27';
 -- DECLARE @DataHora DATETIME = '2026-04-27 18:06:39';
 -- PRINT @DataHora;

================================================================================
 💡 Dica: Mantenha este bloco comentado no topo dos seus arquivos SQL
          para servir como um manual de consulta rápida!
================================================================================
*/