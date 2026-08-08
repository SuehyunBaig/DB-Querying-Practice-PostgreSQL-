select d.name as Department, a.name as Employee, a.salary as Salary
from (select name, salary, departmentid 
      from (select e.*, dense_rank() over (partition by departmentid order by salary desc) as rank
            from employee as e)
      where rank <= 3) as a
      left join department as d on a.departmentid = d.id

-- key syntax!
-- rank()/dense_rank() over (partition by [column name] order by [column name] asc/desc) as rank: creates a new variable "rank"
