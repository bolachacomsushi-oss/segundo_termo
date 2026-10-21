-- Active: 1788351689620@@127.0.0.1@3306@smartcoffee_dml_beatriz
-- ============================================================
-- AULA 08 - ATIVIDADE PRÁTICA DE DML
-- Nome: BEATRIZ BARROS DE SOUSA
-- Turma: 2-DEVIE Data: 30/09/2026
-- Base: smartcoffee_dml
-- ============================================================
USE smartcoffee_dml_beatriz;

-- IMPORTANTE:
-- Para toda questão de UPDATE ou DELETE, escreva primeiro um SELECT
-- com o mesmo WHERE para validar os registros afetados.

-- PARTE A - INSERT

-- 1. Cadastre dois novos clientes com dados diferentes.
INSERT INTO cliente (nome, email, telefone, cidade, ativo) VALUES
('João Guilherme', 'joaogui@email.com', '19 92565-8690', 'Espirito Santo', TRUE),
('Livia Marabesi', 'marabesi@email.com', '19 98723-5467', 'Limeira', FALSE);


-- 2. Cadastre a categoria 'Especiais da Casa'.
INSERT INTO categoria (nome) VALUES
('Promoções')


-- 3. Localize o id da categoria criada e cadastre três produtos nela.
SELECT*FROM categoria

INSERT INTO produto (nome,preco,ativo,id_categoria) VALUES
('Adryan Brigadeiro', 4.50, TRUE, 7);


-- 4. Cadastre um terceiro cliente sem telefone.
INSERT INTO cliente (nome,email,telefone,cidade,ativo) VALUES
('Vinicius Guedes','guedes@email.com', NULL,'Limeira',TRUE);


-- 5. Crie um novo pedido para um dos clientes cadastrados.
INSERT INTO pedido (data_pedido,status,valor_total,id_cliente) VALUES
(NOW(),'PREPARANDO',10.00,23);


-- 6. Use LAST_INSERT_ID() para guardar o id do pedido em @pedido_atividade
--    e insira pelo menos dois itens nesse pedido.
INSERT INTO pedido (data_pedido,status,valor_total,id_cliente) VALUES
(NOW(),'FINALIZADO'15.25,23);
SET @pedido = LAST_INSERT_ID();

--------------------------------------------------------------------------------------------

-- PARTE B - UPDATE

-- 7. Corrija o telefone de um dos clientes criados.
UPDATE cliente
SET telefone = '19996034670'
WHERE id_cliente = 25


-- 8. Altere cidade e telefone de outro cliente em um único UPDATE.
UPDATE cliente
SET telefone = '19 99742-5791',
    cidade = 'São Paulo'
WHERE id_cliente = 24


-- 9. Aumente em 8% o preço dos produtos da categoria 'Especiais da Casa'.
UPDATE produto
SET preco = preco * 1.00
WHERE id_categoria = 5


-- 10. Altere o status do pedido criado para 'PREPARANDO'.
UPDATE pedido
SET status = 'PREPARANDO'
WHERE id_pedido = 4


-- 11. Atualize valor_total do pedido de acordo com os itens cadastrados.
--     Você pode calcular previamente com SELECT SUM(quantidade * preco_unitario).
-- SELECT SUM(quantidade * preco_unitario)
UPDATE item_pedido
SET valor_total = quantidade * preco_unitario
WHERE id_cliente = 1



-- 12. Escolha um dos produtos criados e faça uma exclusão lógica (ativo = FALSE).
UPDATE produto
SET ativo = FALSE
WHERE id_produto = 22

-- PARTE C - DELETE

-- 13. Crie um cliente de teste sem pedidos.
--     Depois localize e exclua apenas esse cliente.
INSERT INTO cliente (nome,email,telefone,cidade,ativo) VALUES
('Bruna Prado','brunapradonails@email.com','1999123-4567','Limeira',TRUE);
SET @cliente = LAST_INSERT_ID()

SELECT*FROM cliente

DELETE FROM cliente
WHERE id_cliente = 14



-- 14. Tente excluir um cliente da base original que possua pedidos.
--     Deixe o DELETE comentado após o teste e descreva o erro abaixo.
-- Resultado observado:




-- 15. Explique em comentário por que a FK bloqueou a exclusão.
-- Resposta:


-- 16. Crie uma categoria temporária chamada 'Excluir Depois' e remova-a.
INSERT INTO categoria (NOME) VALUES


-- PARTE D - INTEGRIDADE E VALIDAÇÃO

-- 17. Tente inserir um produto usando uma categoria inexistente.


-- 18. Tente cadastrar um cliente usando um e-mail que já existe.


-- 19. Tente criar um pedido para um cliente inexistente.


-- 20. Para cada erro, identifique qual restrição foi responsável.


-- PARTE E - DESAFIO COMPLETO

-- 21. Inicie uma transação.


-- 22. Cadastre um cliente, um pedido e dois itens relacionados.


-- 23. Consulte os dados criados através de JOIN.


-- 24. Execute ROLLBACK e prove com SELECT que os novos registros foram desfeitos.


-- 25. Repita o processo e finalize com COMMIT.



-- =========================================================================================
-- CHECKLIST --
-- Consigo inserir uma ou várias linhas.
-- Entendo AUTO_INCREMENT, DEFAULT e NULL. (só não entendo direito a função do AUTO_INCREMENT)
-- Consigo atualizar uma ou várias linhas com segurança.
-- Nunca executo UPDATE ou DELETE sem conferir o WHERE.
-- Consigo manipular registros relacionados.
-- Sei utilizar COMMIT e ROLLBACK como apoio às operações.