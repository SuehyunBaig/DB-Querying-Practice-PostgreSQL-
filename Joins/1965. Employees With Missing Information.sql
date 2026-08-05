select coalesce(e.employee_id, s.employee_id) as employee_id
from employees as e full join salaries as s on e.employee_id = s.employee_id
where (e.name is null) or (s.salary is null)
order by coalesce(e.employee_id, s.employee_id)
