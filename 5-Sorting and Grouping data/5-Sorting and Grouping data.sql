create database countrydb;
use countrydb;

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

desc persons;

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

select left(country_name,3) as country_code from country;

select concat(first_name, ' ', last_name) as full_name from persons;

select count(distinct country_name) as number_of_countries from country;

select max(population_in_lakhs) as max_population from country;

select	min(population_in_lakhs) as min_population from country;

insert into persons (first_name, last_name, Population, Rating, country_id, country_name)
values
('Raam',null, 0.03, 1.5, 1, 'India'),
('Woo',null, 0.02, 3.8, 2, 'China');

select count(last_name) as count_of_lastnames from persons;

select count(*) as Total_rows from persons;

select population_in_lakhs from country limit 3;

select * from country order by rand() limit 3;

select * from persons order by rating desc;

Select country_name, SUM(Population) as Total_Population from persons group by country_name;

select country_name from persons group by country_name having sum(Population) >0.5;

select country_name, count(*) as number_of_persons, avg(rating) as average_rating
from persons group by country_name having count(*) >1 order by average_rating asc;
# There are no countries in persons table with more than two persons