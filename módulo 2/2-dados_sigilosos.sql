CREATE TABLE contatos (
    id INT PRIMARY KEY,
    nome VARCHAR(100),
    email VARCHAR(150),
    telefone VARCHAR(20),
    cidade VARCHAR(100),
    preferencia_idioma VARCHAR(50),
    horario_contato VARCHAR(50)
);

INSERT INTO contatos (id, nome, email, telefone, cidade, preferencia_idioma, horario_contato) VALUES
(1, 'Lucas', 'lucas@email.com', '(11) 99999-1111', 'São Paulo', 'Português', 'Manhã'),
(2, 'Maria', 'maria@email.com', '(21) 98888-2222', 'Rio de Janeiro', 'Português', 'Tarde'),
(3, 'João', 'joao@email.com', '(31) 97777-3333', 'Belo Horizonte', 'Inglês', 'Noite');
