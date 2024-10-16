WITH history_orders AS (
  SELECT 
    person.name, 
    menu.pizza_name, 
    menu.price, 
    round(
      (
        menu.price * (
          (100 - person_discounts.discount) / 100
        )
      )
    ) AS discount_price, 
    pizzeria.name AS pizzeria_name 
  FROM 
    person_order 
    JOIN person ON person.id = person_order.person_id 
    JOIN menu ON person_order.menu_id = menu.id 
    JOIN pizzeria ON menu.pizzeria_id = pizzeria.id 
    JOIN person_discounts ON (
      person_order.person_id = person_discounts.person_id 
      AND pizzeria.id = person_discounts.pizzeria_id
    )
) 
SELECT 
  * 
FROM 
  history_orders 
ORDER BY 
  1, 
  2;
