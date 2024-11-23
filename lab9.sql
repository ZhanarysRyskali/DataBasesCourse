create database lab9;

CREATE TABLE employee (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    surname VARCHAR(50) NOT NULL
);

INSERT INTO employee (name, surname) VALUES
('John', 'Doe'),
('Jane', 'Smith'),
('Alice', 'Johnson'),
('Robert', 'Brown'),
('Emily', 'Davis');

CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    calories INT NOT NULL
);

INSERT INTO products (name, category, calories) VALUES
('Apple', 'Fruit', 52),
('Banana', 'Fruit', 89),
('Chicken Breast', 'Meat', 165),
('Salmon', 'Meat', 208),
('Coke', 'Drink', 140),
('Orange Juice', 'Drink', 45);

CREATE TABLE worker (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    salary NUMERIC NOT NULL
);

INSERT INTO worker (name, salary) VALUES
('John Doe', 5000),
('Jane Smith', 6000),
('Alice Johnson', 4500);

create or replace function increase_value(inputv integer) returns integer as $$
    begin
    return inputv+10;
    end; $$
language plpgsql;
select increase_value(10);


create or replace function compare_numbers(num1 integer, num2 integer) returns varchar as $$
    begin
        if num1 > num2 then
        set result = 'Greater';
    elseif num1 = num2 then
        set result = 'Equal';
    else
        set result = 'Lesser';
    end if;
    end;
    $$
language plpgsql;


create or replace function number_series(n integer)
returns text as $$
DECLARE
    series text = '';
    i integer;
    begin
    for i in 1..n loop
        series = series || i || CASE WHEN i < n THEN ', ' ELSE '' END;
        end loop;
    return series;
end;
$$
language plpgsql;


create or replace function find_employee(in empname varchar)
returns table(id integer, name varchar, surname varchar) as $$
    begin
        return query
        select id, name, surname from employee where name = empname;
    end;
    $$
language plpgsql;


create or replace function list_products(in incategory varchar)
returns table(id integer, name varchar, category varchar, calories integer) as $$
    begin
        return query
        select id, name, category, calories from products where category = incategory;
    end;
    $$
language plpgsql;


create or replace function calculate_bonus(salary numeric)
returns numeric as $$
begin
    return salary * 0.10;
end;
$$
language plpgsql;

create or replace procedure update_salary(employee_id int)
as $$
declare
    current_salary numeric;
    bonus numeric;
begin
    select salary into current_salary from worker where id = employee_id;
    bonus := calculate_bonus(current_salary);

    update worker
    set salary = current_salary + bonus
    where id = employee_id;
end;
$$
language plpgsql;



create or replace procedure complex_calculation(
    input_number integer,
    input_text varchar,
    out result varchar
)
as $$
    <<outer_block>>
    declare
        numeric_result integer;
        text_result varchar;
        intermediate_result varchar;
    begin
        numeric_result := input_number * input_number;

        <<inner_block>>
        declare
            reversed_text varchar;
        begin
            reversed_text = reverse(input_text);
            intermediate_result = 'Squared number: ' || numeric_result || ', Reversed text: ' || reversed_text;
        end inner_block;

        result = intermediate_result || '. Final result combines both subblocks.';
    end outer_block;
$$
language plpgsql;


