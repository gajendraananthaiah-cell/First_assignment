use fsd;
CREATE TABLE products1(
product_id INT PRIMARY KEY AUTO_INCREMENT,
product_name VARCHAR(20) NOT NULL,
category VARCHAR(20),
price INT NOT NULL,
stock_quantity INT NOT NULL);

INSERT INTO products1(product_name,category,price,stock_quantity)
VALUES("PHONE","ELECTRONICS",30000,29),
("DOL","TOYS",2100,20),
("NOTEBOOK","BOOKS",200,48),
("CHARGER","ELECTRONICS",399,30);

INSERT INTO products1(product_name,price,stock_quantity)
VALUES("CAR",30000,29);
SELECT * FROM products1;

CREATE TABLE tech_inventory (
    id INT AUTO_INCREMENT PRIMARY KEY,
    item_name VARCHAR(100) NOT NULL,
    category VARCHAR(50),
    brand VARCHAR(50),
    price DECIMAL(10, 2),
    stock INT,
    supplier_email VARCHAR(100),
    promo_code VARCHAR(15), -- For practicing IS NULL
    rating DECIMAL(2, 1)    -- For practicing > and < comparisons (e.g., 4.5)
);

INSERT INTO tech_inventory 
(item_name, category, brand, price, stock, supplier_email, promo_code, rating)
VALUES 
('Galaxy Tab S9', 'Tablets', 'Samsung', 799.99, 25, 'sales@samsung.com', 'TECH20', 4.8),
('Galaxy Book3', 'Laptops', 'Samsung', 1299.00, 10, 'support@samsung.com', NULL, 4.2),
('iPad Air', 'Tablets', 'Apple', 599.00, 0, 'orders@apple.com', 'APPLE5', 4.9),
('MacBook Air M2', 'Laptops', 'Apple', 1099.00, 15, 'shipping@apple.com', NULL, 4.7),
('Pixel 8 Pro', 'Mobile', 'Google', 999.00, 40, 'direct@google.com', 'PIXEL10', 4.5),
('Pixel Buds Pro', 'Audio', 'Google', 199.99, 100, 'nexus@gmail.com', NULL, 4.3),
('Surface Laptop 5', 'Laptops', 'Microsoft', 999.99, 8, 'store@outlook.com', 'OFFICE', 4.0),
('XPS 13 Laptop', 'Laptops', 'Dell', 1150.00, 5, 'contact@dell.com', NULL, 4.6),
('Insignia Mouse', 'Accessories', 'BestBuy', 15.50, 250, 'bulk@gmail.com', 'CHEAP', 3.5),
('Basic HDMI Cable', 'Accessories', 'Generic', 9.99, 500, 'info@generic.com', NULL, 2.8);

SELECT * FROM tech_inventory;

SELECT price
FROM tech_inventory
WHERE price= 999;

SELECT item_name
FROM tech_inventory
WHERE rating > 4.5;

SELECT category,price
FROM tech_inventory
WHERE category ="Laptops" AND price > 1000;

SELECT brand
FROM tech_inventory 
WHERE brand IN("Samsung","Apple");

SELECT price,rating
FROM tech_inventory 
WHERE rating > 4.5 and price >1000;

SELECT item_name
FROM tech_inventory 
WHERE item_name LIKE("Galaxy%");

SELECT item_name
FROM tech_inventory 
WHERE item_name LIKE("%Air%");

SELECT category
FROM tech_inventory 
WHERE item_name LIKE("_____");

SELECT promo_code
FROM tech_inventory 
WHERE  promo_code IS NOT NULL;

SELECT category,brand
FROM tech_inventory 
WHERE category="Laptops" AND brand="Apple";

SELECT supplier_email,rating
FROM tech_inventory
WHERE rating > 4.0;

SELECT category,max(stock)
FROM tech_inventory
WHERE category="Accessories" AND MAX(stock);


SELECT UPPER(item_name) AS item_name_upper
FROM tech_inventory;

SELECT item_name, LENGTH(item_name) AS name_length
FROM tech_inventory;

SELECT CONCAT(item_name, ' - ', brand) AS product_details
FROM tech_inventory;

-- Add new column discount

ALTER TABLE tech_inventory
ADD discount INT;

-- Modify column datatype - price col to decimal

ALTER TABLE tech_inventory
MODIFY price DECIMAL(10,2);

-- Count products per category

SELECT category ,count(*) AS total_products
FROM tech_inventory
GROUP BY category;

-- Total stock per brand

SELECT brand ,SUM(stock) as total_stock
FROM tech_inventory
GROUP BY brand;

-- Categories with avg price > 500

SELECT category,AVG(price) AS avg_price
FROM tech_inventory
GROUP BY category
HAVING AVG(price) > 500;

-- Add a column created_at

ALTER TABLE tech_inventory
ADD COLUMN created_at timestamp;

-- find the products added today

SELECT  * FROM tech_inventory
WHERE DATE(created_at)= CURDATE();

-- Create supplier table, id, email

CREATE TABLE supplier(
supplier_id INT PRIMARY KEY AUTO_INCREMENT,
email VARCHAR(30) UNIQUE);

-- Add foreign key column ,supplier_id. Add foreign key constraint

ALTER TABLE tech_inventory
ADD COLUMN supplier_id INT;

ALTER TABLE tech_inventory
ADD CONSTRAINT supply_id
FOREIGN KEY(supplier_id) REFERENCES supplier(supplier_id);

-- Insert supplier and link

INSERT INTO supplier(email)
VALUES("ram@gmail.com");

UPDATE tech_inventory
SET supplier_id = 1
WHERE id = 1;

SELECT * FROM supplier;
SELECT * FROM tech_inventory;

-- Find the 2nd highest priced product (without LIMIT)

SELECT MAX(price) AS second_high_price
FROM tech_inventory
WHERE price<(SELECT MAX(price) FROM tech_inventory);

-- Find brands whose avg rating is higher than overall avg rating

SELECT brand
FROM tech_inventory
GROUP BY brand
HAVING AVG(rating)>(SELECT AVG(rating) FROM tech_inventory);

-- Find the most expensive product in each category

SELECT category ,MAX(price) AS max_price
FROM tech_inventory
GROUP BY category;

SELECT *
FROM tech_inventory t1
WHERE price = (
    SELECT MAX(price)
    FROM tech_inventory t2
    WHERE t1.category = t2.category
);

-- Find products contributing top 50% of total inventory value

SELECT *
FROM tech_inventory
WHERE price * stock > (
    SELECT SUM(price * stock) / 2 FROM tech_inventory
);

-- Find products with highest rating in entire table

SELECT * FROM tech_inventory
ORDER BY rating DESC;

-- Find categories where total stock is less than average stock of all categories

SELECT SUM(stock) AS total_stock
FROM tech_inventory
GROUP BY cetogary;

SELECT category
FROM tech_inventory
GROUP BY category
HAVING SUM(stock) < (
SELECT AVG(total_stock) FROM (
SELECT SUM(stock) AS total_stock
FROM tech_inventory
GROUP BY cetogary));

-- Joins, Views, Truncate, CTE, CASE, Window Functions

USE fsd;

CREATE TABLE customersQA (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    city VARCHAR(50),
    signup_date DATE
);

INSERT INTO customersQA (name, email, city, signup_date) VALUES
('Rahul Sharma', 'rahul@gmail.com', 'Bangalore', '2023-01-10'),
('Priya Verma', 'priya@gmail.com', 'Delhi', '2023-02-15'),
('Amit Patel', 'amit@gmail.com', 'Mumbai', '2023-03-20'),
('Sneha Reddy', 'sneha@gmail.com', 'Hyderabad', '2023-04-05'),
('Vikram Singh', 'vikram@gmail.com', 'Chennai', '2023-05-18'),
('Anjali Mehta', 'anjali@gmail.com', 'Pune', '2023-06-22');


CREATE TABLE ordersQA (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    product_name VARCHAR(100),
    amount DECIMAL(10,2),
    order_date DATETIME,
    
    CONSTRAINT fk_customer
    FOREIGN KEY (customer_id)
    REFERENCES customersQA(customer_id)
);

INSERT INTO ordersQA(customer_id, product_name, amount, order_date) VALUES
(1, 'iPhone 14', 79999, '2023-07-01 10:30:00'),
(1, 'AirPods Pro', 24999, '2023-07-05 12:00:00'),
(2, 'Samsung TV', 55999, '2023-07-03 14:20:00'),
(3, 'MacBook Air', 99999, '2023-07-10 09:00:00'),
(4, 'Gaming Mouse', 1999, '2023-07-11 18:45:00'),
(4, 'Mechanical Keyboard', 4999, '2023-07-12 20:10:00'),
(5, 'Smart Watch', 14999, '2023-07-15 16:30:00'),
(2, 'Bluetooth Speaker', 2999, '2023-07-18 11:15:00');

-- Get all orders with customer names

SELECT o.order_id,c.name
FROM ordersQA o
INNER JOIN customersQA c
ON o.customer_id=c.customer_id;

-- Get all customers and their orders (including no orders)

SELECT o.order_id,c.name,o.order_id
FROM ordersQA o
LEFT JOIN customersQA c
ON o.customer_id=c.customer_id;

-- Show order amount category using CASE

SELECT order_id,amount,
CASE
WHEN amount < 2000 then 'low'
WHEN amount BETWEEN 2000 AND 10000 THEN 'medium'
ELSE 'high'
END AS categary
From ordersQA;

-- Count orders per customer

SELECT customer_id, COUNT(*) AS total_orders
FROM ordersQA
GROUP BY customer_id; 

SELECT C.customer_id,o.name,COUNT(o.order_id) AS total_odres
FROM customersQA c
LEFT JOIN ordersQA o
ON c.customer_id = o.customer-id
GROUP BY c.customer_id,c.name;

-- Categorize customers based on spending

SELECT customer_id,SUM(amount) as total_spent,
CASE
	WHEN SUM(amount)>= 500000 then 'high'
    WHEN SUM(amount) between 1000 and 2500 then 'midium'
    ELSE 'low'
END as categary
FROM ordersQA
GROUP BY customer_id;

-- Find customers who ordered multiple products

SELECT customer_id,COUNT(DISTINCT customer_id) as customer
FROM ordersQA
group by customer_id
having COUNT(DISTINCT customer_id)>1;


-- Find customers who ordered multiple products

SELECT c.name, COUNT(DISTINCT o.product_name)
FROM customersQA c
JOIN ordersQA o ON c.customer_id = o.customer_id
GROUP BY c.name;

 -- Find customers with no orders in last 7 days
-- Find customers with orders in July

SELECT DISTINCT customer_id
FROM ordersQA
WHERE MONTH(order_date)= 7;

SELECT DISTINCT
c.customer_id,
c.name
from customersQA c
join ordersQA o
on c.customer_id = o.customer_id
where month(o.order_date)=7;

-- Find customers who never ordered twice in same day

SELECT c.customer_id,c.name
FROM customersQA c
WHERE c.customer_id not in
	(SELECT customer_id
	FROM ordersQA
	GROUP BY customer_id,order_date
	HAVING COUNT(*)>1);
    
-- 
use fsd;
-- Stored Procedure

delimiter $$
 Create procedure get_all_orders()
   begin
   select * from orders;
   end $$
delimiter ;
   
   
-- Procedure with INPUT Parameter

delimiter $$
 Create procedure get_all_orders(in order_id INT)
   begin
   select * from orders
   where id = order_id;
   end $$
delimiter ;

call get_all_orders(1);

-- Calculate Price with Tax

delimiter $$
 CREATE PROCEDURE cal_price_tax(IN price DECIMAL(10,2),IN tax DECIMAL(4,2))
 RETURNS decimal(10,2)
 DERERMINISTIC
 BEGIN
    SET total=price+ (price*tax/100);
    RETURN total;
 END $$
delimiter ;

-- Bank Transfer (TCL, ACID, Stored Procedure)
-- **Scenario:** Write a MySQL Stored Procedure to transfer funds from one account to another.
-- It must ensure ACID properties—if an account lacks funds, or if the update fails, 
-- the entire transaction must roll back.

CREATE TABLE accounts (
    account_id INT PRIMARY KEY,
    account_holder_name VARCHAR(100),
    balance DECIMAL(10,2) NOT NULL CHECK (balance >= 0),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


INSERT INTO accounts (account_id, account_holder_name, balance)
VALUES
(101, 'Ajay', 50000.00),
(102, 'Vinay', 30000.00),
(103, 'Gajendra', 15000.00),
(104, 'Satya', 8000.00),
(105, 'Shiva', 120000.00);

DELIMITER $$

CREATE PROCEDURE TransferAmount(IN sender_id INT ,
IN receiver_id INT,
IN amount DECIMAL(10,2))

BEGIN
DECLARE sender_balance DECIMAL(10,2);

DECLARE 

START TRANSACTION;

SELECT balance INTO sender_balance
FROM accounts
WHERE account_id=sender_id;

UPDATE accounts
SET balance = balance - amount
WHERE account_id = sender_id;

UPDATE accounts
SET balance = balance + amount
WHERE account_id = receiver_id;
COMMIT;


END $$
DELIMITER ;

-- Solution For that transation  Problem
DELIMITER //

CREATE PROCEDURE TransferFunds(
    IN sender_id INT, 
    IN receiver_id INT, 
    IN amount DECIMAL(10,2)
)
BEGIN
    -- Declare variables to hold current balance and handle errors
    DECLARE current_balance DECIMAL(10,2);
    DECLARE sql_error INT DEFAULT 0;
    
    -- Declare an exception handler for any SQL errors
    DECLARE CONTINUE HANDLER FOR SQLEXCEPTION SET sql_error = 1;

    -- Start the transaction (Ensures Atomicity)
    START TRANSACTION;

    -- Lock the sender's row for update to prevent race conditions (Ensures Isolation)
    SELECT balance INTO current_balance 
    FROM accounts 
    WHERE account_id = sender_id FOR UPDATE;

    -- Check if sender has enough funds (Ensures Consistency)
    IF current_balance < amount THEN
        ROLLBACK;
        SELECT 'Insufficient funds' AS Status;
    ELSE
        -- Deduct from sender
        UPDATE accounts SET balance = balance - amount WHERE account_id = sender_id;
        
        -- Add to receiver
        UPDATE accounts SET balance = balance + amount WHERE account_id = receiver_id;

        -- Check if any error occurred during updates
        IF sql_error = 1 THEN
            ROLLBACK;
            SELECT 'Transaction failed due to system error' AS Status;
        ELSE
            COMMIT; -- Ensures Durability
            SELECT 'Transfer successful' AS Status;
        END IF;
    END IF;
END //

DELIMITER ;
















	






















