create database lab7;


create table countries(
    id serial primary key,
    name varchar
);

insert into countries (name) values
    ('United States'),
    ('Canada'),
    ('Brazil'),
    ('Germany'),
    ('France'),
    ('Australia'),
    ('Japan'),
    ('India'),
    ('China'),
    ('South Africa');

create index countries_id_inx on countries(id);

create index employees_sn_inx on employees(name, surname);

create unique index employees_salary_inx on employees(salary);

create index name_subs_idx on employees(substring(name from 1 for 4));

create index employees_department_idx on employees(department_id);

create index departments_department_idx on departments(department_id);