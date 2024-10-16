--чек уровень изоляци
SHOW TRANSACTION ISOLATION LEVEL;

--режим транзакции 1-й и 2-й сессии 
BEGIN;

--исходник на 1-й и 2-й сессиях
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

--обнова на 1-й сессии 


--обнова на 2-й сессии 
UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut';

--публикуем в 1-й сессии
COMMIT;

--публикуем в 2-й сессии
COMMIT;

--смотрим, что в итоге в 1-й и во 2-й
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';