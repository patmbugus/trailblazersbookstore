-- Creating of BookStore Database
CREATE DATABASE BookStore;

-- Creating Book Author Table
CREATE TABLE Book_Author (
book_author_id INT PRIMARY KEY AUTO_INCREMENT,
book_id INT,
author_id INT
);

-- Creating Book Language Table
CREATE TABLE Book_Language (
language_id INT PRIMARY KEY AUTO_INCREMENT,
genre VARCHAR(50),
language_name VARCHAR(50)
);

-- Creating Publisher Table
CREATE TABLE Publisher (
publisher_id INT PRIMARY KEY AUTO_INCREMENT,
firstName VARCHAR(50),
secondName VARCHAR(50),
contactEmail VARCHAR(50)
);

-- Creating Book Table
CREATE TABLE Book (
book_id INT PRIMARY KEY, 
title VARCHAR(50),
publisher_id INT, 
language_id INT,
published_year VARCHAR(50),
unit_price DECIMAL(10,2),
stock_quantity INT,
Genre VARCHAR(50),
FOREIGN KEY (book_id) REFERENCES Book_Author(book_id),
FOREIGN KEY (language_id) REFERENCES Book_Language(language_id),
FOREIGN KEY (publisher_id) REFERENCES Publisher(publisher_id)
);

-- Creating Author Table
CREATE TABLE Author (
author_id INT PRIMARY KEY AUTO_INCREMENT,
firstName VARCHAR(50),
secondName VARCHAR(50)
);

-- Creating Customer Table
CREATE TABLE Customer (
customer_id INT PRIMARY KEY AUTO_INCREMENT,
firstName VARCHAR(50),
secondName VARCHAR(50),
email VARCHAR(50),
phoneNumber VARCHAR(50)
);


-- Creating Country Table
CREATE TABLE Country (
country_id INT PRIMARY KEY AUTO_INCREMENT,
countryName VARCHAR(50),
countryCode VARCHAR(50)
);


-- Creating Address Table
CREATE TABLE Address (
address_id INT PRIMARY KEY AUTO_INCREMENT,
street VARCHAR(50),
city VARCHAR(50),
postalCode VARCHAR(50),
country_id INT,
FOREIGN KEY (country_id) REFERENCES Country(country_id)
);


-- Creating Address Status Table
CREATE TABLE Address_Status (
address_status_id INT PRIMARY KEY AUTO_INCREMENT,
address_status_name VARCHAR(50)
);


-- Creating Customer Address Table
CREATE TABLE Customer_Address (
customer_address_id INT PRIMARY KEY AUTO_INCREMENT,
customer_id INT,
address_id INT,
address_status_id INT,
FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
FOREIGN KEY (address_id) REFERENCES Address(address_id),
FOREIGN KEY (address_status_id) REFERENCES Address_Status(address_status_id)
);

-- Creating Cust Order Table
CREATE TABLE Cust_Order (
order_id INT PRIMARY KEY AUTO_INCREMENT,
customer_id INT,
orderDate DATETIME DEFAULT CURRENT_TIMESTAMP,
total_amount DECIMAL(10,2) NOT NULL,
payment_method VARCHAR(50) NOT NULL,
order_status VARCHAR(50) NOT NULL,
method_name VARCHAR(50),
shipping_address VARCHAR(50)
);


-- Creating Order Status Table
CREATE TABLE Order_Status (
order_status_id INT PRIMARY KEY AUTO_INCREMENT,
order_status VARCHAR(50),
description_name VARCHAR(50)
);

-- Creating Order History Table
CREATE TABLE Order_History (
history_id INT PRIMARY KEY AUTO_INCREMENT,
order_id INT,
address_id INT,
order_status_id VARCHAR(50),
changed_at DATETIME DEFAULT CURRENT_TIMESTAMP,
updated_by VARCHAR(50),
notes VARCHAR(50)
);


-- Creating Order Line Table
CREATE TABLE Order_Line (
order_line_id INT PRIMARY KEY AUTO_INCREMENT,
order_id INT,
book_id INT,
quantity INT,
unit_price DECIMAL(10,2) NOT NULL,
line_total DECIMAL(10,2)
);


-- Creating Shipping Method Table
CREATE TABLE Shipping_Method (
shipping_method_id INT PRIMARY KEY AUTO_INCREMENT,
country_id INT,
book_id INT,
method_name VARCHAR(50),
delivery_time DATETIME DEFAULT CURRENT_TIMESTAMP,
shipping_cost DECIMAL(10,2)
);





