-- ============================================================
-- 🗄️  SQL Server  |  📦 Módulo 15 — Window Functions
-- 📖 Aula 1 de 14  |  Introdução - Criação da tabela Lojas
-- ============================================================

/*
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
📚 CONCEITO — Window Functions
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━

  Window Functions são utilizadas para cálculos mais avançados de
  análises de dados. Possuem um uso semelhante ao GROUP BY, só que
  mais avançado e personalizável.

  A instrução OVER permite definir qual será a "janela" (conjunto
  de linhas) a ser considerado no cálculo. A instrução PARTITION BY
  divide o conjunto em "partições" nas quais as funções de janela
  são aplicadas.

  Problema de exemplo: rede de 10 lojas — como calcular o
  % vendido por cada loja? Para isso, primeiro criamos a tabela
  Lojas que será usada ao longo do módulo.
━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
*/

-- ────────────────────────────────────────────────────────────
-- 🏋️ Exemplo prático
-- ────────────────────────────────────────────────────────────

CREATE DATABASE WF
USE WF

CREATE TABLE Lojas(
   ID_Loja INT,
   Nome_Loja VARCHAR(100),
   Regiao VARCHAR(100),
   Qtd_Vendida FLOAT
)

INSERT INTO LOJAS(ID_Loja, Nome_Loja, Regiao, Qtd_Vendida)
VALUES
   (1, 'Botafogo Praia&Mar', 'Sudeste', 1800),
   (2, 'Lojas Vitoria', 'Sudeste', 800),
   (3, 'Empórioi Mineirinho', 'Sudeste', 2300),
   (4, 'Central Paulista', 'Sudeste', 1800),
   (5, 'Rio 90 graus', 'Sudeste', 700),
   (6, 'Casa Flor & Anópolis', 'Sul', 2100),
   (7, 'Pampas & Co', 'Sul', 990),
   (8, 'Paraná Papéis', 'Sul', 2800),
   (9, 'Amazonas Prime', 'Norte', 4200),
   (10, 'Pará Bens', 'Norte', 3200),
   (11, 'Tintas Rio Branco', 'Norte', 1500),
   (12, 'Nordestemido Hall', 'Nordeste', 1910),
   (13, 'Cachoerinha Loft', 'Nordeste', 2380)