--  ARITHMETIC OPERATORS: Arithmetic Operators are used to perform mathematical calculations on numbers stored in database columns.
/*  Types
+	Addition	
-	Subtraction	
*	Multiplication	
/	Division	
%	Modulus (remainder)*/

CREATE TABLE people1(
id INT PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(30),
age INT,
location VARCHAR(30));

INSERT INTO people1(name,age,location) 
VALUES
("ROY",25,'UK'),
("LIV",32,'USA'),
("STEAM",23,'NZ'),
("ROBIN",15,'WI');

SELECT * FROM people1;

SELECT id,name,age,age*2 AS age_after_5years FROM people1;
-- CART TABLE
CREATE TABLE cart(
id INT AUTO_INCREMENT PRIMARY KEY, 
iteam_name VARCHAR(20), 
iteam_price INT,
iteam_qty INT
);

INSERT INTO cart(iteam_name,iteam_price,iteam_qty)
VALUES
("BAT",3000,2),
("BALL",8000,4),
("BELLS",6000,3),
("WICKETS",1000,2);

SELECT * FROM cart;
-- query to get total price
SELECT iteam_name,iteam_pr ice,iteam_qty,iteam_price*iteam_qty AS total_price FROM cart;
SELECT SUM(iteam_price*iteam_qty ) AS final_price FROM cart;

-- DISCOUNT

/*	Total Price = ITEM_PRICE * ITEM_QTY
	Discount Amount = Total Price * Discount_Percentage / 100
	Final Price = Total Price - Discount Amount  */

SELECT iteam_name,iteam_price,iteam_qty,
(iteam_price * iteam_qty) AS total_price,
(iteam_price*iteam_qty) * 7 / 100 AS discount,
(iteam_price*iteam_qty) + ((iteam_price*iteam_qty) * 7 / 100) AS final_price
FROM cart;

-- TAX CALCULATION

/*Total Price= ITEM_PRICE * ITEM_QTY
tax amount = TOTAL_PRICE * TAX_PERCENT / 100
final price = TOTAL_PRICE + TAX_AMOUNT*/

SELECT iteam_name,iteam_price,iteam_qty,
(iteam_price * iteam_qty) AS total_price,
(iteam_price*iteam_qty) * 18 / 100 AS tax_amount,
(iteam_price*iteam_qty) - ((iteam_price*iteam_qty) * 18 / 100) AS final_price
FROM cart;

-- DISCOUNT + TAX

SELECT iteam_name,iteam_price,iteam_qty,
(iteam_price * iteam_qty) AS total_price,
(iteam_price*iteam_qty) * 18 / 100 AS tax_amount,
(iteam_price*iteam_qty) * 7 / 100 AS discount,
(iteam_price*iteam_qty) + ((iteam_price*iteam_qty) * 7 / 100) AS tax_and_discount,
((iteam_price*iteam_qty) + (iteam_price*iteam_qty) * 18 / 100) - ((iteam_price*iteam_qty) * 7 / 100) AS final_price
FROM cart;


-- MODIDIFYING TABLE
		-- Modifying a table means changing the structure of an existing table. rhe command used is ALTER TABLE.
SELECT * FROM people1;
 -- Add a new column to the table.(USE ADD with ALTER)
 
ALTER TABLE people1
ADD username VARCHAR(30); -- By default this column values becomes NULL,so u can specify NOT NULL constarint.

ALTER TABLE people1
ADD salary INT NOT NULL; -- Specifying NOT NULL(then u see value zero(0), until u pass the numeric values, becoz zero is not null value.

-- And we can add table at specific position.

ALTER TABLE people1
ADD salary INT AFTER age;

-- DELETING THE COLUMN

-- use  DROP -> Remove a column from the table.(BE carefule, becoz once u delete the column all the related data will be lost),

ALTER TABLE people1
DROP salary;
-- we can delet the multiple columns(use comma separator)
ALTER TABLE people1
DROP COLUMN salary,DROP COLUMN username;

-- MODIFY COLUMN DATA TYPE

-- Change the data type of a column.(USE MODIFY)

ALTER TABLE people1
MODIFY age VARCHAR(30);

DESCRIBE people1;

-- Again we can convert back to int.
ALTER TABLE people1
MODIFY age INT;
-- here we cannnot create string into integer (varchar->int) NOT ALLOWED.

-- RENAMING -> 
		-- changing the name of the column.USEING CHANGE.

-- RENAME column
ALTER TABLE people1
CHANGE location country VARCHAR(20); -- changing column country to location

SELECT * FROM people1;
SELECT * FROM student;

-- RENAME table
ALTER TABLE people1
RENAME TO student1;

-- CONSTRAITS
	-- > rules applied to table columns, to ensure to have proper data
-- >NOT NULL
-- >UNIQUE
-- >DEFAUL
-- >PRIMARY KEY
-- >AUTO_INCREMENT

