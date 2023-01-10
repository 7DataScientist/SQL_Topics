use cust;

select * from cust.bank_info;

create table cust.Customer_info
(
	sno int,
	customer_name varchar(50),
	email varchar(20),
	contact_number int,
	city varchar(20)
);

select * from cust.customer_info;

INSERT INTO cust.customer_info VALUES
(3,	'Pluto Jr',	'plu@mail.com',	789,	'Mumbai'),
(4,	'Mars Jr',	'mar@mail.com',	741,	'Mysore'),
(5,	'Juno',	'jun@mail.com',	852,	'Mysore'),
(6,	'Peter',	'pete@mail.com',	963,	'Mysore'),
(7,	'Hubbel',	'hub@mail.com',	147,	'Chennai'),
(8,	'James Web',	'jame@mail.com',	258,	'Chennai'),
(9,	'Apollo', 	'apo@mail.com',	369,	'Hydrabad'),
(10,	'Kia',	'kia@mail.com',	951,	'Hydrabad'),
(11,	'Json',	'json@mail.com',	753,	'Hydrabad');



create table sales_info
(
	customer_name varchar(50),
	product_name varchar(20),
	product_code varchar(20),
	quantity int
);

select * from cust.sales_info;

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/sales_info.csv'
INTO TABLE cust.sales_info
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;


-- Joins

-- Inner Join

/*

SELECT column_name(s)
FROM table1
INNER JOIN table2
ON table1.column_name = table2.column_name;

  */
  
  select cust.customer_info.customer_name, cust.customer_info.email, cust.customer_info.city, cust.sales_info.product_name, cust.sales_info.quantity 
  from cust.customer_info
  inner join cust.sales_info
  on cust.customer_info.customer_name = cust.sales_info.customer_name; 
  
-- Left Join  

/*

SELECT column_name(s)
FROM table1
LEFT JOIN table2
ON table1.column_name = table2.column_name;

  */


  select cust.customer_info.customer_name, cust.customer_info.email, cust.customer_info.city, cust.sales_info.product_name, cust.sales_info.quantity 
  from cust.customer_info
  left join cust.sales_info
  on cust.customer_info.customer_name = cust.sales_info.customer_name;


  select cust.customer_info.customer_name, cust.customer_info.email, cust.customer_info.city, cust.sales_info.product_name, cust.sales_info.quantity 
  from cust.sales_info left join cust.customer_info
  on cust.customer_info.customer_name = cust.sales_info.customer_name;

-- Right Join  

/*

SELECT column_name(s)
FROM table1
RIGHT JOIN table2
ON table1.column_name = table2.column_name;

  */

  select cust.sales_info.customer_name, cust.customer_info.email, cust.customer_info.city, cust.sales_info.product_name, cust.sales_info.quantity
  from cust.customer_info right join cust.sales_info
  on cust.customer_info.customer_name = cust.sales_info.customer_name;  
  on cust.customer_info.customer_name = cust.sales_info.customer_name;  
  
  
  -- Self Join

/*

SELECT column_name(s)
FROM table1 T1, table1 T2
WHERE condition;

  */
  
  select * from cust.sales_info;

  select cust.sales_info.customer_name,  cust.sales_info.quantity
  from cust.customer_info, cust.sales_info
  WHERE cust.sales_info.quantity= 3 limit 2;
  
-- Views 
  
  /*

CREATE VIEW view_name AS
SELECT column1, column2, ...
FROM table_name
WHERE condition;

  */
  
  select * from cust.customer_info;
  
  create view imp_col as 
  select customer_name, contact_number, city
  from cust.customer_info
  where customer_name like 'P%';
  
  select * from imp_col;
  
  
create view rt_jn as 
select cust.sales_info.customer_name, cust.customer_info.email, cust.customer_info.city, cust.sales_info.product_name, cust.sales_info.quantity
from cust.customer_info right join cust.sales_info
on cust.customer_info.customer_name = cust.sales_info.customer_name;
  
  select * from rt_jn;
  