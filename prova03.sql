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
	nome_atividade TEXT NOT NULL,
	data_entrega DATE NOT NULL,
	id_aluno INTEGER REFERENCES tbl_alunos(id_aluno)
);

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
	
