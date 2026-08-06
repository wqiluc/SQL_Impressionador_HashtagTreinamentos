/*
================================================================================
 📝 [SQL Server] Exercícios de Fixação - Módulo 8 (Aulas 18-23)
 📚 Prática de Variáveis, Conversão e Formatação
================================================================================
*/

/* Todas as Bases de Dados são fictícias e eliminadas após a resolução dos exércicios*/

-- 1️⃣ EXERCÍCIO 01: Operações Básicas
/* Instruções:
   Declare as variáveis valor1, valor2, valor3 e valor4 com os valores: 10, 5, 34 e 7.
   Crie as variáveis soma, subtracao, multiplicacao e divisao (decimal).
   Arredonde o resultado da divisão.
*/
-- Resposta Aqui: 👇

DECLARE 
   @valor1 INT = 10,
   @valor2 INT = 5,
   @valor3 INT = 34,
   @valor4 INT = 7;

DECLARE 
   @soma INT,
   @subtracao INT,
   @multiplicacao INT,
   @divisao DECIMAL(10,2);

SET @soma = @valor1 + @valor2;
SET @subtracao = @valor3 - @valor1;
SET @multiplicacao = @valor2 * @valor4;

SET @divisao = ROUND(CAST(@valor3 AS DECIMAL(10,2)) / @valor4, 2);

SELECT 
    @soma AS "Resultado_Soma", 
    @subtracao AS "Resultado_Subtracao", 
    @multiplicacao AS "Resultado_Multiplicação", 
    @divisao AS "Resultado_Divisão";


-- 2️⃣ EXERCÍCIO 02: Declaração e Cálculo
/* Instruções:
   Declare: 'produto' (Celular), 'quantidade' (12), 'preco' (9.99).
   Declare 'faturamento' como resultado da multiplicação.
   Visualize todos os resultados em um único SELECT.
*/
-- Resposta Aqui: 👇

DECLARE 
   @produto VARCHAR(100) = 'Celular',
   @quantidade INT = 12,
   @preco DECIMAL(10, 2) = 9.99,
   @faturamento DECIMAL(10, 2);

SET 
   @faturamento = @quantidade * @preco;

SELECT DISTINCT
    @produto AS "Produto", 
    @quantidade AS "Quantidade", 
    @preco AS "Preco Unitario (R$)", 
    @faturamento AS "Faturamento Total";

PRINT("O " + @produto + " custa R$ " + CAST(@preco AS VARCHAR(10)) +
      " e o faturamento total é de R$ ") + CAST(@faturamento AS VARCHAR(10));

-- 3️⃣ EXERCÍCIO 03: Manipulação de Dados (CAST e FORMAT)
/* Instruções:
   Declare: 'nome' (André), 'data_nascimento' (10/02/1998), 'num_pets' (2).
   Crie um SELECT que retorne uma frase formatada unindo essas informações.
*/
-- Resposta Aqui: 👇


DECLARE 
   @nomeusuario varchar (100);
SET 
   @nomeusuario = "André";

DECLARE 
   @datanascimento DATE;
SET
   @datanascimento = "1998-02-10";

DECLARE 
   @qtdpets INT;
SET
   @qtdpets = 2;

SELECT DISTINCT 
   ("O usuário " + @nome + " nasceu em " + FORMAT(@data_nascimento, "dd/MMMM/yyyy") + " e possui " + CAST(@num_pets AS VARCHAR(10)) + " pets." AS Frase_Formatada);


-- 4️⃣ EXERCÍCIO 04: Controle de Qualidade (PRINT)
/* Instruções:
   Acumule em uma variável os nomes das lojas da tabela 'DimStore' 
   que fecharam no ano de 2008.
   Use o PRINT para exibir a frase: 'As lojas fechadas no ano de 2008 foram: ' + lista.
*/
-- Resposta Aqui: 👇


DECLARE @lista_lojas VARCHAR(MAX) = '';

SELECT @lista_lojas = @lista_lojas + StoreName + ', '
FROM DimStore
WHERE ClosedYear = 2008;

PRINT ("As lojas fechadas no ano de 2008 foram: " + @lista_lojas);


-- 5️⃣ EXERCÍCIO 05: Filtro Dinâmico
/* Instruções:
   Crie uma variável para armazenar o filtro 'Lamps'.
   Realize um SELECT na tabela 'DimProduct' usando essa variável no WHERE.
*/
-- Resposta Aqui: 👇


DECLARE 
   @filtrocategoria VARCHAR(50);
SET 
   @filtrocategoria = 'Lamps';

SELECT 
   *
FROM 
   DimProduct
WHERE 
   (Category = @filtrocategoria);