-- Subquery in SQL - Detailed Learning Material
-- Table creation for practice
create database if not exists sub_db;
use sub_db;

DROP TABLE IF EXISTS DEPARTMENTS;

CREATE TABLE DEPARTMENTS (
    DEPT_ID    INT          NOT NULL AUTO_INCREMENT,
    DEPT_NAME  VARCHAR(50)  NOT NULL,
    LOCATION   VARCHAR(100) NOT NULL,
    PRIMARY KEY (DEPT_ID)
);


INSERT INTO DEPARTMENTS (DEPT_NAME, LOCATION) VALUES
    ('HR',      'Mumbai'),
    ('IT',      'Bangalore'),
    ('Finance', 'Delhi');


DROP TABLE IF EXISTS EMPLOYEES;

CREATE TABLE EMPLOYEES (
    EMP_ID      INT          NOT NULL,
    NAME        VARCHAR(100) NOT NULL,
    DEPARTMENT  VARCHAR(50)  NOT NULL,
    SALARY      DECIMAL(10,2) NOT NULL,
    MANAGER_ID  INT          NULL,
    PRIMARY KEY (EMP_ID),
    FOREIGN KEY (MANAGER_ID) REFERENCES EMPLOYEES(EMP_ID)
);


INSERT INTO EMPLOYEES (EMP_ID, NAME, DEPARTMENT, SALARY, MANAGER_ID) VALUES
    (101, 'Alice',   'HR',      50000.00, NULL),
    (104, 'Diana',   'Finance', 90000.00, NULL);

-- Employees who report to Alice (101) or Diana (104)
INSERT INTO EMPLOYEES (EMP_ID, NAME, DEPARTMENT, SALARY, MANAGER_ID)
VALUES
    (102, 'Bob',     'IT',      80000.00, 101),
    (103, 'Charlie', 'IT',      75000.00, 101),
    (105, 'Eve',     'HR',      48000.00, 101),
    (106, 'Frank',   'Finance', 95000.00, 104),
    (107, 'Grace',   'IT',      82000.00, 101);


SELECT * FROM DEPARTMENTS;
SELECT * FROM EMPLOYEES;
SELECT * FROM EMPLOYEES ORDER BY EMP_ID;
select name,salary from employees where salary>(select avg(salary) from employees);
select name from employees where  name <> 'bob' and department=(select department from employees where name='bob');
select  name from employees where salary in (select salary from employees where department='hr');
select name from employees as e  where salary>(select avg(salary) from employees as a  
where e.department=a.department );
select name,salary from employees as e  where salary in (select min(salary) from employees as a  
where e.department=a.department );
use sakila;
show tables;
select*from payment;
with cte as
(select*,dense_rank()over(order by amount) as rnk from payment)
select *from cte where rnk=2;
select * from payment where amount= (select  min(amount)from payment  where amount>(select min(amount) as m  from payment  ) );
select min(amount) from payment;
select*,department from employees;
select*from employees;
select  max(salary)from employees  as e  where e.salary<(select max(s.salary)
 from employees as s where e.department=s.department);
 -- isme max(Salary) k saath department bi aaeyga bcz of it can not give values 
 select  max(salary),department from employees  as e  where e.salary<(select max(s.salary)
 from employees as s where e.department=s.department) group by department;
 
 select  e.salary from employees as  e where e.salary=(select max(salary) from employees as s where e.department=s.department);
 
 
 
