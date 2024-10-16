--запуск транзакции
BEGIN;

-- еняем рейтинг пицерии с id = 1
UPDATE pizzeria SET rating = '0' WHERE id = 1;

--меняем рейтинг пицерии с id = 2
UPDATE pizzeria SET rating = '0' WHERE id = 2;

--меняем рейтинг пицерии с id = 2
UPDATE pizzeria SET rating = '1' WHERE id = 2;

--меняем рейтинг пицерии с id = 1 + ловим deadlock
UPDATE pizzeria SET rating = '1' WHERE id = 1;

-- 1-й а потом 2-й сессии
COMMIT;