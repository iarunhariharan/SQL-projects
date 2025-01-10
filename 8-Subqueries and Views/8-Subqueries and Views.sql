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

-- 1. Find the number of persons in each country.
SELECT 
    country_name, 
    COUNT(*) AS Person_Count
FROM persons
GROUP BY country_name;

-- 2. Find the number of persons in each country sorted from high to low.
SELECT 
    country_name, 
    COUNT(*) AS Person_Count
FROM persons
GROUP BY country_name
ORDER BY Person_Count DESC;

-- 3. Find out an average rating for Persons in respective countries if the average is greater than 3.0.
SELECT 
    country_name, 
    AVG(Rating) AS Average_Rating
FROM persons
GROUP BY country_name
HAVING Average_Rating > 3.0;

-- 4. Find the countries with the same rating as the USA. (Use Subqueries)
SELECT country_name
FROM persons
WHERE Rating = (SELECT Rating FROM persons WHERE country_name = 'USA');

-- 5. Select all countries whose population is greater than the average population of all nations.
SELECT 
    country_name, 
    Population_In_lakhs
FROM country
WHERE Population_In_lakhs > (SELECT AVG(Population_In_lakhs) FROM country);


-- Create the Product database and Customer table
CREATE DATABASE Product;

USE Product;

CREATE TABLE Customer (
    Customer_Id INT AUTO_INCREMENT PRIMARY KEY,
    First_name VARCHAR(50),
    Last_name VARCHAR(50),
    Email VARCHAR(100),
    Phone_no VARCHAR(15),
    Address VARCHAR(255),
    City VARCHAR(50),
    State VARCHAR(50),
    Zip_code VARCHAR(10),
    Country VARCHAR(50)
);

INSERT INTO Customer (First_name, Last_name, Email, Phone_no, Address, City, State, Zip_code, Country)
VALUES
('John', 'Doe', 'john.doe@example.com', '1234567890', '123 Elm St', 'Los Angeles', 'California', '90001', 'US'),
('Jane', 'Smith', 'jane.smith@example.com', '0987654321', '456 Oak St', 'San Francisco', 'California', '94101', 'US'),
('Alice', 'Johnson', 'alice.johnson@example.com', '1122334455', '789 Pine St', 'New York', 'New York', '10001', 'US'),
('Bob', 'Brown', 'bob.brown@example.com', '2233445566', '321 Maple St', 'Chicago', 'Illinois', '60601', 'US'),
('Carol', 'Taylor', 'carol.taylor@example.com', '3344556677', '654 Cedar St', 'Houston', 'Texas', '77001', 'US'),
('David', 'Wilson', 'david.wilson@example.com', '4455667788', '987 Birch St', 'Phoenix', 'Arizona', '85001', 'US'),
('Eve', 'Davis', 'eve.davis@example.com', '5566778899', '246 Spruce St', 'Seattle', 'Washington', '98101', 'US'),
('Frank', 'Miller', 'frank.miller@example.com', '6677889900', '135 Willow St', 'Boston', 'Massachusetts', '02101', 'US'),
('Grace', 'Anderson', 'grace.anderson@example.com', '7788990011', '864 Palm St', 'Miami', 'Florida', '33101', 'US'),
('Hank', 'Thomas', 'hank.thomas@example.com', '8899001122', '753 Fir St', 'Denver', 'Colorado', '80201', 'US');

-- 1. Create a view named: customer_info for the Customer table that displays Customer’s Full name and email address.
CREATE VIEW customer_info AS
SELECT 
    CONCAT(First_name, ' ', Last_name) AS Full_Name, 
    Email
FROM Customer;

-- Perform the SELECT operation for the customer_info view.
SELECT * FROM customer_info;

-- 2. Create a view named US_Customers that displays customers located in the US.
CREATE VIEW US_Customers AS
SELECT *
FROM Customer
WHERE Country = 'US';

-- 3. Create another view named Customer_details with columns:
CREATE VIEW Customer_details AS
SELECT 
    CONCAT(First_name, ' ', Last_name) AS Full_Name, 
    Email, 
    Phone_no, 
    State
FROM Customer;

-- 4. Update phone numbers of customers who live in California for Customer_details view.
UPDATE Customer
SET Phone_no = 'Updated Phone Number'
WHERE State = 'California';
 
 select * from Customer_details WHERE State = 'California';
 
-- 5. Count the number of customers in each state and show only states with more than 5 customers.
SELECT 
    State, 
    COUNT(*) AS Customer_Count
FROM Customer
GROUP BY State
HAVING Customer_Count > 5;

-- 6. Write a query that will return the number of customers in each state, based on the "state" column in the "customer_details" view.
SELECT 
    State, 
    COUNT(*) AS Customer_Count
FROM Customer_details
GROUP BY State;

-- 7. Write a query that returns all the columns from the "customer_details" view, sorted by the "state" column in ascending order.
SELECT *
FROM Customer_details
ORDER BY State ASC;
