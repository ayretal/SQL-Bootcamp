WITH n_a AS (
  SELECT 
    name AS person_name1, 
    address AS common_address, 
    id AS id_1 
  FROM 
    person
) 
SELECT 
  person_name1, 
  person.name AS person_name2, 
  common_address 
FROM 
  n_a 
  INNER JOIN person ON address = common_address 
WHERE 
  n_a.id_1 > id 
ORDER BY 
  person_name1, 
  person_name2, 
  common_address