SELECT 
  new_q.name 
FROM 
  (
    SELECT 
      name, 
      COUNT(person_id) AS count 
    FROM 
      pizzeria 
      LEFT JOIN person_visits ON pizzeria.id = person_visits.pizzeria_id 
    GROUP BY 
      pizzeria.name
  ) AS new_q
 WHERE new_q.count IN (0)



SELECT 
  name 
FROM 
  pizzeria 
  LEFT JOIN person_visits ON pizzeria.id = person_visits.pizzeria_id 
WHERE 
  NOT EXISTS (
    SELECT 
      person_visits.person_id 
    FROM 
      person_visits 
    WHERE 
      pizzeria.id = person_visits.pizzeria_id
  )


