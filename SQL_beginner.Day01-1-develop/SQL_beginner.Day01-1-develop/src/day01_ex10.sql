SELECT person.name 			AS person_name,
		m.pizza_name	AS pizza_name,
		pz.name	        AS pizzeria_name
FROM person
    JOIN person_order ON person.id = person_order.person_id
    JOIN menu m ON person_order.menu_id=m.id
    JOIN pizzeria pz ON m.pizzeria_id=pz.id
ORDER BY person_name, 
        pizza_name, 
        pizzeria_name