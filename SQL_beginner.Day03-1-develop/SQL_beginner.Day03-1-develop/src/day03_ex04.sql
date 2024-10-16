WITH visits AS (
  SELECT 
    person.name, 
    person.gender, 
    person.id AS person_id, 
    pizzeria.name AS pizzeria_name, 
    menu.pizza_name 
  FROM 
    person FULL 
    JOIN person_order ON person_order.person_id = person.id FULL 
    JOIN menu ON menu.id = person_order.menu_id 
    LEFT JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
), 
women AS (
  SELECT 
    pizzeria_name, 
    COUNT(person_id) AS count_f 
  FROM 
    visits 
  WHERE 
    gender = 'female' 
  GROUP BY 
    pizzeria_name 
  ORDER BY 
    count_f DESC
), 
men AS (
  SELECT 
    pizzeria_name, 
    COUNT(person_id) AS count_m 
  FROM 
    visits 
  WHERE 
    gender = 'male' 
  GROUP BY 
    pizzeria_name 
  ORDER BY 
    count_m DESC
) 
SELECT 
  pizzeria_name 
FROM 
  (
    (
      SELECT 
        pizzeria_name 
      FROM 
        women 
      WHERE 
        pizzeria_name NOT IN (
          SELECT 
            pizzeria_name 
          FROM 
            men
        )
    ) 
    UNION 
      (
        SELECT 
          pizzeria_name 
        FROM 
          men 
        WHERE 
          pizzeria_name NOT IN (
            SELECT 
              pizzeria_name 
            FROM 
              women
          )
      )
  ) as sasha 
ORDER BY 
  pizzeria_name
