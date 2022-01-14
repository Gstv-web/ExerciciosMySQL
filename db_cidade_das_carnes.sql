-- Crie um banco de dados para um serviço de um açougue ou uma quitanda, o nome do
-- banco deverá ter o seguinte nome db_cidade_das_carnes ou db_cidade_das_frutas, onde o
-- sistema trabalhará com as informações dos produtos desta empresa.

-- CRIAR E USAR DB

CREATE DATABASE db_cidade_das_carnes;
USE db_cidade_das_carnes;

-- CRIAR TABLES

CREATE TABLE tb_categoria(
	id_categoria INT(1) AUTO_INCREMENT PRIMARY KEY,
    tipo_carne VARCHAR(15) NOT NULL,
    tipo_corte VARCHAR(15) NOT NULL,
    importado ENUM("Sim", "Não") NOT NULL
);

CREATE TABLE tb_produtos(
	id_produto INT(1) AUTO_INCREMENT PRIMARY KEY,
    nome_produto VARCHAR(45) NOT NULL,
    peso FLOAT(4, 3) NOT NULL,
    fabricante VARCHAR(45) NOT NULL,
    data_compra DATE,
    preco FLOAT,
    fk_categoria INT,
    FOREIGN KEY (fk_categoria) REFERENCES tb_categoria(id_categoria)
);


-- POPULANDO TABELA

INSERT INTO tb_categoria(tipo_carne, tipo_corte, importado)
VALUES ("Bovino", "Padrão", "Não"),
		("Bovino", "Nobre", "Sim"),
        ("Bovino", "Nobre", "Não"),
        ("Suíno", "Nobre", "Não"),
        ("Aves", "Padrão", "Não");
        
INSERT INTO tb_produtos(nome_produto, peso, fabricante, data_compra, preco, fk_categoria)
VALUES ("Picanha", 2.154, "Friboi", "2022-1-14", 168.36, 3),
		("Picanha Suína", 1.502, "Casa do Porco", "2022-1-03", 64.75, 4),
        ("Tulipa", 3.052, "Sadia", "2021-12-25", 112.36, 5),
        ("Ancho", 1.541, "Beefy Beefs", "2022-01-02", 148.48, 2),
        ("Vazio", 2.550, "Friboi", "2021-10-19", 187.48, 3),
        ("Lagarto", 0.850, "Carnões", "2022-1-10", 26.48, 1),
        ("Coração", 1.754, "Sadia", "2022-1-08", 35.95, 5),
        ("Bacon Defumado", 0.489, "Perdigão", "2022-1-13", 9.57, 4);

-- SELECTS
-- Faça um select que retorne os Produtos com o valor maior do que 50 reais.

SELECT * FROM tb_produtos WHERE preco > 50;

-- Faça um select trazendo os Produtos com valor entre 3 e 60 reais.

SELECT * FROM tb_produtos WHERE preco BETWEEN 3 AND 60;

-- Faça um select utilizando LIKE buscando os Produtos com a letra C.

SELECT * FROM tb_produtos WHERE nome_produto LIKE "%C%";

-- Faça um um select com Inner join entre tabela categoria e produto.

SELECT * FROM tb_produtos INNER JOIN tb_categoria ON tb_categoria.id_categoria = tb_produtos.fk_categoria;

-- Faça um select onde traga todos os Produtos de uma categoria específica

SELECT tb_produtos.nome_produto, tb_produtos.peso, tb_categoria.tipo_carne FROM tb_produtos INNER JOIN tb_categoria ON tb_categoria.id_categoria = tb_produtos.fk_categoria WHERE tb_categoria.tipo_carne = "Bovino";