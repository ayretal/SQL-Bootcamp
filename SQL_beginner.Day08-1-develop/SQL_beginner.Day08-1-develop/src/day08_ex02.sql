--устанавливаем уровень изоляции в сессиях
SET SESSION CHARACTERISTICS AS TRANSACTION ISOLATION LEVEL REPEATABLE READ;

--запуск транзакции
BEGIN;

--проверяем данные сессиях
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

--данные 1-ой сессии
UPDATE pizzeria SET rating = 4 WHERE name = 'Pizza Hut';

--данные 2-й сессии
UPDATE pizzeria SET rating = 3.6 WHERE name = 'Pizza Hut';

--данные 1-й сессии
COMMIT;

--"Аномалия потерянного обновления"
COMMIT;

--проверяем исходные данные 
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';