-- JOINS 
-- > A JOIN combines rows from two or more tables based on a related column

-- INNNER JOIN -> Matching rows from both the tables.

USE fsd;
SELECT * FROM orders;
SELECT * FROM customers;

-- Syntax inner join
SELECT * FROM table_name 
INNER JOIN dependent_table 
ON table_name.column_name = dependent_table.column_name;

SELECT * FROM customers 
INNER JOIN orders 
ON customers.customer_id = orders.customer_id
WHERE customers.name = "RAJAT";

-- ALIYAS
SELECT * FROM customers c
INNER JOIN orders o
ON c.customer_id = o.customer_id
WHERE c.name = "ROHIT";

-- OUTER JOIN -> Matching rows + Some non matching rows.
/*		types 
				-> Left join - All the rows from left table + matching rows from right.
                -> Right join -All the rows from right table + matching rows from left.
       */ 	
	
    -- LEFT JOIN -> Returns all rows from the left table, and only the matched rows from the right table.

SELECT * FROM customers 
LEFT JOIN orders 
ON customers.customer_id = orders.customer_id;

SELECT  customers.name,orders.order_date
FROM customers 
LEFT JOIN orders 
ON customers.customer_id = orders.customer_id
WHERE orders.order_id IS NULL;
    
	-- RIGHT JOIN -> Returns all rows from the right table, and only the matched rows from the left table.
  
SELECT * 
FROM customers 
RIGHT JOIN orders_new 
ON customers.customer_id = orders_new.customer_id;

	-- FULL OUTER JOIN -> Returns all rows when there is a match in either the left or right table
 
SELECT * 
FROM orders_new 
RIGHT JOIN customers 
ON orders_new.customer_id = customers.customer_id
UNION -- UNION ALL
SELECT * 
FROM customers 
RIGHT JOIN orders_new 
ON customers.customer_id = orders_new.customer_id;

 -- CROSS JOIN -> Cartesion product return all possible combinations.

SELECT *
FROM customers
CROSS JOIN orders_new;

-- VIEWS ->
