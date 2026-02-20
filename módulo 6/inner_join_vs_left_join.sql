-- =========================================================
-- 📘 [SQL Server] INNER JOIN vs LEFT JOIN
-- Banco de Dados: modulo6
-- Módulo 6 — JOINs Avançados 🔗
-- =========================================================
-- Objetivo🎯:
-- Entender:
-- ✔ Diferença conceitual entre INNER JOIN e LEFT JOIN
-- ✔ Quando utilizar cada um
-- ✔ Impacto nos resultados
-- ✔ Como decidir corretamente
-- =========================================================

login mysql (or your database);
show databases;
use modulo6;
show tables;

-- =========================================================
-- 🧠 1) O QUE É INNER JOIN?
-- =========================================================
-- Definição:
-- Retorna APENAS os registros que possuem
-- correspondência nas duas tabelas.
--
-- Conceito:
-- Interseção entre conjuntos.
--
-- Comportamento:
-- • Se não houver correspondência → o registro é descartado.
-- • Só aparecem dados "casados".
--
-- Quando usar:
-- ✅ Quando você precisa apenas de dados válidos nas duas tabelas;
-- ✅ Quando registros sem correspondência não são relevantes; e
-- ✅ Quando a integridade do relacionamento é obrigatória.
--
-- Pergunta que ele responde:
-- "Quais registros possuem correspondência?"


-- =========================================================
-- 🧠 2) O QUE É LEFT JOIN?
-- =========================================================
-- Definição:
-- Retorna TODOS os registros da tabela da ESQUERDA
-- e apenas os correspondentes da tabela da DIREITA.
--
-- Conceito:
-- Preserva a tabela principal.
--
-- Comportamento:
-- • Se não houver correspondência → retorna NULL na tabela da direita.
-- • Nunca perde registros da tabela esquerda.
--
-- Quando usar:
-- ✅ Quando a tabela esquerda é a principal da análise;
-- ✅ Quando você quer identificar ausências; e
-- ✅ Quando deseja manter 100% dos dados principais.
--
-- Pergunta que ele responde:
-- "Todos os registros principais possuem correspondência?"


-- =========================================================
-- 🧠 3) PRINCIPAL DIFERENÇA
-- =========================================================
--
-- INNER JOIN:
-- • Retorna apenas correspondências;
-- • Pode reduzir o número de linhas;
-- • Exclui registros sem match.
--
-- LEFT JOIN:
-- • Mantém todos os registros da esquerda;
-- • Pode aumentar o número de linhas;
-- • Permite identificar dados faltantes.


-- =========================================================
-- 🧠 4) IMPACTO EM ANÁLISES
-- =========================================================
--
-- INNER JOIN pode:
-- • Omitir dados importantes sem você perceber;
-- • Reduzir base de análise.
--
-- LEFT JOIN permite:
-- • Auditoria de inconsistências;
-- • Identificação de dados órfãos;
-- • Análise mais completa.


-- =========================================================
-- 🧠 5) COMO DECIDIR QUAL USAR?
-- =========================================================
--
-- Pergunte-se:
--
-- 1) Quero apenas registros que possuem correspondência?
-- → Use INNER JOIN
--
-- 2) Quero todos os registros da tabela principal?
-- → Use LEFT JOIN
--
-- 3) Quero identificar registros sem correspondência?
-- → Use LEFT JOIN + filtro IS NULL
--
-- 4) Estou analisando métricas obrigatórias?
-- → INNER JOIN pode ser suficiente
--
-- 5) Estou auditando dados?
-- → Prefira LEFT JOIN


-- =========================================================
-- 🧠 6) ERRO COMUM❌
-- =========================================================
-- Usar INNER JOIN automaticamente
-- sem avaliar se pode perder dados.
--
-- Em ambientes de BI:
-- LEFT JOIN é frequentemente mais seguro
-- pois preserva a base principal.


-- =========================================================
-- 🎓 RESUMO FINAL:
-- =========================================================
-- INNER JOIN → Apenas interseção
-- LEFT JOIN  → Preserva tabela esquerda
-- INNER      → Pode perder registros
-- LEFT       → Mantém todos da esquerda
-- INNER      → Análise restritiva
-- LEFT       → Análise completa
--
-- Regra prática🖊️:
-- Se a tabela é principal → LEFT JOIN
-- Se só quer correspondências/demonstrativa → INNER JOIN
-- =========================================================