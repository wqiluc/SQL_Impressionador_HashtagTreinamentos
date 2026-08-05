-- ============================================================
-- 🗄️  SQL Server  |  📦 Módulo 19 — Transactions
-- 📖 Aula 7 de 9  |  TRANCOUNT e Transações Aninhadas
-- ============================================================

/*
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📚 CONCEITO — @@TRANCOUNT e o comportamento de transações aninhadas
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  @@TRANCOUNT devolve quantas transações estão abertas na conexão
  atual, uma "empilhadas" dentro da outra.

  • Cada BEGIN TRAN         -> soma +1 no @@TRANCOUNT
  • Cada COMMIT              -> subtrai -1 (só efetiva de verdade
                                 quando @@TRANCOUNT chega a 0)
  • QUALQUER ROLLBACK         -> zera @@TRANCOUNT e desfaz TUDO,
                                 mesmo as transações "internas" que
                                 já tinham dado COMMIT

  Ou seja: um COMMIT interno NÃO efetiva nada sozinho enquanto
  ainda existir uma transação externa aberta - e um ROLLBACK,
  não importa em qual nível, sempre desfaz o bloco inteiro.
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
*/

USE BD_Transactions

-- ────────────────────────────────────────────────────────────
-- 🏋️ Exemplo prático
-- ────────────────────────────────────────────────────────────

SELECT @@TRANCOUNT AS Nivel -- 0: nenhuma transação aberta

-- 1️⃣  Empilhando transações
BEGIN TRAN -- externa
   SELECT @@TRANCOUNT AS Nivel -- 1

   BEGIN TRAN -- interna
      SELECT @@TRANCOUNT AS Nivel -- 2

      UPDATE Conta SET Saldo = Saldo - 10 WHERE ID_Conta = 1

   COMMIT -- "commit" da interna, mas @@TRANCOUNT só cai para 1
   SELECT @@TRANCOUNT AS Nivel -- 1 (ainda NÃO foi efetivado de verdade)

COMMIT -- agora sim @@TRANCOUNT chega a 0 e tudo é efetivado
SELECT @@TRANCOUNT AS Nivel -- 0

SELECT * FROM Conta

-- 2️⃣  Um ROLLBACK em qualquer nível desfaz TUDO, mesmo o que já
--     tinha recebido COMMIT internamente
BEGIN TRAN -- externa

   BEGIN TRAN -- interna
      UPDATE Conta SET Saldo = Saldo - 10 WHERE ID_Conta = 1
   COMMIT -- "commit" da interna (não efetiva de verdade ainda)

   UPDATE Conta SET Saldo = Saldo + 999999 WHERE ID_Conta = 2 -- erro de negócio

   ROLLBACK -- desfaz TUDO, inclusive o débito de 10 já "commitado" na interna

SELECT @@TRANCOUNT AS Nivel -- 0
SELECT * FROM Conta -- nenhuma das duas mudanças foi aplicada
