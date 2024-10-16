SELECT 
  name 
FROM 
  person 
  JOIN person_order ON person.id = person_order.person_id 
  JOIN menu ON menu.id = menu_id 
WHERE 
  address IN ('Moscow', 'Samara') 
  AND pizza_name IN (
    'pepperoni pizza', 'mushroom pizza'
  ) 
  AND gender = 'male' 
ORDER BY 
  person.name DESC
