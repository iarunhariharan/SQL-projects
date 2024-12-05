#Creating database

create database School;

use school;

#Creating tables

create table Student (
Rollnumber int auto_increment primary key,
Name varchar(50) not null,
Marks varchar(100) not null,
Grade char(1) check (grade in ('A', 'B', 'c', 'D'))
);

select * from student;

#Adding column

alter table student
add contact varchar(100) unique;

#Inserting values

insert into student (Name, marks, Grade, contact)
values
('Arun', '90', 'A', 'arun@example.com'),
('Robert', '65', 'c', 'robert@example.com'),
('Chris', '75', 'B', 'chris@example.com');

select * from student;

#Removing column

alter table student drop column grade;

#Renaming table
Rename table Student to ClassTen;

#Delete all rows
truncate table ClassTen;

Select * from classTen;

#Remove table from the database
drop table ClassTen;