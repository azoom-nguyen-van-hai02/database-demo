
-- Create the customers table
CREATE TABLE IF NOT EXISTS customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20),
    address VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create the categories table
CREATE TABLE IF NOT EXISTS categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(50) NOT NULL,
    description TEXT
);

-- Create the products table
CREATE TABLE IF NOT EXISTS products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    description TEXT,
    price DECIMAL(10, 2) NOT NULL,
    stock INT NOT NULL,
    category_id INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (category_id) REFERENCES categories(category_id) ON DELETE SET NULL
);

-- Create the orders table
CREATE TABLE IF NOT EXISTS orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    status ENUM('Pending', 'Shipped', 'Delivered', 'Cancelled') DEFAULT 'Pending',
    total DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id) ON DELETE CASCADE
);

-- Create the order_items table
CREATE TABLE IF NOT EXISTS order_items (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders(order_id) ON DELETE CASCADE,
    FOREIGN KEY (product_id) REFERENCES products(product_id) ON DELETE CASCADE
);

-- Create the payments table
CREATE TABLE IF NOT EXISTS payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    amount DECIMAL(10, 2) NOT NULL,
    payment_method ENUM('Credit Card', 'PayPal', 'Bank Transfer') NOT NULL,
    status ENUM('Completed', 'Pending', 'Failed') DEFAULT 'Pending',
    FOREIGN KEY (order_id) REFERENCES orders(order_id) ON DELETE CASCADE
);


-- Dummy data

INSERT INTO customers (customer_name, email, phone, address)
VALUES 
    ('John Doe', 'johndoe@example.com', '1234567890', '123 Elm Street'),
    ('Jane Smith', 'janesmith@example.com', '0987654321', '456 Oak Avenue'),
    ('Alice Johnson', 'alicejohnson@example.com', '2345678901', '789 Maple Road'),
    ('Bob White', 'bobwhite@example.com', '3456789012', '321 Pine Lane');

   
 INSERT INTO categories (category_name, description)
VALUES 
    ('Electronics', 'Electronic gadgets and devices'),
    ('Books', 'A variety of books from different genres'),
    ('Clothing', 'Men\'s and Women\'s Clothing'),
    ('Home Decor', 'Decor items for your home');

   
   INSERT INTO products (product_name, description, price, stock, category_id)
VALUES 
    ('Smartphone', 'Latest model smartphone with advanced features', 699.99, 50, 1),
    ('Laptop', 'High performance laptop for professionals', 999.99, 30, 1),
    ('Novel', 'Mystery novel from a popular author', 19.99, 100, 2),
    ('T-Shirt', 'Cotton t-shirt with various sizes', 9.99, 200, 3),
    ('Wall Art', 'Framed art print for home decoration', 49.99, 40, 4);
   
   
 INSERT INTO orders (customer_id, order_date, status, total)
VALUES 
    (1, '2024-11-01 10:30:00', 'Pending', 719.98),
    (2, '2024-11-02 14:00:00', 'Delivered', 1019.98),
    (3, '2024-11-03 09:45:00', 'Shipped', 19.99),
    (1, '2024-11-04 16:20:00', 'Cancelled', 49.99);


INSERT INTO order_items (order_id, product_id, quantity, price)
VALUES 
    (1, 1, 1, 699.99),    -- Order 1 for Smartphone
    (1, 3, 1, 19.99),     -- Order 1 for Novel
    (2, 2, 1, 999.99),    -- Order 2 for Laptop
    (3, 3, 1, 19.99),     -- Order 3 for Novel
    (4, 5, 1, 49.99);     -- Order 4 for Wall Art

    
INSERT INTO payments (order_id, payment_date, amount, payment_method, status)
VALUES 
    (1, '2024-11-01 10:35:00', 719.98, 'Credit Card', 'Pending'),
    (2, '2024-11-02 14:05:00', 1019.98, 'PayPal', 'Completed'),
    (3, '2024-11-03 09:50:00', 19.99, 'Bank Transfer', 'Completed'),
    (4, '2024-11-04 16:25:00', 49.99, 'Credit Card', 'Failed');
   
   
--


select * from customers 
