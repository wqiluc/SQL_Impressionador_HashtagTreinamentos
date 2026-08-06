-- ============================================================
-- 🗄️  SQL Server  |  📦 Módulo 21 — Procedures
-- 📖 Aula 7 de 15  |  Criando uma Procedure mais Complexa para Cadastro de Contratos - 
-- Explicação
-- ============================================================

/*
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📚 CONCEITO — Planejando a sp_CadastrarContrato
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  Objetivo: uma única procedure que cadastra um contrato completo,
  reaproveitando o cliente se ele já existir (pelo CPF) e criando
  um cliente novo caso não exista - tudo em uma única chamada.

  Passo a passo que a procedure vai seguir:

  1. Receber os dados do cliente (Nome, CPF), do gerente
     (ID_Gerente) e do contrato (ValorContrato)
  2. Verificar se já existe um cliente com aquele CPF
       • Se existir -> reaproveita o ID_Cliente
       • Se não existir -> insere o cliente e captura o novo
         ID_Cliente gerado (com SCOPE_IDENTITY())
  3. Validar se o ID_Gerente informado realmente existe
       • Se não existir -> dispara um erro e cancela a operação
  4. Inserir o contrato, relacionando cliente e gerente
  5. Envolver os passos 2 e 4 em uma TRANSACTION com TRY/CATCH,
     para garantir que, se algo falhar no meio do caminho, nada
     fique "pela metade" (cliente criado sem o contrato, por
     exemplo)

  A implementação completa vem na próxima aula.
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
*/

USE BD_Procedures;

-- ────────────────────────────────────────────────────────────
-- 🏋️ Exemplo prático
-- ────────────────────────────────────────────────────────────

-- SCOPE_IDENTITY() devolve o último valor de IDENTITY gerado na
-- MESMA sessão e no MESMO escopo (mais seguro que @@IDENTITY,
-- que pode pegar o IDENTITY de uma trigger disparada por engano)
SELECT SCOPE_IDENTITY() AS UltimoIdentityGerado;