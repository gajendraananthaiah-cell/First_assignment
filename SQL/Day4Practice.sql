-- BETWEEN -> is used to filter values within a range.

-- Syntax
SELECT column_name 
FROM table_name
WHERE column_name BETWEEN val1 AND val2;
 
SELECT * FROM people
WHERE age BETWEEN 19 AND 22;

SELECT * FROM people
WHERE age>=19 AND age<=22;

SELECT * FROM sales
WHERE sale_date BETWEEN "2026-01-06" AND "2026-07-17";

SELECT * FROM sales
WHERE amount NOT BETWEEN 100 AND 300;

SELECT * FROM people 
WHERE name BETWEEN 'A' AND 'K';

-- LIKE -> used in SQL to search for a pattern in a column.
-- syntax
SELECT  column_name
FROM  table_name
WHERE column_name LIKE pattern;

SELECT * FROM people
WHERE name LIKE 'J%';

SELECT * FROM people
WHERE name LIKE 'J__%';

SELECT * FROM people
WHERE name LIKE '%G';

SELECT * FROM people
WHERE name LIKE '___G';

SELECT * FROM people
WHERE name LIKE '%J%';

SELECT * FROM people
WHERE email LIKE '%@gmail.com';

SELECT * FROM people
WHERE name LIKE '% roy';

-- %	Represents zero or more characters
-- _	Represents exactly one character

-- IN -> used to match multiple values in a column.
-- syntax

SELECT column_name
FROM table_name
WHERE column_name IN (value1, value2, value3);

SELECT * FROM people
WHERE name IN ('JHON', 'ROY', 'KING');

SELECT * FROM people
WHERE name NOT IN ('JHON', 'ROY', 'KING');

-- NULL ->  Absence of values (no data , empty)

SELECT * FROM people
WHERE age IS NULL;

SELECT * FROM people
WHERE age IS NOT NULL;

 -- IS NULL -> find all the null value.
 -- IS NOT NULL -> removes null values.
 
 -- STRING FUNCTIONS -> String functions are used to manipulate text data.
 
 
 
