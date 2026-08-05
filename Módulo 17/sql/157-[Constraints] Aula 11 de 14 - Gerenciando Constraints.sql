-- ============================================================
-- 🗄️  SQL Server  |  📦 Módulo 17 — Constraints
-- 📖 Aula 11 de 14  |  Gerenciando Constraints
-- ============================================================

/*
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📚 CONCEITO — Adicionando, removendo e desabilitando Constraints
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  Constraints não precisam ser definidas apenas no CREATE TABLE.
  É possível gerenciá-las depois, em uma tabela já existente, com
  ALTER TABLE:

  • ALTER TABLE ... ADD CONSTRAINT   -> adiciona uma nova constraint
  • ALTER TABLE ... DROP CONSTRAINT  -> remove uma constraint existente
  • ALTER TABLE ... NOCHECK CONSTRAINT -> desabilita temporariamente
    (a constraint continua existindo, só para de ser validada)
  • ALTER TABLE ... WITH CHECK CHECK CONSTRAINT -> reabilita e já
    revalida os dados existentes
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
*/

USE BD_Constraints

-- ────────────────────────────────────────────────────────────
-- 🏋️ Exemplo prático
-- ────────────────────────────────────────────────────────────

-- 1️⃣  Adicionando uma nova constraint em uma coluna já existente
ALTER TABLE dGerente
ADD CONSTRAINT CK_dGerente_Email CHECK (Email LIKE '%@%')

-- 2️⃣  Consultando todas as constraints da tabela
sp_helpconstraint 'dGerente'

-- 3️⃣  Desabilitando temporariamente uma constraint (ex.: para uma
--     carga em massa de dados legados que ainda serão corrigidos)
ALTER TABLE fContratos
NOCHECK CONSTRAINT CK_fContratos_Valor

-- Enquanto está desabilitada, o INSERT abaixo passa mesmo violando a regra
INSERT INTO fContratos(ID_Cliente, ID_Gerente, ValorContrato)
VALUES (2, 2, -50.00)

-- 4️⃣  Tentando reabilitar já validando os dados existentes
--     Isso FALHA: a linha (2, 2, -50.00) inserida no passo anterior
--     viola a regra, e o WITH CHECK revalida tudo antes de reabilitar
ALTER TABLE fContratos
WITH CHECK CHECK CONSTRAINT CK_fContratos_Valor
-- Msg 547: The ALTER TABLE statement conflicted with the CHECK
-- constraint 'CK_fContratos_Valor'. A constraint continua desabilitada.

-- 5️⃣  Corrigindo o dado inválido antes de tentar novamente
UPDATE fContratos SET ValorContrato = 50.00 WHERE ValorContrato = -50.00

-- Agora sim a reabilitação com revalidação funciona
ALTER TABLE fContratos
WITH CHECK CHECK CONSTRAINT CK_fContratos_Valor
-- A partir daqui, novos INSERTs voltam a respeitar a regra

-- 6️⃣  Removendo uma constraint definitivamente
ALTER TABLE dGerente
DROP CONSTRAINT CK_dGerente_Email

-- Conferindo que a constraint não existe mais
sp_helpconstraint 'dGerente'
