 -- FOREGIN KEY -> A Foregin key is a column in a table that refers to the primary key in another table.

CREATE TABLE customers(
customer_id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(20),
email varchar(30));

CREATE TABLE orders(
order_id INT PRIMARY KEY AUTO_INCREMENT,
order_date DATE,
customer_id INT,
FOREIGN KEY (customer_id) REFERENCES customers(customer_id));
 /* foreign key should always point to primary key or unique key*/

USE fsd;
SHOW tables;
DROP TABLE orders;

DESCRIBE orders;
DESCRIBE customers;

INSERT INTO customers(name,email) 
VALUES("VIRAT","virat@gmail.com"),
("ROHIT","rohit@gmail.com"),
("RAJAT","rajat@gmail.com");

SELECT * FROM customers;

INSERT INTO orders(order_date,customer_id)
VALUES ("2026-04-02",3),
("2026-06-05",2),
("2026-05-23",3);

INSERT INTO orders(order_date,customer_id)
VALUES ("2026-04-02",4); -- ERROR 
/* Every foreign data which you going to insert must be exist in parent data otherwise it won't insert*/

SELECT * FROM orders;

SELECT customer_id FROM customers WHERE name="ROHIT";

SELECT * FROM orders WHERE customer_id=2;
-- SUB QUERY --
SELECT * FROM orders WHERE customer_id=(SELECT customer_id FROM customers WHERE name="ROHIT");

-- delete customer_id 2
 
 DELETE FROM customers WHERE customer_id=2;
 -- delete
 
 -- ON DELETE CASCADE -> a foreign key rule, When a record in the parent table is deleted, 
					   /*All related records in the child table are automatically deleted,
						 It maintains referential integrity without errors*/

CREATE TABLE orders_new(
order_id INT PRIMARY KEY AUTO_INCREMENT,
customer_id INT,
FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
ON DELETE CASCADE);

INSERT INTO orders_new(customer_id)
VALUES(1);

SELECT * FROM orders_new;

DELETE FROM orders_new WHERE customer_id=1;

-- ASSIGNMENT 
-- Customer, Orders, Order_iteam

CREATE TABLE Customer(
customer_id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(20));

CREATE TABLE OrdersA(
order_id INT PRIMARY KEY AUTO_INCREMENT,
order_status VARCHAR(20) DEFAULT "Undeliverd",
Customer_id INT,
FOREIGN KEY (Customer_id) REFERENCES Customer(customer_id)
ON DELETE CASCADE);

CREATE TABLE Orders_iteam(
iteam_id INT PRIMARY KEY AUTO_INCREMENT,
iteam_name VARCHAR(20),
order_id INT,
FOREIGN KEY (order_id) REFERENCES OrdersA(order_id)
ON DELETE CASCADE);

INSERT INTO Customer(name) VALUES("TIM"),("SALT"),("VIRAT");

INSERT INTO OrdersA(order_status,Customer_id) 
VALUES("InProgress",2),("Out for Delivery",3);

INSERT INTO OrdersA(Customer_id) 
VALUES(1);

INSERT INTO Orders_iteam(iteam_name,order_id) 
VALUES("BAT",3),("WICKETS",2),("BALL",1);

SELECT * FROM Customer;
SELECT * FROM OrdersA;
SELECT * FROM Orders_iteam;

DELETE FROM OrdersA WHERE order_id=2;

-- ASSIGNMENT 2

CREATE TABLE Customer1(
customer_id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(20));

CREATE TABLE OrdersA1(
order_id INT PRIMARY KEY AUTO_INCREMENT,
order_status VARCHAR(20) DEFAULT "Undeliverd",
Customer_id INT,
FOREIGN KEY (Customer_id) REFERENCES Customer(customer_id)
ON DELETE CASCADE);

CREATE TABLE Orders_iteam1(
iteam_id INT PRIMARY KEY AUTO_INCREMENT,
iteam_name VARCHAR(20),
Customer_id INT,
FOREIGN KEY (Customer_id) REFERENCES Customer(customer_id)
ON DELETE CASCADE);

-- ON DELETE SET NULL -> When a record in the parent table is deleted, 
					   /*The foreign key value in the child table becomes NULL, 
						 Instead of deleting the child rows
                         It will remove the link b/w parent and child*/

CREATE TABLE orders_temp(
order_id INT PRIMARY KEY AUTO_INCREMENT,
customer_id INT,
FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
ON DELETE SET NULL);

-- ON DELETE RISTRICT -> You cannot delete a record from the parent table,
					   /*IF child rows exist in the child table
						 SQL will block the delete operation and give an error.*/


-- RELATIONSHIPS
    -- ONE TO ONE -> One row in Table A is linked to exactly one row in Table B.
    -- UNIQUE
CREATE TABLE person(
person_id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(20));

CREATE TABLE passport(
passport_id INT PRIMARY KEY AUTO_INCREMENT,
series VARCHAR(8),
person_id INT UNIQUE,
FOREIGN KEY (person_id) REFERENCES person(person_id)
);

INSERT INTO person(name) 
VALUES("SALT"),
("VIRAT"),
("DDP"),
("KURNAL");

SELECT * FROM person;
SELECT * FROM p assport;

INSERT INTO passport(series,person_id)
VALUES("ABCD1234",1),
("ABCD2003",2),
("ABCD2004",3),
("ABCD2005",4);

-- ONE TO MANY -> One record in Table A can be linked to many records in Table B.

-- MANY TO MANY -> Many records in Table A can be linked to many records in Table B.

CREATE TABLE student(
student_id INT PRIMARY KEY AUTO_INCREMENT,
name varchar(20)
);

CREATE TABLE course(
course_id INT PRIMARY KEY AUTO_INCREMENT,
course_name VARCHAR(20));

CREATE TABLE student_course(
student_id INT,
course_id INT,
FOREIGN KEY (course_id) REFERENCES course(course_id),
FOREIGN KEY (student_id) REFERENCES student(student_id),
PRIMARY KEY(student_id,course_id)-- Composite key -> combination of two tables, to avoid duplicate.
);

INSERT INTO student(name) 
VALUES("JOSH"),("BUVI"),("YADAV");
INSERT INTO course(course_name) 
VALUES("JAVA"),("PYTHON"),("SQL");
INSERT INTO student_course(student_id,course_id) 
VALUES(1,1),(2,3),(2,1);

SELECT * FROM student;
SELECT * FROM course;
SELECT * FROM student_course;

-- Composite Key -> Made up of two of more columns together ->uniquely
				-- in query Performance will be slow 
