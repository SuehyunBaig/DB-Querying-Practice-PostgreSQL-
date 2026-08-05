select coalesce(e.employee_id, s.employee_id) as employee_id
from employees as e full join salaries as s on e.employee_id = s.employee_id
where (e.name is null) or (s.salary is null)
order by coalesce(e.employee_id, s.employee_id)

-- left join | right join | full join | join (= inner join)
-- when doing a full join, make sure to use COALESCE to refer to the key column
