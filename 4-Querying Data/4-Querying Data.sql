create database countrystats;
use countrystats;

create table country (
Id int auto_increment primary key,
country_name varchar(50),
Population_In_lakhs decimal(6,2),
Area varchar(50)
);

desc country;

create table persons (
Id int auto_increment primary key,
first_name varchar(50),
last_name varchar(50),
Population decimal (6,2),
Rating decimal(3,2),
country_id int,
country_name varchar(50)
);

desc country;

insert into Country (country_name, population_in_lakhs, area)
values
('India', 139.00, '3,287,263 sq km'),
('China', 144.00, '9,596,961 sq km'),
('USA', 33.00, '9,833,517 sq km'),
('Canada', 37.74, '9,984,670 sq km'),
('UK', 67.33, '243,610 sq km'),
('Australia', 15.69, '7,692,024 sq km'),
('Croatia', 4.05, '56,594 sq km'),
('Germany', 18.01, '357,022 sq km'),
('Japan', 35.80, '377,975 sq km'),
('Brazil', 21.00, '8,515,767 sq km');

select * from country;

INSERT INTO persons (first_name, last_name, Population, Rating, country_id, country_name)
VALUES
('Raj', 'Kumar', 139.00, 3.5, 1, 'India'),
('Wei', 'Zhang', 144.00, 4.8, 2, 'China'),
('John', 'Smith', 33.00, 4.7, 3, 'USA'),
('Emily', 'Davis', 37.74, 1.6, 4, 'Canada'),
('James', 'Brown', 67.33, 4.5, 5, 'UK'),
('Chloe', 'Taylor', 15.69, 2.9, 6, 'Australia'),
('Luka', 'Horvat', 4.05, 5.0, 7, 'Croatia'),
('Hans', 'Müller', 18.01, 3.3, 8, 'Germany'),
('Yuki', 'Tanaka', 35.80, 4.8, 9, 'Japan'),
('Carlos', 'Silva', 21.00, 1.6, 10, 'Brazil');

select country_name from persons;

Select first_name as Fname, last_name as Lname from persons;

select * from persons where rating >4;

select country_name from country where population_in_lakhs >10;

select * from persons where country_name = 'USA' or rating > 4.5;

select * from persons where country_name is null;

select * from Persons where Country_name in ('USA', 'Canada', 'Uk');

select * from persons where country_name not in ('India', 'Australia');

select * from Country where population_in_lakhs between 5 and 20;

select * from country where Country_name not like 'C%';
