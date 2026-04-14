create database jatinregex;
show databases;
use jatinregex;
create table students(sid int,name char(10));
show tables;
use sakila;
show tables;
describe actor;
select*from actor;
select actor_id,first_name from actor;
select first_name,actor_id,first_name from actor;
select * from actor where actor_id=3;
select * from actor where actor_id>3;
select * from actor where first_name='nick';
select * from actor where actor_id>3 and actor_id<7;
select * from actor where actor_id=3 and actor_id=5;
select * from actor where actor_id>3 and actor_id=5;
select * from actor where actor_id>3 or actor_id=5;
select * from actor where actor_id>3 or actor_id=1;
select * from actor where actor_id>3 and actor_id=1;
select * from actor where actor_id=2 or  actor_id=3 and actor_id=1;
select * from actor where actor_id>2 or  actor_id>4 and actor_id=7;
select * from actor where actor_id>2 and  actor_id>4 and actor_id=7;
select*from actor where actor_id between 2 and 7;
-- for range function use between

-- in operator
 -- select*from actor where actor_id in(2,7,9)
-- select*from actor where first_name in('ed')

-- like operator (pattern ko search krna)
-- select*from actor where first_name like 'b%';  -- b se suru hone wale name 
-- select *from actor where first_name  like 'ed%';
-- select*from actor where first_name like'%a';
-- select*from actor where first_name like '%ed';

-- s first m and r end  m 
-- select*from actor where first_name like 's%r';

-- a bi khi ho  pure  name m 
-- select*from actor where first_name like '%a%' ;

-- r 2 baar ho pure name m '
-- select*from actor where first_name like '%r%r%';
   
-- (_) only 1 character  y check krta hia ki kitnr digit ka name hai 
-- select*from actor where first_name like'___';

 -- 2nd  character is a 
--  select*from actor where first_name like'_a%';
 
 -- 1st character is a and 2nd pr kuch bi ho 
--   select*from actor where first_name like'a_%';

-- 2nd last r ho 
select*from actor where first_name like '%r_';

-- 2nd number pr a and 2nd last pr bi r 
select*from actor where first_name like '_a%r_';
  
-- 1st char c  and 2nd  last char r  ho 
select*from actor where first_name like 'c%r_';

 -- a 3 baar ho
 select*from actor where first_name like '%a%a%a%';
 
 -- last 3rd char d ho 
 select*from actor where first_name like '%d__';
 
 -- aa ek sath ho 
 select*from actor where first_name like '%aa%';

-- at least 5 charachter ho
select*from actor where first_name like '_____' ;

-- -- upper and lower 
select first_name,lower(first_name),last_name,upper(last_name) from actor; 

-- concat 
SELECT CONCAT('heyy', 'hello');

select first_name,last_name,concat(first_name,last_name) from actor;

select first_name,last_name,concat("MR",first_name,' ',last_name) from actor;
 
 -- extract me all the data first_name +last_name='edchase'
 select*,concat (first_name,last_name)from actor;
 
 -- concat with a seprator 
 select first_name ,last_name,concat('mr',first_name,last_name),concat_ws('_','mr',first_name,last_name)from actor;
 
 -- substr ==> extract kuch portiion ko (extract data basis of position)
 select first_name ,last_name,substr(last_name,4)from actor;
  select first_name ,last_name,substr(last_name,-3)from actor;
   select first_name ,last_name,substr(last_name,1,4)from actor;
   select*from actor where first_name like 'a%' or first_name like 'e%';
select *  from actor where substr(first_name ,1,1)='a' or substr(first_name,1,1)='e';
-- alternative 
select first_name, replace(first_name,'ICK','e')from actor;


-- TRIM FUNCTION - select value only for testing purpose  --trim wide space ya koi characteer remove krta hai at the starting and at the end
select '  abhi   '; -- iske ouput m dono side wide space aa rh agr is space ko remove krna hai to use krenge trim
select trim('  abhi'); -- iska output m wide space remove ho jaenge

-- naman banana hai ham ko "aaanaman' se mtln k isme se y aage k 'a' ko htana hai 
select trim(both'a' from 'aaanaman');

-- we can also apply trim on coloumn
select first_name,trim(both 'E' from first_name) from actor;    

-- l pad(left pading) and r pad(right pading)
select lpad('10294',6,'@');
select rpad('10125',7,'@');



-- numbers function  =>> round off krna 
select 14.68,round(14.68);  -- 15
select 23.68 ,round(23.68,1);
select 23.48 ,round(23.43,1);
select 23.654,round(23.656,2);
select 23.68,round(23.68,-1);  -- 20 
select 28.68,round(28.68,-1); -- 30
select 47.68,round(47.68,-1); -- 50
select 47.68,round(4227.68,-3);
select 57.68,round(57.28,-2);
select 157.68 ,round(157.67,-2); -- 200

-- truncate - value extract krne k  kaam aata haii 
select truncate(14.685,2);  -- 14.68
select floor (5.9999999);  -- 5
select ceil(6.0000001);  -- 7

-- distinct function will give you all unique value from the coloum
select distinct(amount) from payment ; 

-- function count (rows) 
select count(first_name) from actor;  

select count(distinct(first_name))  from actor; 

select curdate(),current_time(),current_timestamp(),now();

select now(),adddate(now(),2);
use sakila;
select payment_date,adddate(payment_date,2) from payment;
select now(),adddate(now(),interval 4 month);
select payment_date,adddate(payment_date,interval 4 month)from payment;

select now(),month(now()),year(now());

-- extract function
select now(),extract(month from now());
select now(),extract(day from now());

-- value chaiye month k according 
select payment_date , month(payment_date),date_format(payment_date,'%y') from payment;

select *,month(payment_date)from payment
where month(payment_date)=5;
select*,year(payment_date)from  payment where year (payment_date)=2006;
-- alternative of this  
select*from payment where year(payment_date)=2006;


-- multi row function(aggregate function => which will be used for calculation)
select distinct customer_id from payment;
select distinct(customer_id), amount from payment;
-- combination of amount and staff id should be unique
select distinct(amount),staff_id from payment;
-- distinct se phle directly column chosse ni kar skte
-- distinct ke bad he choose kare 
select  customer_id from payment;-- customer id ke bad distnict likege to error dega
-- combinaton of two column is possible in distnict
-- distnict print only unique values


-- sum()
select *from payment;
select sum(amount) from payment;
-- count(),max()
select count(amount) from payment;
select max(amount) from payment;
select min(amount) ,avg(amount) from payment;
select count(*) from payment
where month(payment_date)=5 or month(payment_date)=6;

-- total amount and numb of trancation done for the amount > 5$ and after the  march month
select  sum(amount),count(amount)from payment
where amount> 5 and  month(payment_date)>3;

-- ksii bi agrigate function k sth koi or non-agrigate jese nrml acolumn select ni kr skte
-- select count(*),amount from payment non agrigate


select *from payment;
-- find total custmor and the total numb of unique cusymor done the payment in (the last day of the month where the amount is >0.5)
select count(customer_id),count(distinct customer_id)from payment
where date(payment_date)=last_day(payment_date) and amount>0.5;



-- learning assigment 1.wht is grup by  2.diffenrce between grup by and ditinict keyword  3. 



  

use world;
select *from country;
select sum(population) from country;
select *from country where continent='asia';
select continent ,sum(population) from country group by continent;
select region, sum(population) from country group by region;
select continent ,region ,sum(population) from country group by continent,region;
select continent,count(name) from country group by continent;
select indepyear, count(name) from country group by indepyear;

 -- how many country got indep for each year and each continent
 select continent,indepyear, count(name) from country group by continent,indepyear;
 -- where hmesa phle legega group by select
 -- where clause ushe column pr filter krta hain jo column exist krta handler
 -- where clause genurally are not use on aggreagte function 
 -- having caluse is use to filter the row based on aggregate function
 -- having clause bina group by ke use ni hoskta
 -- having grup by ke bad m lgta hain
 select continent ,count(name) as totalcountry from country group by continent having totalcountry>30;
 -- find the continet name and avg poipulation only for those continent where the avg populatin>half million(0.5)
 select continent ,avg(population) as avgpopulation from country group by continent having avgpopulation>0.5;
 -- get me the avg population total num of name,for each goverment form only for the country after 1890 and have atleast four country 
select governmentform,avg(population),count(name)  from country where indepyear>1890  group by  governmentform having count(name)>=4;
use world;
select*from country;


create database testdb;
 use testdb;
 
 CREATE TABLE customers (
    customerid INT PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(50)
);

CREATE TABLE orders (
    orderid INT PRIMARY KEY,
    productid INT,
    pname VARCHAR(50),
    price DECIMAL(10,2),
    customerid INT
);

INSERT INTO customers (customerid, name, city) VALUES
(1, 'Alice', 'New York'),
(2, 'Bob', 'London'),
(3, 'Charlie', 'Mumbai'),
(4, 'Diana', 'Sydney'),
(5, 'Ethan', 'Toronto');

INSERT INTO orders (orderid, productid, pname, price, customerid) VALUES
(101, 201, 'Laptop', 800.00, 1),
(102, 202, 'Mouse', 25.00, 1),
(103, 203, 'Keyboard', 45.00, 2),
(104, 204, 'Monitor', 200.00, 2),
(105, 205, 'Printer', 150.00, 3),
(106, 206, 'Tablet', 300.00, 3),
(107, 207, 'Mobile', 500.00, 4),
(108, 208, 'Headphones', 75.00, 4),
(109, 209, 'Camera', 600.00, 5),
(110, 210, 'Speaker', 120.00, 5);

select * from customers;
select*from orders;  -- order id is a primarykey its define candidate key
select customerid from orders; 
-- orders table ka customer id is the foreign key jo ki connect kr rha hai customer table k customer id k 
-- many to one relation 
-- foregin key is the key which is duplicate in both the tables ( dusre table k primary key ko )   
--  agr dono table ke beech m jo duplicate value hui forignn key h 
  
select o.orderid,o.pname,o.customerid from orders as o;
select c.customerid,c.name from customers as c ;

select o.orderid,o.pname,o.customerid , c.customerid,c.name from orders as  o join customers as c
where o.customerid=c.customerid;



 use testdb;
 select*from customers;
 select*from orders;
 select orders.orderid ,orders.pname , orders.price, orders.customerid,
 customers.customerid,customers.name from orders join customers where orders.customerid=customers.customerid; 
--  select customers.customerid,customers.name from customers;

use world;
select*from country;
select*from city;
select c.name,c.countrycode,c.district,c.id, y.name,y.continent,y.region from city as c  join country as y;
select c.id,c.name,c.countrycode from city as c;
select y.code,y.name,y.population ,y.continent from country as y;
select c.id,c.name,c.countrycode,y.name from city  as c join country as y
 where c.countrycode=y.code; 
-- select city.id,city.name,city.countrycode,country.name from city join country where city.countrycode=country.code;
select c.id,c.name,c.countrycode,y.name from city  as c join country as y
 where c.countrycode=y.code AND y.name='South Africa';   
 
 
 select*from country;
 select*from  country language;
select cnt.name,c.language from country as cnt join countrylanguage as  c where cnt.code=c.countrycode;


-- using the new syntax
select cnt.name,c.language from country as cnt inner join countrylanguage as c on cnt.code=c.countrycode and c.language='Hindi';



create database rmd;
use rmd;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    city VARCHAR(100)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_amount DECIMAL(10,2)
);


INSERT INTO customers VALUES
(1, 'John', 'New York'),
(2, 'Alice', 'Los Angeles'),
(3, 'Bob', 'Chicago'),
(4, 'Emma', 'Houston'),
(5, 'Michael', 'Phoenix'),
(6, 'Sophia', 'Dallas'),
(7, 'David', 'Seattle'),
(8, 'Olivia', 'Boston'),
(9, 'James', 'Denver'),
(10, 'Isabella', 'Miami');


INSERT INTO orders VALUES
(101, 1, 250.00),
(102, 2, 300.00),
(103, 1, 150.00),
(104, 3, 400.00),
(105, 5, 500.00),
(106, 7, 700.00),
(107, 7, 200.00),
(108, 9, 350.00),
(109, 11, 600.00),  -- No matching customer
(110, 12, 800.00);  -- No matching customer
-- innner 
select * from customers;
select * from orders; 
select c.customer_id,c.name,o.customer_id,o.order_amount,o.order_id from customers as c  inner join orders as o on  c.customer_id=o.customer_id;

-- left  saare customers ka data aa jAATA hai
select c.customer_id,c.name,o.customer_id,o.order_amount,o.order_id 
from customers as c   left join orders as o on  c.customer_id=o.customer_id where o.order_id is null;

-- right
select c.customer_id,c.name,o.customer_id,o.order_amount,o.order_id 
from customers as c   right join orders as o on  c.customer_id=o.customer_id; 

-- sum of all the orders purchase by customer
select sum(o.order_amount)from customers as c  inner join orders as o on  c.customer_id=o.customer_id;

-- total no of orders which are not placed by customer
select c.customer_id,o.customer_id,o.order_amount,o.order_id 
from customers as c   right join orders as o on  c.customer_id=o.customer_id where c.customer_id is null; 
 -- counting the number  
 select count(o.order_id) 
from customers as c   right join orders as o on  c.customer_id=o.customer_id where c.customer_id is null; 

-- if the customer id >=3 then sum of thier order amount and avg
select sum(o.order_amount),avg(o.order_amount) from customers as c  inner join orders as o on  c.customer_id=o.customer_id and c.customer_id>=3;

-- new  table
  CREATE TABLE employees (
    eid INT PRIMARY KEY,
    ename VARCHAR(100),
    salary DECIMAL(10,2),
    manager_id INT
);



INSERT INTO employees VALUES
(1, 'John', 90000, NULL),   -- Top-level manager (CEO)
(2, 'Alice', 75000, 1),
(3, 'Bob', 70000, 1),
(4, 'Emma', 65000, 2),
(5, 'Michael', 60000, 2),
(6, 'Sophia', 62000, 2),
(7, 'David', 58000, 3),
(8, 'Olivia', 55000, 3),
(9, 'James', 50000, 4),
(10, 'Isabella', 52000, 4);


select * from employees;
select e.eid,
e.ename,
e.manager_id,
mngr.eid,mngr.ename from employees as e
join employees as mngr
on  e.manager_id=mngr.eid;

-- join with group by 
use world;
select*from city; 
select*from country;
select c.name ,c.District,c.population,cnty.name,cnty.population from city as c inner join country as cnty where c.countrycode=cnty.code; 

-- calculate total os each distrct from each country
select cnty.name,c.district,sum(c.population) from 
city as c inner join country as cnty
where c.countrycode=cnty.code group by cnty.name,c.district; 
 select*from country language;
SELECT cl.language, SUM(cnty.population) AS total_population
FROM country AS cnty
INNER JOIN countrylanguage AS cl
ON cnty.code = cl.countrycode
GROUP BY cl.language;
--  total spokers  
SELECT 
    cl.Language,
    SUM(cnty.Population * cl.Percentage / 100) AS total_speakers
FROM country AS cnty
INNER JOIN countrylanguage AS cl
    ON cnty.Code = cl.CountryCode
GROUP BY cl.Language;
use sakila;
select*from actor;
select*from film_actor;
select*from film;
select a.first_name,f.rating,avg(length) from actor as a join film_actor as fa
join film as f 
on a.actor_id=fa.actor_id and fa.film_id=f.film_id
group by a.actor_id,a.first_name,f.rating;
 -- corerealted subquery is a type of sub query which is again and again repitatively
 use sakila;
 select payment_date,month(payment_date),date_format(payment_date,'%b') from payment;
 select count(*),month(payment_date) from payment where month(payment_date)=5 group by month(payment_date);
 select sum(amount),max(amount),avg(Amount),month(payment_date) from payment where month(payment_date) in (5,6,7) and day(payment_date) between 
 1 and 7 group by month(payment_date);
 select distinct(amount) ,payment_date from payment;
 select*,max(amount) over(partition by payment_date) from payment;
 use windowdb;
 select*from (select*,avg(amount) over(partition by customer_name)  as tmp from sales) as tmp2 where amount>tmp;
 with cte as
 (select*,avg(amount) over(partition by customer_name)  as tmp from sales)
 select*from cte where amount>tmp;
 select*,sum(amount)over(partition by customer_name order by amount) from sales;
 select*,row_number()over(partition by customer_name)from sales;
 select*,rank()over( partition by  month(sale_date) order by amount) from sales;
 select*,dense_rank()over(order by amount) from sales;
 select max(amount) from sales where amount< (select max(amount) as tmp from sales) ;
 select* from(select*,dense_rank()over(order by amount desc) as ranki from sales)as tmp where ranki=2;
 select*,lag(amount,2,'piggi')over()from sales;
 select*,lag(sale_date,1)over(),datediff(sale_date,lag(sale_date,1) over()) from sales;
 select*,sum(amount)over(order by amount rows between unbounded preceding and current row) from sales;
 select*,sum(amount)over(order by amount) from sales;
 select*,sum(amount) over(order by amount rows between 2 preceding  and current row ) from sales;
 select*,sum(amount) over(order by amount rows between 1 preceding and 1 following) from sales;
select*,sum(amount)over(partition by customer_name order by sale_date rows between unbounded preceding and 1 preceding) from sales;
select*from(select*,dense_rank()over(partition by category order by amount desc)as ranks from orders)as tmp where ranks<=2;
select*,dense_rank()over(partition by category order by amount ) from orders;
select*,lag(amount,1)over(partition by customer_name ) from sales;
use world;
select code,name,continent from country where code in ('alb','and')
union all
select code,name,continent from country where code in ('alb','bih');
show databases;
use testdb;
show tables;
select*from customers;
use sakila;
show tables;
show databases;
use testdb;
show tables;
