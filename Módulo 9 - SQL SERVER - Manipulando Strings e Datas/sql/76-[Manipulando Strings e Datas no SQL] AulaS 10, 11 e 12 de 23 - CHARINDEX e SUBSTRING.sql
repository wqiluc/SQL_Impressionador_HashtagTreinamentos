/*
================================================================================
 🔍 [SQL Server] Manipulando Strings
 📚 Aula 10, 11 e 12 de 23: Extração Dinâmica com CHARINDEX e SUBSTRING
================================================================================

 Estas duas funções são o "canivete suíço" para separar e organizar dados
 que vêm misturados em uma única coluna.

--------------------------------------------------------------------------------
 1️⃣ CHARINDEX (A Bússola) 🧭
--------------------------------------------------------------------------------
 Descrição: Retorna a posição (número inteiro) onde um caractere ou texto
 começa dentro de uma string.
 
 Sintaxe: CHARINDEX('o que procurar', 'onde procurar')

--------------------------------------------------------------------------------
 2️⃣ SUBSTRING (A Tesoura) ✂️
--------------------------------------------------------------------------------
 Descrição: Extrai uma parte de uma string a partir de uma posição definida.
 
 Sintaxe: SUBSTRING(coluna, posição_inicial, tamanho)

--------------------------------------------------------------------------------
 3️⃣ O Poder do Uso Combinado 🧭🤝✂️
--------------------------------------------------------------------------------
 Raramente sabemos a posição exata de um nome ou sobrenome (pois os nomes
 têm tamanhos diferentes). Por isso, usamos o CHARINDEX *dentro* do SUBSTRING
 para tornar nossa consulta dinâmica e inteligente.

--------------------------------------------------------------------------------
 4️⃣ Refatoração com Variáveis ⚡
--------------------------------------------------------------------------------
 Usar variáveis permite separar o "cálculo" da "extração". Isso torna o código
 muito mais legível, fácil de debugar e evita repetições desnecessárias de 
 funções complexas.
*/

-- =============================================================================
-- EXEMPOS BÁSICOS
-- =============================================================================

SELECT DISTINCT
    CHARINDEX('Moreno', 'Raquel Moreno') AS 'Posicao_Sobrenome'; -- Retorna 8

SELECT DISTINCT
    SUBSTRING('Raquel Moreno', 8, 6) AS 'Sobrenome_Manual'; -- Retorna 'Moreno'


-- =============================================================================
-- EXEMPLO PRÁTICO: EXTRAÇÃO DINÂMICA
-- =============================================================================

SELECT DISTINCT
    'Marcus Cavalcanti' AS 'Nome Original',
    CHARINDEX(' ', 'Marcus Cavalcanti') AS 'Posição do Espaço',
    SUBSTRING
    (
        'Marcus Cavalcanti', 
        CHARINDEX(' ', 'Marcus Cavalcanti') + 1, 
        100
    ) 
        AS 'Sobrenome_Extraido';


-- =============================================================================
-- EXEMPLO OTIMIZADO: VARIÁVEIS EM BLOCO (E-mail)
-- =============================================================================
/*
 Aqui agrupamos as declarações e atribuições para um código mais limpo e sucinto.
*/

DECLARE 
    @EmailCompleto VARCHAR(100) = 'ana.silva@empresa.com',
    @PosicaoArroba  INT,
    @Usuario VARCHAR(50),
    @Dominio VARCHAR(50);

-- Atribuição múltipla em um único bloco SET/SELECT
SELECT 
    @PosicaoArroba = CHARINDEX('@', @EmailCompleto),
    @Usuario = LEFT(@EmailCompleto, CHARINDEX('@', @EmailCompleto) - 1),
    @Dominio = SUBSTRING(@EmailCompleto, CHARINDEX('@', @EmailCompleto) + 1, LEN(@EmailCompleto));

SELECT DISTINCT
    @EmailCompleto AS 'E-mail Original',
    @Usuario AS 'Usuário Extraído',
    @Dominio AS 'Domínio Extraído';

/*
================================================================================
 💡 Dica de Ouro:
    Se você quiser GARANTIR que está pegando exatamente o restante do texto sem 
    chutar o número '100', pode usar a função LEN:
    
    SUBSTRING(Nome, Posicao + 1, LEN(Nome))
    
    Isso calcula dinamicamente quantos caracteres restam, tornando seu código 
    muito mais profissional e à prova de erros!
================================================================================
*/