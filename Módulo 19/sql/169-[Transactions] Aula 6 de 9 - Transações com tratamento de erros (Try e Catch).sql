-- ============================================================
-- 🗄️  SQL Server  |  📦 Módulo 19 — Transactions
-- 📖 Aula 6 de 9  |  Transações com tratamento de erros (Try e Catch)
-- ============================================================

/*
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📚 CONCEITO — BEGIN TRY / BEGIN CATCH
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  O padrão profissional para transações combina TRY/CATCH com
  BEGIN TRAN:

  BEGIN TRY
     BEGIN TRAN
        comandos...
     COMMIT
  END TRY
  BEGIN CATCH
     IF @@TRANCOUNT > 0
        ROLLBACK
     -- tratar/relançar o erro
  END CATCH

  Assim, QUALQUER erro em tempo de execução (violação de
  constraint, divisão por zero, conversão inválida etc.) é
  capturado pelo CATCH, que desfaz a transação antes de reportar
  o problema - em vez de deixar a transação "pendurada" aberta.

  Funções úteis dentro do CATCH:
  • ERROR_MESSAGE() -> mensagem do erro
  • ERROR_NUMBER()  -> código do erro
  • ERROR_LINE()    -> linha onde ocorreu
  • XACT_STATE()    -> estado da transação (1 = ok p/ commit,
                       -1 = só pode dar rollback, 0 = sem transação)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
*/

USE BD_Transactions

-- ────────────────────────────────────────────────────────────
-- 🏋️ Exemplo prático
-- ────────────────────────────────────────────────────────────

SELECT * FROM Conta

-- 1️⃣  Transferência protegida por TRY/CATCH
BEGIN TRY
   BEGIN TRAN

      UPDATE Conta SET Saldo = Saldo - 150 WHERE ID_Conta = 1
      UPDATE Conta SET Saldo = Saldo + 150 WHERE ID_Conta = 2

   COMMIT
   PRINT 'Transferência concluída com sucesso'
END TRY
BEGIN CATCH
   IF @@TRANCOUNT > 0
      ROLLBACK

   PRINT 'Erro ao transferir: ' + ERROR_MESSAGE()
END CATCH

SELECT * FROM Conta

-- 2️⃣  Forçando um erro real (conta inexistente causa violação de
--     regra abaixo, simulada com um RAISERROR)
BEGIN TRY
   BEGIN TRAN

      UPDATE Conta SET Saldo = Saldo - 150 WHERE ID_Conta = 1

      IF NOT EXISTS (SELECT 1 FROM Conta WHERE ID_Conta = 999)
         RAISERROR('Conta de destino não encontrada', 16, 1)

      UPDATE Conta SET Saldo = Saldo + 150 WHERE ID_Conta = 999

   COMMIT
END TRY
BEGIN CATCH
   IF @@TRANCOUNT > 0
      ROLLBACK

   PRINT 'Erro ao transferir: ' + ERROR_MESSAGE()
END CATCH

SELECT * FROM Conta -- saldo da conta 1 não foi debitado (rollback completo)
