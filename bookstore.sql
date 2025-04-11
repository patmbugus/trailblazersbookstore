-- Creating of Database
CREATE DATABASE BookStore;

-- Creating Book Table
CREATE TABLE Book (
book_id INT PRIMARY KEY,
title VARCHAR(50),
publisher_id INT, 
language_id INT,
published_year VARCHAR(50),
unit_price DECIMAL(10,2),
stock_quantity INT
);
