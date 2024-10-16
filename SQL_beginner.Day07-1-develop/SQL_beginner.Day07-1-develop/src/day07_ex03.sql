WITH actions AS (
  SELECT 
    pizzeria.name, 
    COUNT(pizzeria_id) AS total_count 
  FROM 
    person_visits
    JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id 
  GROUP BY 
    pizzeria.name
  UNION ALL 
  SELECT 
    pizzeria.name, 
    COUNT(pizzeria.name) AS total_count 
  FROM 
    person_order
    JOIN menu ON person_order.menu_id = menu.id 
    JOIN pizzeria ON menu.pizzeria_id = pizzeria.id 
  GROUP BY 
    pizzeria.name
) 
SELECT 
  name, 
  sum(total_count) AS total_count 
FROM 
  actions 
GROUP BY 
  name 
ORDER BY 
  total_count DESC, 
  name ASC
