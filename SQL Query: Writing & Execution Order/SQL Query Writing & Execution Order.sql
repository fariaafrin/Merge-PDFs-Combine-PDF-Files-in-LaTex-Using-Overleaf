use youtube;

--  Create Order Table
CREATE TABLE orders(
	order_id INT AUTO_INCREMENT, 
	name VARCHAR(50) NOT NULL,
	product_id INT,
    quantity INT,
	PRIMARY KEY(order_id)
);

--  Create Product Table
CREATE TABLE products(
	id INT AUTO_INCREMENT, 
	name VARCHAR(50) NOT NULL,
    price INT,
	PRIMARY KEY(id)
);

-- Insert Data into Order Table 
INSERT INTO 
	orders(name, product_id,quantity)
VALUES
	('Timmy', 1, 2),
    ('Tommy', 1, 1),
    ('Lonnie', 5, 3),
    ('Tobbie', 4, 3),
	('Bonnie', 1, 3);
    
    -- Insert Data into Product Table 
INSERT INTO 
	products(name,price)
VALUES
	('Pencil', 10),
    ('Pen', 40),
    ('Ruler', 20),
    ('Eraser', 30),
	('Paper', 20);
    
    -- Showing Data of Order Table & Product Table 
SELECT * FROM orders;
SELECT * FROM products;
SELECT * FROM orders,products;
-- Writing Query to FInd the Total Spent of of Each Person 
SELECT O.name,
	(P.price * O.quantity) AS total_spent
FROM Orders O
JOIN Products P
	ON O.product_id = P.id
ORDER BY total_spent ASC;

-- Why We Need to Know The Execution Order 

-- Right Query
-- total spent less than 50
SELECT O.name,
	(P.price * O.quantity) AS total_spent
FROM Orders O
JOIN Products P
	ON O.product_id = P.id
-- no using column aliases in the WHERE clause
WHERE P.price * O.quantity < 50
ORDER BY total_spent ASC;


-- Wrong Query
--  total spent less than 50
SELECT O.name,
	(P.price * O.quantity) AS total_spent
FROM Orders O
JOIN Products P
	ON O.product_id = P.id
--  using column aliases in the WHERE clause
WHERE total_spent < 50
ORDER BY total_spent DESC;



-- Joining Two Tables 
SELECT *
FROM Orders O
JOIN Products P
	ON O.product_id = P.id;

