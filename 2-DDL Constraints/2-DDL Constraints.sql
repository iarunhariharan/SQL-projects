create database sales;
use sales;

create table orders (
orderId int auto_increment primary key,
customerName varchar(50) Not null,
productCategory varchar(50),
orderedItem varchar(50),
contactNumber varchar(15) unique
);

alter table orders add order_quantity int;

Rename table orders to sales_orders;

Insert into sales_orders (customername, productCategory, ordereditem, contactNumber, order_quantity)
values
('John Doe', 'Electronics', 'Smartphone', '1234567890',2),
('Jane Smith', 'Home Appliances', 'Vacuum Cleaner', '9876543210',5),
('Emily Brown', 'Furniture', 'Dining Table', '1122334455',3),
('Michael Green', 'Fashion', 'Leather Jacket', '5566778899',1),
('Sarah White', 'Books', 'Science Fiction Novel', '9988776655',4),
('David Johnson', 'Electronics', 'Laptop', '6677889900',7),
('Emma Wilson', 'Toys', 'Building Blocks Set', '7788990011',2),
('Liam Harris', 'Groceries', 'Organic Honey', '8899001122',5),
('Olivia Davis', 'Sports', 'Tennis Racket', '9900112233',3),
('Sophia Martinez', 'Beauty', 'Skincare Kit', '1231231234',8);

Select customername, orderedItem from Sales_orders;

Update Sales_orders 
set ordereditem = 'Television' 
where orderId = 6;

Drop Table sales_orders;