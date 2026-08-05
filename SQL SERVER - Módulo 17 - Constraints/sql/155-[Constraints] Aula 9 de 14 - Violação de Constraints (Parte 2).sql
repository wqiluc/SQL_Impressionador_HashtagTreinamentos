-- ============================================================
-- 🗄️  SQL Server  |  📦 Módulo 17 — Constraints
-- 📖 Aula 9 de 14  |  Violação de Constraints (Parte 2)
-- ============================================================

/*
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📚 CONCEITO — Violações de CHECK e comportamento do DEFAULT
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  Agora o foco vai para a constraint CHECK, que valida uma condição
  lógica antes de aceitar o valor, e para reforçar que o DEFAULT só
  entra em ação quando a coluna é simplesmente OMITIDA do INSERT -
  se um valor inválido for informado explicitamente, o CHECK
  continua bloqueando normalmente.
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
*/

USE BD_Constraints

-- ────────────────────────────────────────────────────────────
-- 🏋️ Exemplo prático
-- ────────────────────────────────────────────────────────────

-- 1️⃣  CHECK: valor de contrato negativo
INSERT INTO fContratos(ID_Cliente, ID_Gerente, ValorContrato)
VALUES (1, 1, -200.00)
-- Msg 547: The INSERT statement conflicted with the CHECK constraint
-- 'CK_fContratos_Valor'.

-- 2️⃣  CHECK: valor de contrato igual a zero (a regra exige > 0)
INSERT INTO fContratos(ID_Cliente, ID_Gerente, ValorContrato)
VALUES (1, 1, 0)
-- Msg 547: The INSERT statement conflicted with the CHECK constraint
-- 'CK_fContratos_Valor'.

-- 3️⃣  CHECK: Status fora da lista permitida
INSERT INTO fContratos(ID_Cliente, ID_Gerente, ValorContrato, Status)
VALUES (1, 1, 1000.00, 'Pendente')
-- Msg 547: The INSERT statement conflicted with the CHECK constraint
-- 'CK_fContratos_Status'.

-- 4️⃣  DEFAULT em ação: omitindo DataContrato e Status,
--     o próprio SQL Server preenche os valores padrão
INSERT INTO fContratos(ID_Cliente, ID_Gerente, ValorContrato)
VALUES (2, 2, 3200.00)

SELECT * FROM fContratos WHERE ID_Cliente = 2
