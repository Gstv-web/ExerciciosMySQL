-- Crie um banco de dados para um serviço de farmácia de uma empresa, o nome do banco
-- deverá ter o seguinte nome db_farmacia_do_bem, onde o sistema trabalhará com as
-- informações dos produtos desta empresa.

-- Criar DB

CREATE DATABASE db_farmacia_do_bem;
USE db_farmacia_do_bem;

-- Criat Tables

CREATE TABLE tb_categoria(
	id_categoria BIGINT AUTO_INCREMENT PRIMARY KEY,
    tipo_produto VARCHAR(25),
    numero_lote VARCHAR(6),
    prescricao CHAR(3)
);

CREATE TABLE tb_produto(
	id_produto BIGINT AUTO_INCREMENT PRIMARY KEY,
	nome_produto VARCHAR(50),
    preco FLOAT,
    data_validade DATE,
    quant_estoque INT,
	fk_categoria BIGINT,
    FOREIGN KEY (fk_categoria) REFERENCES tb_categoria(id_categoria)
);

-- Populando tabelas

INSERT INTO tb_categoria (tipo_produto, numero_lote, prescricao)
VALUES  ("Medicação", "1234X6", "Sim"),
		("Medicação", "546548", "Não"),
        ("Cosmético", "752241", "Não"),
        ("Produto de Higiene", 665468, "Não"),
        ("Primeiros Socorros", 415524, "Não");
        
INSERT INTO tb_produto(nome_produto, preco, data_validade, quant_estoque, fk_categoria)
VALUES  ("Resfenol", 6.99, "2029-1-01", 100, 2),
		("Creme Dental", 3.99, "2028-1-01", 100, 4),
        ("Algodão Pacote 50g", 5.00, "2030-1-01", 50, 5),
        ("Prozac 100mg", 89.90, "2035-5-08", 40, 1),
        ("Manteiga de Cacau", 1.99, "2025-5-05", 50, 3),
        ("Engov Comprimido", 4.99, "2026-1-01", 150, 2),
        ("Dipirona Monohidratada", 6.99, "2030-1-01", 85, 2),
        ("Tramal 500mg", 119.99, "2035-1-01", 30, 1);
        

-- Faça um select que retorne os Produtos com o valor maior do que 50 reais.

SELECT * FROM tb_produto WHERE preco > 50;

-- Faça um select trazendo os Produtos com valor entre 3 e 60 reais.

SELECT * FROM tb_produto WHERE  preco BETWEEN 3 AND 60;

-- Faça um select utilizando LIKE buscando os Produtos com a letra B.

SELECT * FROM tb_produto WHERE nome_produto LIKE "%B%";

-- Faça um um select com Inner join entre tabela categoria e produto.

SELECT * FROM tb_produto
INNER JOIN tb_categoria on tb_categoria.id_categoria = tb_produto.fk_categoria;

-- Faça um select onde traga todos os Produtos de uma categoria específica

SELECT tb_produto.nome_produto, tb_produto.preco FROM tb_produto
INNER JOIN tb_categoria on tb_categoria.id_categoria = tb_produto.fk_categoria
WHERE tb_categoria.tipo_produto = "Medicação";