SELECT * FROM total_sum_view
WHERE total_cost IN ((SELECT MIN(total_cost) FROM total_sum_view), (SELECT MAX(total_cost) FROM total_sum_view))
ORDER BY total_cost ,tour;


