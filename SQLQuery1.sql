
--PROJECT STATUS
with project_status as(
select 
project_id,
project_name,
project_budget,
'upcoming' as status
from upcoming_projects
union all
select 
project_id,
project_name,
project_budget,
'completed' as status
from completed_projects)


--MAIN TABLE
select
E.employee_id,
E.first_name,
E.last_name,
E.job_title,
E.salary,
D.Department_Name,
D.Department_Budget,
PA.project_id,
P.project_name,
P.status
from employees E
join departments D
on E.department_id = D.Department_ID
join project_assignments PA
on PA.employee_id = E.employee_id
join project_status P
on P.project_id = PA.project_id