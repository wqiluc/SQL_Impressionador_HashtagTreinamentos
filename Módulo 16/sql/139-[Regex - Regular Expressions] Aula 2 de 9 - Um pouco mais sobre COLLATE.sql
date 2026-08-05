-- ============================================================
-- 🗄️  SQL Server  |  📦 Módulo 16 — Regex - Regular Expressions
-- 📖 Aula 2 de 9  |  Um pouco mais sobre COLLATE
-- ============================================================

/*
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📚 CONCEITO — COLLATE a nível de Banco de Dados e de Tabela/Coluna
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  2. A nível de Banco de Dados
  Por padrão, todos os bancos de dados vão herdar a configuração
  do COLLATION do SQL Server feito durante a instalação. Em
  Propriedades, conseguimos visualizar o COLLATION configurado.

  Nós podemos também especificar o COLLATION do Banco de Dados no
  momento da sua criação, ou alterá-lo depois de já criado.

  3. A nível de Coluna/Tabela
  Por padrão, uma nova coluna do tipo VARCHAR herda o COLLATION do
  banco de dados, a menos que você especifique o COLLATION
  explicitamente ao criar a tabela. Para criar uma coluna com um
  COLLATION diferente, basta especificar o agrupamento usando a
  cláusula COLLATE na definição da coluna.
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
*/

-- ────────────────────────────────────────────────────────────
-- 🏋️ Exemplo prático
-- ────────────────────────────────────────────────────────────

-- 1️⃣  Criando um Banco de Dados especificando o COLLATION
CREATE DATABASE BD_Collation
COLLATE Latin1_General_CS_AS

-- 2️⃣  Alterando o COLLATE de um Banco de Dados já existente
ALTER DATABASE BD_Collation COLLATE Latin1_General_CI_AS

-- 3️⃣  Consultando o COLLATION configurado de um Banco de Dados específico
SELECT DATABASEPROPERTYEX('BD_Collation','collation')

-- 4️⃣  Criando uma tabela com o COLLATION de uma coluna especificado
CREATE TABLE Nomes(
   ID INT,
   Nome1 VARCHAR(100),
   Nome2 VARCHAR(100) COLLATE Latin1_General_CS_AS
)

-- 5️⃣  Consultando o COLLATION de cada coluna da tabela
sp_help Nomes
