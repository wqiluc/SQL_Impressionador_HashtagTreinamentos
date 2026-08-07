-- ============================================================
-- 🗄️  SQL Server  |  📦 Módulo 22 — Triggers DML
-- 📖 Aula 6 de 8  |  Criando uma Trigger para Controle de Permissão de Cadastro - INSTEAD OF (Parte 1)
-- ============================================================

/*
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📚 CONCEITO — O cenário: cadastro de Funcionário só com autorização
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  Regra de negócio: um novo Funcionário só pode ser cadastrado se
  quem está inserindo informar um CÓDIGO DE AUTORIZAÇÃO válido do
  RH, junto com o INSERT. Sem o código certo, o cadastro deve ser
  BLOQUEADO por completo.

  Uma constraint comum (CHECK/FK) não resolve isso, porque o
  código de autorização não é um dado que deve ficar salvo junto
  do funcionário. Para isso, usamos uma trigger INSTEAD OF INSERT:
  ela intercepta a tentativa de INSERT e decide o que realmente
  acontece.

  Nesta primeira parte: montamos as tabelas do cenário e a
  ESTRUTURA da trigger, validando o código sem ainda persistir o
  cadastro (isso vem na Parte 2).
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
*/

USE BD_Triggers;

-- ────────────────────────────────────────────────────────────
-- 🏋️ Exemplo prático
-- ────────────────────────────────────────────────────────────

CREATE TABLE Funcionario
(
   ID_Funcionario     INT IDENTITY(1,1) PRIMARY KEY,
   Nome               VARCHAR(100) NOT NULL,
   Salario            DECIMAL(10,2) NOT NULL,
   CodigoAutorizacao  CHAR(6) NULL
)

CREATE TABLE CodigosAutorizacaoRH
(
   Codigo CHAR(6) PRIMARY KEY
)

INSERT INTO CodigosAutorizacaoRH(Codigo) VALUES ('RH2026')

-- Estrutura inicial da trigger: por enquanto só identifica se o
-- código informado é válido ou não (sem persistir nada ainda)
CREATE TRIGGER trg_Funcionario_ValidarAutorizacao
ON Funcionario
INSTEAD OF INSERT
AS
BEGIN
   IF EXISTS 
   (
      SELECT 1
      FROM inserted i
      JOIN CodigosAutorizacaoRH c ON c.Codigo = i.CodigoAutorizacao
   )
      PRINT 'Código válido✅ - cadastro seria realizado (implementado na Parte 2)'
   ELSE
      PRINT 'Código inválido❌ - cadastro seria bloqueado (implementado na Parte 2)'
END

-- Testando: como a trigger é INSTEAD OF e ainda não insere nada
-- de verdade, a tabela Funcionario continua vazia nos dois casos
INSERT INTO Funcionario(Nome, Salario, CodigoAutorizacao)
VALUES ('Rafael Souza', 4500.00, 'RH2026')

INSERT INTO Funcionario(Nome, Salario, CodigoAutorizacao)
VALUES ('Cliente Suspeito', 9000.00, 'XXXXXX')

SELECT * FROM Funcionario;
-- ainda vazia: a Parte 2 vai completar a lógica