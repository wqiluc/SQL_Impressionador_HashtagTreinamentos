-- ============================================================
-- 🗄️  SQL Server  |  📦 Módulo 18 — Sequences
-- 📖 Aula 3 de 6  |  Como criar uma Sequence
-- ============================================================

/*
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📚 CONCEITO — Sintaxe do CREATE SEQUENCE
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  CREATE SEQUENCE nome
     AS tipo_do_dado         -- opcional (padrão: BIGINT)
     START WITH valor_inicial
     INCREMENT BY incremento
     [MINVALUE valor | MAXVALUE valor]
     [CYCLE | NO CYCLE]
     [CACHE tamanho | NO CACHE]
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
*/

USE BD_Sequences

-- ────────────────────────────────────────────────────────────
-- 🏋️ Exemplo prático
-- ────────────────────────────────────────────────────────────

-- 1️⃣  Sequence simples: começa em 1, incrementa de 1 em 1
CREATE SEQUENCE Seq_Pedido
   START WITH 1
   INCREMENT BY 1

-- 2️⃣  Sequence com tipo de dado explícito e incremento maior
--     (útil, por exemplo, para gerar códigos "espaçados")
CREATE SEQUENCE Seq_CodigoProduto
   AS INT
   START WITH 1000
   INCREMENT BY 10

-- 3️⃣  Sequence decrescente, com limites e ciclo
--     (ao chegar no MINVALUE, volta para o MAXVALUE)
CREATE SEQUENCE Seq_Senha
   START WITH 100
   INCREMENT BY -1
   MINVALUE 1
   MAXVALUE 100
   CYCLE

-- Conferindo as sequences criadas
SELECT name, start_value, increment, minimum_value, maximum_value, is_cycling
FROM sys.sequences
