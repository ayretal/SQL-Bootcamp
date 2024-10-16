WITH query_1 AS (
  SELECT 
    menu.pizza_name, 
    pizzeria.name, 
    menu.price, 
    pizzeria.id 
  FROM 
    menu 
    JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
)
SELECT 
  query_2.pizza_name, 
  query_2.name AS pizzeria_name_1, 
  query_1.name AS pizzeria_name_2, 
  query_2.price 
FROM 
  (
    SELECT 
      * 
    FROM 
      query_1
  ) AS query_2 
  JOIN query_1 ON query_2.price = query_1.price 
  AND query_2.pizza_name = query_1.pizza_name 
  AND query_2.id > query_1.id 
ORDER BY 
  pizza_name;
