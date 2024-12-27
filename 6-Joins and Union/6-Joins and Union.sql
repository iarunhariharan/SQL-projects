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

SELECT p.Id AS person_id, p.first_name, p.last_name, p.rating, c.country_name, c.Population_In_lakhs, c.Area
FROM persons p
INNER JOIN country c
ON p.country_id = c.Id;

SELECT p.Id AS person_id, p.first_name, p.last_name, p.rating, c.country_name, c.Population_In_lakhs, c.Area
FROM persons p
LEFT JOIN country c
ON p.country_id = c.Id;

SELECT p.Id AS person_id, p.first_name, p.last_name, p.rating, c.country_name, c.Population_In_lakhs, c.Area
FROM persons p
LEFT JOIN country c
ON p.country_id = c.Id;

SELECT p.Id AS person_id, p.first_name, p.last_name, p.rating, c.country_name, c.Population_In_lakhs, c.Area
FROM persons p
RIGHT JOIN country c
ON p.country_id = c.Id;

SELECT DISTINCT country_name FROM country
UNION
SELECT DISTINCT country_name FROM persons;

SELECT country_name FROM country
UNION ALL
SELECT country_name FROM persons;

SELECT Id, first_name, last_name, ROUND(rating) AS rounded_rating, country_name
FROM persons;
