USE fsd;

SHOW tables;

DESCRIBE people;

-- SELECT, INSERT, DISTRINCT --

INSERT INTO people(id, name, age, location)
VALUES(1,"JHON",22,"Lundon");

SELECT * FROM people;

SELECT name,id FROM people;
SELECT location FROM people;

SELECT DISTINCT id,name,location,age FROM  people;

SELECT DISTINCT id FROM  people;

INSERT INTO people(name,id,location,age) VALUES("ROY",4,"UAE",19);

INSERT INTO people VALUES("TOM",5,"USA");

INSERT INTO people(name,id,location) VALUES("TOM",4,"USA");

INSERT INTO people(id, name, age, location)
VALUES(6,"SAM",22,"AFRICA"),
(5,"KING",23,"WEST INDIES"),
(7,"SANTNER",20,"NZ");

SELECT name,age+5 FROM people;

SELECT 10+10;
-- AS --
SELECT name AS PersonName FROM people;

SELECT DISTINCT name FROM people;

SELECT DISTINCT name,location FROM people;

SELECT DISTINCT name,age,location FROM people;

-- WHERE --

SELECT * FROM people WHERE name="SANTNER";

SELECT * FROM people WHERE age>20;

-- CONSTRAINTS --

-- NOT NULL --

CREATE TABLE customer(
id INT NOT NULL,
name VARCHAR(30) NOT NULL,
loc VARCHAR(30));

DESCRIBE customer;

INSERT INTO customer(id,name,loc) VALUES(1,"JON","AUS");

SELECT * FROM customer;

INSERT INTO customer(id,name,loc) VALUES(3,NULL,"NZ");

-- UNIQUE -- 

CREATE TABLE customer1(
id INT NOT NULL,
name VARCHAR(30) NOT NULL,
email VARCHAR(30) UNIQUE);

DESCRIBE customer1;

INSERT INTO customer1(id,name,email) VALUES(1,"JACOB","jacob@gmail.com");

SELECT * FROM customer1;

INSERT INTO customer1(id,name,email) VALUES(2,"JON","jacob@gmail.com");

INSERT INTO customer1(id,name,email) VALUES(2,"JON",NULL);

-- PRIMERY KEY --

CREATE TABLE customer2(
id INT primary KEY,
name VARCHAR(20));

DESCRIBE customer2;

INSERT INTO customer2(id,name) VALUES(1,"SALT");

SELECT * FROM customer2;

INSERT INTO customer2(id,name) VALUES(2,"BEN");

INSERT INTO customer2(id,name) VALUES(2,"ARCHER");

 







