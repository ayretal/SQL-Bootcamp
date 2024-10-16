CREATE TABLE roads
	(ID bigint primary key,
	Root1 varchar not null ,
 	Root2 varchar not null ,
 	Road_cost int not null);

INSERT INTO roads VALUES (1, 'A', 'B', 10);
INSERT INTO roads VALUES (2, 'B', 'A', 10);
INSERT INTO roads VALUES (3, 'A', 'D', 20);
INSERT INTO roads VALUES (4, 'D', 'A', 20);
INSERT INTO roads VALUES (5, 'A', 'C', 15);
INSERT INTO roads VALUES (6, 'C', 'A', 15);
INSERT INTO roads VALUES (7, 'B', 'C', 35);
INSERT INTO roads VALUES (8, 'C', 'B', 35);
INSERT INTO roads VALUES (9, 'D', 'B', 25);
INSERT INTO roads VALUES (10, 'B', 'D', 25);
INSERT INTO roads VALUES (11, 'D', 'C', 30);
INSERT INTO roads VALUES (12, 'C', 'D', 30);

CREATE VIEW total_sum_view (total_cost, tour) AS
(
WITH RECURSIVE tour_cost AS (
    SELECT roads.Root1 AS tour,
           roads.Root1,
           roads.Root2,
           roads.Road_cost,
           roads.Road_cost  AS summ
    FROM roads
    WHERE roads.Root1 = 'A'
    UNION ALL
    SELECT parrent.tour || ',' || children.Root1 AS tour,
           children.Root1,
           children.Root2,
           parrent.Road_cost,
           parrent.summ + children.Road_cost AS summ
    FROM roads AS children
             JOIN tour_cost AS parrent ON children.Root1 = parrent.Root2
    WHERE parrent.tour NOT LIKE '%' || children.Root1 || '%'
)
SELECT tour_cost.summ AS total_cost,
       '{' || tour_cost.tour || ',A}' AS tour
FROM tour_cost
WHERE tour_cost.Root2 = 'A' AND length(tour_cost.tour) = 7
);
SELECT * FROM total_sum_view WHERE total_cost IN (SELECT MIN(total_cost) FROM total_sum_view)
ORDER BY total_cost,tour;

