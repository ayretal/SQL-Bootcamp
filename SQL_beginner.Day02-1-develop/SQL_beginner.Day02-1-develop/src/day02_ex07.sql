SELECT 
  pizzeria.name 
FROM 
  person_visits 
  JOIN person ON person_visits.person_id = person.id 
  JOIN menu ON menu.pizzeria_id = person_visits.pizzeria_id 
  JOIN pizzeria ON pizzeria.id = person_visits.pizzeria_id 
WHERE 
  person.name = 'Dmitriy' 
  AND visit_date = '2022-01-08' 
  AND (price < 800)
