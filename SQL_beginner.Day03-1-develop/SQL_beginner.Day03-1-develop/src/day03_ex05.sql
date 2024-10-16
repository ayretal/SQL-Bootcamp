SELECT pizzeria_name FROM
(
(SELECT DISTINCT pizzeria.name AS pizzeria_name
 FROM person_visits
 FULL JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
 FULL JOIN person ON person_visits.person_id = person.id
 WHERE person.name = 'Andrey' )
EXCEPT 
(SELECT DISTINCT pizzeria.name AS pizzeria_name
 FROM person
 INNER JOIN person_order ON person.id = person_order.person_id
 INNER JOIN menu ON person_order.menu_id = menu.id
 INNER JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
 WHERE person.name = 'Andrey')
)
AS q1
ORDER BY pizzeria_name