SELECT
    CASE
        WHEN id = MAX(id) OVER () AND mod(id,2)=1 THEN id
        WHEN mod(id,2)=1 THEN id+1
        ELSE id-1
    END AS id,
    student
FROM seat
ORDER BY id;

-- used window function (OVER ()) since MAX itself is an aggregate function and need a GROUP BY 
-- since the parentheses have a blank space, it refers to the whole table without filtering or changing the order of rows
-- id in the ORDER BY clause is executed after SELECT clause, so the table is sorted by the newly created 'id' instead of the original one
-- ASC is default for ORDER BY (could be omitted)
