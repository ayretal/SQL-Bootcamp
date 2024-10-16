--меняем изоляцию
SET SESSION CHARACTERISTICS AS TRANSACTION ISOLATION LEVEL REPEATABLE READ;

--запуск транзакции
BEGIN;

--смотрим сумму в 1-й сессии
SELECT SUM(rating) FROM pizzeria; 

--вставка во 2-й сессии
INSERT INTO pizzeria (id, name, rating) VALUES (11, 'Kazan Pizza ', 4);

--обновляем во 2-й сессии
COMMIT;

--смотрим сумму рейтинга в 1-й сессии
SELECT SUM(rating) FROM pizzeria;

--выходим из режима транзакции в 1-я сессии
COMMIT;

--смотрим сумму рейтинга в 1-й и в 2-й сессии 
SELECT SUM(rating) FROM pizzeria;