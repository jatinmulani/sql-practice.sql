-- Create Database
CREATE DATABASE jatin;

-- Use Database
USE jatin;

-- Create employees table
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    dept_id INT
);

-- Create departments table
CREATE TABLE departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50)
);

-- Insert data into employees
INSERT INTO employees (emp_id, emp_name, dept_id) VALUES
(1, 'Alice', 10),
(2, 'Bob', 20),
(3, 'Charlie', 30),
(4, 'Diana', 10),
(5, 'Edward', NULL);

-- Insert data into departments
INSERT INTO departments (dept_id, dept_name) VALUES
(10, 'HR'),
(20, 'IT'),
(40, 'Finance');
select e.emp_name,d.dept_name,d.dept_id,e.dept_id from departments as d inner join employees as e on d.dept_id=e.dept_id;
select d.dept_id,e.emp_name,d.dept_name from departments as d inner join employees as e on d.dept_id=e.dept_id where e.emp_name='Alice';
select d.dept_id,e.emp_name,d.dept_name from departments as d inner join employees as e on d.dept_id=e.dept_id where e.emp_name='Bob';
select e.dept_id,e.emp_name from departments as d right join employees as e on d.dept_id=e.dept_id where e.emp_name='Charlie';
select d.dept_id,e.emp_name,d.dept_name from departments as d inner join employees as e on d.dept_id=e.dept_id where e.emp_name='Diana';
select d.dept_id,e.emp_name,d.dept_name from departments as d inner join employees as e on d.dept_id=e.dept_id where e.emp_name='Edward';
select d.dept_id,e.emp_name,d.dept_name from departments as d inner join employees as e on d.dept_id=e.dept_id where d.dept_name='finance';
select e.emp_name, d.dept_id,d.dept_name from employees as e left join departments as d on e.dept_id=d.dept_id where e.emp_name='alice';
select d.dept_name,d.dept_id from employees as  e right join departments as  d on  e.dept_id=d.dept_id;

select d.dept_name,d.dept_id,e.emp_name from employees as  e right join
departments as  d on e.dept_id=d.dept_id where emp_name in('alice','diana');
select e.emp_name from employees as e join departments as d on e.dept_id=d.dept_id;
select e.emp_name,d.dept_name from employees as e inner join departments as d on e.dept_id=d.dept_id;
CREATE TABLE employes (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50),
    manager_id INT,
    FOREIGN KEY (manager_id) REFERENCES employees(emp_id)
);
INSERT INTO employes (emp_id, emp_name, manager_id) VALUES
(1, 'Alice', 3),
(2, 'Bob', 3),
(3, 'Charlie', NULL),
(4, 'Diana', 1),
(5, 'Edward', 1);
SELECT e.emp_name AS Employee, m.emp_name AS Manager
FROM employes e
 JOIN employes m ON e.manager_id = m.emp_id;
 select e.emp_name,m.emp_id from employes as e join employes as m on e.manager_id=m.emp_id;
 select e.emp_name,m.emp_id,e.emp_id,m.emp_name from employes as e join employes as m on e.manager_id=m.emp_id where e.emp_name='alice';
  select e.emp_name,m.emp_id AS M_ID ,e.emp_id,m.emp_name from employes as e left join employes as m on 
  e.manager_id=m.emp_id where e.emp_name='charlie';
  SELECT e.emp_name AS Employes,
       m.emp_name AS Manager
FROM employes e
JOIN employes m
  ON e.manager_id = m.emp_id
WHERE m.emp_name = 'Alice';
  select d.dept_name,count(emp_id) from employees as e  right join departments as d on e.dept_id=d.dept_id group by d.dept_name;
  
--   Display each employee's name along with their manager's name. Employees with no
-- manager should show 'No Manager'.
select e.emp_name,m.emp_name from employes as  e  left join employes as m on e.manager_id=m.emp_id;
