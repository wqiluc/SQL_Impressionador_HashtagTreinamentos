-- ============================================================
-- 🗄️  SQL Server  |  📦 Módulo 17 — Constraints
-- 📖 Aula 3 de 14  |  O que temos sem Constraints...
-- ============================================================

/*
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📚 CONCEITO — Os problemas de uma tabela sem Constraints
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  Sem constraints, o SQL Server aceita praticamente qualquer coisa
  que "caiba" no tipo de dado da coluna. Isso abre espaço para:

  • Linhas duplicadas (nenhum identificador único)
  • Colunas obrigatórias ficando em branco (NULL)
  • Valores fora do domínio esperado (idade negativa, e-mail repetido)
  • Registros "órfãos" - uma fContratos apontando para um cliente
    ou gerente que nem existe em dCliente/dGerente

  As tabelas abaixo (dCliente, dGerente e fContratos) serão criadas
  de propósito SEM nenhuma constraint, para evidenciar esses
  problemas. Nas próximas aulas elas serão recriadas COM as
  constraints adequadas.
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
*/

USE BD_Constraints

-- ────────────────────────────────────────────────────────────
-- 🏋️ Exemplo prático
-- ────────────────────────────────────────────────────────────

CREATE TABLE dCliente(
   ID_Cliente INT,
   Nome VARCHAR(100),
   CPF CHAR(11),
   Email VARCHAR(100)
)

CREATE TABLE dGerente(
   ID_Gerente INT,
   Nome VARCHAR(100),
   Email VARCHAR(100),
   Regional VARCHAR(50)
)

CREATE TABLE fContratos(
   ID_Contrato INT,
   ID_Cliente INT,
   ID_Gerente INT,
   ValorContrato DECIMAL(10,2),
   DataContrato DATE,
   Status VARCHAR(20)
)

-- 1️⃣  ID duplicado + CPF duplicado (nada impede)
INSERT INTO dCliente VALUES
   (1, 'Marcus Andrade', '11122233344', 'marcus@email.com'),
   (1, 'Marcus Andrade', '11122233344', 'marcus@email.com')

-- 2️⃣  Nome (obrigatório na regra de negócio) ficando em branco
INSERT INTO dCliente VALUES
   (2, NULL, '55566677788', 'cliente2@email.com')

-- 3️⃣  Gerente sem nenhum dado obrigatório preenchido
INSERT INTO dGerente VALUES
   (NULL, NULL, NULL, NULL)

-- 4️⃣  Contrato "órfão": aponta para um ID_Cliente e ID_Gerente
--     que não existem em nenhuma das duas tabelas
INSERT INTO fContratos VALUES
   (1, 999, 999, -500.00, '2026-01-10', 'Inexistente')

-- Conferindo a bagunça
SELECT * FROM dCliente
SELECT * FROM dGerente
SELECT * FROM fContratos
