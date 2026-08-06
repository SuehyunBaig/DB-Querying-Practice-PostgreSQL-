select e.employee_id, e.department_id
from employee as e left join 
    (select employee_id, count(*) as count from employee group by employee_id) as c
    on e.employee_id = c.employee_id
where e.primary_flag = 'Y' or c.count = 1

-- We want to gather two distinct cases: 1) primary_flag = 'Y', 2) number of department is 1 (only 1 when grouped by employee_id)
-- To achieve this, it would be useful to create a new column called 'count' and let this count be final count of each group as opposed
-- to cumulative count (e.g. if employee_id 2 appears twice, count column will have 2 for all rows that belong to employee_id=2)
-- To add this new column, we can use join, and the other table to be joined should be something with count of each employee_id
-- So we create a table getting the count of incidents by each employee_id using group by and count(*)
-- This subquery is used in the FROM statement of the outer (larger) query
