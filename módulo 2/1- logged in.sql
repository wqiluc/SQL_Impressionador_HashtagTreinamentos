CREATE DATABASE dados_pessoais;

USE dados_pessoais

CREATE TABLE pessoas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100),
    idade INT,
    genero VARCHAR(20),
);
INSERT INTO pessoas (nome, idade, genero) VALUES
('Lucas', 20, 'homem'),
('Maria', 25, 'mulher'),
('João', 30, 'homem',);

