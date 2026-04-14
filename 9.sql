create database sbi_loan_db;
use sbi_loan_db;
create table customer( customer_id int primary key auto_increment, full_name varchar(100) not null , aadhar_number char(12) not null unique,
pan_number char(10) not null unique , mobile varchar(15) not null, email varchar(100), address text, dob date not null, 
created_at timestamp default
current_timestamp);
CREATE TABLE branch (
    branch_id INT PRIMARY KEY AUTO_INCREMENT,
    branch_name VARCHAR(100) NOT NULL,
    city VARCHAR(50) NOT NULL,
    ifsc_code VARCHAR(11) NOT NULL UNIQUE
);
CREATE TABLE employee (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    employee_name VARCHAR(100) NOT NULL,
    designation VARCHAR(50) NOT NULL,
    branch_id INT,
    FOREIGN KEY (branch_id) REFERENCES branch(branch_id)
);
CREATE TABLE loan_type (
    loan_type_id INT PRIMARY KEY AUTO_INCREMENT,
    loan_type_name VARCHAR(50) NOT NULL,
    default_interest_rate DECIMAL(5,2) CHECK (default_interest_rate > 0)
);
CREATE TABLE loan (
    loan_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    branch_id INT NOT NULL,
    loan_type_id INT NOT NULL,
    loan_amount DECIMAL(15,2) NOT NULL CHECK (loan_amount > 0),
    interest_rate DECIMAL(5,2) NOT NULL CHECK (interest_rate > 0),
    emi_amount DECIMAL(15,2),
    next_due_date DATE,
    loan_start_date DATE NOT NULL,
    loan_end_date DATE,
    loan_status VARCHAR(20) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
    FOREIGN KEY (branch_id) REFERENCES branch(branch_id),
    FOREIGN KEY (loan_type_id) REFERENCES loan_type(loan_type_id),

    CHECK (loan_status IN ('ACTIVE','CLOSED','DEFAULTED'))
);
CREATE TABLE payment (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    loan_id INT NOT NULL,
    payment_date DATE NOT NULL,
    principal_paid DECIMAL(15,2) NOT NULL CHECK (principal_paid >= 0),
    interest_paid DECIMAL(15,2) NOT NULL CHECK (interest_paid >= 0),
    total_paid DECIMAL(15,2) 
        GENERATED ALWAYS AS (principal_paid + interest_paid) STORED,

    FOREIGN KEY (loan_id) 
        REFERENCES loan(loan_id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
CREATE INDEX idx_customer_mobile ON customer(mobile);
CREATE INDEX idx_branch_city ON branch(city);

CREATE INDEX idx_loan_branch_status 
ON loan(branch_id, loan_status);

CREATE INDEX idx_loan_customer 
ON loan(customer_id);
DESC customer;
show columns from customer;
CREATE INDEX idx_payment_loan 
ON payment(loan_id);
INSERT INTO loan_type (loan_type_name, default_interest_rate) VALUES
('Home Loan', 8.50),
('Car Loan', 9.25),
('Education Loan', 7.80),
('Personal Loan', 12.00);
INSERT INTO branch (branch_name, city, ifsc_code) VALUES
('SBI Main Branch', 'Kota', 'SBIN0001001'),
('SBI City Branch', 'Jaipur', 'SBIN0001002'),
('SBI Industrial Branch', 'Udaipur', 'SBIN0001003');
INSERT INTO customer 
(full_name, aadhar_number, pan_number, mobile, email, address, dob)
VALUES
('Rahul Sharma','123456789012','ABCDE1234F','9876543210','rahul@gmail.com','Kota Rajasthan','1995-04-10'),
('Anita Verma','234567890123','BCDEF2345G','9123456780','anita@gmail.com','Jaipur Rajasthan','1993-08-21');
INSERT INTO loan
(customer_id, branch_id, loan_type_id, loan_amount, interest_rate,
 emi_amount, next_due_date, loan_start_date, loan_end_date, loan_status)
VALUES
(1,1,1,500000,8.50,12000,'2026-04-01','2025-04-01','2030-04-01','ACTIVE');
INSERT INTO payment
(loan_id, payment_date, principal_paid, interest_paid)
VALUES
(1,'2025-05-01',8000,4000),
(1,'2025-06-01',8200,3800);
select payment_id, principal_paid, interest_paid, total_paid from payment;
select branch_id , sum(loan_amount) from loan group by branch_id;
select*from loan ;
