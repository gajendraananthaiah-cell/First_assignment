SHOW DATABASES;
USE fsd;
SHOW tables;

-- DEFAULT -> Sets a default value if no value is provided during insert 

CREATE TABLE orders(
id INT ,
status VARCHAR(20) DEFAULT "Undeliverd");

DESCRIBE orders;

INSERT INTO orders(id) VALUES(1);

SELECT * FROM orders; 

INSERT INTO orders(id,status) VALUES(1,"deliverd");

-- AUTO INCREMENT -> Automatically increases value etc 1.2.3....

  CREATE TABLE bookings(
  id INT PRIMARY KEY AUTO_INCREMENT,
  name VARCHAR(30),
  guests INT);
  
  INSERT INTO bookings(name,guests) VALUES("KING",3);
  
  SELECT * FROM bookings;
  
  INSERT INTO bookings(name,guests) VALUES("HOPE",6);
  
-- COMPARISION OPERATORS -> Operators that compare the two values, this operator returns boolean results true/false , In some cases it might return null also.--
  
  /*| Operator | Meaning                  |
	| -------- | ------------------------ |
	| =        | Equal to                 |
	| != / <>  | Not equal to             |
	| >        | Greater than             |
	| <        | Less than                |
	| >=       | Greater than or equal to |
	| <=       | Less than or equal to    |*/
    
-- "=" Equal to   

SELECT * FROM people;
    
SELECT * FROM people
WHERE age = 22;

SELECT * FROM people
WHERE name = "JHON";

-- != / <> Not equal to 

SELECT * FROM people
WHERE age != 20;

SELECT * FROM people
WHERE location != "Lundon"; /*Space matters while comparing values*/

SELECT * FROM people
WHERE age = NULL;

-- Equle to can't work on Null

--  > Greater than 

SELECT * FROM people
WHERE age > 20;
 
--  < Less than

SELECT * FROM people
WHERE age < 20;

-- >= Greater than or equal to 

SELECT * FROM people
WHERE age >= 20;

-- <= Less than or equal to 

SELECT * FROM people
WHERE age <= 20;

CREATE TABLE sales(
id INT PRIMARY KEY AUTO_INCREMENT,
amount INT,
sale_date date);

INSERT INTO sales(amount,sale_date) 
VALUES(100,"2026-01-06"),
(200,"2026-04-20"),
(250,"2026-06-17"),
(150,"2026-07-08"),
(500,"2026-01-01"),
(125,"2026-09-09"),
(450,"2026-08-02");
  
SELECT * FROM sales;

SELECT * FROM sales
WHERE sale_date ="2026-01-06";

SELECT amount,id FROM sales
WHERE sale_date ="2026-01-06";

SELECT * FROM sales
WHERE amount > 200;

SELECT amount,id FROM sales
WHERE sale_date >="2026-07-08";

SELECT amount,id FROM sales
WHERE sale_date <="2026-09-09";

SELECT amount,id FROM sales
WHERE sale_date !="2026-01-06";

 -- Corner cases
 
SELECT amount,id FROM sales
WHERE sale_date !="06-01-2026"; -- it won't work 
  
-- DATETIME

CREATE TABLE sales1(
id INT PRIMARY KEY AUTO_INCREMENT,
sale_date DATE ,
sake_time TIME);

SELECT * FROM sales1;
 
 INSERT INTO sales1(sale_date,sake_time) 
 VALUES("2026-03-03",'12:05:00'),
 ("2026-04-02",'01:05:00'),
 ("2026-05-04",'05:55:00'),
 ("2026-06-05",'02:05:00'),
 ("2026-06-06",'04:45:00'),
 ("2026-04-03",'09:05:00'),
 ("2026-05-04",'10:05:00'),
 ("2026-03-02",'12:15:00');
 
 SELECT sale_date,sake_time FROM sales1
 WHERE sake_time >= '12:00:00';
 
 SELECT sale_date,sake_time FROM sales1
 WHERE sake_time >= '12:00:00' AND sale_date >="2026-03-02";
 
 SELECT sale_date,sake_time FROM sales1
 WHERE sake_time >= '12:00:00' AND sale_date <="2026-03-02";
 
 SELECT sale_date,sake_time FROM sales1
 WHERE sake_time != '12:00:00';
 
/*  | Operator | Meaning                             |
	| -------- | ----------------------------------- |
	| AND      | All conditions must be TRUE         |
	| OR       | At least one condition must be TRUE |
	| NOT      | Reverses a condition                |
	| XOR      | Only one condition must be TRUE     |
*/
  
-- AND -> All conditions must be TRUE 
SELECT * FROM people;

SELECT * FROM people
WHERE age >22
AND location="UAE";

SELECT * FROM people
WHERE age >20
AND location="Lundon"
AND name ="JHON";

--  OR -> At least one condition must be TRUE

SELECT * FROM people
WHERE age <20
OR location="AFRICA";

--  NOT -> Reverses a condition / Same as not equal to !=

SELECT * FROM people
WHERE NOT age = 22;

--  XOR ->  Only one condition must be TRUE

SELECT * FROM  people
WHERE age < 20 XOR location="Dubai";

--  Order of Precidence 
/* NOT
   AND
   OR
   XOR*/
   
   SELECT * FROM people
   WHERE age > 20
   AND name="MIKE" OR location="Lundon";
 
