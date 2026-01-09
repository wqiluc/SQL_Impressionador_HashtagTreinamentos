CREATE DATABASE IF NOT EXISTS info_pessoas;

USE info_pessoas;

CREATE TABLE IF NOT EXISTS pessoas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    idade INT,
    genero VARCHAR(20),
    salario DECIMAL(10,2),
    tem_filhos BOOLEAN,
    brasileiro BOOLEAN);

INSERT INTO pessoas (nome, idade, genero, salario, tem_filhos, brasileiro) VALUES
('Lucas', 20, 'homem', 2500.50, 0, 1),
('Maria', 25, 'mulher', 3200.00, 1, 1),
('João', 30, 'homem', 4000.75, 1, 0);


SELECT * FROM pessoas;
