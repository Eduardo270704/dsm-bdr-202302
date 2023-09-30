\ c bd_aula09 create table tbl_fornecedor (
    cod_fornecedor serial primary key,
    nome text not null,
    status integer,
    cidade text
);

create table tbl_peca (
    cod_peca serial primary key,
    nome text not null,
    cor text,
    preco numeric,
    cidade text
);

create table tbl_estoque (
    cod_compra serial primary key,
    cod_fornecedor integer references tbl_fornecedor(cod_fornecedor),
    cod_peca integer references tbl_peca(cod_peca),
    quantidade integer
);

insert into
    tbl_fornecedor(nome, status, cidade)
values
    ('A', 30, 'LONDRES'),
    ('B', 20, 'PARIS'),
    ('C', 10, 'PARIS'),
    ('D', 10, 'LONDRES');

INSERT INTO
    tbl_peca(nome, cor, preco, cidade)
values
    ('PLACA', 'AZUL', 5, 'LONDRES'),
    ('MESA', 'VERMELHA', 10, 'PARIS'),
    ('CADERNO', 'PRETA', 14, 'ROMA'),
    ('TESOURA', 'VERMELHA', 12, 'LONDRES');

INSERT INTO
    tbl_estoque(cod_fornecedor, cod_peca, quantidade)
values
    (1, 1, 30),
    (2, 1, 30),
    (3, 2, 10),
    (3, 3, 50);

--1 Listar o nome e a cidade dos fornecedores com mais de 10 peças.Contar só as peças de código 1.
SELECT
    tf.nome,
    tf.cidade
FROM
    tbl_fornecedor AS tf
    INNER JOIN tbl_estoque AS te ON tf.cod_fornecedor = te.cod_fornecedor
    INNER JOIN tbl_peca AS tp ON te.cod_peca = tp.cod_peca
WHERE
    te.quantidade > 10
    AND tp.cod_peca = 1;

--2  Encontre o nome das peças com preço superior a 10 que estão disponíveis em estoque:
SELECT
    tp.nome
FROM
    tbl_peca AS tp
    INNER JOIN tbl_estoque AS te ON tp.cod_peca = te.cod_peca
WHERE
    tp.preco > 10;

--3 Selecione o nome das peças que não estão em estoque:
SELECT
    tp.nome
FROM
    tbl_peca AS tp
    LEFT JOIN tbl_estoque AS te ON tp.cod_peca = te.cod_peca
WHERE
    te.cod_peca IS NULL;

--4 Encontre o nome das peças que estão em estoque com uma quantidade maior que 20:
SELECT
    DISTINCT tp.nome
FROM
    tbl_peca AS tp
    INNER JOIN tbl_estoque AS te ON tp.cod_peca = te.cod_peca
WHERE
    te.quantidade > 20;

--5 Listar todas as pecas exceto a PLACA, ordenado por nome
SELECT
    tp.cod_peca,
    tp.nome,
    tp.cor,
    tp.preco,
    tp.cidade
FROM
    tbl_peca AS tp
WHERE
    tp.nome != 'PLACA'
ORDER BY
    tp.nome;

--6 Listar o nome e a cor das peças do fornecedor C, ordenado pelo nome da peça
SELECT
    tp.nome,
    tp.cor
FROM
    tbl_peca AS tp
    INNER JOIN tbl_estoque AS te ON te.cod_peca = tp.cod_peca
    INNER JOIN tbl_fornecedor AS tf ON tf.cod_fornecedor = te.cod_fornecedor
WHERE
    tf.nome = 'C'
ORDER BY
    tp.nome;

--7 Listar o nome e a cor de todas as pecas de Londres
SELECT
    tp.nome,
    tp.cor
FROM
    tbl_peca AS tp
WHERE
    tp.cidade = 'LONDRES';

--8 Encontre o nome das peças que estão disponíveis em estoque em Londres e não estão disponíveis em estoque em Paris:
SELECT
    DISTINCT tp.nome
FROM
    tbl_peca AS tp
    INNER JOIN tbl_estoque AS te ON te.cod_peca = tp.cod_peca
WHERE
    tp.cidade = 'LONDRES'
EXCEPT
SELECT
    DISTINCT tp.nome
FROM
    tbl_peca AS tp
    INNER JOIN tbl_estoque AS te ON te.cod_peca = tp.cod_peca
WHERE
    tp.cidade = 'PARIS';

--9 Quais os codigos das peças que possuem maior estoque do que a peça de codigo 2?
SELECT
    DISTINCT tp.cod_peca
FROM
    tbl_peca AS tp
    INNER JOIN tbl_estoque AS te ON te.cod_peca = tp.cod_peca
WHERE
    te.quantidade > (
        SELECT
            te.quantidade
        FROM
            tbl_peca AS tp
            INNER JOIN tbl_estoque AS te ON te.cod_peca = tp.cod_peca
        WHERE
            tp.cod_peca = 2
    )
ORDER BY
    1;