-- ============================================================
-- 🗄️  SQL Server  |  📦 Módulo 17 — Constraints
-- 📖 Aula 7 de 14  |  O que muda ao criar Constraints...
-- ============================================================

/*
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📚 CONCEITO — Comparando o antes e o depois
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  Agora que dCliente, dGerente e fContratos têm constraints,
  repetir exatamente os mesmos INSERTs "problemáticos" da Aula 3
  não é mais possível: o SQL Server passa a bloquear a operação e
  devolve uma mensagem de erro explicando qual regra foi violada.
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
*/

USE BD_Constraints

-- ────────────────────────────────────────────────────────────
-- 🏋️ Exemplo prático
-- ────────────────────────────────────────────────────────────

-- 1️⃣  CPF duplicado -> antes era aceito, agora quebra a UNIQUE
INSERT INTO dCliente(Nome, CPF, Email)
VALUES ('Marcus Duplicado', '11122233344', 'outro@email.com')
-- Msg: Violation of UNIQUE KEY constraint 'UQ_dCliente_CPF'

-- 2️⃣  Nome em branco -> antes era aceito, agora quebra a NOT NULL
INSERT INTO dCliente(Nome, CPF, Email)
VALUES (NULL, '99988877766', 'semnome@email.com')
-- Msg: Cannot insert the value NULL into column 'Nome'

-- 3️⃣  Gerente sem nenhum dado -> antes era aceito, agora quebra
--     a NOT NULL de Nome e Email
INSERT INTO dGerente(Nome, Email)
VALUES (NULL, NULL)

-- 4️⃣  Contrato "órfão" -> antes era aceito, agora quebra a FOREIGN KEY
INSERT INTO fContratos(ID_Cliente, ID_Gerente, ValorContrato)
VALUES (999, 999, 500.00)
-- Msg: The INSERT statement conflicted with the FOREIGN KEY constraint

-- ✅ Um INSERT válido continua funcionando normalmente
INSERT INTO dCliente(Nome, CPF, Email)
VALUES ('Helena Rocha', '44455566677', 'helena@email.com')

SELECT * FROM dCliente
