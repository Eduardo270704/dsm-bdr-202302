--CRIANDO TABELAS
CREATE TABLE tbl_cursos (
    id_curso SERIAL PRIMARY KEY,
    nome_curso TEXT NOT NULL,
    instrutor TEXT NOT NULL
);

CREATE TABLE tbl_alunos (
    id_aluno SERIAL PRIMARY KEY,
    primeiro_nome TEXT NOT NULL,
    sobrenome TEXT NOT NULL,
    idade INTEGER NOT NULL
);

CREATE TABLE tbl_alunos_cursos (
    id_aluno INTEGER REFERENCES tbl_alunos(id_aluno),
    id_curso INTEGER REFERENCES tbl_cursos(id_curso)
);

CREATE TABLE tbl_atividades (
    id_atividade SERIAL PRIMARY KEY,
    nome_atividade TEXT,
    data_entrega DATE,
    id_aluno INTEGER REFERENCES tbl_alunos(id_aluno)
);

--POPULANDO TABELAS
INSERT INTO
    tbl_cursos (nome_curso, instrutor)
VALUES
    ('Matematica', 'Dr. Johnson'),
    ('Ciencia da Computacao', 'Prof. Silva'),
    ('Historia', 'Dr. Davis'),
    ('Fisica', 'Prof. Miller'),
    ('Ingles', 'Dr. Wilson');

INSERT INTO
    tbl_alunos (primeiro_nome, sobrenome, idade)
VALUES
    ('Alice', 'Silva', 20),
    ('Bob', 'Johnson', 22),
    ('Charlie', 'Brown', 21),
    ('David', 'Miller', 23),
    ('Eva', 'Davis', 22);

INSERT INTO
    tbl_alunos_cursos (id_aluno, id_curso)
VALUES
    (1, 1),
    (2, 2),
    (3, 3),
    (4, 4),
    (5, 5);

INSERT INTO
    tbl_atividades (nome_atividade, data_entrega, id_aluno)
VALUES
    ('Atividade 1', '2023-12-01', 1),
    ('Atividade 2', '2023-12-15', 2),
    ('Atividade 3', '2023-12-10', 3),
    ('Atividade 4', '2023-12-05', 4),
    ('Atividade 5', '2023-11-30', 5);

--QUESTÃO 1:
--A
SELECT
    *
FROM
    tbl_alunos;

--B
SELECT
    *
FROM
    tbl_cursos;

--C
SELECT
    *
FROM
    tbl_alunos_cursos;

--D
SELECT
    *
FROM
    tbl_atividades;

--QUESTÃO 2
CREATE VIEW v_alunos_ciencia_computacao(Primeiro_Nome, Sobrenome) AS
SELECT
    ta.primeiro_nome,
    ta.sobrenome
FROM
    tbl_alunos AS ta
    INNER JOIN tbl_alunos_cursos AS tac ON tac.id_aluno = ta.id_aluno
    INNER JOIN tbl_cursos AS tc ON tc.id_curso = tac.id_curso
WHERE
    tc.id_curso = 2;

--A
SELECT
    *
FROM
    v_alunos_ciencia_computacao;

--B
SELECT
    Primeiro_Nome
FROM
    v_alunos_ciencia_computacao;

--C
-- Bob Johnson, o único aluno de ciencia da computacao
;

--D
SELECT
    sobrenome
FROM
    v_alunos_ciencia_computacao;

CREATE PROCEDURE sp_atribuir_atividade_aluno(id_atividade INTEGER, id_aluno INTEGER) LANGUAGE plgsql AS $$ BEGIN
INSERT INTO
    tbl_atividade(id_atividade, id_aluno)
VALUES
    (id_atividade, id_aluno) COMMIT;

END $$;

--3(Não sei fazer)

--4
CREATE FUNCTION fc_obter_contagem_alunos() RETURNS INTEGER LANGUAGE plpgsql AS $$ DECLARE Quantidade_Alunos INTEGER;

BEGIN
SELECT
    COUNT(ta.id_aluno) INTO Quantidade_Alunos
FROM
    tbl_alunos AS ta;

RETURN Quantidade_Alunos;

END $$;

--A
SELECT
    *
FROM
    fc_obter_contagem_alunos();

--B
--Retorna 5, a quantidade de alunos na tabela
;

--C
CREATE FUNCTION fc_obter_contagem_alunos() RETURNS INTEGER LANGUAGE plpgsql AS $$ DECLARE Quantidade_Alunos INTEGER;

BEGIN
SELECT
    COUNT(ta.id_aluno) INTO Quantidade_Alunos
FROM
    tbl_alunos AS ta;

RETURN Quantidade_Alunos;

END $$;

--5 (Ainda não sei fazer)