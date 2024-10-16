CREATE VIEW v_price_with_discount AS (
SELECT person.name AS person_name, menu.pizza_name AS pizza_name, menu.price AS real_price, ROUND(menu.price*0.9, 0) AS discount_price
FROM person_order
JOIN person ON person_order.person_id = person.id
JOIN menu ON menu.id = person_order.menu_id
ORDER BY person_name, pizza_name
)