create database sistema_padaria;

use sistema_padaria;	

CREATE TABLE cliente (
    id_cliente INT,
    cpf VARCHAR(11),
    CONSTRAINT PK_cliente PRIMARY KEY (id_cliente, cpf)
);
	

CREATE TABLE produto (
    id_produto INT PRIMARY KEY,
    nome VARCHAR(30),
    preco FLOAT
);

CREATE TABLE pedido (
    id INT PRIMARY KEY,
    id_cliente INT,
	cpf varchar(11),
    id_produto INT,
    FOREIGN KEY (id_cliente, cpf) REFERENCES cliente(id_cliente, cpf),
    FOREIGN KEY (id_produto) REFERENCES produto(id_produto)
);
