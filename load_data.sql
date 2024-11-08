use dummy_database;

SHOW VARIABLES LIKE 'local_infile';


load data local infile '/Users/hainguyenvan/Documents/Study/Database/customer.csv'
into table customer 
fields terminated by ','
enclosed by '"'
lines terminated by '\n'
ignore 1 ROWS 
(customerName, email, gender);

select * from customer ;

--
ALTER table customer
add column email varchar(100)

