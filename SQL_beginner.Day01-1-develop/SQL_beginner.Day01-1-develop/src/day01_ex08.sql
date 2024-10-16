SELECT 
  po.order_date, 
  CONCAT(p.name, ' (age:', age, ')') AS person_information 
FROM 
  person_order as po (
    primary_id, id, menu_id, order_date
  )
NATURAL JOIN person as p
ORDER BY 
  order_date ASC, 
  person_information ASC
