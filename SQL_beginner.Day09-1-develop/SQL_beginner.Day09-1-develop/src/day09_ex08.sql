CREATE 
OR REPLACE FUNCTION func_minimum(VARIADIC arr numeric[]) RETURNS numeric AS $$ 
SELECT 
  min(value) 
FROM 
  unnest(arr) AS t(value);
$$ LANGUAGE SQL;
SELECT 
  func_minimum(
    VARIADIC arr => ARRAY [10.0, -1.0, 5.0, 
    4.4]
  );
CREATE 
OR REPLACE FUNCTION fnc_fibonacci(pstop integer DEFAULT 10) RETURNS TABLE(fib integer) AS $$ WITH RECURSIVE num_fib AS (
  SELECT 
    0 AS current_n, 
    1 AS next_n 
  UNION ALL 
  SELECT 
    next_n AS current_n, 
    current_n + next_n AS next_n 
  FROM 
    num_fib 
  WHERE 
    next_n < pstop
) 
SELECT 
  current_n 
FROM 
  num_fib;
$$ LANGUAGE SQL;
SELECT 
  * 
FROM 
  fnc_fibonacci(100);
SELECT 
  * 
FROM 
  fnc_fibonacci();
