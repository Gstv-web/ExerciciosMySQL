-- Criar Banco de Dados

CREATE DATABASE atividade1;

-- Criar tabela

CREATE TABLE tb_funcionarios(
id BIGINT AUTO_INCREMENT,
prim_nome VARCHAR(40) NOT NULL,
sobrenome varchar(80) NOT NULL,
idade INT(2) NOT NULL,
salario FLOAT NOT NULL,
PRIMARY KEY(id)
);

-- Popular tabela 

INSERT INTO tb_funcionarios(prim_nome, sobrenome, idade, salario)
VALUES ("José Gustavo", "Oliveira da Silva", 30, 3500.00),
("Adriana", "Cardoso de Almeida", 36, 5000.00),
("Thaiane", "de Paula Gomes", 30, 2700.00),
("Douglas William", "de Oliveira Soares", 43, 1800.00),
("José Gustavo", "Oliveira da Silva", 30, 3500.00);

-- Mostrar funcionários com salario maior que 2k

SELECT * FROM atividade1.tb_funcionarios WHERE salario > 2000;

--  Mostrar funcionários com salario menor que 2k

SELECT * FROM atividade1.tb_funcionarios WHERE salario < 2000;

-- Atualizar algum dado

UPDATE tb_funcionarios SET salario = 1850 WHERE id = 3;
