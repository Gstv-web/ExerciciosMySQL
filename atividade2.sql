CREATE DATABASE atividade2;

CREATE TABLE tb_produtos(
id BIGINT(2) AUTO_INCREMENT,
nome VARCHAR(100),
marca VARCHAR(50),
preço FLOAT,
quantidade INT,
PRIMARY KEY(id)
);

INSERT INTO tb_produtos (nome, marca, preço, quantidade)
VALUES ("Notebook", "HP", 5000.50, 50)
("Mouse Wireless", "Microsoft", 120, 20),
("Mouse Gamer", "Razer", 485, 20),
("Mouse Pad 15x15", "Padders", 50, 50),
("Impressora", "HP", 350, 30),
("Monitor 24'", "AOC", 900, 10),
("Teclado Padrão", "Microsoft", 85, 35),
("Teclado Gamer", "Cougar", 449.99, 25)


SELECT * FROM atividade2.tb_produtos WHERE preço > 500;

SELECT * FROM atividade2.tb_produtos WHERE preço < 500;

UPDATE tb_produtos SET quantidade = 5 WHERE id = 6;