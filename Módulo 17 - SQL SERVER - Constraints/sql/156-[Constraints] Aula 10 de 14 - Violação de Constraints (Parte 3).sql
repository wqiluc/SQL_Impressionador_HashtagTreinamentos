-- ============================================================
-- 🗄️  SQL Server  |  📦 Módulo 17 — Constraints
-- 📖 Aula 10 de 14  |  Violação de Constraints (Parte 3)
-- ============================================================

/*
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📚 CONCEITO — Violações de FOREIGN KEY (inserção e exclusão)
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  A FOREIGN KEY protege a integridade em DUAS direções:

  1. Na tabela "filha" (fContratos): não deixa inserir/atualizar um
     ID_Cliente ou ID_Gerente que não exista na tabela "pai".
  2. Na tabela "pai" (dCliente/dGerente): por padrão, não deixa
     excluir um registro que ainda esteja sendo referenciado por
     algum contrato em fContratos.
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
*/

USE BD_Constraints

-- ────────────────────────────────────────────────────────────
-- 🏋️ Exemplo prático
-- ────────────────────────────────────────────────────────────

-- 1️⃣  Inserindo um contrato com ID_Cliente inexistente
INSERT INTO fContratos(ID_Cliente, ID_Gerente, ValorContrato)
VALUES (500, 1, 1000.00)
-- Msg 547: The INSERT statement conflicted with the FOREIGN KEY
-- constraint 'FK_fContratos_dCliente'.

-- 2️⃣  Inserindo um contrato com ID_Gerente inexistente
INSERT INTO fContratos(ID_Cliente, ID_Gerente, ValorContrato)
VALUES (1, 500, 1000.00)
-- Msg 547: The INSERT statement conflicted with the FOREIGN KEY
-- constraint 'FK_fContratos_dGerente'.

-- 3️⃣  Tentando excluir um cliente que já possui contrato
DELETE FROM dCliente WHERE ID_Cliente = 1
-- Msg 547: The DELETE statement conflicted with the REFERENCE
-- constraint 'FK_fContratos_dCliente'.

-- 4️⃣  A FOREIGN KEY também bloqueia um UPDATE na tabela filha que
--     tente apontar para um gerente inexistente (não é só no INSERT)
UPDATE fContratos SET ID_Gerente = 999 WHERE ID_Contrato = 1
-- Msg 547: The UPDATE statement conflicted with the FOREIGN KEY
-- constraint 'FK_fContratos_dGerente'.

-- ✅ Excluir um cliente/gerente só é possível se não houver
--    nenhum contrato apontando para ele
DELETE FROM dCliente WHERE ID_Cliente = 3
-- Rafael Souza (ID 3) não tem contrato -> exclusão permitida
