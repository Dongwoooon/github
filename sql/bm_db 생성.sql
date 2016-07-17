show databases;
show variables like 'datadir';

create database BM_exercise;
use BM_exercise;
show tables;

create table customer(CustomerID integer, Name varchar(10), Gender char(1),	
	Age integer, Address varchar(10), VIP char(1));
show tables;
LOAD DATA LOCAL INFILE 'E://customer.csv' INTO TABLE customer FIELDS TERMINATED BY ',';

create table prod(ProdID integer, ProductCategory char(1),	ManufacturerID integer,
	ProductName varchar(15), IssueDate date, Brand varchar(20),	
	UnitPrice integer,	Color varchar(10));
show tables;
LOAD DATA LOCAL INFILE 'E://prod.csv' INTO TABLE prod FIELDS TERMINATED BY ',';

create table purchase(Order_No integer, CustomerID int,	PurchaseDate date,	
	PaymentMethod varchar(15),	DeliveryMethod varchar(15),	OrderQuantity int,
	TotalPurchasePrice int,	ProdID int);

show tables;
LOAD DATA LOCAL INFILE 'E://purchase.csv' INTO TABLE purchase FIELDS TERMINATED BY ',';