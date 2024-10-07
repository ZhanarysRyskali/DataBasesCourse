create database lab4;

create table Warehouse(
  code serial PRIMARY KEY,
  location varchar(255),
  capacity integer
);

create table Boxes(
    code char(4),
    contents varchar(255),
    value real,
    warehouse integer
);

insert into Warehouse(location, capacity) values('Chicago', 3);
insert into Warehouse(location, capacity) values('Chicago', 4);
insert into Warehouse(location, capacity) values('New York', 7);
insert into Warehouse(location, capacity) values('Los Angeles', 2);
insert into Warehouse(location, capacity) values('San Francisco', 8);

insert into Boxes(code, contents, value, warehouse) values('0MN7', 'Rocks', 180, 3);
insert into Boxes(code, contents, value, warehouse) values('4H8P', 'Rocks', 250, 1);
insert into Boxes(code, contents, value, warehouse) values('4RT3', 'Scissors', 190, 4);
insert into Boxes(code, contents, value, warehouse) values('7G3H', 'Rocks', 200, 1);
insert into Boxes(code, contents, value, warehouse) values('8JN6', 'Papers', 75, 1);
insert into Boxes(code, contents, value, warehouse) values('8Y6U', 'Papers', 50, 3);
insert into Boxes(code, contents, value, warehouse) values('9J6F', 'Papers', 175, 2);
insert into Boxes(code, contents, value, warehouse) values('LL08', 'Rocks', 140, 4);
insert into Boxes(code, contents, value, warehouse) values('P0H6', 'Scissors', 125, 1);
insert into Boxes(code, contents, value, warehouse) values('P2T6', 'Scissors', 150, 2);
insert into Boxes(code, contents, value, warehouse) values('TU55', 'Papers', 90, 5);

select * from Warehouse;

select * from Boxes where value > 150;

select distinct on(contents) *  from Boxes;

select warehouse warehouse_code, count(*) box_count
from Boxes
group by warehouse;

select warehouse warehouse_code, count(*) box_count
from Boxes
group by warehouse
having count(*) > 2;

insert into Warehouse(location, capacity) values ('New York', 3);

insert into Boxes(code, contents, value, warehouse) values ('H5RT', 'Papers', 200, 2);

UPDATE Boxes
SET value = value * 0.85
WHERE value = (
    SELECT DISTINCT ON (value) value
    FROM Boxes
    ORDER BY value DESC
    LIMIT 1 OFFSET 2
);

delete from boxes where value < 150;

delete from Warehouse where location = 'New York'
returning *;

