-- Creating of BookStore Database
-- CREATE DATABASE BookStore;
USE BookStore;

-- Creating Users
CREATE USER 'cate_admin'@'%' IDENTIFIED BY 'cate001';
GRANT ALL PRIVILEGES ON bookstore.* TO 'cate_admin'@'%' WITH GRANT OPTION;

CREATE USER 'pat_admin'@'%' IDENTIFIED BY 'pat002';
GRANT ALL PRIVILEGES ON bookstore.* TO 'pat_admin'@'%' WITH GRANT OPTION;

CREATE USER 'evan_admin'@'%' IDENTIFIED BY 'evan003';
GRANT ALL PRIVILEGES ON bookstore.* TO 'evan_admin'@'%' WITH GRANT OPTION;

FLUSH PRIVILEGES;


-- Creating Book Author Table
CREATE TABLE Book_Author (
book_author_id INT,
book_id INT,
author_id INT,
PRIMARY KEY(book_id,author_id)
);

INSERT INTO Book_Author(book_author_id, book_id, author_id)
VALUES (1, 'English'), (2, 'French'), (3, 'English'), (2, 'French')


-- Creating Book Language Table
CREATE TABLE Book_Language (
language_id INT PRIMARY KEY AUTO_INCREMENT,
genre VARCHAR(50),
language_name VARCHAR(50)
);

INSERT INTO book_language (genre, language_name)
VALUES
('fiction', 'english'),
('literature', 'french');

-- Creating Publisher Table
CREATE TABLE Publisher (
publisher_id INT PRIMARY KEY AUTO_INCREMENT,
firstName VARCHAR(50),
secondName VARCHAR(50),
contactEmail VARCHAR(50)
);
INSERT INTO publisher (firstName, secondName, contactEmail)
VALUES
('klb', 'publishers', 'klb@publishers.com'),
('moran', 'publishers', 'moran@publishers.com'),
('oxford', 'publishers', 'oxford@publishers.com');

-- Creating Book Table
CREATE TABLE Book (
book_id INT PRIMARY KEY AUTO_INCREMENT, 
title VARCHAR(50),
publisher_id INT, 
language_id INT,
published_year VARCHAR(50),
unit_price DECIMAL(10,2),
stock_quantity INT,
Genre VARCHAR(50),
FOREIGN KEY (language_id) REFERENCES Book_Language(language_id),
FOREIGN KEY (publisher_id) REFERENCES Publisher(publisher_id)
);

INSERT INTO book (title, publisher_id, language_id, published_year, unit_price, stock_quantity, genre)
VALUES
('theanimalfarm', 1, 1, 1997, 600, 20, 'fiction'),
('richdadpoordad', 2, 2, 1998, 500, 30, 'selfhelp'),
('harrypotter', 3, 3, 2000, 600, 20, 'fiction');


-- Creating Author Table
CREATE TABLE Author (
author_id INT PRIMARY KEY AUTO_INCREMENT,
firstName VARCHAR(50),
secondName VARCHAR(50)
);

INSERT INTO author (firstName, secondName)
VALUES
('harper', 'lee'),
('jane', 'brown'),
('frank', 'scott');


-- Creating Customer Table
CREATE TABLE Customer (
customer_id INT PRIMARY KEY AUTO_INCREMENT,
firstName VARCHAR(50),
secondName VARCHAR(50),
email VARCHAR(50),
phoneNumber VARCHAR(50)
);

INSERT INTO customer (firstName, secondName, email, phoneNumber)
VALUES
('Patricia', 'Wairimu', 'patmbugus@gmail.com', 0724165917),
('Evan', 'Omanga', 'evanomanga@gmail.com', 0704541058),
('Catherine', 'Abugah', 'cateabugah@gmail.com', 0724165917);



-- Creating Country Table
CREATE TABLE Country (
country_id INT PRIMARY KEY AUTO_INCREMENT,
countryName VARCHAR(50),
countryCode VARCHAR(50)
);

INSERT INTO country (countryName, countryCode)
VALUES
('kenya', 254),
('tanzania', 255),
('uganda', 253),
('turkey', 234);


-- Creating Address Table
CREATE TABLE Address (
address_id INT PRIMARY KEY AUTO_INCREMENT,
street VARCHAR(50),
city VARCHAR(50),
postalCode VARCHAR(50),
country_id INT,
FOREIGN KEY (country_id) REFERENCES Country(country_id)
);

INSERT INTO address (street, city, postalCode)
VALUES
('riverroad', 'nairobi', '11993'),
('mugweni', 'daresalaam', '28101'),
('mugoba', 'kampala', '24513'),
('newvine', 'bucharest', '40-200');


-- Creating Address Status Table
CREATE TABLE Address_Status (
address_status_id INT PRIMARY KEY AUTO_INCREMENT,
address_status_name VARCHAR(50)
);

INSERT INTO address_status (address_status_name)
VALUES
('current'),
('old'),
('current'),
('old');


-- Creating Customer Address Table
CREATE TABLE Customer_Address (
customer_address_id INT,
customer_id INT,
address_id INT,
address_status_id INT,
PRIMARY KEY(customer_id,address_id),
FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
FOREIGN KEY (address_id) REFERENCES Address(address_id),
FOREIGN KEY (address_status_id) REFERENCES Address_Status(address_status_id)
);

INSERT INTO customer_address (customer_address_id)
VALUES
(1),
(2),
(3);



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

INSERT INTO cust_order (total_amount, payment_method, order_status, method_name, shipping_address)
VALUES
('150.00', 'cash' 'shipped', 'air', 'hse07emombasa'),
('300.00', 'card' 'pending', 'sea', 'hse009kilifi');


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

-- To auto-calculate line-total
DELIMITER $$

CREATE TRIGGER before_insert_order_line
BEFORE INSERT ON Order_Line
FOR EACH ROW
BEGIN
  SET NEW.line_total = NEW.quantity * NEW.unit_price;
END$$

DELIMITER ;


-- Creating Order Line Table
CREATE TABLE Order_Line (
order_line_id INT,
order_id INT,
book_id INT,
quantity INT,
PRIMARY KEY(order_id,book_id),
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


-- Create an Order and link book
INSERT INTO Cust_Order (customer_id, total_amount, payment_method, order_status, method_name, shipping_address)
VALUES (1, 1230.00, 'Mobile Money', 'Pending', 'M-Pesa', '123 Market St, Nairobi');


-- Adding data to Order_Line Table
INSERT INTO Order_Line (order_line_id, order_id, book_id, quantity, unit_price)
VALUES (1, 1, 1, 5, 1230.00);


-- Adding data to Order_History Table
INSERT INTO Order_History (order_id, address_id, order_status_id, updated_by, notes)
VALUES (1, 1, 'Pending', SYSTEM_USER(),'Initial order placed');
