-- 31st march

-- STEP 1: Create practice database
CREATE DATABASE index_demo;
USE index_demo;

-- STEP 2: Create the employees table (NO indexes yet, except Primary Key)
CREATE TABLE employees (
    emp_id     INT PRIMARY KEY AUTO_INCREMENT,
    emp_name   VARCHAR(100) NOT NULL,
    email      VARCHAR(150),
    department VARCHAR(50),
    salary     DECIMAL(10,2),
    city       VARCHAR(50),
    hire_date  DATE
);

-- STEP 3: Insert 100,000 sample rows using a stored procedure
DELIMITER $$
CREATE PROCEDURE fill_employees()
BEGIN
  DECLARE i INT DEFAULT 1;
  WHILE i <= 100000 DO
    INSERT INTO employees (emp_name, email, department, salary, city, hire_date)
    VALUES (
      CONCAT('Employee_', i),
      CONCAT('emp', i, '@company.com'),
      ELT(1 + MOD(i, 5), 'IT','HR','Finance','Marketing','Operations'),
      40000 + (MOD(i, 60000)),
      ELT(1 + MOD(i, 4), 'Mumbai','Delhi','Bangalore','Chennai'),
      DATE_ADD('2015-01-01', INTERVAL MOD(i, 3650) DAY)
    );
    SET i = i + 1;
  END WHILE;
END$$
DELIMITER ;

-- STEP 4: Run the procedure (this may take 30-60 seconds)
CALL fill_employees();

-- STEP 5: Verify data
SELECT COUNT(*) FROM employees;

-- Expected result: 100000
 explain select*from employees where emp_name='Employee_5';
 create table test1800(id int,name varchar(50));
 insert into test1800 values(5,'yash'),(4,'raju'),(1,'aalu'),(2,'kamla'),(3,'rajus');
 alter table test1800 add primary key(id);
 describe test1800;
explain select*from test1800 where id=4;
