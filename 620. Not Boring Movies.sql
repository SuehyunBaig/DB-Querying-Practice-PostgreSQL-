-- solution 1: using modulo operator %
SELECT *
FROM cinema
WHERE id%2 = 1 AND description != 'boring'
ORDER BY rating DESC;

-- solution 2: using mod() function
SELECT *
FROM cinema
WHERE mod(id,2) = 1 AND description != 'boring'
ORDER BY rating DESC;
