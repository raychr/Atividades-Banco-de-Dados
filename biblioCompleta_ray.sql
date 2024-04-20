CREATE TABLE usuarios (
    cdusuario INT PRIMARY KEY,
    nmusuario VARCHAR(50),
    cpf CHAR(11) UNIQUE NOT NULL,
    endereco VARCHAR(50),
    telefone VARCHAR(50) 
);

CREATE TABLE editoras (
    cdeditora INT PRIMARY KEY,
    nmeditora VARCHAR(50) NOT NULL,
    contato VARCHAR(50) NOT NULL,
    endereco VARCHAR(50) 
);

CREATE TABLE autores (
    cdautor INT PRIMARY KEY,
    nmautor VARCHAR(50) NOT NULL,
    funcao VARCHAR(50) NOT NULL,
    nacionalidade VARCHAR(50) NOT NULL
);

CREATE TABLE livros (
    cdlivro INT PRIMARY KEY,
    nmlivro VARCHAR(50) NOT NULL,
    edicao INT NOT NULL,
    genero VARCHAR(50) NOT NULL,
    ano_publicacao INT NOT NULL,
    preco MONEY NOT NULL,
    cdautor INT NOT NULL,
    cdeditora INT NOT NULL,
    FOREIGN KEY (cdautor) REFERENCES autores(cdautor),
    FOREIGN KEY (cdeditora) REFERENCES editoras(cdeditora)
);

CREATE TABLE funcionarios (
    cdfuncionario INT PRIMARY KEY,
    nmfuncionario VARCHAR(50) NOT NULL,
    telefone VARCHAR(50) NOT NULL,
    dtnascimento DATE NOT NULL,
    salario MONEY NOT NULL,
    cdeditora INT NOT NULL,
    FOREIGN KEY (cdeditora) REFERENCES editoras(cdeditora)
);

INSERT INTO autores (cdautor, nmautor, funcao, nacionalidade)
VALUES (1, 'F. Scott', 'Author', 'American'),
       (2, 'Lee', 'Author', 'Brazilian'),
       (3, 'George', 'Author', 'British'),
       (4, 'Matheus', 'Author', 'British'),
       (5, 'Gabriel', 'Author', 'American');

INSERT INTO usuarios (cdusuario, nmusuario, cpf, endereco, telefone)
VALUES (1, 'Carol', '12345678901','123 Ex rua', '(12) 12345-6789'),
       (2, 'Amanda', '09876543210', '234 Ex rua', '(55) 23456-7890'),
       (3, 'Duda', '11122233344', '345 Ex rua', '(12) 34567-8901'),
       (4, 'Jake', '44455566677', '456 Ex rua', '(55) 45678-9012'),
       (5, 'Black', '77788899900', '567 Ex rua', '(55) 56789-0123');

INSERT INTO editoras (cdeditora, nmeditora, contato, endereco)
VALUES (1, 'Galera', '(12) 12345-6789', '789 Ex rua'),
       (2, 'TAG', '(55) 23456-7890', '890 Ex rua'),
       (3, 'Darkside', '(12) 34567-8901', '901 Ex rua');

INSERT INTO funcionarios (cdfuncionario, nmfuncionario, telefone, dtnascimento, salario, cdeditora)
VALUES (1, 'Mary', '(12) 45678-9012', '1980-01-01', 5000.00, 1),
       (2, 'James', '(12) 56789-0123', '1990-01-01', 6000.00, 2),
       (3, 'Robert', '(12) 67890-1234', '1970-01-01', 7000.00, 3),
       (4, 'Michael', '(12) 78901-2345', '1960-01-01', 8000.00, 1),
       (5, 'Michelle ', '(12) 89012-3456', '1975-01-01', 9000.00, 2);
       
INSERT INTO livros (cdlivro, nmlivro, edicao, genero, ano_publicacao, preco, cdautor, cdeditora)
VALUES (1, 'Garota do Mar', 1, 'Fiction', 1925, 10.99, 1, 1),
       (2, 'Ultima Parada', 1, 'Fiction', 1960, 12.99, 2, 1),
       (3, '1984', 1, 'Fiction', 1949, 11.99, 3, 2),
       (4, 'Amor nao e obvio', 1, 'Fiction', 1932, 13.99, 4, 2),
       (5, 'O sol e para todos', 1, 'Fiction', 1951, 14.99, 5, 3);
       
--a
UPDATE editoras
SET contato = '(55) 55555-5555'
WHERE cdeditora = 1;

UPDATE usuarios
SET endereco = '987 Ex rua'
WHERE cdusuario = 1;

--b
UPDATE funcionarios
SET salario = salario * 1.1;

--c fazer
INSERT INTO usuarios (cdusuario, cpf)
VALUES (6, '22233344455'),
       (7, '55566677788');

--d
INSERT INTO livros (cdlivro, nmlivro, edicao, genero, ano_publicacao, preco, cdautor, cdeditora)
VALUES (6, 'Livro 6', 1, 'Fiction', 1000, 15.99, 1, 1),
       (7, 'Livro 7', 1, 'Fiction', 1000, 16.99, 2, 1),
       (20, 'Livro 20', 1, 'Fiction', 2000, 17.99, 3, 2);

--e
DELETE FROM livros
WHERE ano_publicacao = 1000;

--f
DELETE FROM livros
WHERE cdlivro = 2000;

--g
UPDATE funcionarios
SET telefone = '(12) 99999-9999', salario = 8000.00
WHERE cdfuncionario = 1;

--h
SELECT *
FROM editoras;

--i
SELECT cdeditora, nmeditora
FROM editoras
WHERE cdeditora < 5;

--j
SELECT a.nmautor, l.nmlivro
FROM autores a
JOIN livros l ON a.cdautor = l.cdautor;