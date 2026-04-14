-- comman table expression
use regex2;
with test as 
(select  dept,avg(salary) as avgsalary from employee group by dept)
select e.name,e.dept,e.salary,t.avgsalary from employee as e join test as t where t.dept=e.dept and e.salary>t.avgsalary;
select max(salary) from employee  where salary<(select  max(salary) from employee);
with cte as
(select*,dense_rank() over(order by salary desc) as rnk from employee)
select *from cte where rnk=2;


