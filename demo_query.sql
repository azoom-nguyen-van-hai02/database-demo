-- Set up DB
-- Tạo bảng Users
CREATE TABLE Users (
    user_id INT PRIMARY KEY,
    name VARCHAR(50),
    email VARCHAR(100)
)

-- Tạo bảng Orders
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    user_id INT,
    product_name VARCHAR(100),
    price DECIMAL(10, 2),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
)

-- Thêm dữ liệu vào bảng Users
INSERT INTO Users (user_id, name, email)
VALUES 
    (1, 'Alice', 'alice@example.com'),
    (2, 'Bob', 'bob@example.com'),
    (3, 'Charlie', 'charlie@example.com')

-- Thêm dữ liệu vào bảng Orders
INSERT INTO Orders (order_id, user_id, product_name, price)
VALUES 
    (1, 1, 'Laptop', 1200.00),
    (2, 1, 'Mouse', 25.00),
    (3, 2, 'Keyboard', 45.00),
    (4, 3, 'Monitor', 300.00)
    
-- Biểu diễn CRUD
-- C
INSERT INTO Users (user_id, name, email)
VALUES (4, 'Dave', 'dave@example.com')
INSERT INTO Orders (order_id, user_id, product_name, price)
VALUES (5, 4, 'Tablet', 250.00);
-- R
SELECT * FROM Users
SELECT * FROM Orders 
-- U
UPDATE Orders
SET price = 1250.00
WHERE order_id = 1
-- D
DELETE FROM Orders
WHERE order_id = 2

-- Biểu diễn SELECT
-- Select với điều kiện
SELECT * FROM Orders WHERE price > 100
SELECT * FROM Orders
WHERE price > 50 AND user_id = 1
-- Select với order
SELECT * FROM Orders
ORDER BY price DESC
SELECT * FROM Users
ORDER BY name ASC
-- Select với limit
SELECT * FROM Orders
LIMIT 2
-- Select với Aggregation Queries
SELECT SUM(price) AS total_sales FROM Orders
SELECT AVG(price) AS average_price FROM Orders
SELECT COUNT(*) AS user_count FROM Users
SELECT MAX(price) AS max_price FROM Orders
SELECT user_id, SUM(price) AS total_spent
FROM Orders
GROUP BY user_id

-- Inner join
SELECT Users.user_id, Users.name, Orders.product_name, Orders.price
FROM Users
INNER JOIN Orders ON Users.user_id = Orders.user_id
-- Left join
SELECT Users.name, COUNT(Orders.order_id) AS total_orders
FROM Users
LEFT JOIN Orders ON Users.user_id = Orders.user_id
GROUP BY Users.name

-- Subquery
SELECT * FROM Users
WHERE user_id IN (
    SELECT user_id
    FROM Orders
    GROUP BY user_id
    HAVING SUM(price) > 300
)

