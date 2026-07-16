SELECT
    (SELECT DISTINCT salary
     FROM employee
     ORDER BY salary DESC
     LIMIT 1 OFFSET 1) AS SecondHighestSalary

-- The question asks to return one row with value 'null' when there is no second highest salary
-- Filtering with where statement will result in 0 row in edge cases (e.g. all employees have the same salary)
-- Therefore, we should approach this with a scalar subquery, which always returns one value (including null)
