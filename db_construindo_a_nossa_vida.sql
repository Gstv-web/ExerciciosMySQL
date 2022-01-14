-- Crie um banco de dados para um serviço de uma loja de produtos de construção, o nome
-- do banco deverá ter o seguinte nome db_construindo_a_nossa_vida, onde o sistema
-- trabalhará com as informações dos produtos desta empresa.

-- CRIAR DB E USAR DB

CREATE DATABASE db_construindo_a_nossa_vida;
USE db_construindo_a_nossa_vida;

-- CRIAR TABLES

CREATE TABLE tb_categoria(
	id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    setor VARCHAR(30) NOT NULL,
    material VARCHAR(30) NOT NULL,
    transporte VARCHAR(30)
);

CREATE TABLE tb_produtos(
	id_produto INT AUTO_INCREMENT PRIMARY KEY,
    nome_produto VARCHAR(45),
    preco FLOAT(6,2),
    quantidade INT,
    numero_lote varchar(6),
    status_pedido ENUM("PENDENTE", "APROVADO"),
    fk_categoria INT,
    FOREIGN KEY (fk_categoria) REFERENCES tb_categoria(id_categoria)
);

-- POPULAR TABELA

INSERT INTO tb_categoria(setor, material, transporte) VALUES
("Hidráulica", "Metal", "Veículo Pequeno"),
("Construção", "Metal", "Veículo Pequeno"),
("Marcenaria", "Madeira", "Veículo grande"),
("Hidráulica", "Plástico", "Veículo pequeno"),
("Construção", "Metal", "Veículo Grande");

INSERT INTO tb_produtos(nome_produto, preco, quantidade, numero_lote, status_pedido, fk_categoria) VALUES
("Cano PVC", 39.99, 30, "123A47", "PENDENTE", 4),
("Parafuso 1,5mm x 1,5mm", 9.99, 800, "8W5422", "PENDENTE", 2),
("Caixa D'água 100m³", 599.90, 10, "FF1234", "APROVADO", 4),
("Ralo para Banheiro", 25.99, 25, "GD5852", "PENDENTE", 1),
("Tábua 2m x 40cm", 24.99, 50, "548R55", "APROVADO", 3),
("Tábua 3m x 1m", 35.90, 75, "7DDD78", "PENDENTE", 3),
("Viga 3 polegadas", 49.90, 50, "E11545", "APROVADO", 5),
("Parafuso 3mm x 3mm", 12.99, 150, "R4454D", "APROVADO", 2);


-- Faça um select que retorne os Produtos com o valor maior do que 50 reais.

SELECT * FROM tb_produtos WHERE preco > 50;

-- Faça um select trazendo os Produtos com valor entre 3 e 60 reais.

SELECT * FROM tb_produtos WHERE preco BETWEEN 3 AND 60;

-- Faça um select utilizando LIKE buscando os Produtos com a letra J.

SELECT * FROM tb_produtos WHERE nome_produto LIKE "%C%";

-- Faça um um select com Inner join entre tabela categoria e produto.

SELECT * FROM tb_produtos INNER JOIN tb_categoria ON tb_categoria.id_categoria = tb_produtos.fk_categoria;

-- Faça um select onde traga todos os Produtos de uma categoria específica

SELECT * FROM tb_produtos INNER JOIN tb_categoria ON tb_categoria.id_categoria = tb_produtos.fk_categoria WHERE tb_categoria.setor = "Hidráulica";