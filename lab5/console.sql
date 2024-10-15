create database lab5;

create table customers(
    customer_id int,
    cust_name varchar(255),
    city varchar(255),
    grade int,
    salesman_id int
);

create table orders(
    ord_no int,
    purch_amt int,
    ord_date date,
    customer_id int,
    salesman_id int
);

create table salesman(
    salesman_id int,
    name varchar(255),
    city varchar(255),
    comission int
);

insert into customers(customer_id, cust_name, city, grade, salesman_id)
values
    (3002, 'Nick Rimando', 'New York', 100, 5001),
    (3005, 'Graham Zusi', 'California', 200, 5002),
    (3001, 'Brad Guzan', 'London', null, 5005),
    (3004, 'Fabian Johns', 'Paris', 300, 5006),
    (3007, 'Brad Davis', 'New York', 200, 5001),
    (3009, 'Geoff Camero', 'Berlin', 100, 5003),
    (3008, 'Julian Green', 'London', 300, 5002);

insert into orders(ord_no, purch_amt, ord_date, customer_id, salesman_id)
values
    (70001, 150.5, '2012-10-05', 3005, 5002),
    (70009, 270.65, '2012-09-10', 3001, 5005),
    (7002, 65.26, '2012-10-05', 3002, 5001),
    (7004, 110.5, '2012-08-17', 3009, 5003),
    (70007, 948.5, '2012-09-10', 3005, 5002),
    (70005, 2400.6, '2012-07-27', 3007, 5001),
    (70008, 5760, '2012-09-10', 3002, 5001);

insert into salesman(salesman_id, name, city, comission)
values
    (5001, 'James Hoog', 'New York', 0.15),
    (5002, 'Nail Knite', 'Paris', 0.13),
    (5005, 'Pit Alex', 'London', 0.11),
    (5003, 'Lousen Hen', null, 0.12),
    (5007, 'Paul Adam', 'Rome', 0.13);

select sum(purch_amt) from orders;
select avg(purch_amt) from orders;


SELECT COUNT(*) AS customers_with_names
FROM customers
WHERE cust_name IS NOT NULL;

select min(purch_amt) from orders;
select * from customers
where cust_name like '%b';

SELECT o.*
FROM orders o
JOIN customers c ON o.customer_id = c.customer_id
WHERE c.city = 'New York';

SELECT DISTINCT c.*
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
WHERE o.purch_amt > 10;

select sum(grade) grade_total from customers;

select customer_id, cust_name, city, grade, salesman_id
from customers
where cust_name is not null;

select max(grade) from customers;