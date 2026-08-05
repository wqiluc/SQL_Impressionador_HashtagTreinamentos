-- ============================================================
-- 🗄️  SQL Server  |  📦 Módulo 21 — Procedures
-- 📖 Aula 8 de 15  |  Criando uma Procedure mais Complexa para Cadastro de Contratos - Solução
-- ============================================================

/*
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📚 CONCEITO — Implementação completa da sp_CadastrarContrato
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  Uma Procedure pode combinar tudo que já vimos até aqui:
  parâmetros, variáveis locais, IF/ELSE, TRANSACTION e TRY/CATCH -
  tudo em um único objeto reutilizável.
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
*/

USE BD_Procedures

-- ────────────────────────────────────────────────────────────
-- 🏋️ Exemplo prático
-- ────────────────────────────────────────────────────────────

CREATE PROCEDURE sp_CadastrarContrato
   @NomeCliente   VARCHAR(100),
   @CPFCliente    CHAR(11),
   @ID_Gerente    INT,
   @ValorContrato DECIMAL(10,2)
AS
BEGIN
   DECLARE @ID_Cliente INT

   BEGIN TRY
      BEGIN TRAN

         -- Valida se o gerente informado existe
         IF NOT EXISTS (SELECT 1 FROM dGerente WHERE ID_Gerente = @ID_Gerente)
         BEGIN
            RAISERROR('Gerente informado não existe', 16, 1)
         END

         -- Reaproveita o cliente se o CPF já existir, senão cria um novo
         SELECT @ID_Cliente = ID_Cliente
         FROM dCliente
         WHERE CPF = @CPFCliente

         IF @ID_Cliente IS NULL
         BEGIN
            INSERT INTO dCliente(Nome, CPF)
            VALUES (@NomeCliente, @CPFCliente)

            SET @ID_Cliente = SCOPE_IDENTITY()
         END

         -- Insere o contrato relacionando cliente e gerente
         INSERT INTO fContratos(ID_Cliente, ID_Gerente, ValorContrato)
         VALUES (@ID_Cliente, @ID_Gerente, @ValorContrato)

      COMMIT
      PRINT 'Contrato cadastrado com sucesso'
   END TRY
   BEGIN CATCH
      IF @@TRANCOUNT > 0
         ROLLBACK

      PRINT 'Erro ao cadastrar contrato: ' + ERROR_MESSAGE()
   END CATCH
END

-- 1️⃣  Cliente novo -> cria o cliente e já cadastra o contrato
EXEC sp_CadastrarContrato
   @NomeCliente = 'Helena Rocha',
   @CPFCliente = '44455566677',
   @ID_Gerente = 1,
   @ValorContrato = 9200.00

-- 2️⃣  Cliente já existente (mesmo CPF) -> reaproveita o cliente
EXEC sp_CadastrarContrato
   @NomeCliente = 'Helena Rocha',
   @CPFCliente = '44455566677',
   @ID_Gerente = 2,
   @ValorContrato = 3000.00

-- 3️⃣  Gerente inexistente -> operação é cancelada, nada é gravado
EXEC sp_CadastrarContrato
   @NomeCliente = 'Cliente Teste',
   @CPFCliente = '99988877766',
   @ID_Gerente = 999,
   @ValorContrato = 1000.00

SELECT * FROM dCliente
SELECT * FROM fContratos
