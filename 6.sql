create database ctedb;
use ctedb;

CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    manager_id INT
);

INSERT INTO employees (emp_id, emp_name, manager_id) VALUES
(1, 'CEO', NULL),
(2, 'Manager A', 1),
(3, 'Manager B', 1),
(4, 'Team Lead A1', 2),
(5, 'Team Lead A2', 2),
(6, 'Developer A1', 4),
(7, 'Developer A2', 4),
(8, 'Developer B1', 3);
select*from employees;
select*from employees where manager_id is null;

select t1.emp_name,t1.emp_id,st1.manager_id,st1.emp_name from employees as t1 join employees as
 st1 on t1.manager_id=st1.emp_id ;
 
with cte as
(select emp_id,emp_name,manager_id,emp_name as hierachy from employees where manager_id is null)

select e1.emp_id,e1.emp_name,e1.manager_id,cte.emp_id,cte.emp_name,
concat(e1.emp_name,'->',cte.hierachy)
from cte join employees as e1
where (e1.manager_id=cte.emp_id and e1.emp_id=2);

with recursive cte as
(select emp_id,emp_name,manager_id,emp_name as hierachy from employees where manager_id is null  # base case 
union all
select e1.emp_id,e1.emp_name,e1.manager_id,concat(e1.emp_name,'->',cte.hierachy) as hierachy 
from employees as e1 join cte  where  e1.manager_id=cte.emp_id)
select*from cte;
-- learning assigment 
-- what is tcl commit ,rollback and star trasection
-- drop v/s delete v/s truncate
-- what is normalisation 1nf and 2nf and 3nf and bcnf     
