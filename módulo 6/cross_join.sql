-- =========================================================
-- 📘 [MySQL] CROSS JOIN
-- Banco de Dados: modulo6
-- Módulo 6 — JOINs Avançados 🔗
-- =========================================================
-- Objetivo🎯:
-- Entender:
-- ✅ O que é CROSS JOIN;
-- ✅ Como ele funciona;
-- ✅ Quando utilizar;
-- ✅ Riscos e cuidados
-- =========================================================


-- =========================================================
-- 🔐 ACESSO AO MYSQL
-- =========================================================
login mysql (or your database)
show databases;
use modulo6;
show tables;
-- =========================================================

-- =========================================================
-- 🧠 1) O QUE É CROSS JOIN?
-- =========================================================
-- ✅ CROSS JOIN retorna o produto cartesiano entre duas tabelas
-- ✅ Cada linha da tabela A é combinada com TODAS as linhas da tabela B
-- ✅ Não utiliza cláusula ON
-- ✅ Não exige relacionamento entre as tabelas
--
-- Fórmula:
-- Total de linhas = Linhas_A × Linhas_B
-- =========================================================


-- =========================================================
-- 🧠 2) COMO ELE FUNCIONA?
-- =========================================================
-- ✅ Para cada registro da primeira tabela
--    o banco replica todas as linhas da segunda
--
-- Exemplo conceitual:
--
-- Tabela A → 3 linhas
-- Tabela B → 4 linhas
--
-- Resultado:
-- 3 × 4 = 12 linhas
--
-- ✅ É uma multiplicação de conjuntos
-- =========================================================


-- =========================================================
-- 🧠 3) QUANDO UTILIZAR?
-- =========================================================
-- ✅ Criar combinações possíveis
-- ✅ Gerar cenários
-- ✅ Criar simulações
-- ✅ Montar grade de testes
-- ✅ Combinar dimensões
--
-- Muito usado em:
-- • Modelagem analítica
-- • Simulação de dados
-- • Construção de calendários
-- • Matrizes de possibilidades
-- =========================================================


-- =========================================================
-- 🧠 4) DIFERENÇA PARA OUTROS JOINS
-- =========================================================
-- INNER JOIN:
-- ✅ Precisa de correspondência
-- ✅ Usa condição ON
--
-- LEFT JOIN:
-- ✅ Preserva tabela da esquerda
-- ✅ Pode gerar valores NULL
--
-- CROSS JOIN:
-- ✅ Não usa ON
-- ✅ Não precisa correspondência
-- ✅ Gera todas as combinações possíveis
-- =========================================================


-- =========================================================
-- 🧠 5) RISCO PRINCIPAL
-- =========================================================
-- 🚨 Explosão de dados
--
-- Se tabelas forem grandes:
-- 1.000 linhas × 10.000 linhas
-- = 10.000.000 linhas
--
-- Pode causar:
-- • Lentidão
-- • Alto consumo de memória
-- • Travamento da consulta
--
-- ✅ Deve ser usado com consciência
-- =========================================================


-- =========================================================
-- 🧠 6) EM DATA WAREHOUSE:
-- =========================================================
-- ✅ Pode ser usado para:
-- • Criar todas combinações de tempo x produto;
-- • Gerar calendário expandido;
-- • Criar matriz de planejamento.
--
-- ❌ Não é comum em análises operacionais.
-- =========================================================


-- =========================================================
-- 🎓 RESUMO FINAL:
-- =========================================================
-- ✅ CROSS JOIN → Produto cartesiano
-- ✅ Não usa ON
-- ✅ Multiplica linhas
-- ✅ Gera todas combinações possíveis
-- ✅ Pode causar explosão de dados
-- ✅ Use com cautela
-- =========================================================