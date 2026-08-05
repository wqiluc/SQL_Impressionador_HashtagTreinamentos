-- ============================================================
-- 🗄️  SQL Server  |  📦 Módulo 20 — Functions
-- 📖 Aula 2 de 11  |  O que é uma Function
-- ============================================================

/*
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📚 CONCEITO — Tipos de Function e sintaxe geral
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  O SQL Server tem dois grandes tipos de Function definida pelo
  usuário:

  1. SCALAR FUNCTION -> recebe parâmetros e devolve UM ÚNICO valor
     (um número, texto, data...). Pode ser usada dentro de um
     SELECT, WHERE, ou em qualquer lugar que aceite uma expressão.

  2. TABLE-VALUED FUNCTION (TVF) -> devolve uma TABELA inteira,
     podendo ser usada no FROM de uma consulta, como se fosse uma
     tabela ou view.

  Sintaxe geral de uma scalar function:

     CREATE FUNCTION nome_da_function (@parametro tipo)
     RETURNS tipo_de_retorno
     AS
     BEGIN
        DECLARE @resultado tipo_de_retorno

        -- lógica...

        RETURN @resultado
     END

  Diferente de uma Procedure, uma Function é OBRIGADA a devolver um
  valor com RETURN, e não pode executar comandos que alterem dados
  (INSERT/UPDATE/DELETE) - ela serve para CALCULAR e DEVOLVER algo,
  não para modificar o banco.
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
*/

USE BD_Functions

-- ────────────────────────────────────────────────────────────
-- 🏋️ Exemplo prático
-- ────────────────────────────────────────────────────────────

-- Consultando as functions já criadas no banco
SELECT name, type_desc
FROM sys.objects
WHERE type IN ('FN', 'IF', 'TF') -- FN = scalar, IF = inline table-valued, TF = multi-statement table-valued
