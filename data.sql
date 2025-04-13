USE BookStore;

INSERT INTO Country (countryName) VALUES ('Romania');
INSERT INTO Address_Status (address_status_name) VALUES ('Current');
INSERT INTO Order_Status (description_name) VALUES ('Pending');
INSERT INTO Book_Language (language_name) VALUES ('English');
INSERT INTO Publisher (firstName) VALUES ('Pearson');
INSERT INTO Publisher (secondName) VALUES ('Ranee');
INSERT INTO Shipping_Method (method_name) VALUES ('Local Delivery');


-- INSERT INTO Customer (firstName, secondName, email, phoneNumber)
VALUES ('Shale', 'Doe', 'shale@gmail.com', +345689002);

-- INSERT INTO Address (street, city, postalCode)
VALUES ('123 Mountain Rd', 'Bucharest', '003500');

SELECT * FROM Address WHERE address_id = 1;

INSERT INTO Customer_Address (customer_address_id, customer_id, address_id, address_status_id)
VALUES (1, 1, 1, 1);

SELECT * FROM Address WHERE address_id = 1;
SELECT * FROM Customer WHERE customer_id = 1;
SELECT * FROM Address_Status WHERE address_status_id = 1;

INSERT INTO Country (country_id, countryName, countryCode) VALUES (2, 'Kenya', 567);

INSERT INTO Address (street, city, postalCode, country_id)
VALUES ('456 Sunset Blvd', 'Kampala', '00256', 2);


-- Insert Customer and address
INSERT INTO Customer (firstName, secondName, email, phoneNumber)
VALUES ('Biggy', 'Endrin', 'biggy@yahoo.com', +234455789000);

INSERT INTO Address_Status (address_status_name) VALUES ('Current');

Insert Author, book and then linking them
INSERT INTO Author (firstName, secondName) VALUES ('Chinua',  'Achebe');


INSERT INTO Book (title, publisher_id, language_id, published_year, unit_price, stock_quantity, genre)
VALUES ('Things Fall Apart', 1, 1, '1968', 1577.00, 28, 'Poetry');

INSERT INTO Book_Author (book_id, author_id) VALUES (1, 1);

-- Create an Order and link book
INSERT INTO Cust_Order (customer_id, total_amount, payment_method, order_status, method_name, shipping_address)
VALUES (1, 1230.00, 'Mobile Money', 'Pending', 'M-Pesa', '123 Market St, Nairobi');


-- To set to automatic calculation of line total in Order_Line Table
DELIMITER $$

CREATE TRIGGER before_insert_order_line
BEFORE INSERT ON Order_Line
FOR EACH ROW
BEGIN
  SET NEW.line_total = NEW.quantity * NEW.unit_price;
END$$

DELIMITER ;

-- Adding data to Order_Line Table
INSERT INTO Order_Line (order_line_id, order_id, book_id, quantity, unit_price)
VALUES (1, 1, 1, 5, 1230.00);

-- Adding data to Order_History Table
INSERT INTO Order_History (order_id, address_id, order_status_id, updated_by, notes)
VALUES (1, 1, 'Pending', SYSTEM_USER(),'Initial order placed');

