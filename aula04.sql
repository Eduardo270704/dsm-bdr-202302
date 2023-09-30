CREATE DATABASE bd_aula04;

\ c bd_aula04 CREATE DOMAIN chk_categoria TEXT CHECK (
    VALUE = 'DRAMA'
    OR VALUE = 'COMEDIA'
);

CREATE DOMAIN chk_status TEXT CHECK (
    VALUE = 'DISPONIVEL'
    OR VALUE = 'ALUGADO'
);

CREATE TABLE tbl_cliente (
    codigo_cliente INTEGER PRIMARY KEY,
    nome TEXT NOT NULL,
    cidade TEXT,
    endereco TEXT
);

CREATE TABLE tbl_titulo (
    codigo_titulo INTEGER PRIMARY KEY,
    titulo TEXT NOT NULL,
    descricao TEXT,
    categoria chk_categoria
);

CREATE TABLE tbl_livros (
    cod_livro INTEGER PRIMARY KEY,
    codigo_titulo INTEGER REFERENCES tbl_titulo(codigo_titulo),
    STATUS chk_status DEFAULT 'DISPONIVEL'
);

CREATE TABLE tbl_emprestimo (
    numero_emprestimo INTEGER PRIMARY KEY,
    codigo_cliente INTEGER REFERENCES tbl_cliente(codigo_cliente),
    codigo_livro INTEGER REFERENCES tbl_livros(cod_livro)
);

INSERT INTO
    tbl_cliente (codigo_cliente, nome, cidade, endereco)
VALUES
    (1, 'João Silva', 'São Paulo', 'Rua A, 123'),
    (
        2,
        'Maria Santos',
        'Rio de Janeiro',
        'Av. B, 456'
    ),
    (
        3,
        'Pedro Almeida',
        'Belo Horizonte',
        'Rua C, 789'
    ),
    (4, 'Ana Oliveira', 'Salvador', 'Av. D, 1011'),
    (5, 'Carlos Lima', 'Brasília', 'Rua E, 1213');

INSERT INTO
    tbl_titulo (codigo_titulo, titulo, descricao, categoria)
VALUES
    (
        1,
        'Aventuras Urbanas',
        'Uma história emocionante',
        'DRAMA'
    ),
    (
        2,
        'Mistérios Antigos',
        'Enigmas por resolver',
        'COMEDIA'
    ),
    (
        3,
        'Amor nas Estrelas',
        'Um romance intergaláctico',
        'DRAMA'
    ),
    (
        4,
        'Código Enigmático',
        'Segredos ocultos',
        'COMEDIA'
    ),
    (
        5,
        'Histórias Perdidas',
        'Contos esquecidos',
        'DRAMA'
    );

INSERT INTO
    tbl_livros (cod_livro, codigo_titulo, status)
VALUES
    (1, 1, 'DISPONIVEL'),
    (2, 1, 'ALUGADO'),
    (3, 2, 'DISPONIVEL'),
    (4, 3, 'ALUGADO'),
    (5, 4, 'DISPONIVEL');

INSERT INTO
    tbl_emprestimo (numero_emprestimo, codigo_cliente, codigo_livro)
VALUES
    (1, 1, 2),
    (2, 2, 4),
    (3, 3, 1),
    (4, 4, 5),
    (5, 5, 3);

SELECT
    *
FROM
    tbl_cliente;

SELECT
    *
FROM
    tbl_cliente
WHERE
    cidade = 'São Paulo';

SELECT
    *
FROM
    tbl_cliente
WHERE
    codigo_cliente > 3;

SELECT
    *
FROM
    tbl_titulo;

CREATE TABLE tbl_cliente2 (codigo INTEGER);

INSERT INTO
    tbl_cliente2
SELECT
    codigo_cliente
FROM
    tbl_cliente;

UPDATE
    tbl_livros
SET
    status = 'DISPONIVEL'
WHERE
    status = 'ALUGADO';

DELETE FROM
    tbl_cliente2
WHERE
    codigo > 3;