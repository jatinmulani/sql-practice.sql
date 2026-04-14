create database windowdb;
use windowdb;

CREATE TABLE Sales (
    sale_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    sale_date DATE,
    amount DECIMAL(10,2)
);

INSERT INTO Sales (sale_id, customer_name, sale_date, amount) VALUES
(1, 'Alice',   '2024-01-05', 250.00),
(2, 'Bob',     '2024-01-06', 180.50),
(3, 'Charlie', '2024-01-07', 320.75),
(4, 'Alice',   '2024-01-10', 150.00),
(5, 'Bob',     '2024-01-12', 400.00),
(6, 'David',   '2024-01-15', 275.25),
(7, 'Eve',     '2024-01-18', 500.00),
(8, 'Charlie', '2024-01-20', 220.00),
(9, 'Alice',   '2024-01-22', 330.40),
(10, 'David',  '2024-01-25', 145.75),
(11, 'Eve',    '2024-02-01', 600.00),
(12, 'Bob',    '2024-02-03', 210.30),
(13, 'Charlie','2024-02-05', 390.60),
(14, 'Alice',  '2024-02-07', 120.00),
(15, 'David',  '2024-02-10', 310.00),
(16, 'Eve',    '2024-02-12', 450.00),
(17, 'Bob',    '2024-02-15', 275.00),
(18, 'Charlie','2024-02-18', 500.00),
(19, 'Alice',  '2024-02-20', 200.00),
(20, 'David',  '2024-02-22', 350.00),
(21, 'Eve',    '2024-02-25', 700.00),
(22, 'Bob',    '2024-02-27', 150.00),
(23, 'Charlie','2024-03-01', 425.50),
(24, 'Alice',  '2024-03-03', 275.75),
(25, 'David',  '2024-03-05', 500.00);


select * from sales;
use windowdb;
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    category VARCHAR(50),
    order_date DATE,
    amount DECIMAL(10,2),
    city VARCHAR(50)
);


INSERT INTO orders VALUES
(1,101,201,'Electronics','2024-01-01',500,'Delhi'),
(2,102,202,'Clothing','2024-01-02',200,'Mumbai'),
(3,103,203,'Electronics','2024-01-03',800,'Delhi'),
(4,101,204,'Furniture','2024-01-05',1200,'Delhi'),
(5,104,205,'Electronics','2024-01-07',600,'Bangalore'),
(6,105,206,'Clothing','2024-01-09',150,'Mumbai'),
(7,102,207,'Electronics','2024-01-11',900,'Mumbai'),
(8,106,208,'Furniture','2024-01-12',700,'Delhi'),
(9,107,209,'Clothing','2024-01-13',300,'Chennai'),
(10,108,210,'Electronics','2024-01-14',400,'Delhi'),
(11,103,211,'Furniture','2024-01-16',1000,'Delhi'),
(12,104,212,'Electronics','2024-01-17',750,'Bangalore'),
(13,105,213,'Clothing','2024-01-18',180,'Mumbai'),
(14,106,214,'Electronics','2024-01-20',650,'Delhi'),
(15,101,215,'Furniture','2024-01-21',1400,'Delhi'),
(16,102,216,'Electronics','2024-01-22',500,'Mumbai'),
(17,103,217,'Clothing','2024-01-23',220,'Delhi'),
(18,104,218,'Electronics','2024-01-24',950,'Bangalore'),
(19,105,219,'Furniture','2024-01-25',1100,'Mumbai'),
(20,106,220,'Clothing','2024-01-26',260,'Delhi'),
(21,107,221,'Electronics','2024-01-27',700,'Chennai'),
(22,108,222,'Furniture','2024-01-28',1300,'Delhi'),
(23,101,223,'Electronics','2024-01-29',850,'Delhi'),
(24,102,224,'Clothing','2024-01-30',210,'Mumbai'),
(25,103,225,'Electronics','2024-02-01',920,'Delhi'),
(26,104,226,'Furniture','2024-02-02',1150,'Bangalore'),
(27,105,227,'Clothing','2024-02-03',190,'Mumbai'),
(28,106,228,'Electronics','2024-02-04',620,'Delhi'),
(29,107,229,'Furniture','2024-02-05',980,'Chennai'),
(30,108,230,'Electronics','2024-02-06',540,'Delhi');
select*from orders;
-- find top the highest ranking orders 
select category,order_id,amount from   (select*, 
dense_rank() 
over(partition by category order by amount desc) as ranks from orders) as tmp  where ranks<=2;

-- calculate  running total of sales for eacg customer
select customer_id ,amount, order_id,sum(amount) 
over(partition by customer_id order by order_id) as running_total from orders;

select order_id,customer_id,amount,running_total
from (select*,sum(amount) over (partition by customer_id order by order_id) as running_total
from orders) as temp;

-- show the previous order amount for each customer 
select customer_id,order_date,amount,lag(amount) over(partition by customer_id order by order_date ) as previous_amu
from orders;
-- avg amount per catergory 
select amount,category,order_id,customer_id,avg(amount) over (partition by category order by order_date ) as avg_amu from orders;
-- percentage contribution  of each order to total sales
select * , sum(amount) over() , concat(((amount)/sum(amount) over())*100 , '%') as percent from orders ;
select *,(amount*100.0/sum(amount) over()) as percentage from orders;
select sum(percentage_contribution)  as total_percenatge from ( select (amount*100.0/sum(amount) over()) as 
percentage_contribution from orders)  as t ;
-- find the first  order for each  customer
select * from (select *,row_number()
 over(partition by customer_id order by order_id) as rn from orders)
 t where rn = 1;
 select* from(select*, dense_rank() over (partition by customer_id order by order_date) as rt from orders)
 as temp where rt=1;
 -- find the top spending customer in each city
 select max(amount) from orders;
 select city,customer_id,total_spent from 
 (select city,customer_id,sum(amount) as  total_spent, rank() over
 (partition by city order by sum(amount) desc) as rt  from orders group by city,customer_id) t where rt=1;
