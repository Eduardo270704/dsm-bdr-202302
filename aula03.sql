create database bd_aula03;

\c bd_aula03

create table tbl_cliente (
	codigo_cliente integer primary key,
	Nome varchar not null,
	Cidade varchar,
	Endereco varchar
);

create table tbl_titulo (
	codigo_titulo integer primary key,
	titulo varchar Not null,
	descricao varchar,
	categoria text
);

create table tbl_emprestimo (
	numero_cliente integer primary key,
	codigo_cliente integer,
	codigo_livro integer
);

create table tbl_livros (
	cod_livro integer primary key,
	codigo_titulo integer,
	status text
);
