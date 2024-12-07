Create database Employees;
use employees;

#Creating table

CREATE TABLE Managers (
    Manager_id INT PRIMARY KEY AUTO_INCREMENT,
    First_name VARCHAR(50),
    Last_name VARCHAR(50),
    DOB DATE,
    Age INT CHECK (Age > 25),
    Last_update DATE,
    Gender CHAR(1) CHECK (Gender IN ('M', 'F')),
    Department VARCHAR(50) NOT NULL,
    Salary DECIMAL(10,2) NOT NULL
);

#Inserting values

Insert into Managers (First_name, last_name, DOB, Age, Last_update, Gender, Department, Salary)
values
('Aaliya', 'Johnson', '1985-06-12', '38', '2024-12-01', 'F', 'Human Resources', '55000.00'),
('Bob', 'Smith', '1980-02-22', 44, '2024-12-01', 'M', 'IT', 75000.00),
('Charlie', 'Brown', '1990-11-10', 33, '2024-12-02', 'M', 'Sales', 60000.00),
('Daisy', 'Green', '1992-09-08', 32, '2024-12-02', 'F', 'Marketing', 31000.00),
('Ethan', 'Wilson', '1988-01-15', 36, '2024-12-03', 'M', 'Finance', 82000.00),
('Fiona', 'White', '1987-03-30', 37, '2024-12-03', 'F', 'IT', 61000.00),
('George', 'Hall', '1993-07-19', 31, '2024-12-04', 'M', 'Research', 70000.00),
('Hannah', 'King', '1989-12-05', 34, '2024-12-04', 'F', 'Product Development', 19500.00),
('Isaac', 'Carter', '1982-04-25', 42, '2024-12-05', 'M', 'IT', 28000.00),
('Julia', 'Moore', '1991-08-11', 33, '2024-12-05', 'F', 'Administration', 62000.00);

#Name and date of birth of the manager with Manager_Id 1

select First_name, DOB from Managers where manager_id = '1';

#Annual income of all managers

Select Manager_id, first_name, Last_name, Department, salary * 12 as Annual_income from managers;

#Records of all managers except ‘Aaliya'

select * from Managers where not first_name = 'Aaliya';

#Managers whose department is IT and earns more than 25000 per month

Select * from Managers where department = 'IT' and salary > '25000';

#Managers whose salary is between 10000 and 35000

select * from Managers where salary between 10000 and 35000;