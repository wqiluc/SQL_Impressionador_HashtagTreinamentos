-- =========================================================
-- 📘 [SQL Server] MODELAGEM DIMENSIONAL
-- Aula 3 de 17 — Por que não criar uma tabela única? 🏗️
-- =========================================================
-- Objetivo🎯:
-- Demonstrar a importância da separação; e
-- entre Fato e Dimensão no modelo estrela.
-- =========================================================

login basemysql;
show databases;
use modulo6;
show tables;

-- =========================================================
-- 🧠 ANÁLISE:
-- =========================================================

SELECT TOP(1000) 
    * 
FROM 
    FactSales;

SELECT 
    * 
FROM 
    DimProduct;

-- =========================================================
-- 💡 OBSERVAÇÃO IMPORTANTE:
-- =========================================================
-- Separar dados melhora:
-- ✅ Organização;
-- ✅ Performance;
-- ✅ Escalabilidade; e
-- ✅ Integridade.
-- =========================================================