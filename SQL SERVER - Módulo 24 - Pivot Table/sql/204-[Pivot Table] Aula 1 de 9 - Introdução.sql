-- ============================================================
-- 🗄️  SQL Server  |  📦 Módulo 24 — Pivot Table
-- 📖 Aula 1 de 9  |  Introdução
-- ============================================================

/*
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📚 CONCEITO — O problema que a Pivot Table resolve
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  Um GROUP BY tradicional devolve os resultados "empilhados" -
  uma linha por combinação de grupo. Muitas vezes, para leitura
  (ou para exportar para Excel), é mais fácil enxergar os dados
  "deitados": uma linha por Loja, e uma COLUNA para cada
  Trimestre, por exemplo.

  Esse é o papel do PIVOT: transformar VALORES DE UMA COLUNA em
  NOVAS COLUNAS, aplicando uma função de agregação nos valores.

  Neste módulo vamos ver:
  1. O que são Pivot Tables
  2. Criando uma Pivot Table
  3. Adicionando grupos de linha
  4. Ordenando linhas e colunas
  5. As limitações de uma Pivot Table
  6. Corrigindo a limitação de forma dinâmica
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
*/

-- ────────────────────────────────────────────────────────────
-- 🏋️ Exemplo prático
-- ────────────────────────────────────────────────────────────

CREATE DATABASE BD_PivotTable
GO

USE BD_PivotTable
GO

CREATE TABLE Vendas(
   ID_Venda   INT IDENTITY(1,1) PRIMARY KEY,
   Loja       VARCHAR(50) NOT NULL,
   Regiao     VARCHAR(50) NOT NULL,
   Vendedor   VARCHAR(50) NOT NULL,
   Trimestre  VARCHAR(2) NOT NULL, -- Q1, Q2, Q3, Q4
   ValorVenda DECIMAL(10,2) NOT NULL
)

INSERT INTO Vendas(Loja, Regiao, Vendedor, Trimestre, ValorVenda)
VALUES
   ('Loja Centro', 'Sudeste', 'Marcus', 'Q1', 12000),
   ('Loja Centro', 'Sudeste', 'Marcus', 'Q2', 15500),
   ('Loja Centro', 'Sudeste', 'Bianca', 'Q3', 9800),
   ('Loja Centro', 'Sudeste', 'Bianca', 'Q4', 21000),
   ('Loja Norte',  'Norte',   'Rafael', 'Q1', 8000),
   ('Loja Norte',  'Norte',   'Rafael', 'Q2', 8700),
   ('Loja Norte',  'Norte',   'Helena', 'Q3', 10200),
   ('Loja Norte',  'Norte',   'Helena', 'Q4', 11500),
   ('Loja Sul',    'Sul',     'Otávio', 'Q1', 14300),
   ('Loja Sul',    'Sul',     'Otávio', 'Q2', 13900),
   ('Loja Sul',    'Sul',     'Carla',  'Q3', 16200),
   ('Loja Sul',    'Sul',     'Carla',  'Q4', 17800)

SELECT * FROM Vendas
