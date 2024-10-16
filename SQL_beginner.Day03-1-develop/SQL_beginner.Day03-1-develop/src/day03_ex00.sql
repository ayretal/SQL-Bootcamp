SELECT 
  menu.pizza_name AS pizza_name, 
  price, 
  pizzeria.name AS pizzeria_name, 
  visit_date 
FROM 
  person_visits FULL 
  JOIN person ON person.id = person_visits.person_id 
  AND person.name = 'Kate' FULL 
  JOIN pizzeria ON pizzeria.id = person_visits.pizzeria_id 
  JOIN menu ON pizzeria.id = menu.pizzeria_id 
WHERE 
  person.name = 'Kate' 
  AND menu.price BETWEEN 800 
  AND 1000 
ORDER BY 
  menu.pizza_name, 
  price, 
  pizzeria_name, 
  visit_date
