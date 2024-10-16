--меняем изоляцию
SET SESSION CHARACTERISTICS AS TRANSACTION ISOLATION LEVEL READ COMMITTED;

--запуск транзакцию
BEGIN;

--смотрим сумму рейтинга в 1-й сессии
SELECT SUM(rating) FROM pizzeria;

--выполняем вставку во 2-й сессии
INSERT INTO pizzeria (id, name, rating) VALUES (10, 'Kazan Pizza',5);

--обновляем во 2-й сессии
COMMIT;

--смотрим сумму рейтинга в 1-й сессии
SELECT SUM(rating) FROM pizzeria;

--выходим из транзакции в 1-я сессии
COMMIT;

--смотрим сумму в 1-й и в 2-й сессии 
SELECT SUM(rating) FROM pizzeria;