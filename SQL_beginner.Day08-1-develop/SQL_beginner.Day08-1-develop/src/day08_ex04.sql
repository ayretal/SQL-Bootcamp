--меняем уровень изол
SET SESSION CHARACTERISTICS AS TRANSACTION ISOLATION LEVEL SERIALIZABLE;

--запуск транзакции 
BEGIN;

-- исходные данные в 1-й
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';   

--изменяем во 2-й сессии
UPDATE pizzeria SET rating = 3.0 WHERE name = 'Pizza Hut';

--публикуем в 2-й сессии
COMMIT;

--проверяем данные в 1-й
SELECT * FROM pizzeria WHERE name = 'Pizza Hut'; 

--выход из транзакции
COMMIT;

--проверяем данные в 1-й и 2-й сессии
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';