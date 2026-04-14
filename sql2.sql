use sakila;
select *from payment;
select min(payment_id) from payment;
select *from payment where payment_id=(select max(payment_id) from payment);
-- get all the payment information with the highest rental id
-- get me all the payment information for the earlyest payment_date
select *from payment where rental_id=(select max( rental_id) from payment);
select *from payment where payment_date=(select min(payment_date) from payment);unt of custmoer id 1
select  * from payment where amount>(select avg(amount) from payment);
-- select all the payment information where the amount is same as of payment id 5
select  * from payment where amount=(select amount from payment where payment_id=5);
-- where amount is grester the avg amount of payment table
-- get all the payment informatiion where the amount is greater than the maxium amo
select * from payment where amount >(select max(amount) from payment where customer_id=1);
-- u need to find the payment id staff id and amount only form the payment where the mh oonth is equal to the montf payment_id 4
-- get the highest paymentid from the payment table where the amount is samw of payment id 11and custmoer id 1
select amount,staff_id,payment_id from payment where month(payment_date)=(select month(payment_date) from payment where (payment_id)=4);
select max(payment_id) from payment where amount=(select amount from payment where payment_id=11 and customer_id=1);

-- here the subquery returm two rows => eg of multi row subquery
-- in multi row subquery we cant  not use compaerison operator 
-- select*from payment where amount=(select amount from payment where payment_id= 3 or payment_id=6)--
# in
select * from payment where amount in (Select amount  from  payment where payment_id=3 or payment_id=6);
select*from payment where customer_id in (select customer_id from  payment where payment_id=3 or payment_id=2);
select*from payment where amount=any(select amount from payment where payment_id=3 or payment_id=6);
select*from payment where amount<any(select amount from payment where payment_id=3 or payment_id=6);
select*from payment where amount>all(select amount from payment where payment_id=3 or payment_id=6);
select*from payment where amount<=all(select amount from payment where payment_id=3 or payment_id=6);
select*from payment where amount>any(select amount from  payment where payment_id=1 or payment_id=3);
select*from payment where amount>all(select amount from payment where customer_id=1);
use world;
select*from country;
select  *from country where population=(select max(population) from country where continent='Europe');
select *from country where population=(select max(population)from country where continent='Africa');
 -- corerealted subquery is a type of sub query which is again and again repitatively for each row of outer query
 create database regex2;
use regex2;
CREATE TABLE employee (
    eid INT PRIMARY KEY,
    name VARCHAR(50),
    dept VARCHAR(50),
    salary DECIMAL(10,2)
);


INSERT INTO employee (eid, name, dept, salary) VALUES
(101, 'Amit', 'HR', 40000),
(102, 'Neha', 'HR', 45000),
(103, 'Raj', 'IT', 60000),
(104, 'Priya', 'IT', 75000),
(105, 'Suresh', 'IT', 50000),
(106, 'Anita', 'Finance', 55000),
(107, 'Vikram', 'Finance', 65000),
(108, 'Kavita', 'Finance', 48000),
(109, 'Rohit', 'Marketing', 52000),
(110, 'Sneha', 'Marketing', 58000);
select*from employee;
select eid,name ,salary from employee as t1 where salary>(select avg(salary) from  employee where dept=t1.dept);

select*from employee  as t1 where salary=(select max(salary) from employee where dept=t1.dept);
select*from employee  as t1 where salary=(select min(salary) from employee where dept=t1.dept);

-- employees who earn more than at least one employee in thier department 
select *from employee as t1 where salary>any(select salary from employee where dept=t1.dept); 
--  employee who earn more than all employes in thhier department except themsseleves
select *from employee as t1 where salary>=all(select salary from employee where dept=t1.dept); 

-- ek continent k total population kl value 250 se badi homh vhsir  


use world;
select*from city;
select*from country;
select name,population from city where population>(select avg(population) from city where countrycode='NLD');
-- show the city whoes population is higher than the avg of country 
select name ,population ,countrycode from city as c where population>(select avg(population) from city where countrycode=c.countrycode);

-- find the cities that have  the minimum population within thier country
select * from city as c where population=(select max(population) from city where countrycode=c.countrycode);  

-- find all the cities and countryname whose population is greater
--  than the average population of cities in the same country;
 select c.name ,co.name from city  as c join country as co on c.countrycode=co.code  where c.population =(select avg(c.population) from city where countrycode=c.countrycode);
 
 
 --   get me the continent name  who have  the total number of country greater than the  
 -- total number of countries  in south america
-- select name from world where continent='south america';
select continent from country group by continent having  count(name) >(select count(name) from country where continent='south america');
use regex2;
select*from employee;
select sum(salary) from employee group by dept;
SELECT UPPER(LEFT(name, 3)) 
FROM employee;
select name from employee where name like('______%');
