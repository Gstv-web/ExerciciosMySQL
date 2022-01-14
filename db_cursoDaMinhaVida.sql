-- Crie um banco de dados para um serviço de um site de cursos onlines, o nome do banco
-- deverá ter o seguinte nome db_cursoDaMinhaVida, onde o sistema trabalhará com as
-- informações dos produtos desta empresa.

-- CRIAR E USAR DB

CREATE DATABASE db_cursoDaMinhaVida;
USE db_cursoDaMinhaVida;

-- CRIAR TABLES

CREATE TABLE tb_categoria(
	id_categoria INT AUTO_INCREMENT PRIMARY KEY,
    categoria VARCHAR(45) NOT NULL,
    turmas_ano INT(2) NOT NULL,
    bolsista ENUM("Sim", "Não")
);

CREATE TABLE tb_cursos(
	id_curso INT AUTO_INCREMENT PRIMARY KEY,
    nome_curso VARCHAR(45),
    preco FLOAT(6,2) NOT NULL,
    carga_horaria INT(3),
    fk_curso INT,
    FOREIGN KEY (fk_curso) REFERENCES tb_categoria(id_categoria)
);

-- POPULANDO TABLES

INSERT INTO tb_categoria (categoria, turmas_ano, bolsista) VALUES
("Exatas", 6, "Não"),
("Tecnologia", 4, "Não"),
("Idiomas", 2, "Sim"),
("Negócios", 1, "Não"),
("Saúde e Estética", 1, "Sim");

INSERT INTO tb_cursos(nome_curso, preco, carga_horaria, fk_curso) VALUES
("Programação Orientada a Objetos", 250.00, 600, 2),
("Marketing", 350.00, 450, 4),
("Matemática", 300.00, 500, 1),
("Japonês", 440.00, 600, 3),
("Francês", 440.00, 600, 3),
("Micropigmentação", 500.00, 250, 5),
("Administração", 350.00, 400, 4),
("Data Science", 600.00, 250, 2);


-- Faça um select que retorne os Produtos com o valor maior do que 500 reais.

SELECT * FROM tb_cursos WHERE preco > 500;

-- Faça um select trazendo os Produtos com valor entre 300 e 600 reais.

SELECT * FROM tb_cursos WHERE preco BETWEEN 300 AND 600;

-- Faça um select utilizando LIKE buscando os Produtos com a letra J.

SELECT * FROM tb_cursos WHERE nome_curso LIKE "%J%";

-- Faça um um select com Inner join entre tabela categoria e produto.

SELECT * FROM tb_cursos INNER JOIN tb_categoria ON tb_categoria.id_categoria = tb_cursos.fk_curso;

-- Faça um select onde traga todos os Produtos de uma categoria específica

SELECT * FROM tb_cursos INNER JOIN tb_categoria ON tb_categoria.id_categoria = tb_cursos.fk_curso WHERE tb_categoria.categoria = "Idiomas";