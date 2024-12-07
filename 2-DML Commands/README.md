#Managers Table Assignment

This project demonstrates fundamental SQL operations, including table creation, data insertion, and various types of queries. It uses a Managers table to manage data and enforce constraints while performing basic data manipulations.

Table Structure

The Managers table includes the following fields:

Manager_Id: Primary Key, Auto-increment.
First_name: Manager's first name.  
Last_name: Manager's last name.  
DOB: Date of birth.
Age: Manager's age with a CHECK constraint.  
Last_update: Date when the record was last  updated.  
Gender: Manager's gender, constrained to 'M' or 'F'.
Department: The department the manager works in (NOT NULL).  
Salary: Monthly salary in decimal format (NOT NULL).

Objectives:

Create the Table: Use SQL to create a table named Managers with the fields listed above, enforcing constraints where applicable.
Insert Data: Add 10 rows of sample data to the table.
Write Queries:
Retrieve the name and date of birth of the manager with Manager_Id = 1.
Display the annual income of all managers (calculated as Salary * 12).
Display records of all managers except those named 'Aaliya'.
Display details of managers whose department is IT and who earn more than 25,000 per month.
Display details of managers whose salary is between 10,000 and 35,000.
