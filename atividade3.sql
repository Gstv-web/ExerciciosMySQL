CREATE DATABASE atividade3;

USE atividade3;

CREATE TABLE tb_alunos(
id INT(2) AUTO_INCREMENT,
Nome VARCHAR(100),
Curso VARCHAR(50),
Unidade VARCHAR(50),
Nota DECIMAL(2,1),
PRIMARY KEY(id)
);

INSERT INTO tb_alunos(Nome, Curso, Unidade, Nota) VALUES ("Aline Rodrigues Castro", "Matemática", "Mooca", 8.5),
("Rodrigo Araújo", "Matemática", "Mooca", 7.7),
("Guilherme Jorge Silva Carvalho", "Inglês", "Bom Retiro", 6.5),
("Aline Silveira Santos", "Geografia", "Vila Mariana", 9.8),
("Kleber da Silva Pires", "Português", "Mooca", 7.3),
("Mariana Silva Santos", "Matemática", "Mooca", 6.6),
("Juliana Mara de Oliveira", "Biologia", "Vila Mariana", 4),
("Fabiana Pereira", "Inglês", "Bom Retiro", 9.5);

SELECT * FROM atividade3.tb_alunos WHERE Nota > 7;

SELECT * FROM atividade3.tb_alunos WHERE Nota < 7;

UPDATE tb_alunos SET Curso = "História" WHERE id = 2; 