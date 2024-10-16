WITH calc_discount AS (
  SELECT 
    person_order.person_id, 
    menu.pizzeria_id, 
    CASE WHEN (
      COUNT(menu.pizzeria_id) = 1
    ) THEN 10.5 WHEN (
      COUNT(menu.pizzeria_id) = 2
    ) THEN 22 ELSE 30 END AS discount 
  FROM 
    person_order
    JOIN menu ON person_order.menu_id = menu.id 
  GROUP BY 
    person_id, 
    pizzeria_id 
  ORDER BY 
person_order.person_id, 
    menu.pizzeria_id
) INSERT INTO person_discounts (
  id, person_id, pizzeria_id, discount
) 
SELECT 
  ROW_NUMBER() OVER () AS id, 
  person_id, 
  pizzeria_id, 
  discount 
FROM 
  calc_discount;    1, 
    2
