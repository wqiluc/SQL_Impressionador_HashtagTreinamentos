-- ============================================================
-- 🗄️  SQL Server  |  📦 Módulo 21 — Procedures
-- 📖 Aula 2 de 15  |  O que é uma Procedure
-- ============================================================

/*
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📚 CONCEITO — Sintaxe geral e Procedure vs consulta avulsa
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  Sintaxe geral:

     CREATE PROCEDURE nome_da_procedure
        @parametro1 tipo,
        @parametro2 tipo = valor_default
     AS
     BEGIN
        -- comandos T-SQL (SELECT, INSERT, UPDATE, DELETE...)
     END

  Para executar: EXEC nome_da_procedure @parametro1 = valor, ...

  Por que usar Procedure em vez de rodar a consulta "avulsa" toda
  vez?

  • O plano de execução é compilado na primeira chamada e
    reaproveitado nas próximas -> ganho de performance
  • A lógica fica centralizada: se a regra mudar, só é preciso
    alterar em um lugar
  • Dá para conceder permissão de EXECUTE na procedure sem dar
    acesso direto de leitura/escrita nas tabelas
  • Uma procedure pode rodar VÁRIOS comandos (SELECT, INSERT,
    UPDATE, DELETE, controle de transação) - uma function não pode
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
*/

USE BD_Procedures

-- ────────────────────────────────────────────────────────────
-- 🏋️ Exemplo prático
-- ────────────────────────────────────────────────────────────

-- Consultando as procedures já criadas no banco (procedures do
-- usuário, sem contar as procedures internas do sistema)
SELECT name, create_date, modify_date
FROM sys.procedures
