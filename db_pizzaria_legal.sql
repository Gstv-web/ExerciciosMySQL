-- Criar um banco de dados

CREATE DATABASE db_pizzaria_legal;

-- Usar database

USE db_pizzaria_legal;

-- Criar tabelas

CREATE TABLE tb_categoria(
	id BIGINT AUTO_INCREMENT PRIMARY KEY,
    tipo_pizza VARCHAR(15),
    tamanho_pizza VARCHAR(10)
);

CREATE TABLE tb_pizza(
	id BIGINT AUTO_INCREMENT PRIMARY KEY,
    sabor_pizza VARCHAR(25),
    estilo_pizza VARCHAR(10),
    preco FLOAT,
    fk_categoria BIGINT,
    FOREIGN KEY (fk_categoria) REFERENCES tb_categoria(id)
);

-- Popular tabelas

INSERT INTO tb_categoria(tipo_pizza, tamanho_pizza) 
	VALUES ("Salgada", "Broto"),
			("Salgada", "Média"), 
            ("Salgada", "Grande"),
            ("Doce", "Broto"),
            ("Doce", "Média"),
            ("Doce", "Grande");
            
INSERT INTO tb_pizza(sabor_pizza, estilo_pizza, preco, fk_categoria) 
	VALUES ("Americana", "Redonda", 39.90, 2),
			("Baiana", "Quadrada", 49.90, 3),
            ("Prestígio", "Redonda", 34.90, 4),
			("Mussarela", "Redonda", 54.90, 3),
            ("Portuguesa", "Quadrada", 36.90, 1),
            ("Calabresa", "Redonda", 45.90, 3),
            ("Champignon", "Redonda", 39.90, 2),
            ("À Moda da Casa", "Redonda", 44.90, 2);
            

-- Faça um select que retorne os Produtos com o valor maior do que 45 reais.

SELECT * FROM tb_pizza WHERE preco > 45;

-- Faça um select trazendo os Produtos com valor entre 29 e 60 reais.

SELECT * FROM tb_pizza WHERE preco BETWEEN 29 AND 60;

-- Faça um select utilizando LIKE buscando os Produtos com a letra C.

SELECT * FROM tb_pizza WHERE sabor_pizza LIKE "%C%";

-- Faça um um select com Inner join entre tabela categoria e pizza.
-- traduzindo: selecionar (Tudo ou o que está descrito abaixo) da tb_personagens, "juntar" a tabela categoria com a coluna id da tabela categoria se for igual à coluna fk_ da tabela personagens
SELECT * FROM tb_pizza
	INNER JOIN tb_categoria on tb_categoria.id = tb_pizza.fk_categoria;
    
SELECT tb_pizza.sabor_pizza, tb_pizza.estilo_pizza, tb_categoria.tipo_pizza, tb_categoria.tamanho_pizza, tb_pizza.preco
	FROM tb_pizza
	INNER JOIN tb_categoria on tb_categoria.id = tb_pizza.fk_categoria
    WHERE tb_categoria.tipo_pizza = "Doce";
    
