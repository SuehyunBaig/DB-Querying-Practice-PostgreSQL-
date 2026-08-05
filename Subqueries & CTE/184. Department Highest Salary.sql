select a.name as Department, b.name as Employee, a.salary as Salary
from (select e.departmentid, d.name, max(e.salary) as salary from employee as e left join department as d on e.departmentId = d.id group by e.departmentId, d.name) as a
    left join employee as b 
    on a.departmentid = b.departmentid and a.salary = b.salary


-- Initial approach was joining -> grouping -> max(salary) in select statement
-- However, this cannot capture ties in the highest salary and  we cannot print employee names (since we must use that in group by, making it impossible to get the max salaryby dept.)

-- Change of approach: get the highest salary by department and then match employees with coinciding department and slaary (this allows multiple rows for identical dept and salary)
-- This means using a subquery in FROM statement (as one of the tables for join)
