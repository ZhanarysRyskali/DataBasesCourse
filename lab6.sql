create database lab6;

create table locations(
    location_id serial primary key,
    street_address varchar(25),
    postal_code varchar(25),
    city varchar(30),
    state_province varchar(12)
);

create table departments(
    department_id serial primary key,
    department_name varchar(50) unique,
    budget integer,
    location_id integer references locations
);

create table employees(
    employee_id serial primary key,
    first_name varchar(50),
    last_name varchar(50),
    email varchar(50),
    phone_number varchar(20),
    salary integer,
    department_id integer references departments
);

insert into locations (street_address, postal_code, city, state_province)
values
('123 Main St', '10001', 'New York', 'NY'),
('456 Elm St', '94101', 'San Francisco', 'CA'),
('789 Oak St', '60601', 'Chicago', 'IL'),
('101 Maple Ave', '73301', 'Austin', 'TX'),
('202 Pine St', '98101', 'Seattle', 'WA'),
('303 Cedar St', '30301', 'Atlanta', 'GA'),
('404 Birch Rd', '80201', 'Denver', 'CO'),
('505 Spruce Rd', '85001', 'Phoenix', 'AZ'),
('606 Walnut St', '32801', 'Orlando', 'FL'),
('707 Chestnut St', '33101', 'Miami', 'FL');

insert into departments (department_name, budget, location_id)
values
('Sales', 500000, 1),
('Marketing', 300000, 2),
('IT', 200000, 3),
('HR', 150000, 4),
('Finance', 400000, 5),
('Operations', 250000, 6),
('Customer Service', 200000, 7),
('R&D', 350000, 8),
('Legal', 180000, 9),
('Logistics', 220000, 10);

insert into employees (first_name, last_name, email, phone_number, salary, department_id)
values
('John', 'Doe', 'johndoe@example.com', '123-456-7890', 60000, 1),
('Jane', 'Smith', 'janesmith@example.com', '987-654-3210', 55000, 2),
('Alice', 'Johnson', 'alicej@example.com', '555-123-4567', 75000, 3),
('Bob', 'Brown', 'bobbrown@example.com', '555-234-5678', 50000, 4),
('Charlie', 'Davis', 'charlied@example.com', '555-345-6789', 65000, 5),
('Emily', 'Wilson', 'emilyw@example.com', '555-456-7890', 58000, 6),
('Frank', 'Clark', 'frankc@example.com', '555-567-8901', 47000, 7),
('Grace', 'Taylor', 'gracet@example.com', '555-678-9012', 72000, 8),
('Henry', 'Anderson', 'henrya@example.com', '555-789-0123', 67000, 9),
('Ivy', 'Martin', 'ivym@example.com', '555-890-1234', 53000, 10);


select e.first_name, e.last_name, e.department_id, d.department_name
from employees e
join departments d on e.department_id = d.department_id;

select e.first_name, e.last_name, e.department_id, d.department_name
from employees e
join departments d on e.department_id = d.department_id
where e.department_id in(80, 40);

select e.first_name, e.last_name, d.department_name, l.city, l.state_province
from employees e
join departments d on e.department_id = d.department_id
join locations l on d.location_id = l.location_id;

select d.department_name, d.department_id, e.employee_id
from departments d
left join employees e on d.department_id = e.department_id;

select e.first_name, e.last_name, e.department_id, d.department_name
from employees e
left join departments d on e.department_id = d.department_id;
