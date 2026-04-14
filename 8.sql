CREATE DATABASE jatin2;

USE jatin2;

-- Table 1: ORDERS
CREATE TABLE ORDERS (
    ORDER_ID INT PRIMARY KEY,
    CUSTOMER_ID VARCHAR(10),
    PRODUCT_ID VARCHAR(10),
    QUANTITY INT,
    ORDER_DATE DATE,
    STATUS VARCHAR(20)
);

-- Table 2: CUSTOMERS
CREATE TABLE CUSTOMERS (
    CUSTOMER_ID VARCHAR(10) PRIMARY KEY,
    CUSTOMER_NAME VARCHAR(50),
    CITY VARCHAR(50),
    CREDIT_LIMIT INT
);

-- Table 3: PRODUCTS
CREATE TABLE PRODUCTS (
    PRODUCT_ID VARCHAR(10) PRIMARY KEY,
    PRODUCT_NAME VARCHAR(50),
    CATEGORY VARCHAR(50),
    PRICE INT
);
USE jatin2;

-- Insert data into CUSTOMERS
INSERT INTO CUSTOMERS (CUSTOMER_ID, CUSTOMER_NAME, CITY, CREDIT_LIMIT) VALUES
('C01', 'Ravi Kumar', 'Delhi', 100000),
('C02', 'Priya Singh', 'Mumbai', 80000),
('C03', 'Amit Sharma', 'Bangalore', 60000),
('C04', 'Neha Joshi', 'Chennai', 50000);

-- Insert data into PRODUCTS
INSERT INTO PRODUCTS (PRODUCT_ID, PRODUCT_NAME, CATEGORY, PRICE) VALUES
('P01', 'Laptop', 'Electronics', 55000),
('P02', 'Headphones', 'Electronics', 3000),
('P03', 'Desk Chair', 'Furniture', 12000),
('P04', 'Notebook', 'Stationery', 150);

-- Insert data into ORDERS
INSERT INTO ORDERS (ORDER_ID, CUSTOMER_ID, PRODUCT_ID, QUANTITY, ORDER_DATE, STATUS) VALUES
(1001, 'C01', 'P01', 2, '2024-01-05', 'Delivered'),
(1002, 'C02', 'P02', 1, '2024-01-10', 'Pending'),
(1003, 'C01', 'P03', 5, '2024-01-12', 'Delivered'),
(1004, 'C03', 'P01', 2, '2024-01-15', 'Cancelled'),
(1005, 'C04', 'P02', 3, '2024-02-01', 'Pending'),
(1006, 'C02', 'P04', 1, '2024-02-10', 'Delivered'),
(1007, 'C03', 'P03', 4, '2024-02-10', 'Pending');
select customer_name from customers where customer_id in(select customer_id from orders );
select product_name from products where product_id not in (select  distinct product_id from orders);
select  customer_name , credit_limit from customers where credit_limit>(select avg(credit_limit) from customers);
select price from products where price=(select max(price) from products);
select product_name from products where price>10000;
select product_name from products where price in(select price from products where price>10000);
select customer_name from customers where customer_id in(select customer_id,count(product_id)as c
 from orders  group by customer_id having c>2);
 select product_id from orders where status='delivered' and 
 product_id in(select product_id from products where category='electronics');
 -- 8th  
 select customer_name from customers where customer_id=(select customer_id 
 from orders group by customer_id order by count(customer_id) desc limit 1);
 -- 9th
 select product_name from products where price>(select sum(price) from products where category='stationery');
 -- 10 
 select customer_name from customers where customer_id  not in(select customer_id from orders where status='cancelled');
 -- 11 
 select customer_name from customers where city in(select city from customers where city='delhi');
 -- 12
 select product_name from products where product_id in(select product_id from orders where quantity>3);
 -- 13 
 select * from customers where credit_limit<(select credit_limit  from customers where customer_name='Ravi Kumar');
 -- 14
 select customer_name from customers where customer_id  in(select customer_id from orders  where product_id in
 (select product_id from products where category='furniture'));	
 -- 15
 select  max(price) from products where price<(select max(price) from products);
 
 -- 16
 select customer_name from customers where customer_id not in (select customer_id from orders);
 -- or 
  select customer_name from customers where  not exists (select customer_id from orders);
  -- 17
 --
