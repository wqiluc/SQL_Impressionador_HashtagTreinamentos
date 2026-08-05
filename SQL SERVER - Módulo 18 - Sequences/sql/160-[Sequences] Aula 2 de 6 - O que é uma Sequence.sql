-- ============================================================
-- 🗄️  SQL Server  |  📦 Módulo 18 — Sequences
-- 📖 Aula 2 de 6  |  O que é uma Sequence
-- ============================================================

/*
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📚 CONCEITO — Sequence vs IDENTITY
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  | Característica              | IDENTITY            | SEQUENCE                 |
  |------------------------------|----------------------|--------------------------|
  | Onde vive                    | Dentro de uma coluna | Objeto independente do banco |
  | Compartilhável entre tabelas | Não                  | Sim                      |
  | Pode "pular" o próximo valor sem inserir | Difícil    | Sim (NEXT VALUE FOR)    |
  | Permite reiniciar/configurar depois | Limitado       | ALTER SEQUENCE completo |
  | Suporta ciclo (voltar ao início) | Não               | Sim (CYCLE)              |

  As principais opções na criação de uma SEQUENCE são:

  • START WITH   -> valor inicial da sequência
  • INCREMENT BY -> quanto cada NEXT VALUE FOR soma (pode ser negativo)
  • MINVALUE / MAXVALUE -> limites da sequência
  • CYCLE / NO CYCLE    -> se, ao atingir o limite, volta ao início
  • CACHE / NO CACHE    -> quantos valores o SQL Server pré-gera em
                           memória, para ganho de performance
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
*/

USE BD_Sequences;

-- ────────────────────────────────────────────────────────────
-- 🏋️ Exemplo prático
-- ────────────────────────────────────────────────────────────

-- Consultando as sequences já criadas no banco
SELECT name, start_value, increment, minimum_value, maximum_value, is_cycling
FROM sys.sequences;

-- Consultando o valor atual (o ÚLTIMO valor já entregue por um
-- NEXT VALUE FOR - não o próximo a ser gerado) de uma sequence
SELECT 
  current_value
FROM 
  sys.sequences
WHERE 
name = 'Seq_Exemplo';