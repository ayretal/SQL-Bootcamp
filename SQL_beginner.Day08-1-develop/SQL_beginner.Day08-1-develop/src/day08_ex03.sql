--уровень изоляции READ COMMITTED
SET SESSION CHARACTERISTICS AS TRANSACTION ISOLATION LEVEL READ COMMITTED;

--режим транзакции 1-й и 2-й сессии
BEGIN;

--проверяем данные в 1-й 
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';   

--изменяем данные во 2-й
UPDATE pizzeria SET rating = '3.6' WHERE name = 'Pizza Hut';

--публикуем данные в 2-й
COMMIT;

--проверяем данные в 1-й 
SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; 

--публикуем данные 1-й сессии
COMMIT;

--проверяем исходные данные 
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';