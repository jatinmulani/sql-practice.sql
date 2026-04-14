use testdb;
select*from customers;
select*from orders;
select * from customers as c join orders as o where c.customerid=o.customerid;
use world;
select*from city;
select* from country;
select*from city as c join country as cy where c.countrycode=cy.code;
select c.id,c.name,c.countrycode from city as c;
select cy.continent,cy.name,cy.code,cy.population from country as cy;
select c.id,c.name ,cy.name from city as c join country as cy where c.countrycode=cy.code ;
select*from country;
select*from countrylanguage;
select cy.name ,c.language from country as cy   join countrylanguage as c where  cy.code=c.countrycode and language='hindi';

select*from orders;
select sum(price) ,avg(price) from orders where customerid>=3;
select c.customerid,c.name,o.orderid,o.price from customers as c left join orders as o on c.customerid=o.customerid ;
select sum(o.price) from orders as o join customers as c where o.customerid=c.customerid;
select sum(price) from orders;
select count(orderid) from orders where orderid is null;
select customerid,sum(price) from orders group by customerid;
use sakila;
select*from payment;
select customer_id,count(amount) from payment group by amount;
select*from customer;
select count(customer_id),sum(amount) from  payment where payment_id=9 group by staff_id;
select sum(amount),avg(amount),count(payment_id) from payment group by month(payment_date);
select sum(amount),max(amount),avg(amount) from payment  where month(payment_date) in (5 ,6, 7) and day(payment_date) between 1 and 7 group by month (payment_date);
use world;
select*from country;
select sum(population) from country where continent='asia';
select indepyear,name,count(name) from country group by name,indepyear;
select count(name) ,indepyear from country  group by indepyear ;
select count(name) from country where indepyear>=1980;
select continent,count(name) from country  group by continent having count(name)>30;
select continent,avg(population) from country group by continent having avg(population)>5000000;
select avg(population) ,count(name) ,governmentform  from country where indepyear>1890 group by governmentform  having count(name)>=4 ;
use testdb;
create table test_date(dob date);
insert into test_date values('2025-12-5');
select*from test_date; 
create table test1000(salary int not null ,age int);
insert into test1000 values(20,20),(200,30),(50,null);
insert into test1000 values(null , 900);
select*from test1000;

use world;
show tables;
select*from country;
select*from city;
select population from city where name='kabul';
with cte  as 
(select continent from country where population>(select population from city where name='kabul'))
select*from cte;

select count(name) from country;
use regex2;
show tables;

select*from employee;
with yu as 
(select max(salary) as high from employee) 
select * from employee where salary< (select high from yu);


-- 
