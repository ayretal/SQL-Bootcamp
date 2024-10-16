SELECT DISTINCT person_id FROM person_visits
WHERE visit_date BETWEEN '22.01.06' AND '22.01.09'
OR pizzeria_id = 2
ORDER BY person_id DESC