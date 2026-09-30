-- Active: 1788351689620@@127.0.0.1@3306@smartcoffee_dml_beatriz

DROP DATABASE IF EXISTS SMARTCOFFEE_DML_BEATRIZ;
CREATE DATABASE SMARTCOFFEE_DML_BEATRIZ;
USE SMARTCOFFEE_DML_BEATRIZ;;

--------------------------------------------------------------------------------------
CREATE TABLE cliente (
    id_cliente INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(120) UNIQUE,
    telefone VARCHAR(20),
    cidade VARCHAR(60) NOT NULL,
    ativo BOOLEAN NOT NULL DEFAULT TRUE
);

CREATE TABLE categoria (
    id_categoria INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(60) NOT NULL UNIQUE
);

CREATE TABLE produto (
    id_produto INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL,
    preco DECIMAL(10,2) NOT NULL,
    ativo BOOLEAN NOT NULL DEFAULT TRUE,
    id_categoria INT NOT NULL,
    CONSTRAINT fk_produto_categoria FOREIGN KEY (id_categoria)
        REFERENCES categoria(id_categoria)
);

CREATE TABLE pedido (
    id_pedido INT PRIMARY KEY AUTO_INCREMENT,
    data_pedido DATETIME NOT NULL,
    status ENUM('ABERTO','PREPARANDO','FINALIZADO','CANCELADO') NOT NULL,
    valor_total DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    id_cliente INT NOT NULL,
    CONSTRAINT fk_pedido_cliente FOREIGN KEY (id_cliente)
        REFERENCES cliente(id_cliente)
);

CREATE TABLE item_pedido (
    id_item INT PRIMARY KEY AUTO_INCREMENT,
    id_pedido INT NOT NULL,
    id_produto INT NOT NULL,
    quantidade INT NOT NULL,
    preco_unitario DECIMAL(10,2) NOT NULL,
    observacao VARCHAR(150),
    CONSTRAINT fk_item_pedido FOREIGN KEY (id_pedido)
        REFERENCES pedido(id_pedido),
    CONSTRAINT fk_item_produto FOREIGN KEY (id_produto)
        REFERENCES produto(id_produto)
);

CREATE TABLE forma_pagamento (
    id_forma_pagamento INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(40) NOT NULL UNIQUE
);

CREATE TABLE pagamento (
    id_pagamento INT PRIMARY KEY AUTO_INCREMENT,
    id_pedido INT NOT NULL,
    id_forma_pagamento INT NOT NULL,
    valor DECIMAL(10,2) NOT NULL,
    data_pagamento DATETIME,
    CONSTRAINT fk_pagamento_pedido FOREIGN KEY (id_pedido)
        REFERENCES pedido(id_pedido),
    CONSTRAINT fk_pagamento_forma FOREIGN KEY (id_forma_pagamento)
        REFERENCES forma_pagamento(id_forma_pagamento)
);

--------------------------------------------------------------------------------------

-- INSERINDO DADOS NO BCD;
-- DML: INSERTS, UPDATE, DELETE;

 INSERT INTO cliente (NOME, EMAIL, TELEFONE, CIDADE, ATIVO) VALUES
 ('Adryan Costa','adryan@email.com','19 99999-9901','Limeira',TRUE),
 ('Ana francisca','ana@email.com','19 99999-9902','Lençois Paulista',TRUE),
 ('Anna Júlia','annaj@email.com','19 99999-9903','Limeira',TRUE),
 ('Beatriz Barros','beatrizb@email.com','19 99999-9904','Limeira',TRUE),
 ('Beatriz Santana','beatrizs@email.com','19 99999-9905','Limeira',TRUE),
 ('Bruno Dias','bruno@email.com','19 99999-9906','Limeira',TRUE),
 ('Cristopher da Costa','cristopher@email.com','19 99999-9906','Mogi Guaçu',TRUE),
 ('Davi Guerra','davi@email.com',NULL,'Limeira',TRUE),
 ('Gabriel Lucio','gabriel@email.com','19 99999-9908','Limeira',TRUE),
 ('Gabriela Lima','gabriela@email.com','19 99999-9909','Curitiba',TRUE),
 ('Giovana Santana','giovana@email.com',NULL,'Juquerópolis',FALSE),
 ('Gustavo Couto','gustavo@email.com','19 99999-9910','Ipatinga',FALSE),
 ('Isabeli Sousa','isabeli@email.com',NULL,'Limeira',TRUE),
 ('Jacó de Souza','jaco@email.com','19 99999-9911','Limeira',TRUE),
 ('João Moreira','joao@email.com','19 99999-9912','Limeira',TRUE),
 ('John Pierre','john@email.com','19 99999-9913','Cap Haitien',TRUE),
 ('Jonas Dawid','jonas@email.com','19 99999-9914','Rio de janeiro/Limeira',TRUE),
 ('Juan Pablo','juan@email.com','19 99999-9915','Limeira',TRUE),
 ('Júlia Fernanda','julia@email.com','19 99999-9916','Limeira',TRUE);

-------------------------------------------------------------------------------------
INSERT INTO categoria (nome) VALUES
('Cafés'), ('Bebidas Geladas'), ('Doces'), ('Salgados'), ('Combos'), ('Produtos');

INSERT INTO produto (nome, preco, ativo, id_categoria) VALUES
('Café Espresso', 7.00, TRUE, 1), ('Café Duplo', 10.00, TRUE, 1),
('Café com Leite', 9.50, TRUE, 1), ('Cappuccino', 13.00, TRUE, 1),
('Mocha Chocolate', 15.50, TRUE, 1), ('Cold Brew', 14.00, TRUE, 2),
('Frappé de Chocolate', 18.00, TRUE, 2), ('Suco de Laranja', 11.00, TRUE, 2),
('Brownie', 9.00, TRUE, 3), ('Cheesecake', 14.50, TRUE, 3),
('Cookie de Chocolate', 7.50, TRUE, 3), ('Pão de Queijo', 6.50, TRUE, 4),
('Croissant', 12.00, TRUE, 4), ('Sanduíche Natural', 16.00, TRUE, 4),
('Combo Café + Pão de Queijo', 12.50, TRUE, 5),
('Combo Cappuccino + Brownie', 20.00, TRUE, 5), ('Torta Especial', 22.00, FALSE, 3);

INSERT INTO pedido (data_pedido, status, valor_total, id_cliente) VALUES
('2026-09-01 08:15:00', 'FINALIZADO', 16.00, 1),
('2026-09-01 09:30:00', 'FINALIZADO', 26.00, 2),
('2026-09-02 10:20:00', 'CANCELADO', 18.00, 3),
('2026-09-03 14:10:00', 'FINALIZADO', 35.50, 1),
('2026-09-04 16:40:00', 'FINALIZADO', 20.00, 4),
('2026-09-05 11:05:00', 'PREPARANDO', 31.50, 5),
('2026-09-06 08:50:00', 'FINALIZADO', 28.00, 6),
('2026-09-07 17:25:00', 'FINALIZADO', 44.00, 2),
('2026-09-08 13:15:00', 'ABERTO', 13.00, 7),
('2026-09-09 09:45:00', 'FINALIZADO', 39.00, 1);

INSERT INTO item_pedido (id_pedido, id_produto, quantidade, preco_unitario, observacao) VALUES
(1,1,1,7.00,NULL),(1,9,1,9.00,NULL),(2,4,2,13.00,'Sem canela'),
(3,7,1,18.00,NULL),(4,5,1,15.50,NULL),(4,16,1,20.00,NULL),
(5,16,1,20.00,NULL),(6,4,1,13.00,NULL),(6,7,1,18.00,NULL),
(7,6,2,14.00,NULL),(8,14,2,16.00,NULL),(8,12,2,6.00,NULL),
(9,4,1,13.00,NULL),(10,3,2,9.50,NULL),(10,16,1,20.00,NULL);

INSERT INTO forma_pagamento (descricao) VALUES
('Dinheiro'), ('PIX'), ('Cartão de Crédito'), ('Cartão de Débito');

INSERT INTO pagamento (id_pedido, id_forma_pagamento, valor, data_pagamento) VALUES
(1,2,16.00,'2026-09-01 08:20:00'),(2,4,26.00,'2026-09-01 09:40:00'),
(4,3,35.50,'2026-09-03 14:20:00'),(5,2,20.00,'2026-09-04 16:45:00'),
(7,1,28.00,'2026-09-06 09:00:00'),(8,3,30.00,'2026-09-07 17:30:00'),
(8,2,14.00,'2026-09-07 17:31:00'),(10,2,39.00,'2026-09-09 09:50:00');
--------------------------------------------------------------------------------------------

INSERT INTO produto (nome,preco,ativo,id_categoria) VALUES
('Manteiga Giovana',14.00,TRUE,6);



-- INSERINDO VALORES E BUSCANDO O ULTIMO VALOR INSERIDO
INSERT INTO pedido (data_pedido,status,valor_total,id_cliente) VALUES
(NOW(),'ABERTO',14.00,18);

SET @pedido = LAST_INSERT_ID();
SELECT @pedido

-------------------------------------------------------------------------------------
------ COMANDOS!!!!!!!!!!!!!!! -------

-- ATUALIZANDO OU MODIFICANDO DADOS NO BCD
-- EX 1: ATUALIZANDO INFORMACOES INDIVIDUAIS
UPDATE cliente
SET telefone = '19999957890'
WHERE id_cliente = 10

UPDATE cliente
SET ativo = TRUE
WHERE id_cliente = 11

-- NUNCA, JAMAIS, NEVER ESQUEÇAM DE UTILIZAR O WHERE

-- REGRA DE OURO
SELECT*FROM cliente
WHERE id_cliente = 13

-- SEGUNDA ETAPA
UPDATE cliente
SET ativo = FALSE
WHERE id_cliente = 13

-- EX 2: ATUALIZANDO MAIS DO QUE UM CAMPO
UPDATE cliente
SET telefone = '19999256789',
    cidade = 'Campinas'
WHERE id_cliente = 12

-- EX 3: ATUALIZANDO COM CONDICIONAIS
UPDATE produto
SET preco = preco * 0.50
WHERE id_categoria = 1



----- APAGANDO DADOS
-- EX 1: APAGAR DADOS SEM CONTER INFORMAÇÕES
DELETE FROM cliente;

-- EX 2: APAGAR DADOS COM CONDIÇÕES
DELETE FROM cliente
WHERE id_cliente = 14

-- EX 3: APAGANDO DADOS DE TODA TABELA
TRUNCATE TABLE cliente;

-- EX 4: APAGAR DE FORMA REPRESENTATIVA OU LÓGICA
UPDATE produto
SET ativo = FALSE
WHERE id_produto = 19

-----------------------------------------------------------------------------------------
-- REALIZANDO PASSOS PARA UMA COMPRA NO SMARTCOFFEE
-- PASSO 1: CADASTRAR UM NOVO CLIENTE

INSERT INTO cliente (nome,email,telefone,cidade,ativo) VALUES
('Bruno A','brunoa@email.com','1999123-4560','Piracicaba',TRUE);
SET @cliente = LAST_INSERT_ID()

-- PASSO 2: CRIAR O PEDIDO
INSERT INTO pedido (data_pedido,status,valor_total,id_cliente) VALUES
(NOW(),'ABERTO',0.00,10);
SET @pedido = LAST_INSERT_ID();

-- PASSO 3: INSERIR ITENS NO PEDIDO
INSERT INTO item_pedido (id_pedido,id_produto,quantidade,preco_unitario) VALUES
(@pedido,5,73,13.00),
(@pedido,10,11,25.50);

-- PASSO 4: ATUALIZAR O TOTAL E STATUS
UPDATE pedido
SET valor_total = 84.38,
    status = 'preparando'
WHERE id_pedido = @pedido

-- PASSO 5: REGISTRAR PAGAMENTO
INSERT INTO pagamento (id_pagamento,id_forma_pagamento,valor,data_pagamento) VALUES
(@pedido, 1, 84.34, NOW());

DELETE FROM pagamento
WHERE id_pagamento = 1;



----------------------------------------------------------------------------------------
-- CONSULTAR DADOS EM TABELAS BCD
-- CONSULTAR TODA A TABELA
SELECT*FROM categoria;

-- CONSULTAR INDIVIDUAL POR ID
SELECT*FROM cliente
WHERE id_cliente = 115