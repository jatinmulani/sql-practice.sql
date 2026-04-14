create database tabledbs;
use tabledbs;
CREATE TABLE departments ( 
    department_id   INT          PRIMARY KEY, 
    department_name VARCHAR(100) NOT NULL, 
    location_id     INT, 
    budget          DECIMAL(12,2) 
); 
  
INSERT INTO departments VALUES 
(1,'Engineering',101,2000000), 
(2,'Finance',    102, 800000), 
(3,'Sales',      103,1200000), 
(4,'HR',         104, 600000);
CREATE TABLE employees ( 
    employee_id   INT           PRIMARY KEY, 
    first_name    VARCHAR(50)   NOT NULL, 
    last_name     VARCHAR(50)   NOT NULL, 
    department_id INT           REFERENCES departments(department_id), 
    manager_id    INT           REFERENCES employees(employee_id), 
    salary        DECIMAL(10,2) NOT NULL, 
    hire_date     DATE          NOT NULL, 
    job_title     VARCHAR(100) 
); 
  
INSERT INTO employees VALUES 
(1, 'Alice','Johnson',1,NULL,  120000,'2018-01-15','CTO'), 
(2, 'Bob',  'Kumar',  1,1,      72000,'2019-03-01','Sr. Engineer'), 
(3, 'Carol','Singh',  2,1,      95000,'2019-06-01','Finance Lead'), 
(4, 'David','Patel',  1,2,      98000,'2020-05-20','Engineer'), 
(5, 'Emma', 'Williams',2,3,    85000,'2020-08-10','Analyst'), 
(6, 'Frank','Miller', 1,2,      65000,'2023-11-05','Junior Eng'), 
(7, 'Grace','Lee',    2,3,      78000,'2023-09-20','Sr. Analyst'), 
(8, 'Henry','Brown',  3,1,      82000,'2024-01-15','Sales Lead'), 
(9, 'Ivy',  'Chen',   3,8,      76000,'2022-07-11','Account Mgr'), 
(10,'James','Wilson', 4,1,      92000,'2021-03-25','HR Director'); 
  -- ── projects ─────────────────────────────────────────── 
CREATE TABLE projects ( 
    project_id   INT           PRIMARY KEY, 
    project_name VARCHAR(200)  NOT NULL, 
    start_date   DATE          NOT NULL, 
    end_date     DATE, 
    budget       DECIMAL(12,2), 
    lead_emp_id  INT           REFERENCES employees(employee_id) 
); 
  
INSERT INTO projects VALUES 
(1,'Data Platform Rebuild','2023-01-01','2023-12-31',500000,1), 
(2,'CRM Migration',        '2023-06-01', NULL,       320000,8), 
(3,'Finance Automation',   '2024-01-01','2024-09-30',180000,3); 
  -- ── employee_projects ────────────────────────────────── 
CREATE TABLE employee_projects ( 
    employee_id   INT REFERENCES employees(employee_id), 
    project_id    INT REFERENCES projects(project_id), 
    role          VARCHAR(100), 
    assigned_date DATE NOT NULL, 
    PRIMARY KEY (employee_id, project_id) 
); 
  
INSERT INTO employee_projects VALUES 
(1,1,'Architect',  '2023-01-01'), 
(2,1,'Developer',  '2023-01-15'), 
(4,1,'Developer',  '2023-02-01'), 
(8,2,'Lead',       '2023-06-01'), 
(9,2,'Coordinator','2023-07-01'), 
(3,3,'Lead',       '2024-01-01'), 
(5,3,'Analyst',    '2024-01-15');
show tables;
select*from employees;
select*from departments;
select concat(first_name,last_name) as emp_name ,department_name,salary from employees as e  where salary 
>(select sum(salary) from employees as e2 join departments as d on d.dept_id=e2.dept_id where
 department_name='sales');
