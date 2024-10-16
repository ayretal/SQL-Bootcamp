SELECT 
  order_date, 
  CONCAT(name, ' (age:', age, ')') AS person_information 
FROM 
  person 
  INNER JOIN person_order ON person.id = person_order.person_id 
ORDER BY 
  order_date ASC, 
  person_information ASC
