-- Crie um banco de dados para um serviço de um game Online , o nome do banco deverá ter
-- o seguinte nome db_generation_game_online, onde, o sistema trabalhará com as
-- informações dos personagens desse game.
-- O sistema trabalhará com 2 tabelas tb_personagem e tb_classe.

-- Criar BD

CREATE DATABASE db_generation_game_online;

USE db_generation_game_online;

-- Criar tables

CREATE TABLE tb_classe(
	id BIGINT(2) AUTO_INCREMENT PRIMARY KEY,
    nome_classe VARCHAR(25) NOT NULL,
    atributo_primario VARCHAR(45) NOT NULL,
    afinidade_elemental VARCHAR(15) DEFAULT "nenhum"
    );

CREATE TABLE tb_personagens(
	id BIGINT(2) AUTO_INCREMENT PRIMARY KEY,
    nome_personagem VARCHAR(25) NOT NULL,
    nivel INT(2),
    hp INT(5),
    mp INT(5),
    ataque INT(4),
    defesa INT(4),
	destreza INT(4),
    fk_classe BIGINT(2),
    FOREIGN KEY (fk_classe) REFERENCES tb_classe (id)
);

-- popular tables

INSERT INTO tb_classe(nome_classe, atributo_primario, afinidade_elemental)
VALUES ("Paladino", "Resistência contra zumbis",""),
		("Mago", "+Mana por nível", "Fogo"),
		("Amazona", "Velocidade de ataque aumentada",""),
        ("Assassino", "Furtividade", "Eletricidade"),
        ("Bárbaro", "+Ataque e +HP por nível","");

INSERT INTO tb_personagens (nome_personagem, nivel, hp, mp, ataque, defesa, destreza, fk_classe)
VALUES ("Galdalf da Quebrada", 35, 3650, 2902, 450, 3585, 800, 2),
		("O Cara das Cruzadas", 50, 5752, 1566, 4215, 2412, 1253, 1),
        ("Matador de Passarinho", 49, 2985, 1232, 2147, 1125, 5415, 4),
        ("Olafo de Carvalho", 68, 5242, 3245, 3258, 2896, 1448, 5),
        ("Xenax", 15, 684, 400, 312, 200, 657, 3),
        ("Jogador Feio", 88, 7685, 4000, 5466, 3211, 2584, 1),
        ("Mágico de Araque", 29, 2674, 2155, 328, 2554, 489, 2),
        ("Kratos Cansado", 39, 3249, 1963, 1855, 2301, 955, 5);


-- Mostrar personagens com ataque > 2000

SELECT * FROM tb_personagens WHERE ataque > 2000;
        
-- Mostra personagens com defesa entre 1000 e 2000

SELECT * FROM tb_personagens WHERE defesa BETWEEN 1000 AND 2000;

-- Mostrar personagens com LIKE buscando a letra cache index

SELECT * FROM tb_personagens WHERE nome_personagem LIKE "%c%";

-- Mostrar select com inner join
-- traduzindo: selecionar (Tudo ou o que está descrito abaixo) da tb_personagens, "juntar" a tabela classe com a coluna id da tabela classe se for igual à coluna fk_classe da tabela personagens
SELECT tb_personagens.nome_personagem, tb_personagens.nivel, tb_classe.nome_classe 
FROM tb_personagens
INNER JOIN tb_classe on tb_classe.id = tb_personagens.fk_classe;
