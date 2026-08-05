-- ============================================================
-- 🗄️  SQL Server  |  📦 Módulo 17 — Constraints
-- 📖 Aula 6 de 14  |  Criando Constraints para a Tabela fContratos
-- ============================================================

/*
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📚 CONCEITO — Regras de negócio da tabela fContratos
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  • ID_Contrato   -> identifica cada contrato          -> IDENTITY + PRIMARY KEY
  • ID_Cliente    -> precisa existir em dCliente        -> FOREIGN KEY
  • ID_Gerente    -> precisa existir em dGerente         -> FOREIGN KEY
  • ValorContrato -> obrigatório e sempre positivo       -> NOT NULL + CHECK
  • DataContrato  -> se não informada, assume a data
                     do momento do INSERT                -> DEFAULT
  • Status        -> só pode ser um dos 3 status válidos,
                     e assume 'Ativo' quando não informado -> DEFAULT + CHECK

  Uma FOREIGN KEY faz a "ponte" entre a fContratos (tabela fato) e
  as tabelas de dimensão dCliente/dGerente: o SQL Server passa a
  impedir a inserção de um contrato com um cliente ou gerente que
  não exista.
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
*/

USE BD_Constraints

-- ────────────────────────────────────────────────────────────
-- 🏋️ Exemplo prático
-- ────────────────────────────────────────────────────────────

DROP TABLE fContratos

CREATE TABLE fContratos(
   ID_Contrato   INT IDENTITY(1,1) CONSTRAINT PK_fContratos PRIMARY KEY,
   ID_Cliente    INT NOT NULL CONSTRAINT FK_fContratos_dCliente REFERENCES dCliente(ID_Cliente),
   ID_Gerente    INT NOT NULL CONSTRAINT FK_fContratos_dGerente REFERENCES dGerente(ID_Gerente),
   ValorContrato DECIMAL(10,2) NOT NULL CONSTRAINT CK_fContratos_Valor CHECK (ValorContrato > 0),
   DataContrato  DATE NOT NULL CONSTRAINT DF_fContratos_Data DEFAULT GETDATE(),
   Status        VARCHAR(20) NOT NULL
                  CONSTRAINT DF_fContratos_Status DEFAULT 'Ativo'
                  CONSTRAINT CK_fContratos_Status CHECK (Status IN ('Ativo', 'Cancelado', 'Concluído'))
)

-- Conferindo as constraints criadas na tabela
sp_helpconstraint 'fContratos'

-- Inserindo contratos válidos, referenciando clientes/gerentes existentes
INSERT INTO fContratos(ID_Cliente, ID_Gerente, ValorContrato)
VALUES
   (1, 1, 15000.00),
   (2, 2, 8500.50)

SELECT * FROM fContratos
