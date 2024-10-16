--входим в базу данных в терминалах
psql DO8 

-- режим транзакции 1-й сессии
BEGIN;

--обновляем
UPDATE pizzeria SET rating = 5 WHERE name = 'Pizza Hut';
 
--проверяем 2-ю сессию
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

--публикуем изменения
COMMIT;

--проверяем 2-ю сессию
SELECT * FROM pizzeria WHERE name = 'Pizza Hut';
