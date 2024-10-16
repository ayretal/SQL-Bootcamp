(SELECT name AS object_name FROM person ORDER BY object_name)

UNION ALL

(SELECT pizza_name AS object_name FROM menu order by object_name)