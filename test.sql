USE northwind;

SHOW tables;

SELECT COUNT(*) FROM customers;

SELECT COUNT(*) FROM employees;

SELECT COUNT(*) FROM invoices;

SELECT COUNT(*) FROM orders;

SELECT COUNT(*) FROM products;

SELECT COUNT(*) FROM shippers;

SELECT COUNT(*) FROM suppliers;

SELECT COUNT(*) FROM sales_reports;

SELECT COUNT(*) FROM inventory_transaction_types;

SELECT COUNT(*) FROM order_details;

SELECT COUNT(*) FROM purchase_order_details;

-- nested query that selects the company name from the customers with the id of 30
SELECT company
FROM customers c
WHERE c.id = (SELECT customer_id
			FROM orders o
			WHERE o.id = 30);
            
-- number of employees and companies            
SELECT COUNT(DISTINCT e.id) AS numEmployees,
	COUNT(DISTINCT c.id) AS numCompanies,
	e.city, c.city
FROM employees e INNER JOIN customers c ON
	(e.city = c.city)
GROUP BY e.city, c.city
ORDER BY numEmployees DESC; 

-- number of employees and companies
SELECT COUNT(DISTINCT e.id) AS numEmployees,
	COUNT(DISTINCT c.id) AS numCompanies,
	e.city, c.city
FROM employees e right JOIN customers c ON
	(e.city = c.city)
GROUP BY e.city, c.city
ORDER BY numEmployees ASC;

-- number of employees and companies
SELECT COUNT(DISTINCT e.id) AS numEmployees,
	COUNT(DISTINCT c.id) AS numCompanies,
	e.city, c.city
FROM employees e LEFT JOIN customers c ON
	(e.city = c.city)
GROUP BY e.city, c.city
ORDER BY numEmployees ASC;

-- number of customers ordered
SELECT COUNT(c.id) FROM customers c 
INNER JOIN orders o ON o.customer_id = c.id;
