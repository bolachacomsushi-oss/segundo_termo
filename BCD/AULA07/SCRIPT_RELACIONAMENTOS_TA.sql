-- Geração de Modelo físico
-- Sql ANSI 2003 - brModelo.



CREATE TABLE Cliente (
ID_Cliente int primary key PRIMARY KEY,
Nome_cliente varchar(40)
)

CREATE TABLE Pedido (
ID_Pedido int primary key PRIMARY KEY,
Quantidade int,
ID_Cliente int primary key,
FOREIGN KEY(ID_Cliente) REFERENCES Cliente (ID_Cliente)
)

CREATE TABLE Produtos+Estoques (
ID_Produto int primary key,
Nome_produto varchar(40),
ID_Estoque int primary key,
Valor decimal(10,2),
PRIMARY KEY(ID_Produto,ID_Estoque)
)

CREATE TABLE Fornecedores (
ID_Fornecedores Texto(1) PRIMARY KEY,
razao_social Texto(1)
)

CREATE TABLE Produtos (
ID_Produto Texto(1) PRIMARY KEY,
nome_produto Texto(1)
)

CREATE TABLE fornece (
ID_Produto int,
ID_Fornecedores int,
ID_Item int auto_increment PRIMARY KEY,
Quantidade int
)

