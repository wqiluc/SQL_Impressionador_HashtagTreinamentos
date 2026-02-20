-- =========================================================
-- 📘 [SQL Server] INTRODUÇÃO COMPLETA A JOINS
-- Banco de Dados: modulo6
-- Módulo 6 — Fundamentos de Relacionamentos 🔗
-- =========================================================
-- Objetivo🎯:
-- Apresentar os principais tipos de JOIN
-- que serão estudados neste módulo,
-- explicando:
-- ✅ Quando usar;
-- ✅ O que retorna;
-- ✅ Diferença entre eles.
-- =========================================================

login mysql;
show databases;
use modulo6;

-- =========================================================
-- 🧠 1) INNER JOIN
-- =========================================================
-- O que é?
-- Retorna apenas registros que possuem
-- correspondência em ambas as tabelas.
--
-- Conceito:
-- Representa a INTERSEÇÃO entre conjuntos.
--
-- Quando usar?
-- Quando você quer apenas dados que estejam
-- relacionados nas duas tabelas.
--
-- Exemplo conceitual:
-- Clientes que possuem pedidos.
-- Produtos que possuem categoria.
-- Funcionários que pertencem a um departamento.


-- =========================================================
-- 🧠 2) LEFT JOIN (LEFT OUTER JOIN)
-- =========================================================
-- O que é?
-- Retorna TODOS os registros da tabela da esquerda
-- e apenas os correspondentes da direita.
--
-- Se não houver correspondência,
-- os campos da direita retornam NULL.
--
-- Conceito:
-- Preserva a tabela da esquerda.
--
-- Quando usar?
-- Quando você quer manter todos os registros
-- principais, mesmo que não tenham relação.
--
-- Exemplo conceitual:
-- Todos os clientes, inclusive os que nunca compraram.
-- Todos os produtos, inclusive os sem categoria.


-- =========================================================
-- 🧠 3) RIGHT JOIN (RIGHT OUTER JOIN)
-- =========================================================
-- O que é?
-- Retorna TODOS os registros da tabela da direita
-- e apenas os correspondentes da esquerda.
--
-- Conceito:
-- Preserva a tabela da direita.
--
-- Observação:
-- É menos utilizado na prática.
-- Normalmente reescrevemos como LEFT JOIN
-- invertendo a ordem das tabelas.


-- =========================================================
-- 🧠 4) FULL JOIN (FULL OUTER JOIN)
-- =========================================================
-- O que é?
-- Retorna TODOS os registros das duas tabelas,
-- possuam correspondência ou não.
--
-- Conceito:
-- União completa dos conjuntos.
--
-- Quando usar?
-- Para encontrar correspondências e também
-- registros "órfãos" de ambos os lados.


-- =========================================================
-- 🧠 5) LEFT ANTI JOIN
-- =========================================================
-- O que é?
-- Retorna registros da esquerda que NÃO
-- possuem correspondência na direita.
--
-- Implementação comum:
-- LEFT JOIN + WHERE campo IS NULL
--
-- Conceito:
-- Diferença de conjuntos.
--
-- Quando usar?
-- Para encontrar registros não relacionados.
--
-- Exemplo conceitual:
-- Clientes que nunca fizeram pedido.
-- Produtos que não foram vendidos.


-- =========================================================
-- 🧠 6) RIGHT ANTI JOIN
-- =========================================================
-- O que é?
-- Retorna registros da direita que NÃO
-- possuem correspondência na esquerda.
--
-- Conceito:
-- Diferença de conjuntos invertida.


-- =========================================================
-- 🧠 7) FULL ANTI JOIN
-- =========================================================
-- O que é?
-- Retorna registros não correspondentes
-- de ambas as tabelas.
--
-- Conceito:
-- Elementos exclusivos de cada conjunto.


-- =========================================================
-- 🧠 8) CROSS JOIN
-- =========================================================
-- O que é?
-- Gera produto cartesiano.
--
-- Conceito:
-- Combina cada linha da tabela A
-- com TODAS as linhas da tabela B.
--
-- Atenção⚠:
-- Pode gerar grande volume de dados.
--
-- Quando usar?
-- Simulações.
-- Combinações.
-- Geração de cenários.


-- =========================================================
-- 🧠 9) MÚLTIPLOS JOINS
-- =========================================================
-- O que é?
-- Encadeamento de JOINs para navegar
-- em modelos relacionais.
--
-- Muito comum em:
-- Modelos estrela (Data Warehouse).
-- Relacionamentos hierárquicos.
--
-- Exemplo conceitual:
-- Produto → Subcategoria → Categoria.
-- Pedido → Cliente → Cidade → Estado.


-- =========================================================
-- 🧠 10) UNION
-- =========================================================
-- O que é?
-- Combina resultados de duas consultas.
--
-- Remove registros duplicados.
--
-- Regra:
-- Mesmo número de colunas.
-- Mesmos tipos de dados compatíveis.
--
-- Performance:
-- Mais lento que UNION ALL
-- porque elimina duplicados.


-- =========================================================
-- 🧠 11) UNION ALL
-- =========================================================
-- O que é?
-- Combina resultados mantendo duplicados.
--
-- Mais performático.
--
-- Quando usar?
-- Quando você NÃO precisa eliminar
-- registros repetidos.


-- =========================================================
-- 🎓 RESUMO FINAL:
-- =========================================================
-- INNER       → Interseção
-- LEFT        → Preserva esquerda
-- RIGHT       → Preserva direita
-- FULL        → Preserva ambas
-- LEFT ANTI   → Esquerda sem correspondência
-- RIGHT ANTI  → Direita sem correspondência
-- FULL ANTI   → Exclusivos de ambos
-- CROSS       → Produto cartesiano
-- UNION       → Combina removendo duplicados
-- UNION ALL   → Combina mantendo duplicados
-- =========================================================