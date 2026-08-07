-- ============================================================
-- 🐘 PostgreSQL  |  📦 Módulo 25 — Introdução
-- 📖 Aula 2 de 3  |  Instalação do PostgreSQL
-- ============================================================

/*
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📚 CONCEITO — Instalando o PostgreSQL + pgAdmin
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  1. Acesse https://www.postgresql.org/download/ e baixe o
     instalador correspondente ao seu sistema operacional
     (Windows, macOS ou Linux).

  2. Durante a instalação, o instalador (Windows: EDB / macOS:
     Postgres.app) já traz junto:
        - O servidor PostgreSQL (o banco em si);
        - O pgAdmin (interface gráfica p/ administrar o banco -
          equivalente ao SSMS do SQL Server);
        - O Stack Builder (ferramentas extras, opcional).

  3. Durante a instalação será pedido:
        - Uma SENHA para o superusuário "postgres";
        - A PORTA do servidor (padrão: 5432 - mantenha o padrão).

  4. Ao final, abra o pgAdmin, conecte no servidor local usando
     usuário "postgres" e a senha definida na instalação.

  5. Dentro do pgAdmin, crie um novo banco de dados vazio -
     ele será usado na próxima aula para criar as tabelas do
     Northwind.
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
*/

-- ────────────────────────────────────────────────────────────
-- 🏋️ Testando a instalação
-- ────────────────────────────────────────────────────────────

-- Depois de conectar no pgAdmin (ou em outro client), rode o
-- comando abaixo numa Query Tool para confirmar que o servidor
-- está no ar e ver a versão instalada:

SELECT version();