create database lab8;

create table salesman(
    salesman_id integer primary key,
    name varchar,
    city varchar,
    comission numeric
);

create table customers(
    customer_id integer primary key,
    cust_name varchar,
    city varchar,
    grade integer,
    salesman_id integer references salesman(salesman_id)
);

create table orders(
    ord_no integer primary key,
    purch_amt numeric,
    ord_date date,
    customer_id integer references customers(customer_id),
    salesman_id integer references salesman(salesman_id)
);

insert into salesman(salesman_id, name, city, comission) values(5001,'James Hoog', 'New York', 0.15),
                                                               (5002, 'Nail Knite', 'Paris', 0.13),
                                                               (5005, 'Pit Alex', 'London', 0.11),
                                                               (5006, 'Mc Lyon', 'Paris', 0.14),
                                                               (5003, 'Lasuon Henn', null, 0.12),
                                                               (5007, 'Paul Adam', 'Rome', 0.13);

insert into customers(customer_id, cust_name, city, grade, salesman_id)
values(3002, 'Nick Rimando', 'New York', 100, 5001),
      (3005, 'Graham Zusi', 'California', 200, 5002),
      (3001, 'Brad Guzan', 'London', null, 5005),
      (3004, 'Fabian Johns', 'Paris', 300, 5006),
      (3007, 'Brad Davis', 'New York', 200, 5001),
      (3009, 'Geoff Camero', 'Berlin', 100, 5003),
      (3008, 'Julian Green', 'London', 300, 5002);

insert into orders(ord_no, purch_amt, ord_date, customer_id, salesman_id)
values(70001, 150.5, '2012-10-05', 3005, 5002),
      (70009, 270.65, '2012-09-10', 3001, 5005),
      (70002, 65.26, '2012-10-05', 3002, 5001),
      (7004, 110.5, '2012-08-17', 3009, 5003),
      (70007, 948.5, '2012-09-10', 3005, 5002),
      (70005, 2400.6, '2012-07-27', 3007, 5001),
      (70008,5760, '2012-09-10', 3002, 5001);

create role junior_dev login;

create view salesman_newyork as
    select *
from salesman
where city = 'New York';

create view orders_with_names as
select
       s.name as salesman_name,
       c.cust_name as customer_name
from orders o
join salesman s on o.salesman_id = s.salesman_id
join customers c on o.customer_id = c.customer_id;
grant all privileges on orders_with_names to junior_dev;

create view customers_max_grade as
select *
from customers
where
grade = (select max(grade) from customers);

grant select on customers_max_grade to junior_dev;

create view salesman_count_city as
select city, count(*) salesmsan_count
from salesman
group by city;

create view salesman_multiple_customers as
select s.name
from salesman s
join customers c on s.salesman_id = c.salesman_id
group by s.name
having count(c.customer_id) > 1;

create role intern;

grant junior_dev to intern;
