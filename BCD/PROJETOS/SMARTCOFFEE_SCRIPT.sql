CREATE DATABASE IF NOT EXISTS SMARTCOFFEE_BEATRIZBARROS

USE SMARTCOFFEE_BEATRIZBARROS



CREATE TABLE Clientes (
id_cliente INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(60),
cpf CHAR(14),
telefone CHAR(14),
email VARCHAR(40),
data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)

CREATE TABLE Produtos (
id_produtos INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(40) NOT NULL,
descricao VARCHAR(150) NOT NULL,
categoria VARCHAR(40),
preco_unitario DECIMAL(10, 2)
)

CREATE TABLE Funcionarios (
id_funcionario INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(60) NOT NULL,
cpf CHAR(14) NOT NULL UNIQUE,
cargo VARCHAR(40) NOT NULL,
salario DECIMAL(10, 2) NOT NULL,
data_admissao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
)

CREATE TABLE pedidos (
id_pedido INT AUTO_INCREMENT PRIMARY KEY,
data_hora DATETIME,
Presencial Texto(1),
Delivery Texto(1),
status_pedidos ENUM ("REALIZADO", "PENDENTE") DEFAULT "PENDENTE" NOT NULL,
valor_total DECIMAL(10, 2)
)

CREATE TABLE Delivery (
id_delivery INT AUTO_INCREMENT PRIMARY KEY,
endereco_entrega VARCHAR(150),
taxa_entrega INT(2),
data_hora_saida DATETIME,
status_entrega VARCHAR(10),
FOREIGN KEY(id_pedido) REFERENCES pedidos (id_pedido)
)

CREATE TABLE Programa de fidelidade (
id_fidelidade INT AUTO_INCREMENT PRIMARY KEY,
saldo_pontos INT(1000),
data_ultima_atualizacao DATETIME,
FOREIGN KEY(id_cliente) REFERENCES Clientes (id_cliente)
)

CREATE TABLE Pagamentos (
id_pagamento INT AUTO_INCREMENT PRIMARY KEY,
valor_pago DECIMAL(10, 2),
data_hora_pagamento DATETIME,
status_pagamento VARCHAR(10),
forma_pagamento ENUM ("PIX", "CARTAO", "DINHEIRO") DEFAULT "DINHEIRO" DECIMAL(10, 2),
FOREIGN KEY(id_pedido) REFERENCES pedidos (id_pedido)
)

CREATE TABLE Estoque (
id_insumo INT AUTO_INCREMENT PRIMARY KEY,
nome_insumo vachar(40),
quantidade_atual int (100),
kg decimal(10, 2),
ml decimal(10, 2),
un decimal(10, 2),
quantidade_minima int (100)
)

CREATE TABLE realiza (
id_pedido Texto(1),
id_cliente Texto(1),
FOREIGN KEY(id_pedido) REFERENCES pedidos (id_pedido),
FOREIGN KEY(id_cliente) REFERENCES Clientes (id_cliente)
)

CREATE TABLE atende (
id_pedido Texto(1),
id_funcionario Texto(1),
FOREIGN KEY(id_pedido) REFERENCES pedidos (id_pedido),
FOREIGN KEY(id_funcionario) REFERENCES Funcionarios (id_funcionario)
)

CREATE TABLE contem (
id_produtos Texto(1),
id_pedido Texto(1),
FOREIGN KEY(id_produtos) REFERENCES Produtos (id_produtos),
FOREIGN KEY(id_pedido) REFERENCES pedidos (id_pedido)
)

CREATE TABLE entrega (
id_delivery Texto(1),
id_funcionario Texto(1),
FOREIGN KEY(id_delivery) REFERENCES Delivery (id_delivery),
FOREIGN KEY(id_funcionario) REFERENCES Funcionarios (id_funcionario)
)

CREATE TABLE consome (
id_insumo Texto(1),
id_produtos Texto(1),
FOREIGN KEY(id_insumo) REFERENCES Estoque (id_insumo))

