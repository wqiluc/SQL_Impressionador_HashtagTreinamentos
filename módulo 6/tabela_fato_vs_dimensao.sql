-- =========================================================
-- 📘 [SQL Server] TABELA FATO vs TABELA DIMENSÃO
-- Banco de Dados: modulo6
-- Módulo 6 — Modelagem Dimensional 📊
-- =========================================================
-- Objetivo🎯:
-- Entender:
-- ✅ O que é Tabela Fato;
-- ✅ O que é Tabela Dimensão;
-- ✅ Diferenças estruturais;
-- ✅ Como elas se relacionam; e
-- ✅ Quando usar cada uma.
-- =========================================================

login mysql;
show databases;
use modulo6;

-- =========================================================
-- 🧠 1) O QUE É UMA TABELA FATO?
-- =========================================================
-- Definição:
-- É a tabela central do modelo dimensional.
--
-- Ela armazena:
-- ✅ Métricas numéricas;
-- ✅ Indicadores quantitativos; e
-- ✅ Valores agregáveis.
--
-- Características:
-- • Grande volume de dados
-- • Cresce constantemente
-- • Contém chaves estrangeiras
-- • Representa eventos ou transações
--
-- Exemplos conceituais:
-- Vendas;
-- Pagamentos;
-- Movimentações;
-- Acessos;
-- Pedidos.
--
-- Estrutura típica:
-- id_tempo;
-- id_produto;
-- id_cliente;
-- quantidade;
-- valor_total.
--
-- Conceito central:
    -- A TABELA FATO responde:

-- "O que aconteceu?"
-- "Quanto?"
-- "Quantas vezes?"
-- "Qual foi o valor?"

-- =========================================================
-- 🧠 2) O QUE É UMA TABELA DIMENSÃO?
-- =========================================================
-- Definição:
-- São tabelas descritivas que contextualizam
-- os dados da tabela fato.
--
-- Elas armazenam:
-- ✅ Atributos qualitativos;
-- ✅ Informações descritivas; e
-- ✅ Classificações.
--
-- Características:
-- • Menor volume de dados;
-- • Estrutura mais estável;
-- • Possuem chave primária; e
-- • Não armazenam métricas.
--
-- Exemplos conceituais:

-- DimProduto;
-- DimCliente;
-- DimTempo;
-- DimCategoria;
-- DimLocalizacao.
--
-- Estrutura típica:

-- id_produto;
-- nome_produto;
-- marca;
-- categoria;
-- fornecedor.
--
-- Conceito central:
    -- A TABELA DIMENSÃO responde:

-- "Quem?"
-- "Onde?"
-- "Quando?"
-- "Qual?"
-- "Como?"


-- =========================================================
-- 🧠 3) RELACIONAMENTO ENTRE FATO E DIMENSÃO
-- =========================================================
-- A Tabela Fato contém:
-- ✅ Chaves estrangeiras
--
-- Essas chaves apontam para:
-- ✅ Chaves primárias das dimensões
--
-- Estrutura comum:
--
--          DimCliente
--               ↑
--          DimProduto
--               ↑
-- DimTempo ← FatoVendas → DimLoja
--               ↓
--           DimVendedor
--
-- Esse modelo é chamado de:
-- ⭐ MODELO ESTRELA (Star Schema)


-- =========================================================
-- 🧠 4) DIFERENÇAS PRINCIPAIS
-- =========================================================
--
-- TABELA FATO:
-- • Contém métricas;
-- • Alto volume;
-- • Crescimento contínuo;
-- • Dados quantitativos;
-- • Base para cálculos.
--
-- TABELA DIMENSÃO:
-- • Contém descrições;
-- • Volume reduzido;
-- • Crescimento controlado;
-- • Dados qualitativos;
-- • Base para filtros e agrupamentos.


-- =========================================================
-- 🧠 5) GRANULARIDADE
-- =========================================================
-- A granularidade define o nível de detalhe
-- da tabela fato.
--
-- Exemplos:
-- • Uma linha por venda;
-- • Uma linha por item vendido;
-- • Uma linha por dia.
--
-- Quanto maior a granularidade:
-- Maior o volume da tabela fato.


-- =========================================================
-- 🧠 6) IMPORTÂNCIA EM BI E DATA WAREHOUSE
-- =========================================================
-- O modelo Fato + Dimensão permite:

-- ✅ Consultas rápidas;
-- ✅ Agregações eficientes;
-- ✅ Análises multidimensionais;
-- ✅ Construção de dashboards; e
-- ✅ Criação de cubos analíticos.
--
-- É a base de:

-- Data Warehouse
-- Power BI
-- Tableau
-- SSAS
-- Ferramentas de Analytics


-- =========================================================
-- 🎓 RESUMO FINAL:
-- =========================================================
-- Tabela Fato      → Métricas e eventos;
-- Tabela Dimensão  → Contexto e descrição;
-- Fato             → Quantitativo;
-- Dimensão         → Qualitativo;
-- Fato             → Centro do modelo;
-- Dimensão         → Apoio analítico;
-- Modelo Estrela   → Estrutura clássica.
-- =========================================================