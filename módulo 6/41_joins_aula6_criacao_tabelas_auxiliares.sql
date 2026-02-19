-- =========================================================
-- 📘 [SQL Server] CRIAÇÃO DE TABELAS AUXILIARES
-- Aula 6 de 17 — Base para entender JOINs 🧱
-- =========================================================
-- Objetivo🎯:
-- Criar tabelas simples para demonstrar
-- visualmente os diferentes tipos de JOIN.
-- =========================================================

login mysql;
show databases;
use modulo6;
show tables;

DROP TABLE IF (EXISTS produtos);
DROP TABLE IF (EXISTS subcategoria);

CREATE TABLE produtos(
	id_produto INT,
	nome_produto VARCHAR(30),
	id_subcategoria INT
);

INSERT INTO produtos VALUES
(1,'Fone Bluetooth JBL',5),
(2,'PS4',6),
(3,'Notebook Samsung i3',2),
(4,'iPhone 11',1),
(5,'Moto G9',1);

CREATE TABLE subcategoria(
	id_subcategoria INT,
	nome_subcategoria VARCHAR(30)
);

INSERT INTO subcategoria VALUES
(1,'Celular'),
(2,'Notebook'),
(3,'Câmera Digital'),
(4,'Televisão'),
(5,'Fone de Ouvido');