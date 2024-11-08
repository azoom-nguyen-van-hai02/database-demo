USE dummy_database;

CREATE TABLE IF NOT EXISTS customer (
    id INT AUTO_INCREMENT PRIMARY KEY,
    customerName VARCHAR(100) NOT NULL,
    email VARCHAR(100),
    gender TINYINT(1) NOT NULL CHECK (gender IN (1, 2))
);

INSERT INTO customer (customerName, gender) VALUES
    ('John Doe' 1),  
    ('Jane Smith', 2), 
    ('Alice Johnson', 2),
    ('Bob Brown', 1),
    ('Charlie White', 1);


SELECT * FROM customer;

-- migrate
ALTER TABLE customer 
ADD gender_string VARCHAR(6);

-- 
UPDATE customer 
SET gender_string = CASE 
	WHEN gender = 1 THEN 'male'
	WHEN gender = 2 THEN 'female'
END

ALTER table customer
drop column gender;

ALTER table customer 
CHANGE gender_string gender varchar(6);

