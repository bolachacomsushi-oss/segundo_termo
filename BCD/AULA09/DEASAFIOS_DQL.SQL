-- Active: 1788351689620@@127.0.0.1@3306@smartcoffee_dml_beatriz
-- ============================================================
-- AULA 09 - ATIVIDADE PRÁTICA DE DQL
-- Nome: Beatriz Barroa de Sousa
-- Turma: 2-Devie Data: 07/10/2026(meu birthday!)
-- Base: smartcoffee_dml_beatriz
-- ============================================================
USE smartcoffee_dml_beatriz;

-- PARTE A - AQUECIMENTO

-- 1. Liste todos os clientes cadastrados.
SELECT * FROM CLIENTE


-- 2. Exiba apenas nome, cidade e e-mail dos clientes.
SELECT nome, cidade, email FROM cliente

-- 3. Liste os nomes das cidades sem repetir valores.
SELECT DISTINCT CIDADE
FROM CLIENTE

-- 4. Liste todos os produtos em ordem crescente de preço.
SELECT NOME, PRECO
FROM produto
ORDER BY PRECO ASC

-- 5. Mostre apenas os 5 produtos mais caros.
SELECT NOME, PRECO
FROM produto
LIMIT 5 OFFSET 5

------------------------------------------------------------------------------------------------
-- PARTE B - FILTROS

-- 6. Liste os produtos com preço entre R$ 8,00 e R$ 15,00.
SELECT nome, preco
FROM produto
WHERE preco >= 8.00 AND preco <= 15.00

-- 7. Liste os clientes das cidades Limeira ou Americana.
SELECT NOME, CIDADE
FROM cliente
WHERE cidade = 'Limeira' OR cidade = 'Piracicaba'

-- 8. Localize os produtos cujo nome contém a palavra “Café”.
SELECT nome
FROM produto
WHERE nome LIKE 'Café%'

-- 9. Liste os clientes que não informaram telefone.
SELECT NOME, TELEFONE
FROM cliente
WHERE TELEFONE IS NULL

-- 10. Mostre os pedidos FINALIZADOS com valor acima de R$ 20,00,
--     do maior para o menor valor.
SELECT id_pedido, status, valor_total
FROM pedido
WHERE valor_total >= 25.00 AND status = 'FINALIZADO'

------------------------------------------------------------------------------------------------

-- PARTE C - CÁLCULOS E AGRUPAMENTOS

-- 11. Informe quantos produtos estão cadastrados.


-- 12. Mostre menor preço, maior preço e preço médio dos produtos.


-- 13. Informe quantos clientes existem em cada cidade.
SELECT CIDADE, COUNT(*) AS QTDE_CIDADES
FROM cliente
GROUP BY cidade;

-- 14. Mostre somente as cidades que possuem dois ou mais clientes.


-- 15. Calcule o faturamento total considerando apenas pedidos FINALIZADOS.
SELECT SUM(VALOR_TOTAL) AS FATURAMENTO_MENSAL
FROM pedido
WHERE STATUS = 'FINALIZADO'