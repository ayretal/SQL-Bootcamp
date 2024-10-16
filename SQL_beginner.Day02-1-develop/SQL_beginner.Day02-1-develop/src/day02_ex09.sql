(SELECT name FROM person
WHERE id IN ( 
 SELECT person_id FROM person_order WHERE menu_id IN
  (SELECT id FROM menu WHERE pizza_name = 'pepperoni pizza'))
AND gender = 'female'
ORDER BY name)
INTERSECT
(SELECT name FROM person
WHERE id IN ( 
 SELECT person_id FROM person_order WHERE menu_id IN
  (SELECT id FROM menu WHERE pizza_name = 'cheese pizza'))
AND gender = 'female'
ORDER BY name)