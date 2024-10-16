WITH male_q AS (SELECT pizzeria.name, COUNT(person_id) AS count_m
FROM
	person_visits
FULL JOIN person ON person.id = person_visits.person_id
FULL JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id

WHERE gender = 'male'
GROUP BY pizzeria.name
ORDER BY count_m DESC
),

female_q AS (SELECT pizzeria.name, COUNT(person_id) AS count_f
FROM
	person_visits
FULL JOIN person ON person.id = person_visits.person_id
FULL JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id

WHERE gender = 'female'
GROUP BY pizzeria.name
ORDER BY count_f DESC
)


SELECT female_q.name AS pizzeria_name FROM male_q JOIN female_q ON female_q.name = male_q.name
WHERE count_m != count_f
ORDER BY female_q