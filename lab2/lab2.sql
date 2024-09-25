create database lab2;

create table countries(
    id serial primary key,
    country_name varchar,
    region_id int,
    population int
);

insert into countries(country_name, region_id, population)
values(
       'Kazakhstan',
       7,
       300000
);

insert into countries(id, country_name)
values(
       10,
       'India'
      );
insert into countries(region_id)
values(
       null
      );
insert into countries(country_name, region_id, population)
values
       ('Scotland', 5, 600000),
       ('Finland', 8, 150000),
       ('Uruguay', 15, 400000);

alter table countries
alter column country_name set default 'Kazakhstan';
insert into countries(country_name)
values(
       default
      );
insert into countries(id, country_name, region_id, population)
values(
       default,
    default,
    default,
    default
      );
create table new_countries(like countries);
insert into new_countries
    select * from countries;
update new_countries
set region_id = 1
where region_id is null;

select country_name,
       population * 1.10 as "New Population"
from new_countries;

delete from new_countries
where population < 100000;

delete from new_countries
where id in (select id from countries)
returning *;

delete from countries
returning *;

select * from countries;
select * from new_countries;